/***********************************
零售月报生成
参数：@fdbh 分店编号
	  @month 月份
	  @je   金额
***********************************/
ALTER    PROCEDURE [dbo].[SP_ls_month_report]
@fdbh varchar(3),
@month char(6),
@je decimal(10,2) 
AS

declare @hj decimal(10,2)
declare @spbh varchar(20)
declare @fgsbh varchar(20)
declare @shul decimal(10,2)
declare @jine decimal(10,2)
declare @jhj decimal(10,2)
declare @gysbh nvarchar(20)
declare @gysmc nvarchar(100)

create table #t
(fgsbh varchar(3) null,
 spbh  varchar(15) null,
 shul  decimal(8,2) default 0 null,
 jine  decimal(8,2) default 0 null,
 jhj   decimal(10,4) default 0 null,
 gysbh nvarchar(20) null,
 gysmc nvarchar(100) null
)

create table #tt
(fgsbh varchar(3) null,
 spbh  varchar(15) null,
 shul  decimal(8,2) default 0 null,
 jine  decimal(8,2) default 0 null,
 jhj   decimal(10,4) default 0 null,
 gysbh nvarchar(20) null,
 gysmc nvarchar(100) null
)


declare cur cursor for 
-- 获取没有开发票标志的零售数据 2025年12月17日 14:41:17
select  a.fgsbh,
		  a.spbh,
		  a.SHUL,   
        isnull(a.JINE,0) as jine,   
        isnull(a.JHJ,0) as jhj
    FROM T_LSHZB a
WHERE a.FGSBH = @fdbh AND 
         substring(convert(char(8),lsrq,112),1,6) = @month and
			isnull(a.JHJ,0)>0 and isnull(a.shul,0)>0 and isnull(a.kfp,'N') = 'N'

begin tran

select @hj=isnull(sum(a.jine),0)
from   t_lshzb a
where  a.fgsbh=@fdbh and
		 substring(convert(char(8),lsrq,112),1,6) = @month and
		 a.kfp='Y'

-- 批量处理开票零售数据 2025年12月17日 14:42:05
insert into #t(fgsbh,spbh,shul,jine,jhj)
 SELECT a.fgsbh,
		  a.spbh,
		  a.SHUL,   
        a.JINE,   
        isnull(a.JHJ,0) as jhj
    FROM T_LSHZB a
   WHERE a.FGSBH = @fdbh AND  
         substring(convert(char(8),lsrq,112),1,6) = @month and
			a.kfp='Y' and isnull(a.JHJ,0)>0 and isnull(a.shul,0)>0

set @hj=@je -@hj

OPEN cur
	
FETCH NEXT FROM cur 
INTO @fgsbh, @spbh, @shul,@jine,@jhj

WHILE @@FETCH_STATUS = 0 and @hj>=@jine
BEGIN
	-- 获取最后的供应商 2025年12月17日 14:43:34
	select top 1 @gysbh = z.gysbh,@gysmc = g.gysmc
	from t_jhdmxb m
	join t_jhdzb z on z.jhdbh=m.jhdbh
	join t_gysxx g on g.gysbh=z.gysbh
	where m.spbh = @spbh
	order by z.jhrq desc

	set @hj=@hj - @jine
	insert into #t
	values(@fgsbh,@spbh,@shul,@jine,@jhj,@gysbh,@gysmc)
	
   FETCH NEXT FROM cur 
	INTO @fgsbh, @spbh, @shul,@jine,@jhj
END

CLOSE cur

DEALLOCATE cur


insert into #tt
select fgsbh,spbh,sum(shul),sum(jine),sum(jhj*shul)/sum(shul),gysbh,gysmc
from  #t
group by fgsbh,spbh,gysbh,gysmc

select * from #tt

commit

GO



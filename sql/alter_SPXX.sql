-- 药品类别
alter table t_spxx
add yplb nvarchar(16) null

-- 药品化学名称
alter table t_spxx
add hxmc nvarchar(64) null


INSERT INTO [T_FUNCS]([FUNCID], [FUNNM], [FUNTP], [GRPID], [FUNMS], [TPLJ], [FUNFM], [FLAG], [UFLAG])
VALUES(12, N'商品价签打印', 3, 2, N'商品价签打印', 'image\tom_wap.gif', 'w_printjq', 0, 1)

update t_spxx
set yplb = N'药品'

update t_spxx
set hxmc = replace(replace(substring(pm, charindex('(',pm),200),'(',''),')','')
where ltrim(rtrim(left(pm,charindex('(',pm)))) <> ''

--增加类别字段，用于区别各种单据
alter table t_spxx
add lb varchar(20)


--增加系统选项表，例如保存药品类别等等信息
CREATE TABLE [T_Options] (
	[ID] [varchar] (4) NOT NULL ,
	[OptionID] tinyint NOT NULL ,	--类别，1 药品类别 2 类别
	[Name] [varchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	CONSTRAINT [PK_T_Options] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
) ON [PRIMARY]
GO

insert into T_Options(id,optionid,name)
values('A',1,N'药品')

insert into T_Options(id,optionid,name)
values('B',1,N'保健食品')

insert into T_Options(id,optionid,name)
values('C',1,N'器械')

insert into T_Options(id,optionid,name)
values('D',1,N'其他')

--增加利润率表(零售利润率表)
CREATE TABLE [T_LSLRL] (
	[ID] tinyint NOT NULL ,
	[NameText] varchar(2) NOT NULL ,	--名称，例如：A、B
	[SX] decimal(6,2) not  NULL , --利润上限
	[XX] decimal(6,2) not  NULL , --利润下限
	CONSTRAINT [PK_T_LSLRL] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
) ON [PRIMARY]
GO

--delete from T_LSLRL

insert into T_LSLRL(id,NameText,sx,xx)
values(1,'A',0,0.10)

insert into T_LSLRL(id,NameText,sx,xx)
values(2,'B',0.11,0.2)

--增加出库单明细临时表，为了解决多个单据合并时的ordr字段问题
create table t_ckdmxb_temp
(
ckdbh varchar(32),
ordr int Identity(1,1) NOT NULL,
spbh varchar(32),
pcbh varchar(32),
yxrq datetime,
jhj decimal(9,4),
lsj decimal(9,4),
kcl int,
shul decimal(9,4),
yxkw nvarchar(16),
note nvarchar(32),
flag int
)

--删除进货单明细中没有商品的进货单
delete a
from t_jhdzb a
left join t_jhdmxb b on a.jhdbh = b.jhdbh 
where b.jhdbh is null

--商品类别表增加利润率浮动字段，针对某一类别药品，设置利润浮动率
alter table t_splb
add rate decimal(5,2)

update t_splb
set rate = 0.05

--增加商品价格查询菜单
INSERT INTO [T_FUNCS]
           ([FUNCID]
           ,[FUNNM]
           ,[FUNTP]
           ,[GRPID]
           ,[FUNMS]
           ,[TPLJ]
           ,[FUNFM]
           ,[FLAG]
           ,[UFLAG])
     VALUES
           ('14'
           ,'商品价格'
           ,2
           ,0
           ,''
           ,'image\tom_wap.gif'
           ,'w_lsrate'
           ,0
           ,1)

--创建视图，库存商品价格
drop view v_spxx_jhj 
go

create view v_spxx_jhj
as
select m.spbh,m.pcbh,sum(m.jhj*m.shul)/sum(m.shul) as jhj
from t_ckdmxb m
where m.shul > 0
group by m.spbh,m.pcbh
go


--获取零售利润
  SELECT T_LSDZB.LSDBH,   
         T_LSDZB.RQ,   
         T_LSDZB.BC,   
         T_LSDZB.JS,            
         T_LSDZB.ZDZK,  
         T_LSDZB.BZ,   
         T_LSDZB.KPR,
	 T_LSDMXB.SPBH,   
         T_LSDMXB.SL,   
         T_LSDMXB.LSJ,   
         T_LSDMXB.YYYBH,   
         T_LSDMXB.ZK, 
	 T_LSDMXB.PCBH,  
         V_SPXX_QTCX.PM,   
         V_SPXX_QTCX.GG,   
         V_SPXX_QTCX.JLDW,
	 V_SPXX_QTCX.SCCJ,
	 round(( t_lsdzb.zdzk / 100.0 ) *  t_lsdmxb.lsj * t_lsdmxb.sl * (t_lsdmxb.zk/100.0) * t_lsdzb.js ,2) as hjje
	,(v_spxx_jhj.jhj + v_spxx_jhj.jhj *t_splb.rate) * T_LSDMXB.sl
	,v_spxx_jhj.jhj + v_spxx_jhj.jhj *t_splb.rate as jhj
    FROM T_LSDZB,   
         T_LSDMXB,   
         V_SPXX_QTCX
	,v_spxx_jhj,
	t_splb  
   WHERE ( T_LSDZB.LSDBH = T_LSDMXB.LSDBH ) and  
         ( T_LSDMXB.SPBH = V_SPXX_QTCX.SPBH ) 
	and 	 T_LSDMXB.SPBH = v_spxx_jhj.SPBH and
	 T_LSDMXB.pcbh = v_spxx_jhj.pcbh and
	 v_spxx_qtcx.lbbh = t_splb.splbbh
and T_LSDZB.rq between '2009-02-14' and '2009-03-31'








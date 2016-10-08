if object_id('SP_PPD2BSD') is not null
	DROP PROCEDURE SP_PPD2BSD
GO
/******************* 过程说明 ******************
  由盘点单生成损益单，一个盘点单对应一个损益单
  参数	@bsdbh   报损单编号
        @pddbh   盘点单编号
	@bsr	 操作人
  结果	生成一个损益单
************************************************/
CREATE PROCEDURE SP_PPD2BSD @bsdbh varchar(15),@pddbh varchar(15),@bsr nvarchar(15) AS
begin

	create table #t
	(
	ordr int identity(1,1),
	bsdbh Nvarchar(30),
	spbh Nvarchar(30),
	pcbh Nvarchar(30),
	dqcl decimal(14,2),
	bssl decimal(14,2),
	bsjg decimal(14,2),
	bstp int,
	yhkw varchar(8),
	yxrq datetime
	)
	
	insert into #t( bsdbh,spbh,pcbh,dqcl,bssl,bsjg,bstp,yhkw,yxrq)
	select @bsdbh,spbh,pcbh,chsl,sl - chsl,0,1,b.hwbh,a.yxrq
	from t_pddmxb a
	join t_pddzb b on a.pddbh = b.pddbh 
	where a.pddbh = @pddbh
	and (a.pcbh <> a.kcpcbh or a.sl <> a.chsl or a.yxrq <> a.kcyxrq)
	and a.sl > a.chsl
	
	insert into #t( bsdbh,spbh,pcbh,dqcl,bssl,bsjg,bstp,yhkw,yxrq)
	select @bsdbh,spbh,pcbh,chsl,chsl-sl,0,-1,b.hwbh,a.yxrq
	from t_pddmxb a
	join t_pddzb b on a.pddbh = b.pddbh 
	where a.pddbh = @pddbh
	and (a.pcbh <> a.kcpcbh or a.sl <> a.chsl or a.yxrq <> a.kcyxrq)
	and a.sl < a.chsl
	
	--从存货找价格
	update a
	set a.bsjg = isnull(b.jiag,0)
	from #t a
	join t_chxx b on a.spbh = b.spbh and a.pcbh = b.pcbh
	
	--从出库单找价格
	update a
	set a.bsjg = isnull((SELECT TOP 1 JHJ FROM T_CKDMXB WHERE SPBH = A.SPBH AND PCBH = A.PCBH),0)
	from #t a
	where isnull(a.bsjg,0) <= 0
	
	--从调拨单里找价格
	update a
	set a.bsjg = isnull((SELECT TOP 1 dbj FROM T_dbDMXB WHERE SPBH = A.SPBH AND PCBH = A.PCBH),0)
	from #t a
	where isnull(a.bsjg,0) <= 0

	--从出库单找价格
	update a
	set a.bsjg = isnull((SELECT TOP 1 m.JHJ FROM T_CKDMXB m join t_ckdzb z on m.ckdbh = z.ckdbh WHERE m.SPBH = A.SPBH order by z.ckrq desc ),0)
	from #t a
	where isnull(a.bsjg,0) <= 0

	update #t
	set bsjg = 0
	where isnull(bsjg,0)= 0

	IF EXISTS(SELECT * FROM #t)
	BEGIN
		insert into t_bsdzb(bsdbh,bsrq,bsr,bz,yxbz,bsdw)
		values(@bsdbh,getdate(),@bsr,'盘点单'+@pddbh,1,'000')

		insert into t_bsdmxb(ordr,bsdbh,spbh,pcbh,dqcl,bssl,bsjg,bstp,bskw,yxrq,bsyy)
		select ordr,bsdbh,spbh,pcbh,dqcl,bssl,bsjg,bstp,yhkw,yxrq,'盘点'
		from #t
	END
		
	drop table #t
end 
go
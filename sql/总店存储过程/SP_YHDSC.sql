-------------2019年4月6日 21:01:55------------
/******************* 过程说明 ******************
  通过分店上传的要货计划自动生成要货计划明细记录
  参数  @sspbh   商品编号
        @ckdbh   要货单编号
        @decyhsl 要货数量
        @ordr    序号
  结果  向出库明细表中插入一条有效的记录
  变更	供应商证照过期的供应商禁止进货 2019年4月6日 20:59:52
		增加进货日期 2024年12月20日 14:22:23
************************************************/
ALTER PROCEDURE [dbo].[SP_YHDSC] @sspbh varchar(15),@ckdbh varchar(15),@decyhsl decimal(8,2), @ordr int ,@sbz varchar(32)AS
begin
	DECLARE @decjhj decimal(8,2), @declsj decimal(8,2),@deckcl decimal(8,2),@decfgskc decimal(8,2)
	DECLARE @gysbh varchar(15),@jhrq datetime


	-- 将进货价、零售价、库存量置为特殊标志
	SET @decjhj = 0
	SET @declsj = 0
	SET @deckcl = 0

	--查找该商品的存货
	SELECT @deckcl =ISNULL(SUM(CHSL),0) FROM T_CHXX WHERE SPBH = @sspbh  

	--查找零售价
	SELECT @declsj = ISNULL(LSJ,0) FROM T_JGXX WHERE SPBH = @sspbh

	--查找最低进货价和对应的供应商
	SELECT top 1 @gysbh=isnull(z.GYSBH,''),@decjhj=isnull(min(m.jhj),0) 
	FROM  T_JHDZB z,t_jhdmxb m,t_gysxx g
	WHERE z.jhdbh = m.jhdbh and
			m.spbh = @sspbh and
			z.jhrq > dateadd(month,-6,getdate()) AND
			( GETDATE() < jyxkzrq AND 
			GETDATE() < g.gsprq AND 
			GETDATE() < g.gsyzrq AND 
			GETDATE() < g.xyrq AND 
			GETDATE() < g.frrq AND 
			GETDATE() < g.ywyyxq AND
			GETDATE() < g.cwyxq )
	group by z.gysbh
	order by min(m.jhj)

	--查找分公司库存
	SELECT  @decfgskc=isnull(sum(SHUL - YXSL),0) FROM T_FGSKC WHERE SPBH = @sspbh
	
	--查找最后进货日期 2024年12月20日 14:22:44
	SELECT @jhrq = MAX(jhrq) 
	FROM t_jhdzb z
	JOIN t_jhdmxb m ON m.JHDBH = z.JHDBH
	WHERE z.jhrq > '2020.1.1' AND spbh = @sspbh

	-- 向要货单明细表插入一条记录
	INSERT INTO T_YHJHMX (YHDBH,ORDR,SPBH,GYSBH,DCL,YHSL,LSJ,JHJ,FLAG,BZ,fgskc,jhrq)
		  VALUES(@ckdbh, @ordr, @sspbh, @gysbh, @deckcl, @decyhsl, @declsj,@decjhj,0,@sbz,cast(@decfgskc as varchar(20)),@jhrq)
end 

GO



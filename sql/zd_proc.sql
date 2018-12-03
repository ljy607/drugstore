-----------------2018年11月25日 15:13:55-----------------------
-------修改要货计划供应商选择，提醒询价日期  2018年11月25日 15:14:52

--/******************* 过程说明 *****************************************************************
--  要货计划录入时获取供应商价格 
--  参数	@spbh   	货号
--  结果	生成供应商价格记录信息
--**********************************************************************************************/
--ALTER PROCEDURE [dbo].[sp_yhjh_gysjg] @spbh NVARCHAR(16) AS
--begin

--CREATE TABLE #t 
--(
--	gysbh NVARCHAR(16),
--	jhj DECIMAL(14,4) null DEFAULT 0,
--	zhjj NVARCHAR(32) NULL DEFAULT 0,
--	xjjg DECIMAL(14,4) null DEFAULT 0,
--	gsyzrq DATETIME NULL,
--	jyxkzrq DATETIME NULL,
--	gsprq DATETIME NULL,
--	frrq DATETIME NULL,
--	xyrq DATETIME NULL,
--	xjrq DATETIME NULL
--)

--CREATE TABLE #tt
--(
--	gysbh NVARCHAR(16),
--	xjjg DECIMAL(14,4) NULL DEFAULT 0,
--	xjrq DATETIME NULL
--)



--INSERT INTO #t(gysbh, jhj, zhjj, gsyzrq, jyxkzrq, gsprq, frrq, xyrq)
--SELECT z.GYSBH,min(m.jhj) jhj2year ,
--(select top 1 cast(e.jhj AS NVARCHAR(16)) +'  '+ convert(varchar(10),e1.jhrq,102) from t_jhdmxb e join t_jhdzb e1 on e.jhdbh = e1.jhdbh 
--where e.spbh = @spbh and e1.gysbh=z.gysbh and e1.jhrq > dateadd(month,-6,getdate()) order by e1.jhrq desc ) as zhjj,
--g.gsyzrq,g.jyxkzrq,g.gsprq,g.frrq,g.xyrq
--FROM  T_JHDZB z,t_jhdmxb m,t_gysxx g
--WHERE z.jhdbh = m.jhdbh and
--	   z.gysbh = g.gysbh and
--		m.spbh = @spbh and
--		z.jhrq > dateadd(month,-24,getdate())
--group by z.gysbh,g.gsyzrq,g.jyxkzrq,g.gsprq,g.frrq,g.xyrq
--order by min(m.jhj)

-------询价价格
--INSERT INTO #tt(gysbh, xjjg,xjrq)
--SELECT t.gysbh,t1.jg,t.rq
--FROM t_xjdzb AS T
--JOIN t_xjdmxb AS t1 ON t1.xjdbh = T.xjdbh 
--JOIN t_gysxx AS g ON g.gysbh = T.gysbh
--WHERE t1.spbh = @spbh and 1>(SELECT COUNT(*) 
--         FROM t_xjdzb e 
--         JOIN t_xjdmxb e1 ON e1.xjdbh = e.xjdbh
--         WHERE e.gysbh=T.gysbh AND t1.spbh = e1.spbh AND e.rq>T.rq
--		)

--UPDATE e
--SET e.xjjg = e1.xjjg,e.xyrq = e1.xjrq
--FROM #t e
--JOIN #tt e1 ON e.gysbh = e1.gysbh

--INSERT INTO #t(gysbh, xjjg, gsyzrq, jyxkzrq, gsprq, frrq,xyrq,xjrq)
--SELECT e1.GYSBH,e.xjjg,e1.gsyzrq, e1.jyxkzrq, e1.gsprq, e1.frrq, e1.xyrq,e.xjrq
--FROM #tt e
--JOIN t_gysxx e1 ON e1.gysbh = e.gysbh
--LEFT JOIN #t e2 ON e2.gysbh = e.gysbh
--WHERE e2.gysbh IS NULL


--SELECT * FROM #t

--DROP TABLE #t
--DROP TABLE #tt

--END

--GO



----------------2018年11月12日 16:46:44-----------------
--------获取商品判断状态，只有flag=1的商品可以查询到
--ALTER PROCEDURE [dbo].[SP_GETSPXX] @spbh varchar(16) AS
--SELECT  T_SPXX.SPBH, T_SPXX.PM,T_SPXX.GG, T_JLDW.JLDW, T_SPXX.JC, T_SCCJ.JC as SCCJ,T_JGXX.LSJ, T_JGXX.PFJ, T_JGXX.GBJ
--FROM T_SPXX LEFT OUTER JOIN
--      T_JLDW ON T_SPXX.JLDWBH = T_JLDW.JLDWBH LEFT OUTER JOIN
--      T_SCCJ ON T_SPXX.CJBH = T_SCCJ.CJBH LEFT OUTER JOIN
--      T_JGXX ON T_SPXX.SPBH = T_JGXX.SPBH
--WHERE t_spxx.FLAG = 1 AND (T_SPXX.SPBH like '%' + @spbh + '%' OR T_SPXX.PM like '%' + @spbh + '%' OR T_SPXX.JC like '%' + @spbh + '%')
--order by t_spxx.spbh
--GO


--------------- 2017年12月2日 16:25:16 -----------------
--增加，判断人员是广安门超市类商品维护人员，只允许获取超市类商品 判断用户 019--李淑云 执行

--create PROCEDURE [dbo].[SP_GETSPXX09] @spbh varchar(16) AS
--SELECT  T_SPXX.SPBH, T_SPXX.PM,T_SPXX.GG, T_JLDW.JLDW, T_SPXX.JC, T_SCCJ.JC as SCCJ,T_JGXX.LSJ, T_JGXX.PFJ, T_JGXX.GBJ
--FROM T_SPXX LEFT OUTER JOIN
--      T_JLDW ON T_SPXX.JLDWBH = T_JLDW.JLDWBH LEFT OUTER JOIN
--      T_SCCJ ON T_SPXX.CJBH = T_SCCJ.CJBH LEFT OUTER JOIN
--      T_JGXX ON T_SPXX.SPBH = T_JGXX.SPBH
--WHERE t_spxx.ypfl = '09' AND (T_SPXX.SPBH like '%' + @spbh + '%' OR T_SPXX.PM like '%' + @spbh + '%' OR T_SPXX.JC like '%' + @spbh + '%' OR t_spxx.spbm = @spbh)
--order by t_spxx.spbh

--GO

---------2017年12月2日 16:30:06------------
--查找商品支持扫码查询

--alter PROCEDURE [dbo].[SP_GETSPXX09] @spbh varchar(16) AS
--SELECT  T_SPXX.SPBH, T_SPXX.PM,T_SPXX.GG, T_JLDW.JLDW, T_SPXX.JC, T_SCCJ.JC as SCCJ,T_JGXX.LSJ, T_JGXX.PFJ, T_JGXX.GBJ
--FROM T_SPXX LEFT OUTER JOIN
--      T_JLDW ON T_SPXX.JLDWBH = T_JLDW.JLDWBH LEFT OUTER JOIN
--      T_SCCJ ON T_SPXX.CJBH = T_SCCJ.CJBH LEFT OUTER JOIN
--      T_JGXX ON T_SPXX.SPBH = T_JGXX.SPBH
--WHERE (T_SPXX.SPBH like '%' + @spbh + '%' OR T_SPXX.PM like '%' + @spbh + '%' OR T_SPXX.JC like '%' + @spbh + '%' OR t_spxx.spbm = @spbh)
--order by t_spxx.spbh

--GO



--if object_id('SP_FKTZ_QK') is not null
--	drop PROCEDURE SP_FKTZ_QK
--GO


--/******************* 过程说明 ******************
--  供应商欠款台账
--  结果  输出供应商欠款台账表
--************************************************/
------增加日期，按到货日期统计
----
--CREATE PROCEDURE SP_FKTZ_QK @jsrq VARCHAR(8) AS
--begin

--	DECLARE @table TABLE
--	(
--		gysbh NVARCHAR(32),
--		gysmc NVARCHAR(128),
--		jh DECIMAL(18,2) DEFAULT 0,
--		th DECIMAL(18,2) DEFAULT 0,
--		ye DECIMAL(18,2) DEFAULT 0
--	)

--	INSERT INTO @table(gysbh, jh)
--	SELECT a.GYSBH,SUM(ROUND(b.jhj * b.sl,2))
--	FROM T_JHDZB a 
--	JOIN T_JHDMXB b ON b.JHDBH = a.JHDBH 
--	WHERE a.JSBZ = 10 AND isnull(b.fkbz,0) = 0 AND b.fk = 1 AND convert(char(8),a.dhRQ,112) <= @jsrq
--	GROUP BY a.GYSBH
	
--	DECLARE @t TABLE ( gysbh VARCHAR(32),th DECIMAL(18,2))	
--	INSERT INTO @t(gysbh, th)
--	SELECT a.GYSBH,SUM(ISNULL(ROUND(a.jhj * a.thsl,2),0))
--	FROM T_THDMXB a
--	JOIN T_THDZB b ON b.THDBH = a.THDBH
--	WHERE b.YXBZ = 10 AND ISNULL(a.fkbz,0) = 0 AND a.fk = 1 AND convert(char(8),b.thRQ,112) <= @jsrq
--	GROUP BY a.GYSBH
	
--	UPDATE a
--	SET a.th = b.th 
--	FROM @table a
--	JOIN @t b ON b.gysbh = a.gysbh
	
--	UPDATE a
--	SET a.gysmc = b.GYSMC
--	FROM @table a
--	JOIN T_GYSXX b ON b.gysbh = a.gysbh
	
--	UPDATE @table 
--	SET ye = jh - th
	

--	SELECT * FROM @table ORDER BY gysbh
--END








--if object_id('SP_ZGSCKMX') is not null
--	drop PROCEDURE SP_ZGSCKMX
--GO

----总公司冲库--------------------------------------------------------------
--/******************* 过程说明 *****************************************************************
--  冲库过程，记录库存
--  参数	@dh	养护编号
--        @yhr	养护人
--  结果	记录库存
--  修改	2016.10.15	增加记录生产日期、到货日期				
--**********************************************************************************************/
--CREATE   PROCEDURE [dbo].[SP_ZGSCKMX] @sspbh varchar(10), @spcbh varchar(20), @sdjhm varchar(15), @ywrq datetime, @yxrq datetime , 
--  @iywtp int, @decjg decimal(10,4), @decsl decimal(10,2), @decjine decimal(10,2), @skw varchar(6),@scrq DATETIME = NULL,@dhrq DATETIME = NULL AS
--begin
--	DECLARE @iordrmax int, @icount int
--	declare @chsl decimal(10,2)
--	declare @sl int 

--	--判断是否有存货
--	if @iywtp < 0
--	BEGIN
--		SELECT @chsl = isnull(chsl,0) FROM T_CHXX WHERE SPBH = @sspbh AND PCBH = @spcbh and hwbh = @skw
--		SELECT @chsl = ISNULL(@chsl,0)
			
--		IF @chsl < @decsl			
--		BEGIN
--			select @sl = cast(@chsl as int)
--				RAISERROR ( '编号为:%s的商品的存货不够(%d)!', 16, 1, @sspbh,@sl)
--				--ROLLBACK TRANSACTION
--				RETURN
--		END
--	END
	
--	IF @dhrq IS NULL 
--		set @dhrq = @ywrq

--	SELECT @yxrq = isnull(@yxrq,getdate())
--	SELECT @iordrmax = ISNULL(MAX(ISNULL(ORDR,0)),0) + 1 FROM T_CKMX WHERE SPBH = @sspbh   --取最大顺序号
--	INSERT INTO T_CKMX VALUES (@sspbh, @spcbh, @sdjhm, @iordrmax, @ywrq, @iywtp, @decjg, @decsl, @decjine, @skw)   --写入数据-T_CKMX
--	SELECT @icount = ISNULL(COUNT(*),0) FROM T_CHXX WHERE SPBH = @sspbh AND PCBH = @spcbh and hwbh = @skw  
--	IF @icount > 0    --发现相应的数据 (批次编号,商品编号)
--	BEGIN
--	  IF @iywtp >= 0   --入库操作
--		BEGIN
--		  IF @iywtp = 1
--			UPDATE T_CHXX 
--			SET YXRQ = @yxrq, CHSL = ISNUll(CHSL,0) + @decsl, JIAG = ((chsl * jiag) + (@decsl * @decjg))/(chsl + @decsl),
--				scrq = @scrq,dhrq = @dhrq
--			WHERE  SPBH = @sspbh AND PCBH = @spcbh and hwbh = @skw
--		  ELSE
--			UPDATE T_CHXX SET CHSL = ISNUll(CHSL,0) + @decsl, YXRQ = @yxrq WHERE  SPBH = @sspbh AND PCBH = @spcbh and hwbh = @skw
--		END 
--	  ELSE   --出库操作
--		BEGIN
--		  UPDATE T_CHXX SET chsl = chsl - @decsl WHERE  SPBH = @sspbh AND PCBH = @spcbh and hwbh = @skw
--		END
--	END
--	ELSE   --没有相应数据 
--	BEGIN
--	  IF @iywtp >= 0  ---入库操作
--		BEGIN
--			IF @scrq IS NULL 
--			BEGIN
--				SELECT @dhrq = MAX(z.jhrq),@scrq = MIN(m.scrq)
--				FROM t_jhdzb z
--				JOIN t_jhdmxb m ON m.JHDBH = z.JHDBH
--				WHERE m.spbh = @sspbh AND pcbh = @spcbh

--			END
--		  INSERT INTO T_CHXX(spbh,pcbh,hwbh,chsl,yxrq,JIAG,flag,scrq,dhrq) VALUES(@sspbh, @spcbh,@skw,@decsl,@yxrq,@decjg,1,@scrq,@dhrq)
--		END
--	  ELSE   ---出库操作
--		BEGIN
--		  RAISERROR ( '编号为:%s的商品的存货不够!', 16, 1, @sspbh )
--		  --ROLLBACK TRANSACTION
--		  RETURN
		  
--		END
--	END
--end


--GO



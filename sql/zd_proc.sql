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



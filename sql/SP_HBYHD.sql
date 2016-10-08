
DROP PROCEDURE [dbo].[SP_HBYHD]
GO


/******************* 过程说明 *****************************************************************
  合并多个要货单为一个，用于进货验证
  参数	@yhdbh   要货单编号
		@hbyhdbh 要合并的要货单号，多个单号，逗号分割
        @zbr   操作人
	@bsr	 操作人
  结果	生成一个退货单
**********************************************************************************************/
CREATE PROCEDURE [dbo].[SP_HBYHD] @yhdbh NVARCHAR(16), @hbyhdbh Nvarchar(128),@zbr nvarchar(15) AS
begin
	create table #t
	(
	YHDBH NVARCHAR(16) null, 
	YHDW NVARCHAR(8) null,
	YHRQ DATETIME null,
	ORDR INT IDENTITY(1,1), 
	SPBH NVARCHAR(16) NULL , 
	GYSBH NVARCHAR(8) null, 
	KLOW DECIMAL(10,2) NULL,
	DCL DECIMAL(10,2) NULL, 
	YHSL DECIMAL(10,2) NULL, 
	jhj DECIMAL(14,4) NULL,
    LSJ DECIMAL(10,2) NULL, 
    FGSKC NVARCHAR(64) NULL, 
    FLAG INT NULL, 
    BZ NVARCHAR(32) NULL
	)
	
	create table #tt
	(	 
	SPBH NVARCHAR(16),	
	YHSL DECIMAL(10,2),
	ordr INT
	)
	
	insert into #t
	select @yhdbh, YHDW, YHRQ, SPBH, GYSBH, KLOW, DCL, YHSL, jhj,
            LSJ, FGSKC, FLAG, BZ
	from t_yhjhmx e
	JOIN fn_SplitToTable(@hbyhdbh,',') e1 ON e.YHDBH=e1.value
	
	INSERT INTO #tt(spbh,yhsl,ordr)
	SELECT spbh,SUM(yhsl) yhsl ,MIN(ordr) ordr
	FROM #t
	GROUP BY SPBH
		
	DECLARE @yhrq DATETIME
	
	--获取要货日期
	SELECT TOP 1 @yhrq = yhrq 
	FROM t_yhjhzb e
	JOIN fn_SplitToTable(@hbyhdbh,',') e1 ON e.YHDBH=e1.value
	
	INSERT INTO t_yhjhzb(YHDBH, YHRQ, BZ, ZBR, JSBZ, YHDW)
	VALUES(@yhdbh,@yhrq,@hbyhdbh,@zbr,0,'000')
	
	INSERT INTO t_yhjhmx(YHDBH, YHDW, YHRQ, ORDR, SPBH, GYSBH, KLOW, DCL, YHSL,
	            jhj, LSJ, FGSKC, FLAG, BZ)
	SELECT e.YHDBH, e.YHDW, e.YHRQ, e.ORDR, e.SPBH, e.GYSBH, e.KLOW, e.DCL, e1.YHSL,
	       e.jhj, e.LSJ, e.FGSKC, e.FLAG, e.BZ
	from #t e
	JOIN #tt e1 ON e.ORDR=e1.ordr
	
		
	drop table #t
end 

GO



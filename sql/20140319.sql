
ALTER TABLE t_yhjhzb 
ALTER COLUMN bz NVARCHAR(128) NULL
GO


if object_id('fn_SplitToTable') is not null
	DROP FUNCTION fn_SplitToTable
GO
CREATE FUNCTION fn_SplitToTable
/****************************************************************************************
'程序代码：fn_SplitToTable
'程序名称：字符串分割
'目　　的：依据要分隔符将传入的字串切割，并传回TABLE
'参数说明：
(
 @sInputString  VARCHAR(8000),  		  --处理字串
 @sSplitChar varchar(8000)		--分割符
)    
'传回值　：Table
'副作用　：无
'备　注　：所有参数都需传入
'范　例　：select * from dbo.fn_SplitToTable('C20041122000001,C20041122000002',',')
****************************************************************************************/
(@sInputString nvarchar(4000) , @sSplitChar varchar(10))
	RETURNS @tbl_List TABLE (idx INT IDENTITY(1,1),value nvarchar(4000))
AS

	BEGIN
		DECLARE	@lInputStringLength	Int ,
			@lPosition		Int ,
			@lSplitChar		Int 


		SET	@lInputStringLength = LEN ( @sInputString )
		SET 	@lPosition=1
		SET	@lSplitChar=1

		WHILE @lPosition <= @lInputStringLength
			BEGIN
				SET @lSplitChar = CHARINDEX ( @sSplitChar , @sInputString , @lPosition)
				IF @lSplitChar = 0
					BEGIN
						INSERT @tbl_List (value )
						SELECT RTRIM(LTRIM(SUBSTRING( @sInputString , @lPosition ,1+ @lInputStringLength - @lPosition)))
						SET @lPosition= @lInputStringLength + 1
					END
		
				ELSE
					BEGIN
						INSERT @tbl_List ( value )
						SELECT RTRIM(LTRIM(SUBSTRING( @sInputString , @lPosition , @lSplitChar - @lPosition)))
						SET @lPosition = @lSplitChar+1
			END
		END
		
        DELETE @tbl_List WHERE RTRIM(value)=''

		RETURN
	END
GO




if object_id('SP_HBYHD') is not null
	DROP PROCEDURE SP_HBYHD
GO
/******************* 过程说明 *****************************************************************
  合并多个要货单为一个，用于进货验证
  参数	@yhdbh   要货单编号
		@hbyhdbh 要合并的要货单号，多个单号，逗号分割
        @zbr   操作人
	@bsr	 操作人
  结果	生成一个退货单
**********************************************************************************************/
CREATE PROCEDURE SP_HBYHD @yhdbh NVARCHAR(16), @hbyhdbh Nvarchar(128),@zbr nvarchar(15) AS
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
    FGSKC DECIMAL(10,2) NULL, 
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

ALTER TABLE t_yhjhmx
ADD dhsl DECIMAL(10,2) NULL DEFAULT 0
GO


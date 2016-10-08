
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




if object_id('SP_CKD2YHD') is not null
	DROP PROCEDURE SP_CKD2YHD
GO
/******************* 过程说明 *****************************************************************
  出库单与要货单比较核对，要货数量少于出库数量的更新要货数量为出库数量，出库单中存在而要货单中
  不存在的商品增加到要货计划中
  参数	@yhdbh   要货单编号
		@ckdbhs  核对的出库单号，多个单号，逗号分割
  结果	
**********************************************************************************************/
CREATE PROCEDURE SP_CKD2YHD @yhdbh NVARCHAR(16), @ckdbhs Nvarchar(4000) AS
BEGIN
	--获取要货计划表最大ordr值
	DECLARE @id INT
	SELECT @id=MAX(ordr)+1 FROM t_yhjhmx WHERE yhdbh=@yhdbh
	DECLARE @sql NVARCHAR(4000)
	SET @sql = '
	create table #t
	(	
	id INT IDENTITY('+cast(@id AS VARCHAR(8))+',1), 
	SPBH NVARCHAR(16) , 
	ckSL DECIMAL(10,2)
	)		
	insert into #t(spbh,cksl)
	SELECT e.spbh,SUM(e.shul) sl
	FROM t_ckdmxb e 
	JOIN fn_SplitToTable('''+@ckdbhs+''','','') e1 ON e.ckDBH=e1.value
	GROUP BY e.spbh
	
	--更新到货数量
	update e
	set e.flag = 255,e.dhsl = e1.cksl
	from t_yhjhmx e
	join #t e1 on e.spbh = e1.spbh
	
	--更新要货计划的要货数量=到货数量 --要货数量<到货数量
	update e
	set e.yhsl = e1.cksl
	from t_yhjhmx e
	join #t e1 on e.spbh = e1.spbh 
	where e.yhsl < e1.cksl
	
	--增加要货计划中不存在的出库商品记录
	insert into t_yhjhmx(YHDBH, YHRQ, ORDR, SPBH, KLOW, DCL, YHSL, LSJ, FLAG,dhsl)
	SELECT '''+@yhdbh+''',GETDATE(),e.id,e.SPBH,0,0,e.ckSL,e1.LSJ,255,e.ckSL
	FROM #t e
	JOIN v_spxx_qtcx e1 ON e.spbh = e1.SPBH
	LEFT JOIN t_yhjhmx e2 ON e.spbh = e2.SPBH AND e2.YHDBH='''+@yhdbh+'''
	WHERE e2.spbh IS NULL
		
	drop table #t'
	
	--PRINT @sql 
	
	EXEC(@sql)
	
end 
GO
if object_id('SP_YHD2YHD') is not null
	DROP PROCEDURE SP_YHD2YHD
GO
/******************* 过程说明 *****************************************************************
  由要货单根据最后进货日期拆分成2个要货单,拆分出来的单据是在@dt日期后面发生过进货的
  参数	@dh   原要货单编号
        @yhdbh   新要货单编号，返回空值表示不需要拆单
		@dt	 商品最后进货日期
  结果	生成两个要货单
**********************************************************************************************/
CREATE PROCEDURE SP_YHD2YHD @dh varchar(15),@yhdbh varchar(15) OUTPUT,@dt DATETIME AS
begin

DECLARE @i INT,@k INT
--SELECT @dh = 'YH16000166',@dt = '2016-01-01',@yhdbh = 'YH16000167'

CREATE TABLE #t
(
	spbh NVARCHAR(32),
	ordr int
)

INSERT INTO #t(spbh,ordr)
SELECT ym.spbh,ym.ORDR
FROM t_yhjhmx ym
JOIN t_jhdmxb jm ON ym.spbh = jm.SPBh
JOIN t_jhdzb jz ON jm.JHDBH=jz.JHDBH
WHERE ym.YHDBH = @dh
GROUP BY ym.SPBH,ym.ORDR
HAVING MAX(jz.jhrq) >= @dt

SELECT @k = COUNT(1) FROM t_yhjhmx WHERE yhdbh = @dh
SELECT @i = COUNT(1) FROM #t
IF @i>0	AND @i <> @k	
	BEGIN
		--有需要拆分的要货数据
		INSERT INTO t_yhjhzb(YHDBH, YHRQ, BZ, ZBR, JSBZ, YHDW)
		SELECT @yhdbh,e.YHRQ, e.BZ+' ['+CONVERT(NVARCHAR(100),@dt,111)+'(含)之后进货品种]', e.ZBR, e.JSBZ, e.YHDW
		FROM t_yhjhzb e
		WHERE e.yhdbh = @dh

		UPDATE e1
		SET e1.yhdbh = @yhdbh
		FROM #t e
		JOIN t_yhjhmx e1 ON e.spbh=e1.spbh AND e.ordr=e1.ORDR
		WHERE e1.YHDBH = @dh
	END
ELSE IF @i = @k
	BEGIN
		--全部是@dt日期后发生进货的数据，也不需要拆单
		select @yhdbh = '0'
	END
ELSE
	BEGIN
		select @yhdbh = ''
	END
	


DROP TABLE #t

END


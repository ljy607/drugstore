if object_id('SP_JHD2BJD') is not null
	DROP PROCEDURE SP_JHD2BJD
GO
/****************
* 通过进货单生成变价单
****************/
CREATE PROCEDURE SP_JHD2BJD @jhdbh varchar(15),@kpr NVARCHAR(3) AS
begin

CREATE TABLE #t
(
	spbh NVARCHAR(16),
	lsj MONEY DEFAULT 0,
	jlsj MONEY DEFAULT 0,
	jpfj MONEY,
	jgbj MONEY,
	dbj  MONEY,
	jhyj DECIMAL(8,2) DEFAULT 0
)

DECLARE @i INT,@bjdbh varchar(15)


--新品
INSERT INTO #t(spbh, lsj,jlsj, jpfj, jgbj, dbj, jhyj)
SELECT distinct m.spbh,m.LSJ,0, m.PFJ, m.GBJ,m.lsj,0
FROM t_jhdmxb m
join t_jgxx j ON m.spbh=j.spbh
WHERE m.jhdbh = @jhdbh AND m.WLHBS = 0 and j.lsj = 0

--毛利低于5%的商品
INSERT INTO #t(spbh, lsj,jlsj, jpfj, jgbj, dbj, jhyj)
SELECT distinct m.spbh,j.lsj,m.LSJ, m.PFJ, m.GBJ,m.lsj,j.hyj
FROM t_jhdmxb m
join t_jgxx j ON m.spbh=j.spbh--销售价格低于进货价1.05的商品
WHERE m.jhdbh = @jhdbh AND m.WLHBS = 0 AND j.lsj > 0 AND (m.jhj *1.05 > j.lsj OR (j.hyj > 0 and m.jhj * 1.05 > j.hyj))

SELECT @i = COUNT(*) FROM #t

IF @i > 0 
BEGIN
	DECLARE @y CHAR(2),@dh NVARCHAR(16)
	
	--判断有无当天未处理的变价单
	SELECT TOP 1  @bjdbh = bjdbh FROM t_bjdzb 
	WHERE jsbz = 0 AND CONVERT(char(8),bjrq,112) = CONVERT(CHAR(8),GETDATE(),112) AND bz LIKE 'JH%'
	IF @bjdbh IS NULL 
	BEGIN
		
		SELECT @y = convert(char(2),GETDATE(),12)	--获取2位年数字
		--获取变价单编号
		SELECT @dh = isnull(max(isnull(BJDBH,'0')),'0') from T_BJDZB WHERE substring(BJDBH,3,2) = @y;
		if @dh = '0' 
			SELECT @bjdbh =  'BJ' + @y + '000001'
		else
			SELECT @bjdbh = SUBSTRING(@dh,1,4) + substring(cast(1000000 + CAST(SUBSTRING(@dh,5,6) AS INT)+1 AS VARCHAR(7)),2,6)
	
	
		INSERT INTO T_bjdzb(BJDBH, BJRQ, PZR, KPR, BZ, JSBZ, DWBH, DWMC)
		VALUES(@bjdbh,GETDATE(),NULL,@kpr,@jhdbh,0,'000','公司')	
	END
	ELSE
		UPDATE t_bjdzb SET bz = bz + ','+@jhdbh WHERE bjdbh = @bjdbh
		
	INSERT INTO T_bjdmxb(BJDBH, SPBH, DWBH, LSZK, JLSJ, LSJ, JPFJ, PFJ, JGBJ,
				GBJ, DBJ, BJYY, jhyj, hyj)
	SELECT @bjdbh,e.spbh,'***',100,e.jlsj,e.lsj,e.jpfj,0,e.jgbj,0,e.dbj,'系统自动生成',e.jhyj,0
	FROM #t e
	LEFT JOIN t_bjdmxb e1 ON e.spbh=e1.spbh  and e1.bjdbh = @bjdbh
	WHERE e1.spbh IS NULL	
	
	SELECT @bjdbh
END


END 






-- 分店库存整体转调拨单
-- 
/* -- 获取调拨单号
select isnull(max(isnull(DBDBH,'0')),'0')   -- select *
from T_DBDZB 
WHERE substring(DBDBH,3,5) = '10625'
order by dbdbh
*/
DECLARE @dh VARCHAR(15),@dcdw VARCHAR(3),@drdw VARCHAR(3)

SELECT @dcdw = '106'
SELECT @drdw = '105'

-- 药品调拨单  
SELECT @dh = 'DB106250663'

CREATE TABLE #t 
(
	spbh VARCHAR(15),
	ordr INT IDENTITY(1,1),
	yxrq DATETIME,
	pcbh VARCHAR(20),
	dbj DECIMAL(10,4),
	lsj DECIMAL(10,4),
	sl DECIMAL(10,4),
	zhek TINYINT,
	yhkw VARCHAR(6),
	scrq DATETIME
)

INSERT INTO T_DBDZB (DBDBH,DBRQ,DCDW,DCJSR,DRDW,DRJSR,KPR,BZ,YXBZ)
VALUES(@dh,'2025.10.20',@dcdw,'',@drdw,'','237','',0)

INSERT INTO #t(spbh, yxrq, pcbh, dbj, lsj, sl, zhek, yhkw, scrq)
SELECT a.spbh,yxrq,pcbh,jiag,j.lsj,chsl,100,hwbh,scrq
FROM t_chxx a
JOIN t_Jgxx j ON j.SPBH = a.SPBH
WHERE chsl > 0 and LEFT(a.spbh,1) IN('1','4')


INSERT INTO t_dbdmxb(DBDBH, ORDR, YXRQ, SPBH, PCBH, DBJ, LSJ, SL, ZHEK, YHKW, scrq)
SELECT @dh,ordr,yxrq, spbh, pcbh, dbj, lsj, sl, zhek, yhkw, scrq
FROM #t 

TRUNCATE TABLE #t

-- 器械调拨单  
SELECT @dh = 'DB106250664'
INSERT INTO T_DBDZB (DBDBH,DBRQ,DCDW,DCJSR,DRDW,DRJSR,KPR,BZ,YXBZ)
VALUES(@dh,'2025.10.20',@dcdw,'',@drdw,'','237','',0)

INSERT INTO #t(spbh, yxrq, pcbh, dbj, lsj, sl, zhek, yhkw, scrq)
SELECT a.spbh,yxrq,pcbh,jiag,j.lsj,chsl,100,hwbh,scrq
FROM t_chxx a
JOIN t_Jgxx j ON j.SPBH = a.SPBH
WHERE chsl > 0 and LEFT(a.spbh,1) IN('3')


INSERT INTO t_dbdmxb(DBDBH, ORDR, YXRQ, SPBH, PCBH, DBJ, LSJ, SL, ZHEK, YHKW, scrq)
SELECT @dh,ordr,yxrq, spbh, pcbh, dbj, lsj, sl, zhek, yhkw, scrq
FROM #t 

TRUNCATE TABLE #t

-- 其他商品调拨单  
SELECT @dh = 'DB106250665'
INSERT INTO T_DBDZB (DBDBH,DBRQ,DCDW,DCJSR,DRDW,DRJSR,KPR,BZ,YXBZ)
VALUES(@dh,'2025.10.20',@dcdw,'',@drdw,'','237','',0)

INSERT INTO #t(spbh, yxrq, pcbh, dbj, lsj, sl, zhek, yhkw, scrq)
SELECT a.spbh,yxrq,pcbh,jiag,j.lsj,chsl,100,hwbh,scrq
FROM t_chxx a
JOIN t_Jgxx j ON j.SPBH = a.SPBH
WHERE chsl > 0 and LEFT(a.spbh,1) not IN('3','1','4')


INSERT INTO t_dbdmxb(DBDBH, ORDR, YXRQ, SPBH, PCBH, DBJ, LSJ, SL, ZHEK, YHKW, scrq)
SELECT @dh,ordr,yxrq, spbh, pcbh, dbj, lsj, sl, zhek, yhkw, scrq
FROM #t 

TRUNCATE TABLE #t
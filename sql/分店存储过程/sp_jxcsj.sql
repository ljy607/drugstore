/******************* 过程说明 *****************************************************************
  查询药品进销存数据
  参数	@rq1	开始日期 2025.1.1 00:00:00
        @rq2	结束日期 2025.12.31 23:59:59
  结果	药品进销存数据，台码 1、3、4 开头
  修改		
**********************************************************************************************/
create PROCEDURE sp_jxcsj @rq1 DATETIME,@rq2 DATETIME AS
begin

--DECLARE @rq1 DATETIME,@rq2 DATETIME
--SET @rq1 = '2020.1.1 00:00:00'
--SET @rq2 = '2020.12.31 23:59:59' 

create table #t
(	
id INT IDENTITY, 
SPBH NVARCHAR(16), 
qcsl DECIMAL(10,2) DEFAULT 0,
jsl DECIMAL(10,2) DEFAULT 0,
xsl DECIMAL(10,2) DEFAULT 0,
csl DECIMAL(10,2) DEFAULT 0
)	

CREATE TABLE #tt
(
	spbh NVARCHAR(32),
	qccl DECIMAL(10,2) DEFAULT 0,	--期初存量
	jsl DECIMAL(10,2) DEFAULT 0,	-- 进数量
	xsl DECIMAL(10,2) DEFAULT 0,	-- 销数量 
	xcl DECIMAL(10,2)  DEFAULT 0	--现存量	
)

CREATE TABLE #t1
(
	spbh NVARCHAR(32),
	sl DECIMAL(10,2) DEFAULT 0
)

-- 查找时间段内的全部商品 
INSERT INTO #t(spbh)
SELECT DISTINCT spbh FROM t_ckmx WHERE fxrq BETWEEN @rq1 AND @rq2  -- and LEFT(spbh,1) IN('1','3','4')

INSERT INTO #tt(spbh) SELECT spbh FROM #t

-- 查询当前库存
INSERT INTO #t1(spbh,sl)
SELECT a.spbh,SUM(isnull(a.chsl,0))
FROM t_chxx a
JOIN #tt b ON b.SPBH = a.SPBH
GROUP by a.spbh 

UPDATE #tt SET #tt.xcl = #t1.sl
FROM #tt 
JOIN #t1 ON #t1.spbh = #tt.spbh

TRUNCATE TABLE #t1

------ 计算截至日期到当前的进数量
insert into #t1(spbh,sl)
SELECT a.spbh,sum(isnull(a.SL,0)) as sl
FROM t_ckmx a
wHERE fxrq > @rq2
AND LEFT(a.spbh,1) IN('1','3','4')
AND a.YWTP > 0
GROUP BY a.spbh

UPDATE #tt SET #tt.jsl = #t1.sl
FROM #tt 
JOIN #t1 ON #t1.spbh = #tt.spbh

TRUNCATE TABLE #t1

------ 计算截至日期到当前的出数量
insert into #t1(spbh,sl)
SELECT a.spbh,sum(isnull(a.SL,0)) as sl
FROM t_ckmx a
wHERE fxrq > @rq2
AND LEFT(a.spbh,1) IN('1','3','4')
AND a.YWTP < 0
GROUP BY a.spbh

UPDATE #tt SET #tt.xsl = #t1.sl
FROM #tt 
JOIN #t1 ON #t1.spbh = #tt.spbh

TRUNCATE TABLE #t1

---- 计算截至日期时间的存量
UPDATE #tt
SET qccl = xcl - jsl + xsl

--SELECT * FROM  #tt WHERE qccl < 0

update #t set #t.csl = #tt.qccl
FROM #t 
JOIN #tt ON #tt.SPBH = #t.SPBH

---------------------------开始计算 查询时间段的进销数据 ------------------
---- 进数量
insert into #t1(spbh,sl)
SELECT a.spbh,sum(isnull(a.SL,0)) as sl
FROM t_ckmx a
wHERE fxrq BETWEEN @rq1 AND @rq2
AND LEFT(a.spbh,1) IN('1','3','4')
AND a.YWTP > 0
GROUP BY a.spbh

UPDATE #t SET #t.jsl = #t1.sl
FROM #t 
JOIN #t1 ON #t1.spbh = #t.spbh

TRUNCATE TABLE #t1

--SELECT * FROM  #t

---- 销数量
insert into #t1(spbh,sl)
SELECT a.spbh,sum(isnull(a.SL,0)) as sl
FROM t_ckmx a
wHERE fxrq BETWEEN @rq1 AND @rq2
AND LEFT(a.spbh,1) IN('1','3','4')
AND a.YWTP < 0
GROUP BY a.spbh

UPDATE #t SET #t.xsl = #t1.sl
FROM #t 
JOIN #t1 ON #t1.spbh = #t.spbh

TRUNCATE TABLE #t1


---- 计算查询时间段的期初存量
UPDATE #t
SET qcsl = csl - jsl + xsl

SELECT e.spbh,e1.pm,e1.gg,e1.cjmc,e1.jldw,e.qcsl,e.jsl,e.xsl,e.csl
FROM #t e
JOIN v_spxx e1 ON e1.SPBH = e.SPBH
where LEFT(e.spbh,1) IN('1','3','4')
ORDER BY e.SPBH

--SELECT * from #tt
--SELECT * FROM #t WHERE csl<0

DROP TABLE #t    
DROP TABLE #tt
DROP TABLE #t1

END

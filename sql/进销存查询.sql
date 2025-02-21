create table #t
(	
id INT IDENTITY, 
SPBH NVARCHAR(16), 
qcsl DECIMAL(10,2),
jsl DECIMAL(10,2),
xsl DECIMAL(10,2),
csl DECIMAL(10,2),
qjsl DECIMAL(10,2),
qxsl DECIMAL(10,2)
)	

-- 进数量	
insert into #t(spbh,jsl)
SELECT a.spbh,sum(isnull(a.SL,0)) as sl
FROM t_ckmx a
wHERE fxrq BETWEEN '2023.1.1' AND '2023.12.31'
AND LEFT(a.spbh,1) IN('1','3','4')
AND a.YWTP >= 0
GROUP BY a.spbh

UPDATE #t SET qcsl = 0,qjsl = 0,qxsl=0,xsl = 0

-- 销数量
UPDATE a SET a.xsl = b.sl
FROM #t a 
JOIN (
SELECT a.spbh,sum(isnull(a.SL,0)) as sl
FROM t_ckmx a
wHERE fxrq BETWEEN '2023.1.1' AND '2023.12.31'
AND LEFT(a.spbh,1) IN('1','3','4')
AND a.YWTP < 0
GROUP BY a.spbh) b ON a.spbh = b.spbh

UPDATE e SET e.qjsl = e1.sl
FROM #t e
JOIN (SELECT a.spbh,sum(isnull(a.SL,0)) as sl
FROM t_ckmx a
wHERE fxrq < '2023.1.1'
AND LEFT(a.spbh,1) IN('1','3','4')
AND a.YWTP >= 0
GROUP BY a.spbh ) e1 ON e.SPbh= e1.spbh

UPDATE e SET e.qxsl = isnull(e1.sl,0)
FROM #t e
JOIN (SELECT a.spbh,sum(isnull(a.SL,0)) as sl
FROM t_ckmx a
wHERE fxrq < '2023.1.1'
AND LEFT(a.spbh,1) IN('1','3','4')
AND a.YWTP < 0
GROUP BY a.spbh ) e1 ON e.SPbh= e1.spbh


UPDATE #t SET qcsl = qjsl-qxsl
--UPDATE #t SET qcsl = 0 WHERE qcsl IS NULL
--UPDATE #t SET xsl = 0 WHERE xsl IS NULL
UPDATE #t SET csl = qcsl + jsl - xsl

--UPDATE #t SET qcsl = xsl - jsl WHERE csl < 0
--UPDATE #t SET csl = qcsl + jsl - xsl

--SELECT * FROM #t WHERE qcsl+jsl-xsl <> csl
      
SELECT a.spbh,b.pm,b.gg,b.jldw,b.cjmc,a.qcsl,a.jsl,a.xsl,a.csl
FROM #t a 
JOIN v_spxx b ON b.SPBH = a.SPBH
WHERE a.spbh=b.SPBH 
ORDER BY a.SPBH  

--SELECT * FROM #t WHERE qcsl +jsl -xsl <> csl

DROP TABLE #t    
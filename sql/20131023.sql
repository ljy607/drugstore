--SELECT *
--FROM t_ckdmxb m
--JOIN t_ckdzb z ON m.CKDBH=z.CKDBH
--LEFT JOIN t_lsdmxb lm ON m.spbh = lm.SPBH
--LEFT JOIN t_lsdzb lz ON lm.LSDBH = lz.LSDBH
--WHERE z.ckd

DECLARE @y INT,@yr INT
SET @y = -12
--SET @yr = 6

CREATE TABLE #t (spbh NVARCHAR(32),ckrq DATETIME)
CREATE TABLE #tt(spbh NVARCHAR(32),xsrq DATETIME)

-- 一年内最后进货日期
INSERT INTO #t(spbh,ckrq)
SELECT cm.spbh,MAX(cz.jhrq) ckrq
FROM t_jhdzb cz
JOIN t_jhdmxb cm ON cz.jhDBH=cm.jhDBH
JOIN t_spxx sp ON cm.spbh = sp.spbh 
WHERE sp.YHBZ='Y' AND sp.FLAG=1 AND sp.LBBH <> '07'
GROUP BY cm.SPBH
HAVING MAX(cz.jhrq) < DATEADD(mm,@y,GETDATE()) 

--INSERT INTO #t(spbh,ckrq)
--SELECT cm.spbh,MAX(cz.ckrq) ckrq
--FROM t_ckdzb cz
--JOIN t_ckdmxb cm ON cz.CKDBH=cm.CKDBH
--JOIN t_spxx sp ON cm.spbh = sp.spbh 
--WHERE sp.YHBZ='Y' --AND sp.spbh = '100377'
--GROUP BY cm.SPBH
--HAVING MAX(cz.ckrq) < DATEADD(mm,@y,GETDATE())

SELECT * FROM #t

--INSERT #tt(spbh,xsrq)
--SELECT lm.SPBH,MIN(lz.ckrq) rq
--FROM #t a
--JOIN t_ckdmxb lm ON a.spbh=lm.spbh 
--join t_ckdzb lz ON lz.ckDBH=lm.ckDBH AND a.ckrq < lz.ckrq
----WHERE lm.spbh = '100377'
--GROUP BY lm.SPBH,a.ckrq
--HAVING DATEDIFF(mm,a.ckrq,MIN(lz.ckrq)) > @yr
--ORDER BY lm.SPBH

--SELECT e.*
--FROM t_spxx e 
--LEFT JOIN (
--SELECT a.spbh
--FROM #t a 
--left JOIN #tt b ON a.spbh = b.spbh
--WHERE b.spbh IS NULL
--) e1 ON e.spbh = e1.spbh
--WHERE e1.spbh IS NULL AND e.YHBZ='Y' AND e.spbh = '100377'

--UNION 

--SELECT spbh FROM #tt

--UPDATE p
--SET p.FLAG=0,GXRQ = GETDATE()
--FROM t_spxx p
--JOIN #t t ON p.SPBH=t.spbh


DROP TABLE #t
DROP TABLE #tt






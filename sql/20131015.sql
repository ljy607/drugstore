--SELECT *
--FROM t_ckdmxb m
--JOIN t_ckdzb z ON m.CKDBH=z.CKDBH
--LEFT JOIN t_lsdmxb lm ON m.spbh = lm.SPBH
--LEFT JOIN t_lsdzb lz ON lm.LSDBH = lz.LSDBH
--WHERE z.ckd

CREATE TABLE #t (spbh NVARCHAR(32),ckrq DATETIME)
CREATE TABLE #tt(spbh NVARCHAR(32),xsrq DATETIME)

INSERT INTO #t(spbh,ckrq)
SELECT cm.spbh,MAX(cz.ckrq) ckrq
FROM t_ckdzb cz
JOIN t_ckdmxb cm ON cz.CKDBH=cm.CKDBH
JOIN t_spxx sp ON cm.spbh = sp.spbh 
WHERE sp.YHBZ='Y' --AND sp.spbh = '100377'
GROUP BY cm.SPBH
HAVING MAX(cz.ckrq) < DATEADD(mm,-12,GETDATE())

--SELECT * FROM #t

INSERT #tt(spbh,xsrq)
SELECT lm.SPBH,MIN(lz.rq) rq
FROM #t a
JOIN t_lsdmxb lm ON a.spbh=lm.spbh 
join t_lsdzb lz ON lz.LSDBH=lm.LSDBH AND a.ckrq < lz.rq
--WHERE lm.spbh = '100377'
GROUP BY lm.SPBH,a.ckrq
HAVING DATEDIFF(mm,a.ckrq,MIN(lz.rq)) > 12
ORDER BY lm.SPBH

SELECT e.*
FROM t_spxx e 
LEFT JOIN (
SELECT a.spbh
FROM #t a 
left JOIN #tt b ON a.spbh = b.spbh
WHERE b.spbh IS NULL
) e1 ON e.spbh = e1.spbh
WHERE e1.spbh IS NULL AND e.YHBZ='Y' AND e.spbh = '100377'

--UNION 

--SELECT spbh FROM #tt




DROP TABLE #t
DROP TABLE #tt






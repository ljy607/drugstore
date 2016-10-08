DECLARE @cgr VARCHAR(3),@zlgly VARCHAR(3),@zlfzr VARCHAR(3)

SELECT @cgr = '124',@zlgly='020',@zlfzr='014'


SELECT ts.spbh,ts.pcbh,MIN(z.ckRQ) ckrq
INTO #t
FROM T_ckdmxb ts
JOIN t_ckdzb z ON ts.ckdbh = z.ckDBH
JOIN v_spxx s ON ts.spbh = s.SPBH
WHERE z.ckrq > '2011-05-31'
AND ts.spbh NOT IN (
	SELECT m.spbh
	FROM t_ckdmxb m 
	JOIN t_ckdzb z ON m.ckdbh=z.ckdbh
	WHERE z.ckrq <'2011-06-01' )
AND s.ypfl IN('01','04','07')
GROUP BY ts.SPBH,ts.PCBH

--SELECT * FROM #t

SELECT distinct z.GYSBH,e.*
INTO #tt
FROM T_JHDZB z
JOIN t_jhdmxb m ON z.JHDBH=m.JHDBH
JOIN #t e ON m.spbh=e.spbh AND m.pcbh=e.pcbh
ORDER BY z.GYSBH,e.spbh

SELECT e.gysbh,g.gysmc,e.spbh,e.pcbh,s.pm,s.gg,s.PZWH,s.CJMC
FROM #tt e
JOIN v_spxx s ON e.spbh=s.SPBH
JOIN t_gysxx g ON e.gysbh=g.GYSBH
ORDER BY e.gysbh,e.spbh


DROP TABLE #t
DROP TABLE #tt

GO


--SELECT  TOP 10 *
--FROM T_SYPZSPB ts



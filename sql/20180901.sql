-----禁用商品  2018年9月1日 13:03:08
SELECT e.SPBH, e.PM, e.GG,e.FLAG,e3.cjmc
FROM t_spxx e
JOIN v_spxx e3 ON e.spbh=e3.SPBH
left JOIN (SELECT DISTINCT spbh 
FROM t_fgskc ) kc ON e.spbh=kc.SPBH
left JOIN (
	SELECT distinct j1.spbh 
	FROM t_jhdzb j
	JOIN t_jhdmxb j1 ON j1.JHDBH = j.JHDBH
	WHERE j.jhrq > '2015-12-31') e1 ON e.spbh = e1.spbh
LEFT JOIN t_chxx e5 ON e.spbh = e5.SPBH
WHERE kc.spbh IS NULL AND e1.spbh IS NULL AND e5.spbh IS NULL AND e.FLAG = 1
ORDER BY e.SPBH




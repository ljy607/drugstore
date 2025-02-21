
SELECT s.spbh,s.PM, s.GG, s.CJMC,jldw,pzwh,s.ypztmc,s.jgzt
FROM v_spxx s
LEFT JOIN (
SELECT jm.spbh
FROM t_jhdmxb jm
JOIN t_Jhdzb jz ON jz.JHDBH = jm.JHDBH
WHERE jz.jhrq >= '2023.6.1'
UNION 
SELECT spbh
FROM t_chxx ch WHERE hwbh <> 'H01'
UNION
SELECT spbh
FROM T_FGSKC tf
) e ON s.spbh=e.spbh
WHERE s.FLAG = 1 AND e.spbh IS NULL


SELECT e.spbh,e.pm,e.FLAG,e.GXRQ	 -- update e set e.flag = 0,gxrq=getdate()
FROM t_spxx e
JOIN (
SELECT s.spbh,s.PM, s.GG, s.CJMC,jldw,pzwh,s.ypztmc,s.jgzt
FROM v_spxx s
LEFT JOIN (
SELECT jm.spbh
FROM t_jhdmxb jm
JOIN t_Jhdzb jz ON jz.JHDBH = jm.JHDBH
WHERE jz.jhrq >= '2023.6.1'
UNION 
SELECT spbh
FROM t_chxx ch WHERE hwbh <> 'H01'
UNION
SELECT spbh
FROM T_FGSKC tf
) e ON s.spbh=e.spbh
WHERE s.FLAG = 1 AND e.spbh IS NULL
) e1 ON e.spbh =e1.spbh 
WHERE LEFT(e.spbh,1) <> '7'


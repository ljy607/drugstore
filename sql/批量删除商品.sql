SELECT sp.spbh,sp.pm,sp.gxrq   -- update sp set sp.flag = 0,sp.gxrq=getdate()  
FROM t_spxx sp   
LEFT JOIN (
SELECT spbh
FROM t_jhdmxb m
JOIN t_jhdzb z ON z.JHDBH = m.JHDBH
WHERE z.jhrq > '2022.11.30'
UNION 
SELECT spbh FROM t_chxx WHERE chsl > 0
UNION 
SELECT spbh FROM t_fgskc WHERE shul - yxsl > 0 
) a ON sp.spbh = a.spbh 
WHERE sp.flag = 1 AND a.spbh IS NULL AND left(sp.spbh,1) <> '7' AND sp.spbh <> '50112'
--ORDER BY sp.GXRQ




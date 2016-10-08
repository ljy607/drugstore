SELECT z.jhdbh,z.jhrq,z.GYSBH,g.gysmc,m.spbh,s.pm,s.gg,s.cjmc,m.pcbh,m.SL
FROM t_jhdzb z
JOIN t_jhdmxb m ON m.JHDBH = z.JHDBH
JOIN v_spxx s ON m.spbh = s.SPBH
JOIN T_GYSXX g ON z.GYSBH = g.GYSBH
JOIN ( SELECT DISTINCT spbh FROM t_fgskc WHERE shul - yxsl > 0) f ON m.spbh = f.SPBH
WHERE z.bz LIKE '%»Î¥Ì%' 
ORDER BY z.jhrq DESC
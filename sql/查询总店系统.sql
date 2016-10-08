----查询商品价格、会员价、核算价
SELECT DISTINCT s.spbh,s.pm,s.gg,s.cjmc,l.splb,l.rate,j.ZDJJ,j.LSJ, j.hyj,(1+l.rate)*j.ZDJJ AS hsjhj
FROM v_spxx s
JOIN t_fgskc c ON s.spbh = c.SPBH
JOIN t_splb l ON l.SPLBBH=s.LBBH
JOIN t_jgxx j ON s.spbh = j.SPBH
ORDER BY s.SPBH
------# 修改进货价 2024年1月18日 15:22:17
/* 
-- 总店部分  
SELECT * -- update m set m.jhj = 18
FROM t_jhdmxb  m
WHERE spbh = '402067' AND jhj = 0.01

SELECT *  -- update j set j.zdjj = 18
FROM T_JGXX j
WHERE spbh = '402067'

*/

SELECT * -- update c set c.jiag = 18
FROM t_chxx c
WHERE c.spbh = '402067' AND pcbh = '230724'

SELECT z.jsdw,m.*  -- update m set m.jhj = 18
FROM t_ckdmxb m 
JOIN t_ckdzb z ON z.CKDBH = m.CKDBH
WHERE spbh = '402067' AND pcbh = '230724'

SELECT *  -- update m set jhjhs = 21.6000,jhj = 18
FROM t_lsdmxb m
WHERE m.spbh = '402067' AND m.pcbh = '230724'


SELECT m.*
FROM t_lsdmxb m 
JOIN t_lsdzb z ON z.LSDBH = m.LSDBH
WHERE z.rq > '2018-1-1' AND m.lsj < m.jhjhs
ORDER BY m.SPBH
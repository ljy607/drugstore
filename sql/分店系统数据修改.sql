-------2020年2月8日 20:38:55
----分店系统：益德堂屏蔽304972商品在18年12月31日前的销售记录
SELECT m.*
--INTO t_lsdmxb_del
DELETE m
FROM t_lsdmxb m
JOIN t_lsdzb z ON z.LSDBH = m.LSDBH
WHERE z.rq < '2019.1.1' AND m.spbh IN('304972')


SELECT *
FROM t_lsdmxb_del


-------2020��2��8�� 20:38:55
----�ֵ�ϵͳ�����������304972��Ʒ��18��12��31��ǰ�����ۼ�¼
SELECT m.*
--INTO t_lsdmxb_del
DELETE m
FROM t_lsdmxb m
JOIN t_lsdzb z ON z.LSDBH = m.LSDBH
WHERE z.rq < '2019.1.1' AND m.spbh IN('304972')


SELECT *
FROM t_lsdmxb_del


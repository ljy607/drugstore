SELECT m.*
FROM t_lsdmxb m 
JOIN t_lsdzb z ON z.LSDBH = m.LSDBH
WHERE z.rq > '2018-3-1' AND m.lsj < m.jhjhs
ORDER BY m.SPBH

----���¼۸�
--UPDATE a
--SET a.jhjhs = 187.8261
----SELECT a.*
--FROM t_lsdmxb a
--WHERE a.lsdbh = '1803090117' AND a.ORDR = 1

----��ѯ��Ӧ��Ʒ��ʷ�۸�
--SELECT tl.*
--FROM T_LSDMXB tl
--JOIN t_lsdzb z ON z.LSDBH = tl.LSDBH
--WHERE spbh = '73743' AND z.rq > '2018-2-1'
--ORDER BY tl.LSDBH


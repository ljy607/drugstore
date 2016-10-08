--SELECT *
--FROM T_LSDMXB tl
--WHERE LEFT(tl.lsdbh,6) > '160501' AND lsj * 1.5 < jhjhs 

--SELECT v.pm,m.*
--FROM t_lsdmxb m
--JOIN v_spxx v ON v.SPBH = m.SPBH
--WHERE m.spbh IN('30515','30522')

UPDATE l
SET jhj = 3,jhjhs=3
FROM t_lsdmxb l
WHERE l.spbh = '30515'

--SELECT *
UPDATE tc SET tc.jiag = 3
FROM T_CHXX tc
WHERE tc.SPBH= '30515'

--SELECT *
UPDATE tc SET tc.jhj = 3
FROM T_Ckdmxb tc
WHERE spbh = '30515'

--UPDATE l
--SET jhj = 6,jhjhs=6
--FROM t_lsdmxb l
--WHERE l.spbh = '30522'



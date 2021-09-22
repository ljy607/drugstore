SELECT DISTINCT sbbz
FROM t_spxx WHERE pzwh LIKE '国药准字%'
AND flag = 1

UPDATE t_spxx SET sbbz = 1 WHERE pzwh LIKE '国药准字%' and sbbz = 0



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




select a.fgsbh,a.spbh,a.pcbh,a.shul,a.gxrq,b.CHSL,b.gxrq
from HJ00.zddb.dbo.t_fgskc a
JOIN t_chxx b ON a.spbh = b.spbh AND a.pcbh = b.pcbh AND a.shul = b.CHSL
WHERE a.fgsbh = '108'


select b.*
from t_chxx b 
left join HJ00.zddb.dbo.t_fgskc a ON a.spbh = b.spbh AND a.pcbh = b.pcbh AND a.shul <> b.CHSL
WHERE a.fgsbh = '108' AND a.spbh IS NULL

SELECT *
FROM t_chxx_tbjl tct

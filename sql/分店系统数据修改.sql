-- ������״̬�޸� 
SELECT *  -- update a set a.yxbz = 0
FROM t_dbdzb a  
WHERE 1=1 
--and yxbz = 1
AND dbdbh = 'DB107250008'

SELECT *
FROM t_dbdmxb 
WHERE 1=1 
--and spbh = '423311'
and dbdbh = 'DB107250008'

-- �˿ⵥ״̬�޸�
SELECT * -- update a set a.flag = 5
FROM t_tkdzb a WHERE FLAG = 2


-- ɾ�����Ŷ��� 2022��10��9�� 11:38:04
SELECT *  
--DELETE a
FROM T_LSDZB_W a
WHERE lsdbh = '22100710522102';

SELECT *  
--delete a
FROM T_LSDmxB_W a
WHERE lsdbh = '22100710522102';

SELECT * 
--update a SET chsl = 1,gxrq = GETDATE() 
FROM t_chxx a 
WHERE spbh = '42204';

SELECT * 
--DELETE a
FROM t_ckmx a WHERE djhm = '22100710522102';


SELECT DISTINCT sbbz
FROM t_spxx WHERE pzwh LIKE '��ҩ׼��%'
AND flag = 1

UPDATE t_spxx SET sbbz = 1 WHERE pzwh LIKE '��ҩ׼��%' and sbbz = 0



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

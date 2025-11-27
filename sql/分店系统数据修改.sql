----------- 删除出库单
SELECT m.*   -- delete m
FROM t_ckdzb z
JOIN t_ckdmxb m ON m.CKDBH = z.CKDBH
WHERE z.ckdbh = 'CK25001214'

SELECT *  -- delete z   -- update z set jsdw = '105',yxbz = 10
FROM t_ckdzb z
WHERE z.ckdbh = 'CK25001214'

------- 更新退货、退库单 委外上传标志 2025年6月23日 10:44:46
SELECT *   --  update tt set wwbz = 1
FROM T_TkDZB tt
WHERE tkdbh = 'TK10225000050'

SELECT *   --  update tt set wwbz = 1
FROM T_THDZB tt
WHERE thdbh = 'TH25000140'


------- 要货单删除  2025年6月3日 09:05:53
SELECT *  -- delete a
FROM t_yhjhzb a
WHERE yhdbh IN ('YH16000046','YH16000035')

SELECT *   -- delete a
FROM t_yhjhmx a
WHERE yhdbh IN ('YH16000046','YH16000035')

SELECT *  -- delete a
FROM t_yhjhzb a
WHERE 1=1 
and a.jsbz = 0
--AND yhdbh IN ('YH18000008','YH17000047')

SELECT DISTINCT a.yhdbh   -- delete a
FROM t_yhjhmx a 
JOIN t_yhjhzb b ON b.YHDBH = a.YHDBH
WHERE 1=1 
AND b.JSBZ = 0
--and yhdbh IN ('YH16000046','YH16000035')

--损益单
SELECT *  -- delete m
FROM t_bsdzb z
JOIN t_bsdmxb m ON m.BSDBH = z.BSDBH
WHERE z.yxbz >0 AND yxbz < 10

SELECT *  -- delete z
FROM t_bsdzb z
WHERE z.yxbz >0 AND yxbz < 10

SELECT *  -- update s set s.scrq = '2023-02-02 00:00:00.000'
FROM t_bsdmxb s
WHERE bsdbh = 'BS24000032' AND spbh = '306635' AND pcbh = '230201'

SELECT *  -- update s set s.scrq = '2024-06-27 00:00:00.000'
FROM t_bsdzb s
WHERE bsdbh = 'BS25000021' 

SELECT s.spbh,s.pcbh,s.scrq,m.scrq   -- update s set s.scrq = m.scrq
FROM t_bsdmxb s
JOIN t_bsdzb z ON z.BSDBH = s.BSDBH -- AND z.yxbz = 5
JOIN t_ckdmxb m ON m.SPBH = s.SPBH AND m.PCBH = s.PCBH 
WHERE s.scrq IS NULL

-- 调拨单状态修改 
SELECT *  -- update a set a.yxbz = 0  -- delete a
FROM t_dbdzb a  
WHERE 1=1 
--and yxbz = 1
AND dbdbh = 'DB107250008'

SELECT *   -- delete a
FROM t_dbdmxb a
WHERE 1=1 
--and spbh = '423311'
and dbdbh = 'DB107250008'

-- 退库单状态修改
SELECT * -- update a set a.flag = 5
FROM t_tkdzb a WHERE FLAG = 2

SELECT * -- delete a
FROM t_tkdzb a WHERE tkdbh IN ('TK22000525')

SELECT * -- delete a
FROM t_tkdmxb a WHERE tkdbh IN ('TK22000525')



-- 删除美团订单 2022年10月9日 11:38:04
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

------------补录进货单 2021年9月15日 16:23:45
INSERT INTO t_jhdzb(JHDBH, JHRQ, GYSBH, FKQX, PJKL, LRR, JSBZ, BZ, fkbz, ysr, JHDW,
            yhdbh, pmje, wmsflag, zpflag, dhrq, fdyhd, fdckd, zdfh, flag)
SELECT 'JH21001721',jhrq,'00347',FKQX, PJKL, LRR, JSBZ, BZ, fkbz, ysr, JHDW, yhdbh, 858,
       wmsflag, zpflag, dhrq, fdyhd, fdckd, zdfh, flag
FROM t_jhdzb 
WHERE jhrq BETWEEN '2021-5-9' AND '2021-5-11'
AND jhdbh = 'JH21000872'

INSERT INTO t_jhdmxb(JHDBH, ORDR, LPHM, SPBH, YXQ, SCRQ, PCBH, SL, PFJ, JHJ, LSJ,
            GBJ, KL, HWBH, FLAG, SCCJ, PZWH, fkbz, FK, DJZBH, WLHBS, qjhj,
            HGSL, YHSL, fhflag, cd, scqyxkzh, jybgpath)
SELECT 'JH21001721', 1, '0072', spbh, '2023-02-01', SCRQ, '129211068', 30, PFJ, 28.6, LSJ, GBJ, KL, HWBH,
       FLAG, SCCJ, PZWH, fkbz, FK, DJZBH, WLHBS, qjhj, 30, 30, fhflag, cd,
       scqyxkzh, 'E:\良田\WORKPATH\国药控股\11447_129211068.jpg'
FROM t_jhdmxb 
WHERE jhdbh = 'JH21001153' AND spbh = '11447'
------- 修改 出库单 批号
SELECT *  -- update a set a.pcbh= '129211068'
FROM t_ckdmxb a
WHERE ckdbh = 'CK21000639' AND spbh = '11447'



----- 修改进货单 供应商 2021年9月14日 14:06:53
SELECT jhdbh,jhrq,gysbh,pmje   -- update a set a.gysbh='00336'
FROM T_JHDZB a
WHERE jhdbh IN('jh21001652','jh21001653')
---- 查询关联进口药记录表里涉及对应进货单的数据，涉及的同时修改对应供应商 
SELECT *
FROM T_JKYPDJB 
WHERE jhdbh IN('jh21001652','jh21001653')

--SELECT * FROM t_gysxx WHERE gysbh = '00336'

------删除退货单中 退货区的商品存量 2021年7月29日 10:24:13 ----------------
SELECT *  -- delete c
FROM T_THDMXB tt
JOIN T_THDZB tt2 ON tt2.THDBH = tt.THDBH
JOIN t_chxx c ON tt.spbh = c.spbh AND tt.pcbh = c.PCBH
WHERE tt.THDBH IN('th21000215','th21000224')

-----更新进货单付款标识 2021年6月1日 16:20:17 ---------------
SELECT z.*
FROM t_jhdzb z
WHERE z.jhdbh in( 'JH20000027','JH20000098','JH20000481','JH20001207')

SELECT z.*
FROM t_jhdzb z
WHERE z.jhdbh in( 'JH19001870','JH19002739')


SELECT m.jhdbh,m.ORDR,m.spbh,m.fkbz,m.FK  -- update m set m.fkbz = 0
FROM t_Jhdmxb m  
WHERE m.jhdbh in( 'JH20000027','JH20000098','JH20000481','JH20001207')

SELECT m.jhdbh,m.ORDR,m.spbh,m.fkbz,m.FK,m.id   -- update m set m.fkbz = 0
FROM t_Jhdmxb m  
-- LEFT JOIN T_FKJLMXB tf ON m.id = tf.id --AND tf.lx = 1
WHERE m.jhdbh in( 'JH19001870','JH19002739')

SELECT * FROM T_FKJLMXB tf WHERE tf.FKJLBH='2021000226'

SELECT * 
FROM t_fkjlzb a 
JOIN t_fkjlmxb b ON a.FKJLBH=b.FKJLBH
WHERE a.gysbh = '000304'--#  退货付款
SELECT *
FROM T_FKJLMXB tf 
JOIN T_THdmxb tm ON tf.ID=tm.id AND tf.lx=2
WHERE tf.FKJLBH='2021000226'

--# 进货付款
SELECT tf.*,tz.jhdbh,tz.gysbh,tm.SL, tm.JHJ, tm.KL, tm.fkbz,sl*jhj
FROM T_FKJLMXB tf 
JOIN T_jHdmxb tm ON tf.ID=tm.id AND tf.lx=1
JOIN t_jhdzb tz ON tm.JHDBH=tz.JHDBH
WHERE tf.FKJLBH='2021000226'

----- 查询最近半年进货最低价的商品 2021年4月20日 17:20:20 --------------
SELECT g.GYSMC,m.spbh,s.pm,s.gg,s.CJMC,min(m.jhj)
FROM t_jhdzb z
JOIN t_jhdmxb m ON m.JHDBH = z.JHDBH
JOIN v_spxx s ON m.spbh = s.SPBH
JOIN t_gysxx g ON z.GYSBH=g.GYSBH
WHERE DATEDIFF(DAY,z.JHRQ,GETDATE()) < 181
GROUP BY g.GYSMC,s.pm,m.spbh,s.gg,s.CJMC
ORDER BY m.spbh

-------------- 修改网店出库单状态 2021年4月14日 18:02:09 ----------
SELECT *   -- UPDATE a SET a.yxbz = 15
FROM T_CKDZB a
WHERE jsdw = '201' AND yxbz = 10


--------------查询库存商品信息  2021年4月3日 13:24:08  -------------
SELECT DISTINCT a.spbh,s.pm,s.gg,s.CJMC,s.GMP,j.lsj,j.ZDJJ,s.is
FROM t_fgskc a 
JOIN V_SPXX s ON a.spbh = s.SPBH
JOIN t_jgxx j ON a.spbh = j.SPBH
WHERE a.shul - a.yxsl > 0

----------网店系统数据导出sql  2021年4月2日 11:11:55 -------------
SELECT a.spbh 商家编码,a.spbh 货品编码,b.pm 货品名称,b.gg 规格名称,'' 规格码,b.spbm 条码,0 最低售价,0 零售价,0 成本价,
0 批发价, 0 会员价,0 市场价,0 有效期,0 长,0 宽,0 高,0 重量,0 税率,0 启用序列号,0 允许负库存,0 出库不用验货,
0 允许0成本,0 允许低于成本价,0 航空禁运,0 大件,0 单品基本单位,0 单品辅助单位,a.pcbh 单品自定义1,a.yxrq 单品自定义2,
'' 单品自定义3,'' 单品自定义4,'' 单品自定义5,'' 单品自定义6,'' 最佳销售期,'' 最佳收货期,'' 销售积分,'' 打包积分,
'' 拣货积分,'' 单品备注,'' 同一批次出库
FROM t_ckdmxb a
JOIN v_spxx b ON a.spbh=b.spbh
WHERE ckdbh = 'CK19000314'


--------2020年2月8日 20:35:38
-----处理总店临时删除数据 公司系统：屏蔽304972、304973、30434三种商品2020年1月22日前的进货记录
SELECT m.* -- UPDATE m SET m.FLAG = 0
FROM t_jhdmxb m
JOIN t_jhdzb z ON z.JHDBH = m.JHDBH
WHERE z.jhrq > '2020.1.22' AND m.spbh IN ('304972','304973','30434')

---- 修改公司零售的情况  2021年3月10日 17:21:36
SELECT *
FROM t_chxx 
WHERE spbh = '30924'

---- 更新台帐数量 
SELECT *  --  UPDATE a SET a.sl=50,a.jine=50*jiag
FROM t_ckmx a
WHERE djhm = 'gsls' AND SPBH='30924' AND ordr=28

---- 新增库存数量
INSERT INTO t_chxx(SPBH, PCBH, yxrq, jiag,sccj,scrq,dhrq,CHSL,HWBH, FLAG)
SELECT TOP 1 spbh,pcbh,yxq,jhj,sccj,SCRQ,b.jhrq,50,'H01',1
FROM t_jhdmxb a
JOIN t_jhdzb b ON b.JHDBH = a.JHDBH
WHERE spbh = '30924' AND pcbh = '20200908'
ORDER BY a.jhdbh desc






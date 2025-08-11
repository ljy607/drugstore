/*
-- 进货单
SELECT COUNT(*)
FROM t_jhdmxb m
JOIN t_jhdzb z ON z.JHDBH = m.JHDBH
WHERE z.jhrq < '2020.7.1'

SELECT count(*)
FROM t_jhdzb z
WHERE z.jhrq < '2020.7.1'

-- 出库单
SELECT  COUNT(*)
FROM t_ckdmxb m
JOIN t_ckdzb z ON z.CKDBH = m.CKDBH
WHERE z.ckrq < '2020.7.1'

SELECT  COUNT(*)
FROM t_ckdzb z 
WHERE z.ckrq < '2020.7.1'

-- 损益单
SELECT  COUNT(*)
FROM t_bsdmxb m 
JOIN t_bsdzb z ON z.BSDBH = m.BSDBH
WHERE z.bsrq < '2020.7.1'

SELECT  COUNT(*)
FROM t_bsdzb z 
WHERE z.bsrq < '2020.7.1'

-- 调拨单
SELECT  COUNT(*)
FROM t_dbdmxb m 
JOIN t_dbdzb z ON z.dbDBH = m.dbDBH
WHERE z.dbrq < '2020.7.1'

SELECT  COUNT(*)
FROM t_dbdzb z 
WHERE z.dbrq < '2020.7.1'

-- 变价单
SELECT  COUNT(*)
FROM t_bjdmxb m 
JOIN t_bjdzb z ON z.BjDBH = m.BjDBH
WHERE z.bjrq < '2020.7.1'

SELECT  COUNT(*)
FROM t_bjdzb z 
WHERE z.bjrq < '2020.7.1'

-- 退库单
SELECT  COUNT(*)
FROM t_tkdmxb m 
JOIN t_tkdzb z ON z.tkDBH = m.tkDBH
WHERE z.tkrq < '2020.7.1'

SELECT  COUNT(*)
FROM t_tkdzb z 
WHERE z.tkrq < '2020.7.1'

-- 退货单
SELECT  COUNT(*)
FROM t_thdmxb m 
JOIN t_thdzb z ON z.thDBH = m.thDBH
WHERE z.thrq < '2020.7.1'

SELECT  COUNT(*)
FROM t_thdzb z 
WHERE z.THrq < '2020.7.1'

-- 盘点单
SELECT  COUNT(*)
FROM t_pddmxb m 
JOIN t_pddzb z ON z.pdDBH = m.pdDBH
WHERE z.pdrq < '2020.7.1'

SELECT  COUNT(*)
FROM t_pddzb z 
WHERE z.pdrq < '2020.7.1'

-- 养护记录
SELECT  COUNT(*)
FROM t_yhjlmx m 
JOIN t_yhjlzb z ON z.yhjlBH = m.yhjlBH
WHERE z.yhrq < '2020.7.1'

SELECT  COUNT(*)
FROM t_yhjlzb z 
WHERE z.yhrq < '2020.7.1'

-- 分店要货单
SELECT  COUNT(*)
FROM t_fdyhmxb m 
JOIN t_fdyhzb z ON z.yhDBH = m.yhDBH
WHERE z.yhrq < '2020.7.1'

SELECT  COUNT(*)
FROM t_fdyhzb z 
WHERE z.yHrq < '2020.7.1'

-- 公司要货单
SELECT  COUNT(*)
FROM t_yhjhmx m 
JOIN t_yhjhzb z ON z.yhDBH = m.yhDBH
WHERE z.yhrq < '2020.7.1'

SELECT  COUNT(*)
FROM t_yhjhzb z 
WHERE z.yHrq < '2020.7.1'

-- 零售汇总
SELECT  COUNT(*)
FROM t_lshzb 
WHERE lsrq < '2020.7.1'

-- 出入库明细
SELECT TOP 100 *
FROM t_ckmx 
WHERE fxrq < '2020.7.1'

-- 付款记录
SELECT TOP 100 m.*
FROM t_fkjlmxb m
JOIN t_fkjlzb z ON z.FKJLBH = m.FKJLBH
WHERE z.fkrq < '2020.7.1'

SELECT TOP 100 z.*
FROM t_fkjlzb z
WHERE z.fkrq < '2020.7.1'

SELECT TOP 100 *
FROM T_FKJL 
WHERE ywrq < '2020.7.1'

-- 首营品种
SELECT *
FROM T_SYPZSPB ts
WHERE cgrq < '2020.7.1'

-- 首营企业
SELECT *
FROM T_SYqySPB ts
WHERE zbrq < '2020.7.1'

*/

-- 进货单
DELETE m
FROM t_jhdmxb m
JOIN t_jhdzb z ON z.JHDBH = m.JHDBH
WHERE z.jhrq < '2020.7.1'

DELETE z
FROM t_jhdzb z
WHERE z.jhrq < '2020.7.1'

-- 出库单
DELETE m
FROM t_ckdmxb m
JOIN t_ckdzb z ON z.CKDBH = m.CKDBH
WHERE z.ckrq < '2020.7.1'

DELETE z
FROM t_ckdzb z 
WHERE z.ckrq < '2020.7.1'

-- 损益单
DELETE m
FROM t_bsdmxb m 
JOIN t_bsdzb z ON z.BSDBH = m.BSDBH
WHERE z.bsrq < '2020.7.1'

DELETE z
FROM t_bsdzb z 
WHERE z.bsrq < '2020.7.1'

-- 调拨单
DELETE m
FROM t_dbdmxb m 
JOIN t_dbdzb z ON z.dbDBH = m.dbDBH
WHERE z.dbrq < '2020.7.1'

DELETE z
FROM t_dbdzb z 
WHERE z.dbrq < '2020.7.1'

-- 变价单
DELETE m
FROM t_bjdmxb m 
JOIN t_bjdzb z ON z.BjDBH = m.BjDBH
WHERE z.bjrq < '2020.7.1'

DELETE z
FROM t_bjdzb z 
WHERE z.bjrq < '2020.7.1'

-- 退库单
DELETE m
FROM t_tkdmxb m 
JOIN t_tkdzb z ON z.tkDBH = m.tkDBH
WHERE z.tkrq < '2020.7.1'

DELETE z
FROM t_tkdzb z 
WHERE z.tkrq < '2020.7.1'

-- 退货单
DELETE m
FROM t_thdmxb m 
JOIN t_thdzb z ON z.thDBH = m.thDBH
WHERE z.thrq < '2020.7.1'

DELETE z
FROM t_thdzb z 
WHERE z.THrq < '2020.7.1'

-- 盘点单
DELETE m
FROM t_pddmxb m 
JOIN t_pddzb z ON z.pdDBH = m.pdDBH
WHERE z.pdrq < '2020.7.1'

DELETE z
FROM t_pddzb z 
WHERE z.pdrq < '2020.7.1'

-- 养护记录
DELETE m
FROM t_yhjlmx m 
JOIN t_yhjlzb z ON z.yhjlBH = m.yhjlBH
WHERE z.yhrq < '2020.7.1'

DELETE z
FROM t_yhjlzb z 
WHERE z.yhrq < '2020.7.1'

-- 分店要货单
DELETE m
FROM t_fdyhmxb m 
JOIN t_fdyhzb z ON z.yhDBH = m.yhDBH
WHERE z.yhrq < '2020.7.1'

DELETE z
FROM t_fdyhzb z 
WHERE z.yHrq < '2020.7.1'

-- 公司要货单
DELETE m
FROM t_yhjhmx m 
JOIN t_yhjhzb z ON z.yhDBH = m.yhDBH
WHERE z.yhrq < '2020.7.1'

DELETE z
FROM t_yhjhzb z 
WHERE z.yHrq < '2020.7.1'

-- 零售汇总
DELETE z
FROM t_lshzb z
WHERE lsrq < '2020.7.1'

-- 出入库明细
DELETE z
FROM t_ckmx z
WHERE fxrq < '2020.7.1'

-- 付款记录
DELETE m
FROM t_fkjlmxb m
JOIN t_fkjlzb z ON z.FKJLBH = m.FKJLBH
WHERE z.fkrq < '2020.7.1'

DELETE z
FROM t_fkjlzb z
WHERE z.fkrq < '2020.7.1'

DELETE z
FROM T_FKJL z
WHERE ywrq < '2020.7.1'

-- 首营品种
DELETE z
FROM T_SYPZSPB z
WHERE cgrq < '2020.7.1'

-- 首营企业
DELETE z
FROM T_SYqySPB z
WHERE zbrq < '2020.7.1'

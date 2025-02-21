/*
SELECT djhm AS bill_code,fxrq AS bill_time
,CASE ywtp WHEN 1 THEN 102 WHEN 2 THEN 111 WHEN 3 THEN 103 WHEN -1 THEN 201 WHEN -2 THEN 214 WHEN -3 THEN 202 ELSE 217 END AS bill_type
FROM t_ckmx e
JOIN v_spxx f ON f.SPBH = e.SPBH
WHERE e.fxrq > '2024.1.1'

-- 库存视图 2024年10月30日 14:25:26
SELECT 2 code_type,s.spbm code,pm yptymc,chsl drkcsl,s.cjmc scqymc,s.gg cbpzgg,s.jxmc jx,s.JLDW cbpzdw,s.pzwh pzwh,c.spbh
FROM (SELECT spbh,SUM(chsl) chsl FROM t_Chxx WHERE LEFT(spbh,1) IN('1','4') GROUP BY SPBH) c
JOIN v_spxx s ON s.SPBH = c.SPBH
WHERE c.chsl > 0 AND s.pzwh LIKE '国药准字%'
UNION ALL
SELECT 2 code_type,s.spbm code,pm yptymc,chsl drkcsl,s.cjmc scqymc,s.gg cbpzgg,s.jxmc jx,s.JLDW cbpzdw,s.pzwh pzwh,c.spbh
FROM (SELECT spbh,SUM(chsl) chsl FROM t_Chxx WHERE LEFT(spbh,1) IN('1','4') GROUP BY SPBH) c
JOIN v_spxx s ON s.SPBH = c.SPBH
WHERE c.chsl > 0 AND s.pzwh LIKE '国药试字%'
UNION ALL
SELECT 2 code_type,s.spbm code,pm yptymc,chsl drkcsl,s.cjmc scqymc,s.gg cbpzgg,s.jxmc jx,s.JLDW cbpzdw,s.pzwh pzwh,c.spbh
FROM (SELECT spbh,SUM(chsl) chsl FROM t_Chxx WHERE LEFT(spbh,1) IN('1','4') GROUP BY SPBH) c
JOIN v_spxx s ON s.SPBH = c.SPBH
WHERE c.chsl > 0 AND s.pzwh LIKE 'H%'
UNION ALL
SELECT 2 code_type,s.spbm code,pm yptymc,chsl drkcsl,s.cjmc scqymc,s.gg cbpzgg,s.jxmc jx,s.JLDW cbpzdw,s.pzwh pzwh,c.spbh
FROM (SELECT spbh,SUM(chsl) chsl FROM t_Chxx WHERE LEFT(spbh,1) IN('1','4') GROUP BY SPBH) c
JOIN v_spxx s ON s.SPBH = c.SPBH
WHERE c.chsl > 0 AND s.pzwh LIKE 'S%'
UNION ALL
SELECT 2 code_type,s.spbm code,pm yptymc,chsl drkcsl,s.cjmc scqymc,s.gg cbpzgg,s.jxmc jx,s.JLDW cbpzdw,s.pzwh pzwh,c.spbh
FROM (SELECT spbh,SUM(chsl) chsl FROM t_Chxx WHERE LEFT(spbh,1) IN('1','4') GROUP BY SPBH) c
JOIN v_spxx s ON s.SPBH = c.SPBH
WHERE c.chsl > 0 AND s.pzwh LIKE 'Z%'

-- 分店入出库记录
SELECT m.ckdbh AS bill_code,z.ckrq AS bill_time,'102' bill_type,m.shul code_count,2 code_type,s.spbm code,m.yxrq exprie_date
,s.pm physic_info,s.gg pkg_spec,s.jldw packing_unit,s.pzwh approval_licence_no,m.PCBH produce_batch_no,m.scrq produce_date
FROM t_ckdmxb m
JOIN t_ckdzb z ON z.CKDBH = m.CKDBH
JOIN v_spxx s ON m.spbh=s.SPBH
WHERE z.ckrq > '2024.1.1' AND z.yxbz = 10 and LEFT(m.spbh,1) IN('1','4')
UNION ALL
SELECT m.tkdbh AS bill_code,z.tkrq AS bill_time,'202' bill_type,m.shul code_count,2 code_type,s.spbm code,m.yxrq exprie_date
,s.pm physic_info,s.gg pkg_spec,s.jldw packing_unit,s.pzwh approval_licence_no,m.PCBH produce_batch_no,m.scrq produce_date
FROM t_tkdmxb m
JOIN t_tkdzb z ON z.tKDBH = m.tKDBH
JOIN v_spxx s ON m.spbh=s.SPBH
WHERE z.tkrq > '2024.1.1' AND z.flag = 10 and LEFT(m.spbh,1) IN('1','4')

--总店入出库记录
SELECT m.jhdbh AS bill_code,z.jhrq AS bill_time,'102' bill_type,m.sl code_count,2 code_type,s.spbm code,m.yxq exprie_date
,s.pm physic_info,s.gg pkg_spec,s.jldw packing_unit,s.pzwh approval_licence_no,m.PCBH produce_batch_no,m.scrq produce_date
FROM t_jhdmxb m
JOIN t_jhdzb z ON z.jhDBH = m.jhDBH
JOIN v_spxx s ON m.spbh=s.SPBH
WHERE z.jhrq > '2024.1.1' AND z.jsbz = 10 and LEFT(m.spbh,1) IN('1','4')
UNION ALL
SELECT m.ckdbh AS bill_code,z.ckrq AS bill_time,'201' bill_type,m.shul code_count,2 code_type,s.spbm code,m.yxrq exprie_date
,s.pm physic_info,s.gg pkg_spec,s.jldw packing_unit,s.pzwh approval_licence_no,m.PCBH produce_batch_no,m.scrq produce_date
FROM t_ckdmxb m
JOIN t_ckdzb z ON z.CKDBH = m.CKDBH
JOIN v_spxx s ON m.spbh=s.SPBH
WHERE z.ckrq > '2024.1.1' AND z.yxbz IN (10,15) and LEFT(m.spbh,1) IN('1','4')
UNION ALL
SELECT m.tkdbh AS bill_code,z.tkrq AS bill_time,'103' bill_type,m.shul code_count,2 code_type,s.spbm code,m.yxrq exprie_date
,s.pm physic_info,s.gg pkg_spec,s.jldw packing_unit,s.pzwh approval_licence_no,m.PCBH produce_batch_no,m.scrq produce_date
FROM t_tkdmxb m
JOIN t_tkdzb z ON z.tKDBH = m.tKDBH
JOIN v_spxx s ON m.spbh=s.SPBH
WHERE z.tkrq > '2024.1.1' AND z.flag = 10 and LEFT(m.spbh,1) IN('1','4')
UNION ALL
SELECT m.thdbh AS bill_code,z.thrq AS bill_time,'202' bill_type,m.thsl code_count,2 code_type,s.spbm code,m.yxrq exprie_date
,s.pm physic_info,s.gg pkg_spec,s.jldw packing_unit,s.pzwh approval_licence_no,m.PCBH produce_batch_no,m.scrq produce_date
FROM t_thdmxb m
JOIN t_thdzb z ON z.thDBH = m.thDBH
JOIN v_spxx s ON m.spbh=s.SPBH
WHERE z.thrq > '2024.1.1' AND z.yxbz = 10 and LEFT(m.spbh,1) IN('1','4')

SELECT * FROM t_chxx 

--ALTER TABLE t_spxx 
--ADD spbmlx TINYINT
--GO

--EXEC sp_addextendedproperty 'MS_Description', '商品编码类型;1: 药品标识码(追溯码前 7 位) 2: 商品条码(69 码) 3: 药品本位码', 'SCHEMA', dbo, 'table', T_SPXX, 'column', spbmlx;
--GO

--UPDATE a SET a.spbmlx = 2,gxrq = GETDATE()
--FROM t_spxx a
--WHERE spbm <> ''
--GO
*/


/* 
TRUNCATE TABLE t_bjyj_drkc
TRUNCATE TABLE t_bjyj_drkcmx
TRUNCATE TABLE t_bjyj_rck
TRUNCATE TABLE t_bjyj_rckmx
TRUNCATE TABLE t_bjyj_lsd
TRUNCATE TABLE t_bjyj_lsdmx
 */
/*  
EXEC sp_bjyj_drkc
EXEC sp_bjyj_rck
EXEC sp_bjyj_lsd
 */
-- SELECT * FROM t_bjyj_drkc 
--SELECT * FROM t_bjyj_drkcmx 

-- SELECT * FROM t_bjyj_rck
--SELECT * FROM t_bjyj_rckmx

-- SELECT * FROM t_bjyj_lsd
--SELECT * FROM t_bjyj_lsdmx


----------------- 当日库存信息 ------------------------
select * -- UPDATE a SET scbz = 0,scsbyy = ''
FROM t_bjyj_drkc a 
WHERE scbz = -1
ORDER BY a.created_time DESC

--SELECT spbh,pm,gg,spbm,spbmlx
--FROM t_spxx 
--WHERE spbmlx IS NULL
--AND FLAG = 1 AND LEFT(spbh,1) IN ('1','4')
--AND spbh IN ('117581','100853')

--SELECT a.spbh,b.pm,a.pzwh,a.code,a.code_type,b.spbm,b.spbmlx,e.ID  -- update a set a.code_type = b.spbmlx
--FROM t_bjyj_drkcmx a
--JOIN t_bjyj_drkc e ON e.ID=a.ID
--JOIN v_spxx b ON b.spbh = a.spbh
--WHERE 1=1  AND a.spbh IN('117581','100853')
--AND (isnull(a.code_type,0)=0 OR isnull(a.code,'') = '')
--a.pzwh NOT LIKE '国药%' 
--AND a.pzwh NOT LIKE 'H%'
--AND a.pzwh NOT LIKE 'S%'
--AND a.pzwh NOT LIKE 'Z%'
--AND a.pzwh = '医药产品注册证号:HC20150044'


----------------- 零售单据信息 ------------------------
--SELECT m.spbh,m.pzwh   -- update m set m.pzwh = 'HC20150044'
--FROM t_bjyj_lsd z
--JOIN t_bjyj_lsdmx m ON m.bill_code = z.bill_code
--WHERE z.scbz = -1
--AND m.pzwh NOT LIKE '国药%' 
--AND m.pzwh NOT LIKE 'H%'
--AND m.pzwh NOT LIKE 'S%'
--AND m.pzwh NOT LIKE 'Z%'
--AND m.pzwh = '医药产品注册证号:HC20150044'

select * -- UPDATE a SET scbz = 0,scsbyy = ''
FROM t_bjyj_lsd a 
WHERE scbz = -1
ORDER BY a.created_time DESC


------ 入出库信息 -------------------

select * -- UPDATE a SET scbz = 0,scsbyy = ''   -- delete a
FROM t_bjyj_rck a 
WHERE scbz = -1
ORDER BY a.created_time DESC

select b.* -- delete b
FROM t_bjyj_rck a 
join t_bjyj_rckmx b ON b.bill_code = a.bill_code
WHERE scbz = -1


--SELECT m.spbh,m.pzwh,s.pm,s.gg,z.created_time -- select distinct m.spbh,s.pm,s.pzwh,s.flag   -- update m set m.pzwh = 'HC20150044'  -- delete m
--FROM t_bjyj_rck z
--JOIN t_bjyj_rckmx m ON m.bill_code = z.bill_code
--JOIN v_spxx s ON s.spbh = m.spbh
--WHERE z.scbz = -1
--AND m.pzwh NOT LIKE '国药%' 
--AND m.pzwh NOT LIKE 'H%'
--AND m.pzwh NOT LIKE 'S%'
--AND m.pzwh NOT LIKE 'Z%' 
--AND s.flag = 1
--AND m.pzwh = '医药产品注册证号:HC20150044'


--SELECT z.bill_code, m.spbh,m.pm,m.gg,m.pcbh,m.pzwh,m.scrq,m.exprie_date   -- update m set m.pzwh = 'HC20150044'  -- delete m
--FROM t_bjyj_rck z
--JOIN t_bjyj_rckmx m ON m.bill_code = z.bill_code
--WHERE z.scbz = -1
--AND (isnull(pzwh,'') = '' OR ISNULL(scrq,'') = '' or exprie_date is null)


--SELECT z.*    -- delete z
--FROM t_bjyj_rck z
--left JOIN t_bjyj_rckmx m ON m.bill_code = z.bill_code
--WHERE z.scbz = -1 AND m.bill_code IS NULL

--SELECT *   -- update a set a.scrq = '2023-11-16 00:00:00.000'
--FROM t_bjyj_rckmx a
--WHERE bill_code LIKE 'BS%' AND spbh = '42368' AND pcbh = '20231101'

--SELECT *   -- update a set a.scrq = '2023-04-06 00:00:00.000'
--FROM t_bjyj_rckmx a
--WHERE bill_code LIKE 'BS%' AND spbh = '42368' AND pcbh = '20230404'

--SELECT *  -- update tb set tb.scrq = '2023-04-06 00:00:00.000'
--FROM T_BSDMXB tb
--WHERE bsdbh = 'BS24000059' and pcbh = '20230404'

--SELECT *
--FROM t_ckdmxb
--WHERE spbh = '42368' AND pcbh = '20230404'  -- 20230404

----SELECT COUNT (DISTINCT spbh ) FROM t_bjyj_drkcmx tbd

--SELECT *
--FROM t_bjyj_rckmx WHERE bill_code = 'CK24001801B'

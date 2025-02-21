-- 入出库数据异常处理 2024年11月18日 10:49:25
select * -- UPDATE a SET scbz = 0,scsbyy = ''   -- delete a
FROM t_bjyj_rck a 
--WHERE scbz = -1
ORDER BY a.created_time DESC

SELECT b.spbh,b.pcbh,b.scrq,c.SCRQ,r.bill_code,r.scbz   -- -- update b set b.scrq = c.scrq
FROM (SELECT distinct e.spbh,e.pcbh,a.SCRQ  
	FROM (
		SELECT m.spbh,m.PCBH
		FROM t_bjyj_rckmx m		
		JOIN v_spxx s ON s.SPBH = m.SPBH AND s.FLAG = 1
		WHERE scrq IS NULL ) e
	JOIN t_jhdmxb a ON a.spbh = e.spbh AND a.pcbh = e.pcbh ) c
JOIN t_bjyj_rckmx b ON b.spbh = c.spbh AND b.pcbh = c.pcbh AND (b.scrq IS NULL)
JOIN t_bjyj_rck r ON r.bill_code = b.bill_code

SELECT b.spbh,b.pcbh,b.exprie_date,c.yxrq,r.bill_code,r.scbz   -- -- update b set b.exprie_date = c.yxrq
FROM (SELECT distinct e.spbh,e.pcbh,a.yxQ yxrq  
	FROM (
		SELECT m.spbh,m.PCBH
		FROM t_bjyj_rckmx m		
		JOIN v_spxx s ON s.SPBH = m.SPBH AND s.FLAG = 1
		WHERE m.exprie_date IS NULL ) e
	JOIN t_jhdmxb a ON a.spbh = e.spbh AND a.pcbh = e.pcbh ) c
JOIN t_bjyj_rckmx b ON b.spbh = c.spbh AND b.pcbh = c.pcbh AND (b.exprie_date IS NULL)
JOIN t_bjyj_rck r ON r.bill_code = b.bill_code

----------------- 当日库存信息 ------------------------
select * -- UPDATE a SET scbz = 0,scsbyy = ''
FROM t_bjyj_drkc a 
--WHERE scbz = -1
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
select * -- UPDATE a SET scbz = 0,scsbyy = ''
FROM t_bjyj_lsd a 
--WHERE scbz = -1
ORDER BY a.created_time DESC

--SELECT m.spbh,m.pzwh   -- update m set m.pzwh = 'HC20150044'
--FROM t_bjyj_lsd z
--JOIN t_bjyj_lsdmx m ON m.bill_code = z.bill_code
--WHERE z.scbz = -1
--AND m.pzwh NOT LIKE '国药%' 
--AND m.pzwh NOT LIKE 'H%'
--AND m.pzwh NOT LIKE 'S%'
--AND m.pzwh NOT LIKE 'Z%'
--AND m.pzwh = '医药产品注册证号:HC20150044'



SELECT b.spbh,b.pcbh,b.scrq,c.SCRQ,d.BSRQ,d.BSDW,d.yxbz  -- -- update b set b.scrq = c.scrq
FROM (SELECT distinct e.spbh,e.pcbh,a.SCRQ  
	FROM (
	SELECT m.spbh,m.pcbh
	FROM t_bsdmxb m
	JOIN t_bsdzb z ON z.BSDBH = m.BSDBH
	JOIN v_spxx s ON s.SPBH = m.SPBH AND s.FLAG = 1
	WHERE LEFT(m.spbh,1) IN ('1','4') AND (scrq IS NULL)
	AND z.bsrq > '2024.10.31' ) e
	JOIN t_jhdmxb a ON a.spbh = e.spbh AND a.pcbh = e.pcbh ) c
JOIN t_bsdmxb b ON b.spbh = c.spbh AND b.pcbh = c.pcbh AND b.scrq IS NULL
JOIN t_bsdzb d ON d.BSDBH = b.BSDBH

SELECT b.spbh,b.pcbh,b.scrq,c.SCRQ   -- -- update b set b.scrq = c.scrq
FROM (SELECT distinct e.spbh,e.pcbh,a.SCRQ  
	FROM (
		SELECT m.spbh,m.PCBH
		FROM t_dbdmxb m
		JOIN t_dbdzb z ON z.dbDBH = m.dbDBH
		JOIN v_spxx s ON s.SPBH = m.SPBH AND s.FLAG = 1
		WHERE LEFT(m.spbh,1) IN ('1','4') AND (scrq IS NULL)
		AND z.dbrq > '2024.10.31') e
	JOIN t_jhdmxb a ON a.spbh = e.spbh AND a.pcbh = e.pcbh ) c
JOIN t_dbdmxb b ON b.spbh = c.spbh AND b.pcbh = c.pcbh AND (b.scrq IS NULL)


SELECT m.*
FROM t_tkdmxb m
JOIN t_tkdzb z ON z.tkDBH = m.tkDBH
JOIN v_spxx s ON s.SPBH = m.SPBH AND s.FLAG = 1
WHERE LEFT(m.spbh,1) IN ('1','4') AND (yxrq IS NULL OR scrq IS NULL)
AND z.tkrq > '2024.10.31'

---- 退货表
SELECT e.*,a.YXQ,a.SCRQ  -- update b set b.yxrq = a.yxq,b.scrq = a.scrq
FROM (
SELECT m.SPBH,m.pcbh
FROM t_thdmxb m
JOIN t_thdzb z ON z.thDBH = m.thDBH
JOIN v_spxx s ON s.SPBH = m.SPBH AND s.FLAG = 1
WHERE LEFT(m.spbh,1) IN ('1','4') AND (yxrq IS NULL OR scrq IS NULL)
AND z.thrq > '2024.10.31') e
JOIN t_jhdmxb a ON a.SPBH = e.SPBH AND a.pcbh = e.pcbh
JOIN t_thdmxb b ON b.SPBH = a.SPBH AND b.PCBH = a.PCBH

---- 公司库存表
SELECT b.spbh,b.pcbh,b.scrq,b.yxrq,c.SCRQ,c.yxrq   -- -- update b set b.scrq = c.scrq
FROM (SELECT distinct e.spbh,e.pcbh,a.SCRQ,a.yxq yxrq  
	FROM (SELECT m.SPBH,m.PCBH
		FROM t_chxx m
		JOIN v_spxx s ON s.SPBH = m.SPBH AND s.FLAG = 1
		where LEFT(m.spbh,1) IN ('1','4') AND (yxrq IS NULL OR scrq IS NULL)) e
	JOIN t_jhdmxb a ON a.spbh = e.spbh AND a.pcbh = e.pcbh ) c
JOIN t_chxx b ON b.spbh = c.spbh AND b.pcbh = c.pcbh AND (b.scrq IS NULL OR b.yxrq IS NULL)

---- 分店库存表
SELECT b.spbh,b.pcbh,b.scrq,c.SCRQ -- select b.*  -- -- update b set b.scrq = c.scrq
FROM (SELECT distinct e.spbh,e.pcbh,a.SCRQ  
	FROM (SELECT m.SPBH,m.PCBH,s.pm,s.gg,s.cjmc
		FROM t_chxx m
		JOIN v_spxx s ON s.SPBH = m.SPBH AND s.FLAG = 1
	      WHERE m.chsl > 0 AND  LEFT(m.spbh,1) IN ('1','4') AND (scrq IS NULL)) e
	JOIN t_ckdmxb a ON a.spbh = e.spbh AND a.pcbh = e.pcbh AND a.scrq IS NOT null ) c
JOIN t_chxx b ON b.spbh = c.spbh AND b.pcbh = c.pcbh AND (b.scrq IS NULL)
WHERE b.chsl > 0

-- 分店损益表 
SELECT b.spbh,b.pcbh,b.scrq,c.SCRQ   -- -- update b set b.scrq = c.scrq
FROM (SELECT distinct e.spbh,e.pcbh,a.SCRQ  
	FROM (
		SELECT m.spbh,m.pcbh
		FROM t_bsdmxb m
		JOIN t_bsdzb z ON z.BSDBH = m.BSDBH
		JOIN v_spxx s ON s.SPBH = m.SPBH AND s.FLAG = 1
		WHERE z.bsrq > '2024.10.31' and LEFT(m.spbh,1) IN ('1','4') AND (scrq IS NULL) ) e
	JOIN t_ckdmxb a ON a.spbh = e.spbh AND a.pcbh = e.pcbh ) c
JOIN t_bsdmxb b ON b.spbh = c.spbh AND b.pcbh = c.pcbh




SELECT *
FROM t_bsdmxb m
JOIN t_bsdzb z ON z.BSDBH = m.BSDBH
JOIN v_spxx s ON s.SPBH = m.SPBH AND s.FLAG = 1
WHERE LEFT(m.spbh,1) IN ('1','4') AND (yxrq IS NULL OR scrq IS NULL)
AND z.bsrq > '2024.10.31'

SELECT *
FROM t_dbdmxb m
JOIN t_dbdzb z ON z.dbDBH = m.dbDBH
JOIN v_spxx s ON s.SPBH = m.SPBH AND s.FLAG = 1
WHERE LEFT(m.spbh,1) IN ('1','4') AND (yxrq IS NULL OR scrq IS NULL)
AND z.dbrq > '2024.10.31'

SELECT *
FROM t_tkdmxb m
JOIN t_tkdzb z ON z.tkDBH = m.tkDBH
JOIN v_spxx s ON s.SPBH = m.SPBH AND s.FLAG = 1
WHERE LEFT(m.spbh,1) IN ('1','4') AND (yxrq IS NULL OR scrq IS NULL)
AND z.tkrq > '2024.10.31'

SELECT *
FROM t_thdmxb m
JOIN t_thdzb z ON z.thDBH = m.thDBH
JOIN v_spxx s ON s.SPBH = m.SPBH AND s.FLAG = 1
WHERE LEFT(m.spbh,1) IN ('1','4') AND (yxrq IS NULL OR scrq IS NULL)
AND z.thrq > '2024.10.31'


SELECT m.*
FROM t_chxx m
JOIN v_spxx s ON s.SPBH = m.SPBH AND s.FLAG = 1
where m.CHSL > 0 AND LEFT(m.spbh,1) IN ('1','4') AND (yxrq IS NULL OR scrq IS NULL)




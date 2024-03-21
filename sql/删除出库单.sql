
-- 出库单
select e.* -- DELETE e
FROM t_ckdzb e
LEFT JOIN t_ckdmxb e1 ON e.CKDBH=e1.CKDBH
WHERE e1.CKDBH IS NULL

-- 分店要货计划
SELECT *  -- delete e
FROM T_FDYHZB e
LEFT JOIN T_FDYHMXB e1 ON e1.YHDBH = e.YHDBH
WHERE e1.YHDBH IS NULL

-- 损益单
SELECT e1.* -- delete e1
FROM t_bsdzb e
JOIN T_BSDMXB e1 ON e1.BSDBH = e.BSDBH
WHERE e.yxbz IN (0,2)
AND e.bsdw='000'

SELECT * -- delete e
FROM t_bsdzb e
WHERE e.yxbz IN (0,2)
AND e.bsdw='000'

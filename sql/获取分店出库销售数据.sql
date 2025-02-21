----- 出库数据 ----------------
SELECT jm.spbh,sp.pm,sp.gg,sp.PZWH,sp.CJMC,jm.shul,jz.ckrq,jm.pcbh,jm.YXKW,jm.YXRQ,jm.LSJ,sp.JLDW,jm.CKDBH
FROM t_ckdmxb jm
JOIN t_ckdzb jz ON jm.CKDBH=jz.CKDBH
JOIN v_spxx sp ON sp.SPBH = jm.SPBH
WHERE jz.ckrq BETWEEN '2022.9.1' AND '2023.12.31' AND sp.pzwh LIKE '国药准字%'
UNION ALL
SELECT jm.spbh,sp.pm,sp.gg,sp.PZWH,sp.CJMC,jm.shul,jz.ckrq,jm.pcbh,jm.YXKW,jm.YXRQ,jm.LSJ,sp.JLDW,jm.CKDBH
FROM t_ckdmxb jm
JOIN t_ckdzb jz ON jm.CKDBH=jz.CKDBH
JOIN v_spxx sp ON sp.SPBH = jm.SPBH
WHERE jz.ckrq BETWEEN '2022.9.1' AND '2023.12.31' AND sp.pzwh LIKE '%械备%'
UNION ALL
SELECT jm.spbh,sp.pm,sp.gg,sp.PZWH, sp.CJMC,jm.shul,jz.ckrq,jm.pcbh,jm.YXKW,jm.YXRQ,jm.LSJ,sp.JLDW,jm.CKDBH
FROM t_ckdmxb jm
JOIN t_ckdzb jz ON jm.CKDBH=jz.CKDBH
JOIN v_spxx sp ON sp.SPBH = jm.SPBH
WHERE jz.ckrq BETWEEN '2022.9.1' AND '2023.12.31' AND sp.pzwh LIKE '%械注准%'
UNION ALL
SELECT jm.spbh,sp.pm,sp.gg,sp.PZWH, sp.CJMC,jm.shul,jz.ckrq,jm.pcbh,jm.YXKW,jm.YXRQ,jm.LSJ,sp.JLDW,jm.CKDBH
FROM t_ckdmxb jm
JOIN t_ckdzb jz ON jm.CKDBH=jz.CKDBH
JOIN v_spxx sp ON sp.SPBH = jm.SPBH
WHERE jz.ckrq BETWEEN '2022.9.1' AND '2023.12.31' AND sp.spbh LIKE '7%'
ORDER BY jz.CKRQ

-------销售数据 ------------------
SELECT jm.spbh,sp.pm,sp.gg,sp.PZWH, sp.CJMC,jm.sl,jz.rq,jm.LSJ, jm.pcbh,jm.LSDBH,jz.tradeno
FROM t_lsdmxb jm
JOIN t_lsdzb jz ON jm.lsDBH=jz.lsDBH
JOIN v_spxx sp ON sp.SPBH = jm.SPBH
WHERE jz.rq BETWEEN '2022.9.1' AND '2023.12.31' AND sp.pzwh LIKE '国药准字%'
UNION ALL
SELECT jm.spbh,sp.pm,sp.gg,sp.PZWH, sp.CJMC,jm.sl,jz.rq,jm.LSJ, jm.pcbh,jm.LSDBH,jz.tradeno
FROM t_lsdmxb jm
JOIN t_lsdzb jz ON jm.lsDBH=jz.lsDBH
JOIN v_spxx sp ON sp.SPBH = jm.SPBH
WHERE jz.rq BETWEEN '2022.9.1' AND '2023.12.31' AND sp.pzwh LIKE '%械备%'
UNION ALL
SELECT jm.spbh,sp.pm,sp.gg,sp.PZWH, sp.CJMC,jm.sl,jz.rq,jm.LSJ, jm.pcbh,jm.LSDBH,jz.tradeno
FROM t_lsdmxb jm
JOIN t_lsdzb jz ON jm.lsDBH=jz.lsDBH
JOIN v_spxx sp ON sp.SPBH = jm.SPBH
WHERE jz.rq BETWEEN '2022.9.1' AND '2023.12.31' AND sp.pzwh LIKE '%械注准%'
UNION ALL
SELECT jm.spbh,sp.pm,sp.gg,sp.PZWH, sp.CJMC,jm.sl,jz.rq,jm.LSJ, jm.pcbh,jm.LSDBH,jz.tradeno
FROM t_lsdmxb jm
JOIN t_lsdzb jz ON jm.lsDBH=jz.lsDBH
JOIN v_spxx sp ON sp.SPBH = jm.SPBH
WHERE jz.rq BETWEEN '2022.9.1' AND '2023.12.31' AND sp.spbh LIKE '7%'

ORDER BY jz.RQ,jz.tradeno
-----三店-------------------
--来货表
SELECT *
--UPDATE z SET ysr = '042' ---'019'
FROM t_ckdzb z
WHERE ckrq BETWEEN '2012-01-01' AND '2014-11-07 23:59:59'
SELECT *
--UPDATE z SET ysr = '124' ---'042'
FROM t_ckdzb z
WHERE ckrq BETWEEN '2014-11-08' AND GETDATE()

--效期催销表
SELECT *
--UPDATE z SET z.zgr = '042'  ---'019'
FROM T_CXZB z
WHERE cxrq BETWEEN '2012-01-01' AND '2014-11-07 23:59:59'
SELECT *
--UPDATE z SET z.zgr = '124'  ---'042'
FROM T_CXZB z
WHERE cxrq BETWEEN '2014-11-08' AND GETDATE()

----损益表
SELECT *
--UPDATE z SET pzr = '042' --'019'
FROM t_bsdzb z
WHERE bsrq BETWEEN '2012-01-01' AND '2014-11-07 23:59:59'
SELECT *
--UPDATE z SET pzr = '124' --'042'
FROM t_bsdzb z
WHERE bsrq BETWEEN '2014-11-08' AND GETDATE()


-----广安门-------------------------------
--来货表
--SELECT *
----UPDATE z SET ysr = '042' ---'019'
--FROM t_ckdzb z
--WHERE ckrq BETWEEN '2012-01-01' AND '2014-11-07 23:59:59'
SELECT *
--UPDATE z SET ysr = '124' ---'042'
FROM t_ckdzb z
WHERE ckrq BETWEEN '2012-01-01' AND GETDATE()

--效期催销表
SELECT *
--UPDATE z SET z.zgr = '042'  ---'019'
FROM T_CXZB z
WHERE cxrq BETWEEN '2012-01-01' AND '2014-11-07 23:59:59'
SELECT *
--UPDATE z SET z.zgr = '124'  ---'042'
FROM T_CXZB z
WHERE cxrq BETWEEN '2014-11-08' AND GETDATE()
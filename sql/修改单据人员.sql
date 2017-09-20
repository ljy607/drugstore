--------小屯-------------
-------来货验收
--SELECT *
----UPDATE z SET fhr = '005' ---'042'
--FROM t_ckdzb z
--WHERE ckrq  BETWEEN '2017-01-01' AND '2017-7-31 23:59:59'

--SELECT *
----UPDATE z SET fhr = '005' ---'042'
--FROM t_ckdzb z
--WHERE ckrq  BETWEEN '2017-08-01' AND GETDATE()


------二店-------------
----退库表
--SELECT *
----UPDATE z SET sqr = '097' ---'019'
--FROM t_tkdzb z
--WHERE tkrq >= '2016-06-09' 

-------来货验收
--SELECT *
----UPDATE z SET ysr = '097' ---'042'
--FROM t_ckdzb z
--WHERE ckrq  >= '2016-06-09' 

------效期催销表
--SELECT *
----UPDATE z SET z.yhr = '097'  ---'019'
--FROM T_CXZB z
--WHERE cxrq >= '2016-06-09' 

--------养护记录
--SELECT *
----UPDATE ty SET ty.yhr = '097'
--FROM t_yhjlzb ty
--WHERE ty.YHRQ >= '2016-06-09'

----------要货计划
--SELECT *
----UPDATE z SET z.zbr = '097'
--FROM t_yhjhzb z
--WHERE z.yhrq >= '2016-06-09'


-------三店-------------------
------来货表
--SELECT *
----UPDATE z SET fhr = '042',ysr = '110'
--FROM t_ckdzb z
--WHERE ckrq BETWEEN '2013-01-01' AND '2015-11-05 23:59:59'

--SELECT *
----UPDATE z SET fhr = '124',ysr = '110'
--FROM t_ckdzb z
--WHERE ckrq BETWEEN '2014-11-08' AND '2017-6-19 23:59:59'

--SELECT *
----UPDATE z SET ysr = '124' ---'042'
--FROM t_ckdzb z
--WHERE ckrq >= '2017-08-01'

----效期催销表
--SELECT *
----UPDATE z SET z.zgr = '042'  ---'019'
--FROM T_CXZB z
--WHERE cxrq BETWEEN '2012-01-01' AND '2014-11-07 23:59:59'
--SELECT *
----UPDATE z SET z.zgr = '124'  ---'042'
--FROM T_CXZB z
--WHERE cxrq BETWEEN '2014-11-08' AND GETDATE()

------损益表
--SELECT *
----UPDATE z SET pzr = '042' --'019'
--FROM t_bsdzb z
--WHERE bsrq BETWEEN '2012-01-01' AND '2014-11-07 23:59:59'
--SELECT *
----UPDATE z SET pzr = '124' --'042'
--FROM t_bsdzb z
--WHERE bsrq BETWEEN '2014-11-08' AND GETDATE()


-------广安门-------------------------------
----来货表
--SELECT *
----UPDATE z SET fhr = '030' ---'019'
--FROM t_ckdzb z
--WHERE ckrq BETWEEN '2016-01-01' AND '2017-05-30 23:59:59'
--SELECT *
----UPDATE z SET ysr = '124' ---'042'
--FROM t_ckdzb z
--WHERE ckrq between '2017-05-01' AND GETDATE()

----效期催销表
--SELECT *
----UPDATE z SET z.zgr = '042'  ---'019'
--FROM T_CXZB z
--WHERE cxrq BETWEEN '2012-01-01' AND '2014-11-07 23:59:59'
--SELECT *
----UPDATE z SET z.zgr = '124'  ---'042'
--FROM T_CXZB z
--WHERE cxrq BETWEEN '2014-11-08' AND GETDATE()



-------------------弘济-----------------
------来货表
--SELECT *
----UPDATE z SET fhr = '042',ysr = '110'
--FROM t_ckdzb z
--WHERE ckrq BETWEEN '2013-01-01' AND '2015-11-05 23:59:59'

--SELECT *
----UPDATE z SET ysr = '123'
--FROM t_ckdzb z
--WHERE ckrq BETWEEN '2017-4-19' AND '2017-9-3 23:59:59'

--SELECT *
----UPDATE z SET ysr = '089' ---'042'
--FROM t_ckdzb z
--WHERE ckrq >= '2017-09-1'
--------WHERE ckdbh = 'CK17002863'
--ORDER BY z.CKRQ

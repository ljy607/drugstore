------------修改分店系统单据-------------
---------来货验收
--SELECT z.*,m.xm
----UPDATE z SET ysr = '097'
--FROM t_ckdzb z
--JOIN t_zgxx m ON z.ysr = m.bh
--WHERE ckrq  BETWEEN '2015.2.1' AND '2019.4.16 23:59:59'
--ORDER BY z.CKRQ

------------退库表
--SELECT z.*,m.XM
------UPDATE z SET sqr = '097'
--FROM t_tkdzb z
--JOIN t_zgxx m ON z.sqr = m.bh
--WHERE tkrq  BETWEEN '2015.2.1' AND '2019.4.16 23:59:59'

--------------效期催销表
--SELECT z.*,e.XM
------UPDATE z SET z.yhr = '124' 
--FROM T_CXZB z
--JOIN t_zgxx e ON z.yhr = e.BH
--WHERE cxrq BETWEEN '2019.3.6' AND '2019.5.5 23:59:59'

----------养护记录
--SELECT z.*,e.XM
------UPDATE z SET z.yhr = '097'
--FROM t_yhjlzb z
--JOIN t_zgxx e ON z.YHR = e.BH
--WHERE z.YHRQ BETWEEN '2015.2.1' AND '2019.4.16 23:59:59'

------------要货计划
--SELECT z.*,e.xm
----UPDATE z SET z.zbr = '002'
--FROM t_yhjhzb z
--JOIN t_zgxx e ON z.zbr = e.BH
--WHERE z.yhrq >= '2016-06-09'
--ORDER BY z.YHRQ

------损益表
--SELECT z.*,e.XM
----UPDATE z SET bsr = '097'
--FROM t_bsdzb z
--JOIN t_zgxx e ON z.bsr = e.bh
--WHERE bsrq BETWEEN '2015.2.1' AND '2019.4.16 23:59:59'


-----------------------修改总店系统单据人员----------------
--------进货单
--SELECT z.*,e.XM
----UPDATE z SET z.ysr = '082'
--FROM t_jhdzb z
--JOIN t_zgxx e ON z.ysr = e.bh
--WHERE z.JHRQ >= '2016.8.1'

--------退款单
--SELECT z.*,e.xm
------UPDATE z SET z.ysr = '082'
--FROM t_tkdzb z
--JOIN t_zgxx e ON z.ysr = e.bh
--WHERE z.tkrq >= '2016.8.1'

--SELECT *
------DELETE m 
--FROM t_ckdmxb m
--WHERE ckdbh = 'ck17001734' AND spbh = '102753'

--SELECT *
------DELETE m 
--FROM t_tkdmxb m
--WHERE tkdbh = 'tk10517000089' 
--SELECT *
------DELETE m 
--FROM t_tkdzb m
--WHERE tkdbh = 'tk10517000089' 


--SELECT *
------update m set m.tkyy = ''
--FROM t_tkdmxb m
--WHERE tkdbh = 'tk10417000060'

--SELECT *
------update m set m.bz = ''
--FROM t_tkdmxb m
--WHERE tkdbh = 'tk17000060'













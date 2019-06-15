------查询商品价格、会员价、核算价
--SELECT DISTINCT s.spbh,s.pm,s.gg,s.cjmc,l.splb,l.rate,j.ZDJJ,j.LSJ, j.hyj,(1+l.rate)*j.ZDJJ AS hsjhj
--FROM v_spxx s
--JOIN t_fgskc c ON s.spbh = c.SPBH
--JOIN t_splb l ON l.SPLBBH=s.LBBH
--JOIN t_jgxx j ON s.spbh = j.SPBH
--ORDER BY s.SPBH

--INSERT INTO t_chxx(HWBH, SPBH, PCBH, CHSL, yxrq, jiag)
--VALUES('K0201','11599','IEZ0R00',58,'2020.3.31',159.6)

--SELECT *
--FROM t_jhdmxb 
--WHERE spbh = '11599'

--SELECT *
--------DELETE a
--FROM t_chxx a
--WHERE spbh = '11599'

-------------------------------------
---------查询分店库存商品的最后供应商------------
--CREATE TABLE #t 
--(
--	spbh NVARCHAR(32) NULL,
--	pcbh NVARCHAR(32) NULL,
--	pm NVARCHAR(64) NULL,
--	gg NVARCHAR(32) NULL,
--	jldw NVARCHAR(8) NULL,
--	sccj NVARCHAR(64) NULL,
--	gysmc NVARCHAR(256) NULL
--)
--INSERT INTO #t(spbh, pcbh, pm, gg, jldw, sccj)
--SELECT distinct e.spbh,e.pcbh,e2.PM,e2.GG,e2.JLDW,e2.CJMC
--FROM t_fgskc e
--LEFT JOIN t_spxx_jybg e1 ON e.spbh = e1.spbh AND e.pcbh = e1.pcbh
--JOIN v_spxx e2 ON e.spbh = e2.SPBH
--WHERE LEFT(e.spbh,1) <> '9' AND LEFT(e.spbh,1) <> '8' AND LEFT(e.spbh,1) <> '3' AND e1.filepath IS NULL
----ORDER BY e.SPBH

--SELECT e.spbh, e.pcbh, e.pm, e.gg, e.jldw, e.sccj,e2.GYSBH,MAX(e2.jhrq) AS jhrq,e3.gysmc
--FROM #t e
--JOIN t_jhdmxb e1 ON e.spbh = e1.spbh AND e.pcbh = e1.PCBH
--JOIN t_jhdzb e2 ON e1.JHDBH = e2.JHDBH
--JOIN t_gysxx e3 ON e2.GYSBH=e3.GYSBH
--GROUP BY e.spbh, e.pcbh, e.pm, e.gg, e.jldw, e.sccj,e2.GYSBH,e3.gysmc
--ORDER BY e2.gysbh asc,jhrq DESC
--DROP TABLE #t

-------------------
-----报损单生成-----------
--CREATE TABLE #t
--(id INT IDENTITY(1,1),
--spbh NVARCHAR(32),
--pcbh NVARCHAR(32),
--hwbh NVARCHAR(8)
--)
--INSERT INTO #t(spbh,pcbh,hwbh)
--SELECT d.spbh,d.pcbh,d.hwbh
--FROM t_chxx d 
--JOIN v_spxx s ON s.SPBH = d.SPBH
--WHERE d.HWBH = 'H01' AND yxrq < GETDATE()
--ORDER BY d.yxrq DESC

--INSERT INTO t_bsdmxb(BSDBH, ORDR, SPBH, PCBH, DQCL, BSSL, BSJG, BSTP, BSYY, BSKW,YXRQ)
--SELECT 'BS19000012',s.id,d.spbh,d.pcbh,d.chsl,d.chsl,d.jiag,-1,'',s.hwbh,d.yxrq
--FROM t_chxx d 
--JOIN #t s ON s.SPBH = d.SPBH AND d.PCBH = s.pcbh AND d.HWBH=s.hwbh
--DROP TABLE #t

-------------------------------------
------更新出库单生产厂家
--SELECT m.*,m1.sccj
----UPDATE m SET m.sccj = m1.sccj
--FROM t_ckdmxb m
--JOIN t_ckdzb z ON z.CKDBH = m.CKDBH
--JOIN (SELECT distinct e.spbh,e.pcbh,e.sccj
--FROM t_jhdmxb e
--WHERE e.spbh LIKE '7%' 
--AND EXISTS(SELECT TOP 1 sccj,MAX(JHDBH) FROM t_jhdmxb WHERE spbh=e.SPBH AND pcbh=e.PCBH GROUP BY sccj)
--) m1 ON m.spbh=m1.spbh AND m.pcbh = m1.pcbh
--WHERE year(z.ckrq) > 2014 AND m.spbh LIKE '7%'
--AND m.sccj IS NULL 
--ORDER BY m.spbh

----------------------------------------
---------修改退货单日期和单号
--SELECT *
------UPDATE e SET e.THDBH = 'TH18000210',e.thrq = '2018-05-08 10:25:14.617'
--FROM t_thdzb e
--WHERE e.THDBH = 'th19000199'

--SELECT *
------UPDATE e SET e.THDBH = 'TH18000210'
--FROM t_thdmxb e
--WHERE e.THDBH = 'th19000199'

--SELECT *
------UPDATE e SET e.DJHM = 'TH18000210',e.FXRQ = '2018-05-08'
--FROM t_ckmx e
--WHERE DJHM = 'th19000199'

--SELECT *
--FROM t_thdzb 
--WHERE YEAR(thrq) = 2018
--ORDER BY THDBH

----------------查询首营品种  
--SELECT e.spbh,e2.pm,e2.GG,e2.JLDW,e2.CJMC,MIN(e1.JHRQ) AS jhrq,ts.pm
--FROM t_jhdmxb e
--JOIN t_jhdzb e1 ON e.JHDBH=e1.JHDBH
--JOIN v_spxx e2 ON e.spbh=e2.SPBH
--LEFT JOIN T_SYPZSPB ts ON e2.pm = ts.pm
--WHERE LEFT(e.spbh,1) <> '3' AND LEFT(e.spbh,1) <> '6' AND LEFT(e.spbh,1) <> '9' AND LEFT(e.spbh,1) <> '8'
--GROUP BY e.spbh,e2.pm,e2.GG,e2.JLDW,e2.CJMC,ts.pm
--HAVING MIN(e1.JHRQ) BETWEEN '2017-11-01' AND '2027-10-31' 
--ORDER BY e.spbh

-------------------修改首营品种 
--SELECT e.pm,e.cgrq,e.zlglyrq,e.zlfzrrq
----UPDATE e SET e.cgrq = '2017.5.30',e.zlglyrq='2017.5.30',e.zlfzrrq='2017.5.30'
--FROM T_SYPZSPB e
----WHERE e.pm LIKE '%小儿氨酚黄那敏颗粒%'
--WHERE e.id IN (6042,6411,6398,6322,6319,6404,6320)

--SELECT *
----UPDATE e SET e.sccj = '太极集团重庆桐君阁药厂有限公司' ---e.cgrq = '2018-10-17',e.zlglyrq='2018-10-17',e.zlfzrrq='2018-10-17'
--FROM T_SYPZSPB e
----WHERE e.pm LIKE '%肺宁%'
--WHERE e.id IN (5964)

--------------------修改批号
--SELECT *
----UPDATE e SET e.pcbh = 'JS07114'
--FROM t_JHDMXB e
--WHERE spbh = '10120' AND pcbh = 'js0711'
--SELECT *
----INTO t_ckmx_del
----DELETE e
--FROM t_ckmx e
--WHERE e.spbh = '10120' AND 
--djhm IN('JH19000267','TK10619000041','CK19000378')

---------------------修改生产日期------------------
--select *
----UPDATE e SET e.scrq = '2019/02/28'
--from t_jhdmxb e
--where e.jhdbh = 'JH19000983' AND spbh = '10668'

--SELECT *
----UPDATE e SET e.scrq = '2019/02/28'
--FROM t_chxx e
--WHERE e.spbh = '10668' AND pcbh = '190228124'

--SELECT e1.jsdw,e.*
----UPDATE e SET e.scrq = '2019/02/28'
--FROM t_ckdmxb e
--JOIN t_ckdzb e1 ON e1.CKDBH = e.CKDBH
--WHERE e.spbh = '10668' AND pcbh = '190228124' --AND e.scrq = '2018-02-28'

--------------删除催销单------------------
--SELECT *
----DELETE e
--FROM t_cxmxb e
--WHERE e.cxdbh IN('201904','201905')

--SELECT *
----DELETE e
--FROM t_cxzb e
--WHERE e.cxdbh IN('201904','201905')

---------------修改养护日期------------------
--SELECT *,DATEADD(DAY,-4,e.yhrq)
----UPDATE e SET e.yhrq = DATEADD(DAY,-4,e.yhrq)
--FROM t_yhjlzb e
--WHERE DAY(e.yhrq) BETWEEN 20 AND 22













































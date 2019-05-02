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









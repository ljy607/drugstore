---------2016年10月15日-------------------
----出库单增加生产日期、复核标志
--ALTER TABLE T_CKDMXB
--ADD scrq DATETIME NULL,fhflag TINYINT NULL

----库存信息增加生产日期、到货时间
--ALTER TABLE T_CHXX
--ADD scrq DATETIME NULL, dhrq DATETIME NULL

--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES(26,'验收员确认收货',1,2,'验收员确认收货','image\tom_wap.gif','w_ckdrk',1,1,0)

------------------------------------------------------------------
--2016年8月24日 08:46:39----------------------------------
---零售明细表记录经营类别，便于调整经营类别不影响历史提奖数据-----
--

--ALTER TABLE t_lsdmxb 
--ADD jylb NVARCHAR(2) NULL ----对应t_spxx表的lbbh
--GO

--UPDATE m SET jylb = s.LBBH
--FROM t_lsdmxb m
--JOIN t_spxx s ON m.spbh = s.SPBH
--JOIN t_lsdzb z ON z.LSDBH = m.LSDBH
--WHERE z.rq > '2016-8-23' AND m.jylb IS NULL



                          
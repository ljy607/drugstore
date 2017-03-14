---------2017年3月8日 15:52:45-----------
----分店出库单增加产地字段，记录饮片的产地
--ALTER TABLE t_ckdmxb 
--ADD cd NVARCHAR(16) NULL

----商品信息增加功能主治
--ALTER TABLE T_SPXX
--ADD gnzz NVARCHAR(64) NULL	--功能主治

---------2017年1月8日 17:53:25-----------
------分店增加经理查询功能-------------------
--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES(11,'经理查询',4,2,'经理查询','image\tom_wap.gif','w_jlcx',1,1,0)


---------2016年10月15日-------------------
----出库单增加生产日期、复核标志
--ALTER TABLE T_CKDMXB
--ADD scrq DATETIME NULL,fhflag TINYINT NULL

----库存信息增加生产日期、到货时间
--ALTER TABLE T_CHXX
--ADD scrq DATETIME NULL, dhrq DATETIME NULL

--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES(26,'验收员确认收货',1,2,'验收员确认收货','image\tom_wap.gif','w_ckdrk',1,1,0)

------反药商品增加数量，用来记录超剂量限制
--ALTER TABLE T_FYSP
--ADD sl INT NULL,	--单剂限制数量		
--lx TINYINT NULL		--类型 1-反药记录 2-饮片单剂限制数量记录
--GO
--UPDATE T_FYSP
--SET lx = 1


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



                          
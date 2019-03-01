------------2019年3月1日 09:48:06---------------
------增加特价商品维护功能
--CREATE TABLE t_spxx_tj
--(
--	spbh NVARCHAR(10) NOT NULL,
--	PRIMARY KEY(spbh)
--)

-------------2019年2月25日 10:34:52-----------------
------公司创建会员分店表，用于记录同步历史和积分情况
--ALTER TABLE t_member
--ADD tbflag TINYINT NULL DEFAULT 0 ;

--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('02','同步会员信息',5,0,'同步会员信息','image\tom_wap.gif','w_member_tbsj',1,1,0)


------------2019年2月22日 14:25:26-----------
--------商品信息增加经验范围，用于控制某些商品不能出库到某个分店------------
--SET IDENTITY_INSERT t_options ON
--INSERT INTO t_options(id,pid, code, name, note, sort)
--VALUES(7,0,'jyfw',N'经营范围',N'经营范围',200)
--SET IDENTITY_INSERT t_options OFF

------分店经营范围
--CREATE TABLE t_dwxx_jyfw
--(
--	id INT IDENTITY(1,1) NOT NULL,
--	dwbh VARCHAR(3) NOT NULL,
--	jyfwid INT NOT NULL,
--  flag TINYINT NULL,
--	PRIMARY KEY(id)
--)

--INSERT INTO t_options(pid, code, name, note, sort)
--VALUES(7,'1',N'药品',N'药品',200)
--INSERT INTO t_options(pid, code, name, note, sort)
--VALUES(7,'2',N'饮片',N'饮片',200)
--INSERT INTO t_options(pid, code, name, note, sort)
--VALUES(7,'3',N'一类医疗器械',N'一类医疗器械',200)
--INSERT INTO t_options(pid, code, name, note, sort)
--VALUES(7,'4',N'二类医疗器械',N'二类医疗器械',200)
--INSERT INTO t_options(pid, code, name, note, sort)
--VALUES(7,'5',N'三类医疗器械',N'三类医疗器械',200)
--INSERT INTO t_options(pid, code, name, note, sort)
--VALUES(7,'6',N'百货',N'百货',200)
--INSERT INTO t_options(pid, code, name, note, sort)
--VALUES(7,'7',N'其他',N'其他',200)

------商品增加经营范围属性
--ALTER TABLE T_SPXX
--ADD jyfwid INT NULL
--GO

--UPDATE s SET s.jyfwid = 2
--FROM t_spxx s
--WHERE s.SPBH LIKE '7%'

-----------2018年9月25日 14:27:31----------------------
----增加按营业员区间统计零售毛利-----
--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES(21,'零售数据分析',2,2,'零售数据分析','image\tom_wap.gif','w_tjfx_ls',1,1,0)


----------2018年8月31日 18:00:45 --------------
-------商品增加 生产企业许可证号
--ALTER TABLE t_spxx 
--ADD scqyxkzh NVARCHAR(32) NULL		----生产企业许可证号

--ALTER TABLE t_jz
--ADD jeyibao	DECIMAL(18,2) NULL			----医保支付金额


-----------2018年4月2日 10:34:51---------------
--------商品信息增加试销有效期，批准文号有效期
--ALTER TABLE t_spxx 
--ADD sxyxq DATETIME NULL,   ----试销有效期
--pzwhyxq DATETIME NULL  ----批准文号有效期


------------2017年5月19日 18:18:11---------------
----修改要货计划表的yhsl的精度
--ALTER TABLE t_yhjhmx
--ALTER COLUMN yhsl DECIMAL(10,2) NOT NULL

------------2017年4月30日 17:29:36--------------------
----退库单增加生产日期
--ALTER TABLE t_tkdmxb 
--ADD scrq DATETIME NULL

-----结账增加 微信、支付宝、其他三项金额
--ALTER TABLE t_jz
--ADD jeweixin MONEY NULL, jezhifubao MONEY NULL, jeqita MONEY NULL

--CREATE FUNCTION [dbo].[fn_cfmxConcat](@district nvarchar(255)) 
--RETURNS varchar(8000) 
--AS 
--BEGIN -----处方明细药品列转行
--    DECLARE @str varchar(8000) 
--    SET @str = '' 
  
--    SELECT @str = @str + ' ' + left(e3.pm + '   ',5) + RIGHT('    ' + cast(e1.sl AS VARCHAR(4)),4) + ' g'
--	FROM t_ys_cfmx e1
--	JOIN t_spxx e3 ON e3.spbh=e1.spbh
--	WHERE e1.cfid = @district
    
--    RETURN STUFF( @str, 1, 1, '') 
--END 
--GO 

------------2017年3月31日 18:36:31-----------------
----要货计划增加产地
--ALTER TABLE t_yhjhmx 
--ADD cd NVARCHAR(16) NULL

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



                          
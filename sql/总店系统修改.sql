---------------2020年2月8日 11:49:27-------------
-------增加临时功能 单品进货记录查询 --------
--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('30','商品进货记录',4,1,'商品进货记录','image\tom_wap.gif','w_jhjlcx',1,1,0)

--create nonclustered index Index_jhdmxb_spbh on t_jhdmxb(spbh)
--with(drop_existing=on)

-------------2019年10月30日 10:54:51---------------------
-------价格信息增加电商价格信息------------
--ALTER TABLE t_jgxx
--ADD dslsj DECIMAL(10,4) NULL  ----电商零售价
--ALTER TABLE t_bjdmxb 
--ADD jdslsj DECIMAL(10,4) NULL, dslsj DECIMAL(10,4) null                           
 

-------------2019年10月28日 11:05:40-------------
---------增加会员信息查询导出-------
--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('26','会员信息',6,0,'会员信息','image\tom_wap.gif','w_member',1,1,0)


-------------2019年9月16日 15:20:10--------------
--------------结账数据-------------
--cREATE TABLE [dbo].[t_jz](
--	dwbh NVARCHAR(8) NOT NULL,
--	[code] [nvarchar](8) NOT NULL,
--	[rq] [datetime] NOT NULL,
--	[je] [decimal](10, 2) NOT NULL,
--	[jewr] [decimal](10, 2) NULL,
--	[jefxj] [decimal](10, 2) NULL,
--	[jeyq] [decimal](10, 2) NULL,
--	[jezp] [decimal](10, 2) NULL,
--	[jeweixin] [money] NULL,
--	[jezhifubao] [money] NULL,
--	[jeqita] [money] NULL,
--	[jeyibao] [decimal](18, 2) NULL,
--	[jeweixinsj] [money] NULL,
--	[jezhifubaosj] [money] NULL,
--	PRIMARY KEY(dwbh,code)
--)

--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('08','零售结账记录',3,2,'零售结账记录','image\tom_wap.gif','w_jz',1,1,0)


--------------2019年5月6日 19:36:47 ------------------
-------退库单增加复核后再入库
--ALTER TABLE T_TKDZB
--ADD fhr NVARCHAR(8) NULL
--GO
--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('34','复核分店退库申请',1,0,'复核分店退库申请','image\tom_wap.gif','w_tkdrk',1,1,0)


---------------2019年5月3日 12:19:01---------------
-------退库单增加生产厂家和产地,解决饮片产地和生产厂家问题
--ALTER TABLE T_TKDMXB 
--ADD cd NVARCHAR(16) NULL,sccj NVARCHAR(32) null
--ALTER TABLE T_chxx
--ADD cd NVARCHAR(16) NULL
--ALTER TABLE T_THDMXB 
--ADD cd NVARCHAR(16) NULL,sccj NVARCHAR(32) null
--ALTER TABLE t_thdzb
--ADD gysbh NVARCHAR(10) NULL

-----------2019年5月1日 13:32:51---------------------
----------运输记录增加出库单列-----
--ALTER TABLE t_ysjl
--ADD ckdbh NVARCHAR(128) NULL
--ADD zxsl INT DEFAULT 0 NULL

-----------2019年4月19日 20:55:36-------------
-----------增加出库红冲功能-----
--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('33','出库红冲',1,0,'出库红冲','image\tom_wap.gif','w_ckdlr_hc',1,1,0)

--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('24','供应商信息维护',6,0,'供应商信息维护','image\tom_wap.gif','w_gysxxlr',1,1,0)

--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('25','供应商信息审核',6,0,'供应商信息审核','image\tom_wap.gif','w_gysxxsh',1,1,0)


---------------2019年4月18日 13:40:47---------------
--------出库单增加sccj，饮片与生产厂家对应关系是动态的----------------
--ALTER TABLE t_chxx 
--ADD sccj NVARCHAR(32) NULL

--ALTER TABLE t_ckdmxb 
--ADD sccj NVARCHAR(32) NULL



----------2019年4月14日 15:38:15
----------运输记录--------------
--CREATE TABLE t_ysjl
--(
--	id INT IDENTITY(1,1) NOT NULL,
--	jsdw NVARCHAR(8) NULL,
--	rq DATETIME NULL,
--	cph NVARCHAR(16) NULL,
--	chek NVARCHAR(16) NULL,
--	pjfs TINYINT NULL,
--	spjs INT NULL,
--	qssj DATETIME NULL,
--	ddsj DATETIME NULL,
--	bzzk NVARCHAR(16) NULL,
--	jsr NVARCHAR(8) NULL,
--	PRIMARY KEY(id)
--)

--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('32','运输记录',1,0,'运输记录','image\tom_wap.gif','w_ysjllr',1,1,0)

--INSERT INTO t_options(pid, code, name, note, sort,flag)
--VALUES(3,19,'运输记录','运输记录',200,1)


------------2019年4月8日 11:33:46 -----------
-----------增加检验报告记录表-------------
--ALTER TABLE T_spxx_jybg
--ADD filePath NVARCHAR(128) NULL
--GO
--ALTER TABLE t_spxx_jybg
--alter column fileNM NVARCHAR(32) NULL
--GO
--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('29','养护计划',4,3,'养护计划','image\tom_wap.gif','w_yhjl_jh',1,1,0)

--SET IDENTITY_INSERT t_options ON
--INSERT INTO t_options(id,pid, code, name, note, sort, flag)
--VALUES(6,0,'wmslb',N'仓储类别',N'仓储类别',200,1)
--SET IDENTITY_INSERT t_options OFF

--INSERT INTO t_options(pid, code, name, note, sort, flag)
--VALUES(6,'NFY',N'内服药',N'内服药',200,1)
--INSERT INTO t_options(pid, code, name, note, sort, flag)
--VALUES(6,'HMHJ',N'麻黄碱复方制剂',N'麻黄碱复方制剂',200,1)
--INSERT INTO t_options(pid, code, name, note, sort, flag)
--VALUES(6,'WYY',N'外用药',N'外用药',200,1)
--INSERT INTO t_options(pid, code, name, note, sort, flag)
--VALUES(6,'QX',N'医疗器械',N'医疗器械',200,1)
--INSERT INTO t_options(pid, code, name, note, sort, flag)
--VALUES(6,'SLQX',N'三类医疗器械',N'三类医疗器械',200,1)
--INSERT INTO t_options(pid, code, name, note, sort, flag)
--VALUES(6,'RYXD',N'日用品、消毒用品',N'日用品、消毒用品',200,1)
--INSERT INTO t_options(pid, code, name, note, sort, flag)
--VALUES(6,'BJSP',N'保健食品',N'保健食品',200,1)
--INSERT INTO t_options(pid, code, name, note, sort, flag)
--VALUES(6,'SP',N'食品',N'食品',200,1)
--INSERT INTO t_options(pid, code, name, note, sort, flag)
--VALUES(6,'ZYYP',N'中药饮片',N'中药饮片',200,1)
--INSERT INTO t_options(pid, code, name, note, sort, flag)
--VALUES(6,'DXZYYP',N'毒性中药饮片',N'毒性中药饮片',200,1)


-------------2019年4月6日 19:16:57 ------------------
-------gsp报表增加 不合格药品记录 -----------
--INSERT INTO t_options(pid, code, name, note, sort,flag)
--VALUES(3,18,'不合格药品记录','不合格药品记录',190,1)

--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('31','待办统计',1,0,'待办统计','image\tom_wap.gif','w_timer',1,1,0)


------------2019年4月2日 13:56:55-----------------
----------进货单增加要货单长度，允许选择多个要货单
--ALTER TABLE T_JHDZB
--ALTER COLUMN yhdbh NVARCHAR(128) NULL


------------2019年2月28日 09:44:15-----------------
------要货标识、要货单供应商同步功能------
--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--            fdbz, parameter)
--VALUES('05','要货计划同步要货标志',5,1,'要货计划同步要货标志','image\tom_wap.gif','w_yhd_tbyhbz',1,1,1,0)

--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--            fdbz, parameter)
--VALUES('06','要货计划同步供应商',5,1,'要货计划同步供应商','image\tom_wap.gif','w_yhd_tbgys',1,1,1,0)


-------------2019年2月25日 10:34:52-----------------
------公司创建会员分店表，用于记录同步历史和积分情况
--CREATE TABLE t_member_fd
--(
--	dwbh NVARCHAR(8) NOT NULL,
--	code NVARCHAR(10) NOT NULL,
--	jine DECIMAL(10,2) NULL,
--	flag TINYINT NULL DEFAULT 1,
--	PRIMARY KEY (dwbh,code)
--)

----------2019年2月22日 17:52:58------------------
------增加检验报告核验功能--------
--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--            fdbz, parameter)
--VALUES(14,'进货要货对比',2,0,'检验报告核对','image\tom_wap.gif','w_jybghd',1,1,1,0)


-----------2019年2月21日 17:27:42----------------
------进货单增加检验报告存放路径--------------
--ALTER TABLE t_jhdmxb 
--ADD jybgpath NVARCHAR(128) NULL
--GO

-----------2019年2月20日 17:00:47------------
------单位信息增加 营业执照，药品经营许可证，发证日期和有效期
--ALTER TABLE t_dwxx 
--add yyzzfzrq DATETIME NULL,yyzzyxrq DATETIME NULL,ypjyxkzfzrq DATETIME NULL,ypjyxkzyxrq DATETIME NULL
--GO


-----------2019年2月19日 16:02:49-----------
------进货单增加要货单号、出库单号字段，用于根据要货单自动拆分出库单
--ALTER TABLE t_jhdzb 
--ADD fdyhd NVARCHAR(255) NULL,fdckd NVARCHAR(255) NULL,zdfh tinyint null default 0
--GO

-----------2019年2月12日 09:41:20---------------
------人员信息增加合同有效期、身份证有效期
--ALTER TABLE T_ZGXX
--ADD SFZYXQ DATETIME NULL,HTYXQ DATETIME NULL
--GO


----------2019年1月19日 17:11:26------------------
------增加进货单与要货单比对功能--------
--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--            fdbz, parameter)
--VALUES(30,'进货要货对比',1,0,'进货要货对比','image\tom_wap.gif','w_jh4yh',1,1,1,0)



----------2018年12月20日 15:38:02------------------
------增加商品信息修改功能--------
--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--            fdbz, parameter)
--VALUES(23,'商品信息修改',6,0,'商品信息修改','image\tom_wap.gif','w_spxx_bg',0,1,1,0)


----------   2018年11月25日 18:24:13 ---------------------------
------变价单增加变价单位记录表
--CREATE TABLE t_bjddw
--(
--	id INT IDENTITY(1,1) NOT NULL,
--	bjdbh NvarCHAR(10) NOT NULL,
--	dwbh NVARCHAR(10) NOT NULL,
--	flag TINYINT DEFAULT 0,
--	PRIMARY KEY(id)
--)


-----------2018年9月1日 10:29:36 ---------
-------要货计划增加一列 是否调拨
--ALTER TABLE T_YHJHMX
--ADD isdb TINYINT NULL		----是否调拨

-----------2018年7月26日 17:29:11------------
-------增加商品信息审批功能
--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--            fdbz, parameter)
--VALUES(22,'商品信息审核',6,0,'商品信息审核','image\tom_wap.gif','w_spxxwh_main_sh',1,1,1,0)

-------商品增加 生产企业许可证号
--ALTER TABLE t_spxx 
--ADD scqyxkzh NVARCHAR(32) NULL		----生产企业许可证号

--ALTER TABLE t_jhdmxb 
--ADD scqyxkzh NVARCHAR(32) NULL		----生产企业许可证号
 

------------2018年5月12日 11:45:32-----------
--------商品信息增加经验范围，用于控制某些商品不能出库到某个分店------------
--SET IDENTITY_INSERT t_options ON
--INSERT INTO t_options(id,pid, code, name, note, sort, flag)
--VALUES(5,0,'jyfw',N'经营范围',N'经营范围',200,1)
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

--INSERT INTO t_options(pid, code, name, note, sort, flag)
--VALUES(5,'1',N'药品',N'药品',200,1)
--INSERT INTO t_options(pid, code, name, note, sort, flag)
--VALUES(5,'2',N'饮片',N'饮片',200,1)
--INSERT INTO t_options(pid, code, name, note, sort, flag)
--VALUES(5,'3',N'一类医疗器械',N'一类医疗器械',200,1)
--INSERT INTO t_options(pid, code, name, note, sort, flag)
--VALUES(5,'4',N'二类医疗器械',N'二类医疗器械',200,1)
--INSERT INTO t_options(pid, code, name, note, sort, flag)
--VALUES(5,'5',N'三类医疗器械',N'三类医疗器械',200,1)
--INSERT INTO t_options(pid, code, name, note, sort, flag)
--VALUES(5,'6',N'百货',N'百货',200,1)
--INSERT INTO t_options(pid, code, name, note, sort, flag)
--VALUES(5,'7',N'其他',N'其他',200,1)

------商品增加经营范围属性
--ALTER TABLE T_SPXX
--ADD jyfwid INT NULL


-----------2018年4月2日 10:34:51---------------
--------商品信息增加试销有效期，批准文号有效期
--ALTER TABLE t_spxx 
--ADD sxyxq DATETIME NULL,   ----试销有效期
--pzwhyxq DATETIME NULL  ----批准文号有效期

------------2018年1月24日 17:04:38--------------------
-------增加供应商供货统计导出功能
--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--            fdbz, parameter)
--VALUES(28,'供货品种统计',4,0,'供货品种统计','image\tom_wap.gif','w_jhpztj',1,1,1,0)



--------------2017年12月2日 16:16:04---------------
----商品类别增加超市类
--INSERT INTO t_options(pid, code, name, note, sort, flag)
--VALUES(2,'09','超市','超市类商品',200,1)

----初始化超市进货录入专用帐号
--INSERT INTO t_zgxx(BH, XM, XB, SYSID, XL, ZC, ZW, SFZH, BM, QX, MM, JG, LXDZ, YZBM,
--            CSRQ, DH1, DH2, JBGZ, RZSJ, LZSJ, MEMO, GXRQ, GXZ, FLAG, tjyxrq)
--SELECT '999', '超市进货', XB, SYSID, XL, ZC, ZW, SFZH, BM, QX, '999', JG, LXDZ, YZBM, CSRQ, DH1,
--       DH2, JBGZ, RZSJ, LZSJ, MEMO, GXRQ, GXZ, FLAG, tjyxrq
--FROM t_zgxx
--WHERE bh = '001'


----------------2017年4月30日 17:48:29--------------
----退款单增加生产日期
--ALTER TABLE t_tkdmxb 
--ADD scrq DATETIME NULL

----进货单转出库单增加生产日期、产地
--ALTER TABLE t_ckdmxb_temp
--ADD  scrq DATETIME NULL,cd NVARCHAR(16) NULL

----------------2017年3月30日 18:32:14-----------------------------------------
----进货单增加产地字段，记录饮片的产地
--ALTER TABLE t_jhdmxb 
--ADD cd NVARCHAR(16) NULL

----要货计划增加产地
--ALTER TABLE t_yhjhmx 
--ADD cd NVARCHAR(16) NULL


----供应商增加业务员、财务人员信息
--ALTER TABLE T_GYSXX
--ADD ywyxm NVARCHAR(16) NULL,	--业务员姓名
--	ywydh VARCHAR(16) NULL,		--业务员电话
--	ywysfzh VARCHAR(18) NULL,	--业务员身份证
--	ywyyxq	DATETIME NULL,		--业务员有效期
--	cwxm NVARCHAR(16) NULL,		--财务姓名
--	cwdh VARCHAR(16) NULL,		--财务电话
--	cwsfzh VARCHAR(18) NULL,	--财务身份证
--	cwyxq DATETIME null   		--财务有效期

----------------2017年3月7日 18:33:44-----------------------------------------
----增加付款记录查询
--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--            fdbz, parameter)
--VALUES('07','付款记录查询',3,1,'付款记录查询','image\tom_wap.gif','w_fkjl_cx',1,1,1,0)

----首营品种增加生产标准、生产地址
--ALTER TABLE T_SYPZSPB 
--ADD scbz NVARCHAR(64) NULL, --生产标准
--    scdz NVARCHAR(64) NULL  --生产地址

----首营企业增加业务员、财务人员信息
--ALTER TABLE T_SYQYSPB
--ADD ywyxm NVARCHAR(16) NULL,	--业务员姓名
--	ywydh VARCHAR(16) NULL,		--业务员电话
--	ywysfzh VARCHAR(18) NULL,	--业务员身份证
--	ywyyxq	DATETIME NULL,		--业务员有效期
--	cwxm NVARCHAR(16) NULL,		--财务姓名
--	cwdh VARCHAR(16) NULL,		--财务电话
--	cwsfzh VARCHAR(18) NULL,	--财务身份证
--	cwyxq DATETIME null   		--财务有效期

----出库单增加产地，饮片需要增加产地录入字段
--ALTER TABLE t_ckdmxb 
--ADD cd NVARCHAR(16) NULL		--饮片产地

----商品信息增加功能主治
--ALTER TABLE T_SPXX
--ADD gnzz NVARCHAR(64) NULL



---------------2016年11月19日 16:25:07----------------------
-----增加医保药品目录
--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--            fdbz, parameter)
--VALUES(21,'医保药品目录',6,0,'医保药品目录','image\tom_wap.gif','w_yb_spxx_main',1,1,1,0)


--------2016.10.15-----------------
-----修改库存增加药品生产日期,到货日期
--ALTER TABLE t_chxx 
--ADD scrq DATETIME NULL,dhrq DATETIME

-----修改出库单增加药品生产日期
--ALTER TABLE t_ckdmxb
--ADD scrq DATETIME NULL

------反药商品增加数量，用来记录超剂量限制
--ALTER TABLE T_FYSP
--ADD sl INT NULL,	--单剂限制数量		
--lx TINYINT NULL		--类型 1-反药记录 2-饮片单剂限制数量记录
--GO
--UPDATE T_FYSP
--SET lx = 1



--------2016.9.29-----------------
-----修改全部单据审批三步走
--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--            fdbz, parameter)
--VALUES(28,'保管员确认出库',1,0,'保管员确认出库','image\tom_wap.gif','w_ckdrk',1,1,1,0)

--ALTER TABLE t_thdzb
--ADD shr NVARCHAR(3) NULL
--GO

--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--            fdbz, parameter)
--VALUES(29,'保管员确认退货',1,0,'保管员确认退货','image\tom_wap.gif','w_thdrk',1,1,1,0)




--------2016.8.27----------------------------------
-----1、所有单据三步审批 2、所有单据增加生产日期 3、人员岗位

-------取消总店饮片装斗记录
--ALTER table t_options
--ADD flag TINYINT NULL DEFAULT 1
--GO
--UPDATE t_options SET flag = 1
--GO
--UPDATE t_options SET flag = 0 WHERE id = 115
--GO

--INSERT INTO t_options(pid,code, name, note, sort,flag)
--VALUES(3,16,N'销后退回记录','',0,1)
--GO


-------  2016.7.31 start   ---------------------
-------  增加销量排名 
--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--            fdbz, parameter)
--VALUES(27,'综合查询',4,0,'综合查询','image\tom_wap.gif','w_zh_report',1,1,0,0)

----询价单维护
--DROP TABLE T_xjdzb
--CREATE TABLE t_xjdzb
--(
--	xjdbh NVARCHAR(16) NOT NULL,
--	gysbh NVARCHAR(10) NOT NULL,
--	rq DATETIME NOT NULL,
--	bz NVARCHAR(32) NULL,
--	flag TINYINT NULL DEFAULT 0,
--	PRIMARY KEY(xjdbh)
--)

--CREATE TABLE t_xjdmxb
--(
--	xjdbh NVARCHAR(16) NOT NULL,
--	spbh NVARCHAR(16) NOT NULL,
--	jg	DECIMAL(14,4) NULL DEFAULT 0,
--	bz NVARCHAR(32),
--	PRIMARY KEY(xjdbh,spbh)
--)

--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--            fdbz, parameter)
--VALUES(23,'询价单录入',1,0,'询价单录入','image\tom_wap.gif','w_xjdlr',1,1,0,0)





----2016.7.3 start------------------------------------
----增加商品供应商限制，主要用于麻黄碱类药品控制，要货计划中需要验证受供应商限制的商品，进货单也要验证
--CREATE TABLE T_R_SP_GYS
--(
--	id INT IDENTITY(1,1) NOT NULL,
--	spbh NVARCHAR(16) NOT NULL,
--	gysbh NVARCHAR(16) NOT NULL,
--	PRIMARY KEY(id)
--)

--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--            fdbz, parameter)
--VALUES(20,'药品限定供应商维护',6,0,'药品限定供应商维护','image\tom_wap.gif','w_sp_gys',1,1,0,0)

-----选择供应商脚本
----SELECT z.GYSBH,min(m.jhj) AS jhj ,(select top 1 e.jhj from t_jhdmxb e join t_jhdzb e1 on e.jhdbh = e1.jhdbh 
----where e.spbh = '10114' and e1.gysbh=z.gysbh and e1.jhrq > dateadd(month,-6,getdate()) order by e1.jhrq desc ) as zhjj,
----g.gsyzrq,g.jyxkzrq,g.gsprq,g.frrq,g.xyrq
----FROM  T_JHDZB z
----join t_jhdmxb m ON m.JHDBH = z.JHDBH
----join t_gysxx g ON z.GYSBH=g.GYSBH
----WHERE m.spbh = '10114' and
----		z.jhrq > dateadd(month,-24,getdate())
----group by z.gysbh,g.gsyzrq,g.jyxkzrq,g.gsprq,g.frrq,g.xyrq

----UNION

----SELECT r.GYSBH,min(a.jhj) AS jhj ,(select top 1 e.jhj from t_jhdmxb e join t_jhdzb e1 on e.jhdbh = e1.jhdbh 
----where e.spbh = '10114' and e1.gysbh=r.gysbh and e1.jhrq > dateadd(month,-6,getdate()) order by e1.jhrq desc ) as zhjj,
----a.gsyzrq,a.jyxkzrq,a.gsprq,a.frrq,a.xyrq
----FROM t_r_sp_gys r
----left join (
----	select z.gysbh,z.JHRQ,m.jhj,m.spbh,g.gsyzrq, g.jyxkzrq, g.gsprq, g.xyrq,g.frrq
----    from T_JHDZB z
----	join t_jhdmxb m ON m.JHDBH = z.JHDBH AND m.spbh = '10114'
----	join t_gysxx g ON z.GYSBH=g.GYSBH
----) a ON r.gysbh = a.gysbh AND r.spbh = a.spbh and a.jhrq > dateadd(month,-24,getdate())
----WHERE r.spbh = '10114' 
----group by r.gysbh,a.gsyzrq,a.jyxkzrq,a.gsprq,a.frrq,a.xyrq
----order by jhj





-----------------2016.7.3 end--------------------------------

----ALTER TABLE t_jhdzb 
----ADD zpflag TINYINT

----ALTER TABLE t_ckdzb 
----ADD zpflag TINYINT

----------2016.6.18
------增加进货明细表复核标志，1复核通过 0复核未通过 null 未复核
----ALTER TABLE t_jhdmxb 
----ADD fhflag TINYINT

-------增加进货单入库功能，单独列出
----INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
----            fdbz, parameter)
----VALUES('03','保管员确认入库',1,0,'保管员确认入库','image\tom_wap.gif','w_jhdrk',1,1,1,0)

--------2016.06.27----------------------
------总店进货单增加到货时间，默认当天
----ALTER TABLE t_jhdzb 
----ADD dhrq DATETIME NULL





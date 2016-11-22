--CREATE TABLE t_yb_sjzd
--(
--	id INT IDENTITY(1,1) NOT NULL,
--	code NVARCHAR(8) NOT NULL,
--	pcode NVARCHAR(8) NULL,
--	codevalue NVARCHAR(32) NULL,
--	sort INT DEFAULT 0,
--	PRIMARY KEY (id)
--)
------商品信息增加医保编码字段
--ALTER TABLE T_SPXX
--ADD ybbm NVARCHAR(50) NULL
--GO


--INSERT INTO t_spxx(SPBH, LBBH, SBBZ, XQBJ, PM, JC, GXRQ,ybbm,FLAG,JLDWBH,CJBH,GG)
--VALUES('his01','01',0,1,N'小儿复方氨基酸注射液(19AA-Ⅰ)','his01',GETDATE(),'101101520940000190102000600000000',1,19,'211213','10ml*4支')
--INSERT INTO t_spxx(SPBH, LBBH, SBBZ, XQBJ, PM, JC, GXRQ,ybbm,FLAG,JLDWBH,CJBH,GG)
--VALUES('his02','07',0,1,N'中药饮片及药材','his01',GETDATE(),'199993000000000980000000000000000',1,19,'211213','草果')
--INSERT INTO t_spxx(SPBH, LBBH, SBBZ, XQBJ, PM, JC, GXRQ,ybbm,FLAG,JLDWBH,CJBH,GG)
--VALUES('his03','07',0,1,N'中药配方颗粒','his01',GETDATE(),'199993000000000980000000000000001',1,19,'211213','四季青')

--INSERT INTO t_chxx(hwbh,spbh,PCBH, CHSL, yxrq)
--VALUES('J0101','his01','123456',1000,'2020-01-01')
--INSERT INTO t_chxx(hwbh,spbh,PCBH, CHSL, yxrq)
--VALUES('J0101','his02','123456',1000,'2020-01-01')
--INSERT INTO t_chxx(hwbh,spbh,PCBH, CHSL, yxrq)
--VALUES('J0101','his03','123456',1000,'2020-01-01')

--INSERT INTO t_jgxx(SPBH, LSJ, PFJ, DBJ, GBJ, ZK, hyj, GXRQ)
--VALUES('his01',1,1,1,1,100,1,GETDATE())
--INSERT INTO t_jgxx(SPBH, LSJ, PFJ, DBJ, GBJ, ZK, hyj, GXRQ)
--VALUES('his02',1.5,1.5,1.5,1.5,100,1.5,GETDATE())
--INSERT INTO t_jgxx(SPBH, LSJ, PFJ, DBJ, GBJ, ZK, hyj, GXRQ)
--VALUES('his03',1,1,1,1,100,1,GETDATE())

--INSERT INTO t_sphw(SPBH, JHHW, LSHW)
--VALUES('his01','J0101','J0101')
--INSERT INTO t_sphw(SPBH, JHHW, LSHW)
--VALUES('his02','J0101','J0101')
--INSERT INTO t_sphw(SPBH, JHHW, LSHW)
--VALUES('his03','J0101','J0101')

--ALTER TABLE T_LSDZB
--ADD tradeno NVARCHAR(24) NULL
--GO

-------零售主表增加 cashe个人现金支付、fund 医保基金支付、personcountpay 医保个人帐号支付
--ALTER TABLE t_lsdzb 
--ADD cash DECIMAL(10,2) NULL ,fund DECIMAL(10,2) NULL,personcountpay DECIMAL(10,2) NULL
--GO

----零售明细 feein 医保内金额 feeout 医保外金额 selfpay2 个人自付2
--ALTER TABLE t_lsdmxb 
--ADD feein DECIMAL(10,4) NULL,feeout DECIMAL(10,4) NULL,selfpay2 DECIMAL(10,4) NULL
--GO

--DROP TABLE t_yb_rxdiagnosisinfo
--GO
------医保外配处方信息 2016年10月29日 12:22:44
--CREATE TABLE t_yb_rxdiagnosisinfo
--(
--	id INT IDENTITY(1,1) NOT NULL,
--	icno VARCHAR(12) NULL,		--医保应用号
--	micode VARCHAR(8) NULL,		--处方医院
--	rxno VARCHAR(22) NULL,		--外配处方流水号:“RX”(2位)+医疗机构代码（8左对齐）＋分支机构号(2右对齐)＋6位系统日期（如070308）+6位序号
--	curetype CHAR(2) NULL,		--医疗类别 11：门诊；19：急诊；
--	isspecifiedhosp TINYINT NULL,	--定点医院状态 1：是本人定点医院、A类医院、专科医院；2：不是本人定点医院3：转诊
--	diagnoseno VARCHAR(9) NULL,		--诊断序号
--	recipedate CHAR(14) NULL,		--处方日期/时间
--	recipetype CHAR(1) NULL,		--处方类别 1：医保内处方2：医保外处方
--	diagnosename NVARCHAR(100) NULL,	--诊断名称
--	diagnosecode NVARCHAR(20) NULL,		--诊断编码
--	medicalrecord NVARCHAR(800) NULL,	--病历信息
--	sectioncode varCHAR(4) NULL,		--就诊科别代码
--	sectionname NVARCHAR(40) NULL,		--就诊科别名称
--	hissectionname NVARCHAR(40) NULL,	--医院本院就诊科别名称
--	drname NVARCHAR(40) NULL,		--医师姓名
--	drid NVARCHAR(20) NULL,		--医师编码
--	drlevel NVARCHAR(40) NULL,	--医师职称
--	registertradeno VARCHAR(22) NULL,	--挂号交易流水号
--	billstype CHAR(1) NULL,		--单据类型 2-西药或中成药处方；4-中草药处方； 
--	flag TINYINT NULL DEFAULT 0,	--标志 0 未成交 1 已成交 2-已退费
--	PRIMARY KEY(id)	
--)
--drop table t_yb_rxdiagnosisinfo_items
--go
------医保外配处方明细信息
--CREATE TABLE t_yb_rxdiagnosisinfo_items
--(
--	id INT IDENTITY(1,1) NOT NULL,
--	icno VARCHAR(12) NULL,		--医保应用号
--	rxno VARCHAR(22) NULL,		--外配处方流水号:“RX”(2位)+医疗机构代码（8左对齐）＋分支机构号(2右对齐)＋6位系统日期（如070308）+6位序号
--	rxitemno VARCHAR(40) NULL,	--外配处方明细流水号
--	itemcode VARCHAR(40) NULL,	--医保项目代码
--	hisname NVARCHAR(200) NULL,	--药店系统项目名称
--	itemtype VARCHAR(3) NULL,	--项目类别
--	dose CHAR(6) NULL,			--剂型
--	specification NVARCHAR(80) NULL,		--规格
--	unit NVARCHAR(40) NULL,		--单位
--	unitprice DECIMAL(10,4) NULL DEFAULT 0,	--单价
--	qty DECIMAL(10,2) NULL DEFAULT 0,		--数量
--	howtouse VARCHAR(3) NULL,	--用法
--	dosage NVARCHAR(40) NULL,	--单次用量
--	packaging NVARCHAR(20) NULL,--包装单位
--	minpackage NVARCHAR(20) NULL,	--最小包装
--	conversion NVARCHAR(20) NULL,	--换算率
--	daynum	INT NULL,	--天数
--	fee	DECIMAL(10,4) NULL DEFAULT 0,	--费用总金额
--	drugapprovalnumber NVARCHAR(40) NULL,	--药品批准文号
--	flag TINYINT NULL DEFAULT 0,	--标志 0 未成交 1 已成交
--	PRIMARY KEY(id)
--)

--DROP TABLE t_yb_personinfo
--GO
------医保用户信息
--CREATE TABLE t_yb_personinfo
--(
--	ic_no	VARCHAR(12) not NULL,				--医保应用号
--	card_no VARCHAR(12) NOT NULL,				--社保卡卡号
--	id_no	VARCHAR(18) NULL,					--公民身份证号
--	personname NVARCHAR(20) NULL,				--姓名
--	sex TINYINT NULL,							--性别 参见标准AAC004
--	birthday CHAR(8) NULL,						--出生日期
--	fromhosp VARCHAR(8) NULL,					--转诊医院编码
--	fromhospdate CHAR(8) NULL,					--转诊时限	格式：YYYYMMDD
--	persontype VARCHAR(3) NULL,					--参保人员类别 参见AKC021 
--	isinredlist VARCHAR(5) NULL,				--是否在红名单	true：在红名单 false：不在红名单
--	isspecifiedhosp CHAR(1) NULL,				--是否本人定点医院 0：本地红名单，默认为本人定点医院； 1：是本人定点医院、A类医院、专科医院、中医医院；2：不是本人定点医院 3：转诊医院
--	ischronichosp VARCHAR(5) NULL,				--是否本人慢病定点医院 true：本人慢病定点医院 false：非本人慢病定点医院
--	personcount DECIMAL(10,2) NULL DEFAULT 0,	--个人帐户余额
--	chroniccode VARCHAR(50) NULL,				--慢病编码
--	fundtype VARCHAR(4) NULL,					--险种类型 参见标准BAE059
--	isyt TINYINT NULL,							--预提人员标识 0：普通人员；1：预提人员
--	jclevel TINYINT NULL,						--军残等级 0：不享受伤残待遇 1：享受一级伤残待遇 2：享受二级伤残待遇 3：享受三级伤残待遇 4：享受四级伤残待遇 5：享受五级伤残待遇 6：享受六级伤残待遇
--	hospflag TINYINT NULL,						--在院标识 0：未住院状态 1：住院状态 2：急诊留观 3：家庭病床; 4: 住院计划生育手术 41：工伤保险住院状态 51：生育保险住院状态
--	updatedate DATETIME NOT NULL DEFAULT GETDATE(),
--	PRIMARY KEY(ic_no)					
--)

--DROP TABLE T_yb_divide
--GO 
------医保结算信息
--CREATE TABLE T_yb_divide
--(
--	tradeno varCHAR(24)	NOT NULL,					--医保药店交易流水号	
--	ic_no	VARCHAR(12) not NULL,					--医保应用号
--	feeno VARCHAR(20) NULL,							--药店系统收费单据号
--	curetype CHAR(2) NULL,							--医疗类别 11：门诊；19：急诊；
--	tradedate CHAR(14) NULL,						--交易日期时间 格式为：YYYYMMDDHHMMSS
--	feeall DECIMAL(10,2) NULL DEFAULT 0,			--费用总金额
--	fund DECIMAL(10,2) NULL DEFAULT 0,				--基金支付金额
--	cash DECIMAL(10,2) NULL DEFAULT 0,				--现金支付金额
--	personcountpay DECIMAL(10,2) NULL DEFAULT 0,	--个人账户支付金额
--	fee DECIMAL(10,2) NULL DEFAULT 0,				--费用总金额
--	feein DECIMAL(10,2) NULL DEFAULT 0,				--医保内总金额
--	feeout DECIMAL(10,2) NULL DEFAULT 0,			--医保外总金额
--	payfirst DECIMAL(10,2) NULL DEFAULT 0,			--本次付起付线金额
--	selfpay2 DECIMAL(10,2) NULL DEFAULT 0,			--个人自付2	
--	bigpay DECIMAL(10,2) NULL DEFAULT 0,			--药店大额支付金额
--	bigselfpay DECIMAL(10,2) NULL DEFAULT 0,		--药店大额自付金额
--	outofbig DECIMAL(10,2) NULL DEFAULT 0,			--超大额自付金额
--	bcpay DECIMAL(10,2) NULL DEFAULT 0,				--补充保险支付金额
--	jcbz DECIMAL(10,2) NULL DEFAULT 0,				--军残补助保险金额
--	medicine DECIMAL(10,2) NULL DEFAULT 0,			--西药金额	
--	tmedicine DECIMAL(10,2) NULL DEFAULT 0,			--中成药金额
--	therb DECIMAL(10,2) NULL DEFAULT 0,				--中草药金额
--	flag TINYINT NULL DEFAULT 0,		--标志 0 未成交 1 已成交 2 已退费	
--	recordtype TINYINT DEFAULT 0,		--记录类型 0 收费分解 1 退费分解                            	
--	PRIMARY KEY(tradeno)
--)

--DROP TABLE T_yb_divide_items
--GO
------医保结算明细
--CREATE TABLE T_yb_divide_items
--(
--	id INT IDENTITY(1,1) NOT NULL,
--	tradeno varCHAR(24)	NOT NULL,					--医保药店交易流水号	
--	itemno INT NULL,								--项目序号
--	recipeno VARCHAR(20) NULL,						--处方序号
--	hiscode VARCHAR(40) NULL,						--药店系统项目代码
--	itemcode VARCHAR(40) NULL,						--医保项目代码
--	itemname VARCHAR(100) NULL,						--医保项目名称
--	itemtype TINYINT NULL,							--项目类别 0药品 1诊疗项目 2服务设施
--	unitprice DECIMAL(10,4) NULL DEFAULT 0,			--单价
--	qty DECIMAL(8,2) NULL DEFAULT 0,				--数量
--	fee DECIMAL(10,4) NULL DEFAULT 0,				--费用总金额
--	feein DECIMAL(10,4) NULL DEFAULT 0,				--医保内总金额 如：医保内金额=0则为全自付 医保外金额=0则为无自付 其他为有自付
--	feeout DECIMAL(10,4) NULL DEFAULT 0,			--医保外总金额
--	selfpay2 DECIMAL(10,4) NULL DEFAULT 0,			--个人自付2	
--	STATE TINYINT NULL,								--分解状态 0正常，1不符合特殊标识，2医保目录内不存在，3对照错误，4不符合特殊定额管理要求，5未对照，6医保外处方
--	fee_type VARCHAR(4) NULL,						--收费类别 参见标准AKA063
--	preferentialfee DECIMAL(10,4) NULL DEFAULT 0,	--社区优惠金额
--	preferentialscale TINYINT NULL,					--社区优惠比例 整数，如优惠10%，则表示为“10”
--	approval_number	NVARCHAR(40) NULL,				--批准文号
--	EX_RECIPE_DETAIL_N VARCHAR(26) NULL,			--外配处方明细流水号
--	PRIMARY KEY(id)                   	         					
--)

-------记录挂起的医保销售记录
--DROP TABLE t_yb_lsdzb
--GO
--CREATE TABLE T_YB_LSDZB(
--	[tradeno] [varchar](24) NOT NULL,
--	[RQ] [datetime] NULL,
--	[JS] [int] NULL DEFAULT 1,
--	[DJHJ] [decimal](10, 2) NULL DEFAULT 0,
--	[HJJE] [decimal](10, 2) NULL DEFAULT 0,
--	[ZDZK] [tinyint] NULL DEFAULT 100,
--	[YSJE] [decimal](10, 2) NULL DEFAULT 0,
--	[BZ] [varchar](60) NULL,
--	[member_code] [varchar](10) NULL DEFAULT '',
--	[IDNumber] [varchar](32) NULL,
--	[CustomerName] [varchar](16) NULL,
--	[SWBZ] [tinyint] NULL DEFAULT 0,
--	[cash] [decimal](10, 2) NULL,
--	[fund] [decimal](10, 2) NULL,
--	[personcountpay] [decimal](10, 2) NULL,
--	PRIMARY KEY(tradeno)
--)
--DROP TABLE t_yb_lsdmxb
--GO
--CREATE TABLE [T_YB_LSDMXB](
--	id INT IDENTITY(1,1) NOT NULL,
--	[SPBH] [varchar](15) NOT NULL,
--	[SL] [decimal](10, 4) NULL DEFAULT 0,
--	[LSJ] [decimal](10, 4) NULL DEFAULT 0,
--	[YYYBH] [varchar](12) NULL,
--	[YSBH] [varchar](12) NULL,
--	[ZK] [tinyint] NULL DEFAULT 100,
--	[pcbh] [varchar](20) NULL,
--	[jhj] [decimal](10, 4) NULL DEFAULT 0,
--	[bz] [nvarchar](128) NULL,
--	[jhjhs] [decimal](15, 4) NULL DEFAULT 0,
--	[jylb] [nvarchar](2) NULL,
--	[feein] [decimal](10, 4) NULL,
--	[feeout] [decimal](10, 4) NULL,
--	[selfpay2] [decimal](10, 4) NULL,
--	rxno VARCHAR(22) NULL,		--外配处方流水号:“RX”(2位)+医疗机构代码（8左对齐）＋分支机构号(2右对齐)＋6位系统日期（如070308）+6位序号
--	rxitemno VARCHAR(40) NULL,	--外配处方明细流水号
--	tradeno VARCHAR(24) NULL,
--	PRIMARY KEY (id)
--)

-------医保商品信息
--CREATE TABLE t_spxx_yb
--(
--	spbh VARCHAR(16) NOT NULL,
--	pm VARCHAR(100) NULL DEFAULT '',
--	ybbm VARCHAR(50) NULL DEFAULT '',
--	ybpm VARCHAR(100) NULL DEFAULT '',
--	jx VARCHAR(20) NULL DEFAULT '',
--	gg VARCHAR(40) NULL DEFAULT '',
--	jldw VARCHAR(20) NULL DEFAULT '',
--	jiag DECIMAL(12,4) NULL DEFAULT 0,
--	sfdj VARCHAR(4) NULL DEFAULT '',
--	sflb VARCHAR(8) NULL DEFAULT '',
--	bz VARCHAR(250) NULL DEFAULT '',
--	pzwh VARCHAR(50) NULL DEFAULT '',
--	yblx TINYINT DEFAULT 1,     ----1 医保内 2 医保外 0 未对照
--	PRIMARY KEY (spbh)
--)

































	
ALTER TABLE t_spxx
ADD IsMHJ BIT DEFAULT 0
GO

UPDATE t_spxx 
SET IsMHJ = 0
GO

ALTER TABLE T_GYSXX
ADD email NVARCHAR(32) NULL

ALTER TABLE T_GYSXX
ADD lb NVARCHAR(32) NULL
GO

ALTER TABLE T_GYSXX
ADD gyfw NVARCHAR(256) NULL
GO

UPDATE t_gysxx
SET lb = '药品经营企业'
GO


--首营企业审批表
DROP TABLE T_SYQYSPB
CREATE TABLE T_SYQYSPB
(
	id INT IDENTITY(1,1) NOT NULL,
	gysbh NVARCHAR(10) NOT NULL,
	ngpz NVARCHAR(512) NULL,	--拟供品种
	xkzmc NVARCHAR(64) NULL,	--许可证名称
	xkzh NVARCHAR(64) NULL,	--许可证号
	xkzqymc NVARCHAR(64) NULL,	--企业名称
	xkzfzr NVARCHAR(16) NULL,	--负责人
	xkfw	NVARCHAR(128) NULL,		--许可范围
	xkzqydz NVARCHAR(64) NULL,	--许可证企业地址
	xkzyxq NVARCHAR(16) NULL,	--许可证有效期
	xkzfzjg	NVARCHAR(64) NULL,	--发证机关
	xkzfzrq NVARCHAR(16) NULL,	--发证日期
	yyzzqymc NVARCHAR(64) NULL,	--营业执照企业名称
	zczh	NVARCHAR(32) NULL,	--注册证号
	frdbr	NVARCHAR(32) NULL,	--法人代表人
	jjxz	NVARCHAR(32) NULL,	--经济性质
	zczj	NVARCHAR(16) NULL,	--注册资金
	jyfw	NVARCHAR(64) NULL,	--经营范围
	jyfs	NVARCHAR(32) NULL,	--经营方式
	yyzzqydz NVARCHAR(64) NULL,	--营业执照企业地址
	yyzzfzjg NVARCHAR(64) NULL,	--营业执照发证机关
	yyzzfzrq NVARCHAR(16) NULL,	--营业执照发证日期
	zlzsybh NVARCHAR(64) NULL,	--质量认证证书与编号
	yxqx NVARCHAR(16) NULL,		--有效期限
	ywbmyj NVARCHAR(64) NULL,	--业务部门意见
	ywbmfzr NVARCHAR(16) NULL,	--业务部门负责人
	ywbmrq NVARCHAR(16) NULL,	--业务部门日期
	zlxy	NVARCHAR(64) NULL,	--质量管理员意见
	kcr	NVARCHAR(16) NULL,	--质量管理员
	kcrq NVARCHAR(16) NULL,	-- 审核日期
	shyj NVARCHAR(64) NULL,	--审核意见
	zlglfzr NVARCHAR(16) NULL,	--质量负责人
	shrq NVARCHAR(16) NULL,	--审核日期
	spyj NVARCHAR(32) NULL,	--审批意见
	zjl NVARCHAR(16) NULL,	--总经理	
	sprq NVARCHAR(16) NULL,	--审批时间
	flag TINYINT DEFAULT 0,--审核标志 0 未审核，1已审核
	zbrq DATETIME DEFAULT GETDATE() null, --制表时间
	zbr NVARCHAR(3),--制表人                                                        	                   	
	xgr NVARCHAR(3),--最后修改人
	xgrq DATETIME DEFAULT GETDATE() NULL,  -- 最后修改时间                                                                     	                   	
	PRIMARY KEY(id)	
)

--首营品种审批表
DROP TABLE T_SYPZSPB
CREATE TABLE T_SYPZSPB
(
	id INT IDENTITY(1,1) NOT NULL,
	spbh NVARCHAR(16) NOT NULL,		--药品
	note NVARCHAR(512) NULL,	--药品性能、质量、用途、疗效等情况
	zlbz NVARCHAR(16) NULL,		--质量标准
	zxgg NVARCHAR(16) NULL,		--装箱规格
	yxq NVARCHAR(16) NULL,		--有效期
	gmpzsh NVARCHAR(32) NULL,	--GMP证书号
	rzsj NVARCHAR(32) NULL,		--认证时间
	cctj NVARCHAR(32) NULL,		--存储条件
	ccj DECIMAL(14,4) DEFAULT 0 NULL,	--出厂价
	cgj DECIMAL(14,4) DEFAULT 0 NULL,	--采购价
	pfj DECIMAL(14,4) DEFAULT 0 NULL,	--批发价
	lsj DECIMAL(14,2) DEFAULT 0 NULL,	--零售价
	sqyy NVARCHAR(64) NULL,		--申请原因
	cgyyj NVARCHAR(32) NULL,	--采购员意见
	cgfzr NVARCHAR(16) NULL,	--采购员
	cgrq NVARCHAR(16) NULL,		--采购员签字日期
	ywyj NVARCHAR(16) NULL,		--业务部门主管意见
	ywfzr NVARCHAR(16) NULL,	--业务负责人签字
	ywrq NVARCHAR(16) NULL,		--业务部门签字日期
	wjyj NVARCHAR(16) NULL,		--物价部门意见
	wjfzr NVARCHAR(16) NULL,	--物价部门负责人签字
	wjrq NVARCHAR(16) NULL,		--物价部门签字日期
	zlyj NVARCHAR(16) NULL,		--质量管理部门意见
	zlfzr NVARCHAR(16) NULL,	--质量负责人签字
	zlrq NVARCHAR(16) NULL,	--质量管理部门签字日期
	jlspyj NVARCHAR(16) NULL,	--经理审批意见: 同意进货 不同意进货
	fzr NVARCHAR(16) NULL,	--经理签字
	jlsprq NVARCHAR(16) NULL,	--经理审批日期
	flag TINYINT DEFAULT 0,   	--审核标志
	zbrq DATETIME DEFAULT GETDATE() null, --制表时间
	zbr NVARCHAR(3),--制表人  
	xgr NVARCHAR(3),--最后修改人
	xgrq DATETIME DEFAULT GETDATE() NULL,  -- 最后修改时间                                                                     	                   	
	PRIMARY KEY(id)
)

--拆零商品
CREATE TABLE t_clspjl
(
	id INT IDENTITY(1,1) NOT NULL,
	qsrq DATETIME DEFAULT GETDATE() NOT NULL,
	spbh NVARCHAR(16) NOT NULL,
	pcbh NVARCHAR(32) NOT NULL,
	yxrq DATETIME NULL,
	xl INT DEFAULT 0 NULL,
	xsrq DATETIME NULL,
	fhr NVARCHAR(3) NULL,
	PRIMARY KEY(id)
	)

INSERT INTO [T_FUNCS]([FUNCID], [FUNNM], [FUNTP], [GRPID], [FUNMS], [TPLJ], [FUNFM], [FLAG], [UFLAG])
VALUES(17, N'首营品种审批表', 6, 0, N'首营品种审批表', 'image\tom_wap.gif', 'w_sypzspb', 1, 1)

INSERT INTO [T_FUNCS]([FUNCID], [FUNNM], [FUNTP], [GRPID], [FUNMS], [TPLJ], [FUNFM], [FLAG], [UFLAG])
VALUES(18, N'首营企业审批表', 6, 0, N'首营企业审批表', 'image\tom_wap.gif', 'w_syqyspb', 1, 1)

INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG)
VALUES(25,N'资质查询',4,3,N'资质查询','image\tom_wap.gif','w_zzcx',1,1)


--分店执行
INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG)
VALUES(22,N'拆零药品',1,1,N'拆零药品','image\tom_wap.gif','w_clspjl',1,1)

--商品信息增加储存条件
ALTER TABLE t_spxx 
ADD cctj NVARCHAR(32) NULL
GO









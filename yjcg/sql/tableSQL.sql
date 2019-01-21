
-----合同订单评审报告
DROP TABLE t_htddps
GO

CREATE TABLE t_htddps
(
	id INT IDENTITY(1,1) NOT NULL,
	htbh NVARCHAR(32) NULL,				--合同编号
	ddbh NVARCHAR(32) NULL,				--订单号
	gysbh NVARCHAR(32) NULL,			--供应商
	cpxh NVARCHAR(64) NULL,				--产品型号
	sl DECIMAL(18,4) DEFAULT 0 NULL,	--数量
	yqjhq DATETIME NULL,				--要求交货日期
	qtyq NVARCHAR(64) NULL,				--其他要求
	jbr NVARCHAR(16) NULL,				--经办人
	jbrq DATETIME NULL,					--经办日期
	sfasjh TINYINT NULL,				--是否能按时发货
	cjrq DATETIME DEFAULT GETDATE() NULL,	--创建时间
	cjr NVARCHAR(16) NULL,					--创建人
	gxrq DATETIME DEFAULT GETDATE() NULL,	--更新日期
	gxr NVARCHAR(16) NULL,					--更新人
	PRIMARY KEY (id)
)
GO

INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
            fdbz, parameter)
VALUES('01','合同订单评审管理',1,0,'合同订单评审管理','image\tom_wap.gif','w_htddps',1,1,1,0)

INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
            fdbz, parameter)
VALUES('02','供应商信息',6,0,'供应商信息','image\tom_wap.gif','w_gysxx',1,1,1,0)

INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
            fdbz, parameter)
VALUES('01','合同订单评审查询',4,0,'合同订单评审查询','image\tom_wap.gif','w_rep_htddps',1,1,1,0)






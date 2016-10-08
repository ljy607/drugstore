
--进货票附单
DROP TABLE t_jhpfd
DROP TABLE t_jhpfdmx
CREATE TABLE t_jhpfd
(
	id INT IDENTITY(1,1) NOT NULL,
	gysbh NVARCHAR(8) NULL,	--供应商编号
	gysmc NVARCHAR(32) NULL,	--供应商名称
	jhrq DATETIME NULL,		--到货日期
	lpzs INT NULL,		--来票张数
	pmje DECIMAL(18,2) NULL,	--票面金额
	ghpz INT NULL,		--供货品种
	cjje DECIMAL(18,2) NULL,	--冲价金额
	wsje DECIMAL(18,2) NULL,	--未收金额
	wspzs INT NULL,				--未收品种
	flag INT DEFAULT 0 NOT NULL,                				--
	PRIMARY KEY(id)	
)
CREATE TABLE t_jhpfdmx
(
	id INT IDENTITY(1,1) NOT NULL,
	jhpfdid INT NOT NULL,	
	jhdbh NVARCHAR(16) NOT null,	--进货单号
	ysje DECIMAL(18,2) NULL,	--已收金额
	wsje DECIMAL(18,2) NULL,	--未收金额
	PRIMARY KEY(id)	
)

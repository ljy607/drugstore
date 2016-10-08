
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
	PRIMARY KEY(id),
	foreign key (jhpfdid) references t_jhpfd(id)	
)




UPDATE a SET a.pmje=b.je
FROM t_jhdzb a 
JOIN (
SELECT e1.JHDBH,SUM(e1.SL*e1.jhj) je
FROM t_jhdzb e
JOIN t_jhdmxb e1 ON e1.JHDBH = e.JHDBH
GROUP BY e1.JHDBH
) b ON a.JHDBH=b.JHDBH

INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
            fdbz, parameter)
VALUES(26,N'进货票附单',1,1,N'进货票附单','image\tom_wap.gif','w_jhpfd',1,1,0,0)





--ALTER TABLE t_jhpfdmx 
--ADD jhpfdid INT NOT NULL

--ALTER TABLE t_jhpfd 
--ADD flag INT DEFAULT 0

--SELECT *
--FROM T_FUNCS tf
--WHERE tf.FUNTP=1




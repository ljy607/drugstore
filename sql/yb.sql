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




	
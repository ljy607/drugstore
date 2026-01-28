--  TRUNCATE TABLE t_3
--  TRUNCATE TABLE t_2
--  TRUNCATE TABLE t_1 

--CREATE TABLE t_3
--(
--	id int IDENTITY(1,1) NOT NULL,
--	spbh NVARCHAR(64) NULL,
--	pm NVARCHAR(100) NULL,
--	jldw NVARCHAR(30) NULL,
--	gg NVARCHAR(50) NULL,
--	sccj NVARCHAR(100) null
--)
--CREATE TABLE t_2
--(
--	id INT IDENTITY(1,1) NOT NULL,
--	spbh NVARCHAR(100),
--	pcbh NVARCHAR(100),
--	sccj NVARCHAR(100)
--)
--CREATE TABLE t_1
--(
--	id INT IDENTITY(1,1) NOT NULL,
--	spbh NVARCHAR(100),
--	pm NVARCHAR(100)
--)

	

----- 导入生产厂家到t_2表中
INSERT INTO t_2(pcbh)
SELECT DISTINCT sccj FROM  t_3

-- 生成生产厂家编码 
SELECT 900000 + id,pcbh,spbh  -- update a set spbh = 900000 + id
FROM t_2  a

---- 导入生产厂家表t_sccj
INSERT INTO t_sccj(CJBH, CJMC, JC, cjjc, FLAG, GXRQ, GXZ)
SELECT spbh,pcbh,pcbh,pcbh,1,GETDATE(),'001'
FROM t_2 

SELECT * FROM T_SCCJ ts WHERE LEFT(cjbh,1) = '9'


-- 导入jldw到临时表，生产计量单位编码 
INSERT INTO t_1(pm)
SELECT DISTINCT a.jldw 
FROM t_3 a
LEFT JOIN t_jldw b ON a.jldw=b.JLDW
WHERE b.JLDWBH IS NULL

-- 导入计量单位表t_jldw
INSERT INTO t_jldw(JLDWBH,JLDW)
SELECT 50+id,pm  -- select *
FROM t_1 a
left JOIN t_jldw b ON a.pm = b.jldw
WHERE b.JLDWBH IS NULL

---- 导入商品信息 t_spxx
INSERT INTO t_spxx(SPBH,PM, GG, JLDWBH,CJBH,LBBH, SBBZ, JC, GXRQ, jfbz,ypztbh,jyfwid)
SELECT a.spbh,a.pm,a.gg,c.jldwbh,b.spbh AS sccj,'09',0,'',GETDATE(),1,2,11
FROM t_3 a
JOIN t_2 b ON a.sccj = b.pcbh
JOIN t_jldw c ON a.jldw = c.jldw 

--SELECT *
--FROM t_3 a 
--JOIN t_jldw b ON b.jldw = a.jldw

--SELECT *
--FROM T_JLDW tj

--SELECT DISTINCT jldw
--FROM t_3 t

SELECT * FROM T_GYSXX tg

delete FROM t_hwxx WHERE hwbh = 'HCY00'

SELECT * FROM T_SPHW ts



---- 初始化 货位信息 t_hwxx
INSERT INTO t_hwxx(HWBH, LSHW, HWMC, HWTP, SXKW, CKSX, HWMS, GXRQ, GXZ,FLAG)
VALUES('HCY00','***','弘诚誉商品货位',0,0,0,'存放弘诚誉商品',getdate(),'001',1)
 
---- 初始化商品货位 
INSERT INTO t_sphw(SPBH, JHHW, LSHW)
SELECT spbh,'HCY00','HCY00'
FROM T_SPXX ts

--- 导入进货表 t_jhdzb t_jhdmxb
INSERT INTO t_jhdzb(JHDBH, JHRQ, GYSBH, PJKL, LRR, JSBZ, JHDW, flag)
VALUES('JH25000001','2025.12.30','10000',1,'001',10,'107',1)

INSERT INTO t_jhdmxb(JHDBH, ORDR, LPHM, SPBH, YXQ, SCRQ, PCBH, SL, PFJ, JHJ, LSJ,
            GBJ, KL, HWBH, FLAG, qjhj,HGSL,YHSL)
SELECT 'JH25000001',id,id,spbh,yxrq,scrq,CONVERT(VARCHAR(8),scrq,112),shul,lsj,jhj,lsj,lsj,100,'K01',1,jhj,shul,shul
FROM t_1


---- 导入出库单 t_ckdzb t_ckdmxb
INSERT INTO t_ckdzb(CKDBH, CKRQ, JSDW, ZBR, CKR, YXBZ, wmsflag,flag)
VALUES('CK25000001','2025.12.31','107','001','001',10,1,1)

INSERT INTO t_ckdmxb(CKDBH, ORDR, SPBH, PCBH, YXRQ, JHJ, LSJ, KCL, SHUL, YXKW,
            scrq, FLAG)
SELECT 'CK25000001',id,spbh,CONVERT(VARCHAR(8),scrq,112),yxrq,jhj,lsj,shul,shul,'K01',scrq,1
FROM t_1



--------------------------------------------
-----------分店出库单处理 ------------------
SELECT *  -- a.spbh,a.yxkw,b.jhhw  -- update a set yxkw = b.jhhw
FROM t_ckdmxb a
JOIN t_sphw b ON b.SPBH = a.SPBH


----- 初始化库存
INSERT INTO t_chxx(HWBH, SPBH, PCBH, CHSL, yxrq, jiag, FLAG, scrq, dhrq, gxrq)
SELECT yxkw,spbh,pcbh,shul,yxrq,jhj,1,scrq,'2025.12.31',GETDATE()
FROM T_CKDMXB


---- 初始化价格信息
INSERT INTO t_jgxx(SPBH, LSJ, PFJ, DBJ, GBJ, ZK, hyj, GXRQ, dslsj)
SELECT spbh,lsj,lsj,lsj,lsj,100,lsj,'2025.12.30',lsj
FROM T_CKDMXB 


SELECT *   -- update a set yxbz = 10
FROM t_ckdzb a






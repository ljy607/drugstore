SELECT 物流中心,出库类型,货主,通知单号,通知单行号,客户编号,货品编号,数量,批号,客户名称,货品名称,单价,金额
,说明,客户类型,时间,_date
		,业务员,库类型,运输方式,是否代收款,是否急送,批号选择要求,是否促销批号,收货地址
		,审批状态,有效期至,生产日期,零售价,批发价
FROM  Pass_出库接口表_each
WHERE 通知单号 between 'CK26000095' and 'CK26000099'
ORDER BY 通知单号,通知单行号


SELECT distinct 通知单号,客户编号,时间
FROM  Pass_出库接口表_each
WHERE 通知单号 between 'CK26000095' and 'CK26000099'


SELECT *
FROM T_CKDMXB 
WHERE ckdbh between 'CK26000095' and 'CK26000099'


SELECT tzdh,a.ordr,a.spbh,a.pcbh,b.spbh,b.pcbh,a.yxrq,a.scrq,b.YXRQ,b.scrq  
-- update b set b.pcbh=a.pcbh
FROM t_bjsl_ckmx a
JOIN t_ckdmxb b ON b.ordr = a.ordr AND a.tzdh=b.CKDBH
WHERE tzdh between 'CK26000095' and 'CK26000099' AND b.pcbh <> a.pcbh


SELECT *  -- update a set a.yxbz = 10
FROM T_CKDzB    a
WHERE ckdbh between 'CK26000095' and 'CK26000099'


SELECT *  -- update a set a.yxbz = 10
FROM T_CKDmxB    a
WHERE ckdbh between 'CK26000095' and 'CK26000099'
AND spbh = '1027511'

SELECT *  -- update a set a.yxbz = 10
FROM T_CKDmxB    a
WHERE ckdbh = 'CK26000095' 


SELECT *  -- update a set a.yxbz = 10
FROM T_CKDmxB    a
WHERE ckdbh between 'CK26000095' and 'CK26000099'

INSERT INTO t_ckdmxb(CKDBH, ORDR, SPBH, PCBH, YXRQ, JHJ, LSJ, SHUL, YXKW, NOTE, 
             scrq,  cd, sccj, flag,DJZBH, ysjl,fhflag)
SELECT CKDBH, ORDR, SPBH, PCBH, YXRQ, JHJ, LSJ, SHUL, 'L0000', NOTE, 
            scrq, cd, sccj, flag,'','合格',1
FROM hjgs.zddb.dbo.t_ckdmxb 
WHERE ckdbh = 'CK26000095' AND spbh = '424551'


--SELECT *
--FROM t_sphw 
--WHERE spbh = '424551'


SELECT *  -- update a set chsl = 12
FROM t_chxx a
WHERE spbh = '424551' AND pcbh = '250902'



SELECT DISTINCT 通知单号,rq,left(通知单号,10) yhdbh,right(通知单号,5) gysbh
--SELECT a.*
-- update a set yhdbh=left(通知单号,10),gysbh=right(通知单号,5)
FROM tmp_slyy a
--JOIN t_jhdzb b ON a.yhdbh=b.yhdbh
WHERE 业务类型='采购入库' and dwlx = 3 and a.flag is null

SELECT a.djbh,a.rq,a.gysbh,a.客户,b.*   -- SELECT a.*
-- update a set gysbh = b.gysbh
FROM tmp_slyy a
left JOIN (select gysmc,max(gysbh) gysbh from t_gysxx GROUP BY gysmc) b ON a.客户=b.gysmc
WHERE 业务类型='采购入库' and dwlx = 2 and a.gysbh is null

SELECT *  -- update a set gysmc = '华润润采医药（北京）有限公司'
FROM t_gysxx  a
WHERE 1=1
--and gysmc LIKE '%华润润采医药（北京）有限公司%'
AND gysbh = '00035'

SELECT a.通知单号,a.yhdbh,a.gysbh,a.客户,b.gysbh,b.jhdbh
-- update a set flag = 1
FROM tmp_slyy a 
JOIN t_jhdzb b ON left(通知单号,10)=b.yhdbh
WHERE 业务类型='采购入库' 

------ 日期之后的数据 是已经存在的数据，不需要导入
SELECT a.*
-- update a set flag = 1
FROM tmp_slyy a 
WHERE 业务类型='采购入库' and dwlx = 2 and rq > '2026.2.25' 

----   JH25001901
SELECT spbh,*
FROM tmp_slyy WHERE 业务类型='采购入库' and yhdbh='YH25002679'

select MAX(jhdbh)  -- select *
from t_jhdzb 
where YEAR(jhrq) = 2026

---- JH26000132
select  *
from t_jhdmxb 
WHERE jhdbh = 'JH25001912'

select  *
from t_jhdzb 
WHERE jhdbh = 'JH25001901'

SELECT DISTINCT 通知单号
-- SELECT a.*
-- update a set djbh = 通知单号
FROM tmp_slyy a
left JOIN t_thdzb b ON a.djbh=b.thdbh
WHERE 业务类型='采退出库' and dwlx = 2 

SELECT a.djbh,a.rq,a.gysbh,a.客户,b.*
-- SELECT a.*
-- update a set gysbh = b.gysbh
FROM tmp_slyy a
left JOIN (select gysmc,max(gysbh) gysbh from t_gysxx GROUP BY gysmc) b ON a.客户=b.gysmc
WHERE 业务类型='采退出库' and dwlx = 2 


SELECT *  -- select max(jhdbh)
FROM t_jhdzb 
WHERE YEAR(jhrq) = 2026

SELECT DISTINCT yhdbh,gysbh ,rq  -- select * 
FROM tmp_slyy
WHERE 业务类型='采购入库' 
and flag is NULL
AND YEAR(rq) = 2025


ALTER TABLE tmp_slyy
add spbh VARCHAR(20) 

SELECT a.货品,a.货品名称,b.货主方编号,a.spbh  -- update a set spbh=b.货主方编号
FROM tmp_slyy a
JOIN tmp_slspxx b ON a.货品=b.货品
WHERE a.spbh IS NULL

UPDATE tmp_slyy SET rq = CAST(CAST(日期 as date) as datetime) where dwlx = 3

SELECT *
FROM t_jhdzb 
WHERE jhrq BETWEEN '2025.12.1' AND '2026.2.10'

SELECT * -- delete 
FROM t_jhdzb 
WHERE jhdbh BETWEEN 'JH26000133' AND 'JH26000195'

SELECT * -- delete 
FROM t_jhdmxb 
WHERE jhdbh BETWEEN 'JH26000133' AND 'JH26000195'

SELECT * -- delete
FROM t_jhdzb 
WHERE jhdbh BETWEEN 'JH25001902' AND 'JH25001993'

SELECT * -- delete
FROM t_jhdmxb 
WHERE jhdbh BETWEEN 'JH25001902' AND 'JH25001993'


----    批量处理进货单 开始 --------------------
CREATE TABLE #t1
(
	id int IDENTITY(1,1),
	jhdbh CHAR(10),
	yhdbh varCHAR(30),
	jhrq DATETIME,
	gysbh CHAR(5),
	ywnd int
)

CREATE TABLE #t2
(
	ORDR int IDENTITY(1,1),
	JHDBH CHAR(10),
	SPBH VARCHAR(20),
	YXQ DATETIME,
	SCRQ DATETIME,
	PCBH VARCHAR(30),
	SL DECIMAL(10,2),
	JHJ DECIMAL(10,2),
	LSJ DECIMAL(10,2),
    GBJ DECIMAL(10,2),
    KL INT DEFAULT 100,
    HWBH CHAR(3) DEFAULT 'W01',
    FLAG INT DEFAULT 1,
    SCCJ CHAR(6),
    PZWH VARCHAR(50) DEFAULT '',
    fkbz tinyINT DEFAULT 1, 
    FK TINYINT DEFAULT 1,
    DJZBH VARCHAR(50) DEFAULT '',
    WLHBS TINYINT DEFAULT 0, 
    qjhj DECIMAL(10,2),
    HGSL DECIMAL(10,2), 
    YHSL DECIMAL(10,2),
    fhflag TINYINT DEFAULT 1, 
    cd NVARCHAR(16), 
    scqyxkzh NVARCHAR(10) DEFAULT '', 
    jybgpath NVARCHAR(10) DEFAULT ''
)

INSERT INTO #t1(yhdbh,gysbh,jhrq,ywnd)
SELECT DISTINCT yhdbh,gysbh ,rq,YEAR(rq) - 2000
FROM tmp_slyy
WHERE 业务类型='采购入库' and dwlx = 2
and flag is NULL

--SELECT 'JH250019'+RIGHT('00'+CAST(id+1 AS VARCHAR(2)), 2),* FROM #t1 WHERE ywnd = 25
--SELECT 'JH260001'+RIGHT('00'+CAST(id-90+33 AS VARCHAR(2)), 2),* FROM #t1 WHERE ywnd = 26
--SELECT 'JH26000'+RIGHT('000'+CAST(id+220 AS VARCHAR(3)), 3),* FROM #t1 WHERE ywnd = 26

-- JH25001901
--UPDATE #t1 SET jhdbh='JH250019'+RIGHT('00'+CAST(id+1 AS VARCHAR(2)), 2) where ywnd = 25
--UPDATE #t1 SET jhdbh='JH260001'+RIGHT('00'+CAST(id-90+33 AS VARCHAR(2)), 2) where ywnd = 26

UPDATE #t1 SET jhdbh='JH26000'+RIGHT('000'+CAST(id+220 AS VARCHAR(3)), 3) where ywnd = 26

--  SELECT * FROM #t1

INSERT INTO #t2(JHDBH,SPBH, YXQ, SCRQ, PCBH, SL, JHJ, LSJ, GBJ, KL, HWBH, FLAG,
            HGSL, YHSL, cd)
SELECT b.jhdbh,spbh,有效期或失效期,生产日期,批号,收入数量,0,0,0,100,'W01',1,收入数量,收入数量,产地
FROM tmp_slyy a
JOIN #t1 b ON a.gysbh=b.gysbh AND a.yhdbh=b.yhdbh AND a.rq=b.jhrq
WHERE 业务类型='采购入库' and dwlx = 2 
 and a.flag is null

--SELECT b.cjbh
UPDATE a SET a.sccj = b.CJBH,pzwh=b.pzwh,cd=b.cd
FROM #t2 a
JOIN t_spxx b ON b.SPBH = a.SPBH

UPDATE a SET jhj = b.zdjj,lsj=b.LSJ,gbj=b.GBJ,qjhj = b.ZDJJ
FROM #t2 a
JOIN t_jgxx b ON b.SPBH = a.SPBH

--SELECT * FROM #t2

insert into t_jhdzb(JHDBH, JHRQ, GYSBH, FKQX, PJKL, LRR, JSBZ, BZ, fkbz, ysr, JHDW,
            yhdbh, pmje, wmsflag, dhrq, fdyhd, fdckd, zdfh, flag)
select jhdbh,jhrq,gysbh,jhrq,1,'016',10,'',1,'016','',yhdbh,0,1,jhrq,'','',1,1
FROM #t1

INSERT INTO t_jhdmxb(JHDBH, ORDR, SPBH, YXQ, SCRQ, PCBH, SL, JHJ, LSJ,
            GBJ, KL, HWBH, FLAG, SCCJ, PZWH, fkbz, FK, DJZBH, WLHBS, qjhj,
            HGSL, YHSL, fhflag, cd, scqyxkzh, jybgpath)
SELECT JHDBH, ORDR, SPBH, YXQ, SCRQ, PCBH, SL, JHJ, LSJ, GBJ, KL, HWBH, FLAG, SCCJ,
       PZWH, fkbz, FK, DJZBH, WLHBS, qjhj, HGSL, YHSL, fhflag, cd, scqyxkzh,jybgpath
FROM #t2


--SELECT * FROM #t1 ORDER BY ywnd,id
--SELECT * FROM #t2

/*
 
DROP TABLE #t1
DROP TABLE #t2

*/

------------     批处理进货单结束         -----------------------------


	
	
	
-------------    批量处理退货单 开始      -----------------------------
CREATE TABLE #t1
(
	id int IDENTITY(1,1),
	thdbh CHAR(10),
	thrq DATETIME,
	gysbh CHAR(5),
	ywnd int
)

CREATE TABLE #t2
(
	ORDR int IDENTITY(1,1), 
	tHDBH CHAR(10),
	SPBH VARCHAR(20),
	YXrQ DATETIME,
	SCRQ DATETIME,
	PCBH VARCHAR(30),
	thSL DECIMAL(10,2),
	JHJ DECIMAL(10,2) DEFAULT 0,	
    yxkw CHAR(3) DEFAULT 'H01',    
    SCCJ nvarCHAR(36),    
    fkbz tinyINT DEFAULT 0, 
    FK TINYINT DEFAULT 1,        
    BZ NVARCHAR(30) DEFAULT '', 
    cd NVARCHAR(16)
)

INSERT INTO #t1(thdbh,gysbh,thrq,ywnd)
SELECT DISTINCT djbh,gysbh ,rq,YEAR(rq) - 2000
FROM tmp_slyy
WHERE 业务类型='采退出库' and dwlx = 2 AND rq < '2026.2.25' 
--and flag IS NULL

---- SELECT * FROM #t1

INSERT INTO #t2(THDBH, SPBH, PCBH, yxrq, scrq,THSL, cd, sccj)
SELECT a.djbh,a.spbh,批号,有效期或失效期,生产日期,发出数量,产地,生产厂商
FROM tmp_slyy a
JOIN #t1 b ON a.gysbh=b.gysbh AND a.djbh = b.thdbh AND a.rq=b.thrq
WHERE 业务类型='采退出库' and a.flag is null

UPDATE a SET jhj = b.zdjj
FROM #t2 a
JOIN t_jgxx b ON b.SPBH = a.SPBH

---- SELECT * FROM #t2 t


insert into t_thdzb(THDBH, THRQ, THR, KPR, YXBZ, BZ, fkbz,shr, THDW,gysbh, isdone, wwbz)
select thdbh,thrq,'' thr,'016' kpr,10 yxbz,'' bz,0 fkbz,'002' shr,'' thdw,gysbh,'Y' isdone,1 wwbz
FROM #t1

INSERT INTO t_thdmxb(THDBH, ORDR, SPBH, PCBH, JHJ, THSL, BZ, cd, sccj, yxrq, scrq,yxkw)
SELECT THDBH, ORDR, SPBH, PCBH, JHJ, THSL, BZ, cd, sccj, yxrq, scrq,yxkw
FROM #t2


/*
 
DROP TABLE #t1
DROP TABLE #t2

*/

------------     批处理退货单结束         -----------------------------

		
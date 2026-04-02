----- 手工补录入库单据修改状态
SELECT b.*   -- update a set jsbz = 10
FROM t_jhdzb a 
JOIN t_jhdmxb b ON b.JHDBH = a.JHDBH
WHERE jsbz = 10 AND bz <> '' AND jhrq = '2026.3.30'

--SELECT DISTINCT jsbz FROM T_JHDZB tj
----- 补总店丢失的变价单
INSERT INTO hjgs.zddb.dbo.t_bjdzb(bjdbh,bjrq,pzr,kpr,bz,jsbz)
SELECT b.bjdbh,b.bjrq,b.pzr,b.kpr,b.bz,10
FROM t_bjdzb b 
LEFT JOIN hjgs.zddb.dbo.t_bjdzb a ON a.bjdbh=b.BJDBH
WHERE b.bjrq > '2025.12.1' and a.BJDBH IS NULL

INSERT INTO hjgs.zddb.dbo.t_bjdmxb(BJDBH, SPBH, DWBH, LSZK, JLSJ, LSJ, JPFJ, PFJ, JGBJ, GBJ, DBJ,
            BJYY, jhyj, hyj, jdslsj, dslsj)
SELECT b.BJDBH,b.SPBH,'***',b.LSZK, b.JLSJ, b.LSJ, b.JPFJ, b.PFJ, b.JGBJ, b.GBJ,b.DBJ, 
			b.BJYY, b.jhyj, b.hyj, b.jdslsj, b.dslsj
FROM t_bjdmxb b 
LEFT JOIN hjgs.zddb.dbo.t_bjdmxb a ON a.bjdbh=b.BJDBH
WHERE b.bjdbh > 'BJ25000100' and a.BJDBH IS NULL

---- 用分店价格更新总店价格
SELECT a.spbh,a.lsj,b.lsj,a.pfj,a.gbj,a.zk,a.hyj,b.hyj,a.dslsj
--   UPDATE b SET lsj = a.lsj,pfj=a.pfj,gbj=a.gbj,hyj=a.hyj,dslsj=a.dslsj
FROM t_jgxx a 
LEFT join hjgs.zddb.dbo.t_Jgxx b ON a.spbh = b.spbh
WHERE a.gxrq > '2025.12.1' AND a.lsj <> b.lsj

---- 用分店价格补充总店不存在的价格
INSERT INTO hjgs.zddb.dbo.t_Jgxx(spbh,lsj,pfj,gbj,zk,hyj,dslsj)
SELECT a.spbh,a.lsj,a.pfj,a.gbj,a.zk,a.hyj,a.dslsj
FROM t_jgxx a 
LEFT join hjgs.zddb.dbo.t_Jgxx b ON a.spbh = b.spbh
WHERE a.gxrq > '2025.12.1' AND b.spbh IS NULL

------ 补充生产厂家信息
INSERT INTO hjgs.zddb.dbo.t_sccj(CJBH, JC, CJMC, DZ, GXRQ, GXZ, FLAG)
SELECT a.CJBH, a.JC, a.CJMC, a.DZ, a.GXRQ, a.GXZ, a.FLAG
FROM t_sccj a 
LEFT JOIN hjgs.zddb.dbo.t_sccj b ON a.CJBH=b.cjbh
WHERE a.gxrq > '2025.12.1' AND b.cjbh IS NULL

------ 更新总店商品信息
UPDATE b
SET lbbh= a.LBBH, sbbz=a.SBBZ, xqbj=a.XQBJ, tzm=a.TZM, pm=a.PM, jc=a.JC, sb=a.SB, pzwh=a.PZWH, gg=a.GG,
       jldwbh=a.JLDWBH, cjbh=a.CJBH, yxqx=a.YXQX, zdjl=a.ZDJL, bz=a.BZ, gxrq=a.GXRQ, gxz=a.GXZ, flag=a.FLAG, yhbz=a.YHBZ, jx=a.JX,
       gmp=a.GMP, gb=a.GB, cd=a.CD, yplb=a.yplb, hxmc=a.hxmc, lb=a.lb, jky=a.jky, jgzt=a.jgzt, ypztbh=a.ypztbh, jfbz=a.jfbz,
       yhlx=a.yhlx, ismhj=a.IsMHJ, cctj=a.cctj, ypfl=a.ypfl, spbm=a.spbm, ybbm=a.ybbm, gnzz=a.gnzz, sxyxq=a.sxyxq, pzwhyxq=a.pzwhyxq,
       scqyxkzh=a.scqyxkzh, jyfwid=a.jyfwid, slyp=a.slyp, sfth=a.sfth, gjgbbm=a.gjgbbm, marketby=a.MarketBy, spbmlx=a.spbmlx
from t_spxx a
left join hjgs.zddb.dbo.t_spxx b on a.spbh = b.spbh
where a.gxrq BETWEEN '2025.12.1' AND '2026.2.13' 
-------- 补充总店不存在的商品信息
insert into hjgs.zddb.dbo.t_spxx(SPBH, LBBH, SBBZ, XQBJ, TZM, PM, JC, SB, PZWH, GG, JLDWBH, CJBH,
            YXQX, ZDJL, BZ, GXRQ, GXZ, FLAG, YHBZ, JX, GMP, GB, CD, yplb, hxmc, lb,
            jky, jgzt, ypztbh, jfbz, yhlx, IsMHJ, cctj, ypfl, spbm, 
            ybbm, gnzz, sxyxq, pzwhyxq, scqyxkzh, jyfwid, slyp, sfth, gjgbbm,
            MarketBy, spbmlx)
select a.SPBH, a.LBBH, a.SBBZ, a.XQBJ, a.TZM, a.PM, a.JC, a.SB, a.PZWH, a.GG,
       a.JLDWBH, a.CJBH, a.YXQX, a.ZDJL, a.BZ, a.GXRQ, a.GXZ, a.FLAG, a.YHBZ, a.JX,
       a.GMP, a.GB, a.CD, a.yplb, a.hxmc, a.lb, a.jky, a.jgzt, a.ypztbh, a.jfbz,
       a.yhlx, a.IsMHJ, a.cctj, a.ypfl, a.spbm, a.ybbm, a.gnzz, a.sxyxq, a.pzwhyxq,
       a.scqyxkzh, a.jyfwid, a.slyp, a.sfth, a.gjgbbm, a.MarketBy, a.spbmlx
from t_spxx a
left join hjgs.zddb.dbo.t_spxx b on a.spbh = b.spbh
where a.gxrq > '2025.12.1' and b.spbh is NULL

----- 补充出库单数据
INSERT INTO hjgs.zddb.dbo.T_CKDZB(CKDBH, CKRQ, JSDW, ZBR, CKR, SHR, YXBZ, BZ, flag, isdone)
SELECT a.CKDBH, a.CKRQ, a.JSDW, a.ZBR, a.CKR, '016', 15, a.BZ, 1,'Y'
FROM t_ckdzb a 
LEFT JOIN hjgs.zddb.dbo.t_ckdzb b ON a.CKDBH=b.ckdbh
WHERE a.ckrq > '2025.12.1' AND b.ckdbh IS NULL

INSERT INTO hjgs.zddb.dbo.t_ckdmxb(CKDBH, ORDR, SPBH, PCBH, YXRQ, JHJ, LSJ, KCL, SHUL, YXKW,
            NOTE, FLAG, scrq, cd, sccj)            
SELECT m.CKDBH, m.ORDR, m.SPBH, m.PCBH, m.YXRQ, m.JHJ, m.LSJ,m.shul, m.SHUL, 'W01',
       m.NOTE,1, m.scrq, m.cd, m.sccj
FROM t_ckdmxb m
JOIN t_ckdzb z ON z.CKDBH = m.CKDBH
LEFT JOIN hjgs.zddb.dbo.t_ckdmxb b ON b.ckdbh = m.ckdbh
WHERE z.ckrq > '2025.12.1' AND b.ckdbh IS NULL

----- 补充退库单数据  益德堂 102
INSERT INTO hjgs.zddb.dbo.t_tkdzb(TKDBH, TKRQ, TKDW, SQR, PZR, FLAG, BZ,ysr, fhr,delflag, isdone, wwbz)
SELECT 'TK102'+RIGHT(a.tkdbh,8), a.TKRQ,'102', a.SQR, a.PZR, a.FLAG, a.BZ,'016','016',1,'Y',1
FROM t_tkdzb a 
LEFT JOIN hjgs.zddb.dbo.t_tkdzb b ON 'TK102'+RIGHT(a.tkdbh,8)=b.tkdbh
WHERE a.tkrq > '2025.12.1' AND b.tkdbh IS NULL AND a.FLAG=10

INSERT INTO hjgs.zddb.dbo.t_tkdmxb(TKDBH, ORDR, SPBH, PCBH, JHJG, SHUL, GUIW, TKYY, yxrq, scrq,zlzk, ysjl, cd, sccj, delflag)            
SELECT 'TK102'+RIGHT(m.tkdbh,8), m.ORDR, m.SPBH, m.PCBH, m.JHJG, m.SHUL, 'H01', m.TKYY, m.yxrq,m.scrq,'外包装符合规定','合格入库', m.cd, m.sccj,1
FROM t_tkdmxb m
JOIN t_tkdzb z ON z.tKDBH = m.tKDBH
LEFT JOIN hjgs.zddb.dbo.t_tkdmxb b ON b.tkdbh = 'TK102'+RIGHT(m.tkdbh,8)
WHERE z.tkrq > '2025.12.1' AND b.tkdbh IS NULL AND z.flag = 10

----- 补充退库单数据  三店 107
INSERT INTO hjgs.zddb.dbo.t_tkdzb(TKDBH, TKRQ, TKDW, SQR, PZR, FLAG, BZ,ysr, fhr,delflag, isdone, wwbz)
SELECT 'TK107'+RIGHT(a.tkdbh,8), a.TKRQ,'107', a.SQR, a.PZR, a.FLAG, a.BZ,'016','016',1,'Y',1
FROM t_tkdzb a 
LEFT JOIN hjgs.zddb.dbo.t_tkdzb b ON 'TK107'+RIGHT(a.tkdbh,8)=b.tkdbh
WHERE a.tkrq > '2025.12.1' AND b.tkdbh IS NULL AND a.flag = 10

INSERT INTO hjgs.zddb.dbo.t_tkdmxb(TKDBH, ORDR, SPBH, PCBH, JHJG, SHUL, GUIW, TKYY, yxrq, scrq,zlzk, ysjl, cd, sccj, delflag)            
SELECT 'TK107'+RIGHT(m.tkdbh,8), m.ORDR, m.SPBH, m.PCBH, m.JHJG, m.SHUL, 'H01', m.TKYY, m.yxrq,m.scrq,'外包装符合规定','合格入库', m.cd, m.sccj,1
FROM t_tkdmxb m
JOIN t_tkdzb z ON z.tKDBH = m.tKDBH
LEFT JOIN hjgs.zddb.dbo.t_tkdmxb b ON b.tkdbh = 'TK107'+RIGHT(m.tkdbh,8)
WHERE z.tkrq > '2025.12.1' AND b.tkdbh IS NULL AND z.flag = 10

----- 补充退库单数据  九店 109
INSERT INTO hjgs.zddb.dbo.t_tkdzb(TKDBH, TKRQ, TKDW, SQR, PZR, FLAG, BZ,ysr, fhr,delflag, isdone, wwbz)
SELECT 'TK109'+RIGHT(a.tkdbh,8), a.TKRQ,'109', a.SQR, a.PZR, a.FLAG, a.BZ,'016','016',1,'Y',1
FROM t_tkdzb a 
LEFT JOIN hjgs.zddb.dbo.t_tkdzb b ON 'TK109'+RIGHT(a.tkdbh,8)=b.tkdbh
WHERE a.tkrq > '2025.12.1' AND b.tkdbh IS NULL AND a.flag = 10

INSERT INTO hjgs.zddb.dbo.t_tkdmxb(TKDBH, ORDR, SPBH, PCBH, JHJG, SHUL, GUIW, TKYY, yxrq, scrq,zlzk, ysjl, cd, sccj, delflag)            
SELECT 'TK109'+RIGHT(m.tkdbh,8), m.ORDR, m.SPBH, m.PCBH, m.JHJG, m.SHUL, 'H01', m.TKYY, m.yxrq,m.scrq,'外包装符合规定','合格入库', m.cd, m.sccj,1
FROM t_tkdmxb m
JOIN t_tkdzb z ON z.tKDBH = m.tKDBH
LEFT JOIN hjgs.zddb.dbo.t_tkdmxb b ON b.tkdbh = 'TK109'+RIGHT(m.tkdbh,8)
WHERE z.tkrq > '2025.12.1' AND b.tkdbh IS NULL AND z.flag = 10

----- 补充退库单数据  弘济康宁 105
INSERT INTO hjgs.zddb.dbo.t_tkdzb(TKDBH, TKRQ, TKDW, SQR, PZR, FLAG, BZ,ysr, fhr,delflag, isdone, wwbz)
SELECT 'TK105'+RIGHT(a.tkdbh,8), a.TKRQ,'105', a.SQR, a.PZR, a.FLAG, a.BZ,'016','016',1,'Y',1
FROM t_tkdzb a 
LEFT JOIN hjgs.zddb.dbo.t_tkdzb b ON 'TK105'+RIGHT(a.tkdbh,8)=b.tkdbh
WHERE a.tkrq > '2025.12.1' AND b.tkdbh IS NULL AND a.flag = 10

INSERT INTO hjgs.zddb.dbo.t_tkdmxb(TKDBH, ORDR, SPBH, PCBH, JHJG, SHUL, GUIW, TKYY, yxrq, scrq,zlzk, ysjl, cd, sccj, delflag)            
SELECT 'TK105'+RIGHT(m.tkdbh,8), m.ORDR, m.SPBH, m.PCBH, m.JHJG, m.SHUL, 'H01', m.TKYY, m.yxrq,m.scrq,'外包装符合规定','合格入库', m.cd, m.sccj,1
FROM t_tkdmxb m
JOIN t_tkdzb z ON z.tKDBH = m.tKDBH
LEFT JOIN hjgs.zddb.dbo.t_tkdmxb b ON b.tkdbh = 'TK105'+RIGHT(m.tkdbh,8)
WHERE z.tkrq > '2025.12.1' AND b.tkdbh IS NULL AND z.flag = 10

----- 补充退库单数据  二十五店 111
INSERT INTO hjgs.zddb.dbo.t_tkdzb(TKDBH, TKRQ, TKDW, SQR, PZR, FLAG, BZ,ysr, fhr,delflag, isdone, wwbz)
SELECT 'TK111'+RIGHT(a.tkdbh,8), a.TKRQ,'111', a.SQR, a.PZR, a.FLAG, a.BZ,'016','016',1,'Y',1
FROM t_tkdzb a 
LEFT JOIN hjgs.zddb.dbo.t_tkdzb b ON 'TK111'+RIGHT(a.tkdbh,8)=b.tkdbh
WHERE a.tkrq > '2025.12.1' AND b.tkdbh IS NULL AND a.flag = 10

INSERT INTO hjgs.zddb.dbo.t_tkdmxb(TKDBH, ORDR, SPBH, PCBH, JHJG, SHUL, GUIW, TKYY, yxrq, scrq,zlzk, ysjl, cd, sccj, delflag)            
SELECT 'TK111'+RIGHT(m.tkdbh,8), m.ORDR, m.SPBH, m.PCBH, m.JHJG, m.SHUL, 'H01', m.TKYY, m.yxrq,m.scrq,'外包装符合规定','合格入库', m.cd, m.sccj,1
FROM t_tkdmxb m
JOIN t_tkdzb z ON z.tKDBH = m.tKDBH
LEFT JOIN hjgs.zddb.dbo.t_tkdmxb b ON b.tkdbh = 'TK111'+RIGHT(m.tkdbh,8)
WHERE z.tkrq > '2025.12.1' AND b.tkdbh IS NULL AND z.flag = 10


---------------- 处理单品台帐表t_ckmx数据  开始   --------------------------- 

CREATE TABLE #t
(
	spbh NVARCHAR(30),
	pcbh NVARCHAR(50),
	djhm NVARCHAR(15),
	ordr INT,
	fxrq DATETIME,
	ywtp TINYINT,
	jiag DECIMAL(10,2),
	sl DECIMAL(10,2),
	jine DECIMAL(18,2),
	yxkw NVARCHAR(10)
)
CREATE TABLE #t1
(
	spbh NVARCHAR(30),
	pcbh NVARCHAR(50),
	id INT 
)
INSERT INTO #t(djhm, spbh, pcbh, fxrq, ywtp, jiag, sl, jine, yxkw,ordr)
SELECT m.jhdbh,m.spbh,m.pcbh,z.jhrq,1 ywtp,m.JHJ,m.sl,m.jhj*m.sl jine,m.HWBH,ROW_NUMBER() OVER (PARTITION BY m.spbh,m.pcbh ORDER BY m.jhdbh,m.spbh,m.pcbh) AS id
FROM t_jhdmxb m
JOIN t_jhdzb z ON z.JHDBH = m.JHDBH
left JOIN t_ckmx c ON m.jhdbh=c.DJHM
WHERE z.jhrq > '2025.12.1' AND  z.jsbz = 10 AND c.djhm IS NULL

INSERT INTO #t1(spbh, pcbh, id)
SELECT b.spbh,b.pcbh,MAX(b.ordr) ordr
FROM (
	SELECT distinct m.spbh,m.pcbh
	FROM t_jhdmxb m
	JOIN t_jhdzb z ON z.JHDBH = m.JHDBH
	left JOIN t_ckmx c ON m.jhdbh=c.DJHM
	WHERE z.jhrq > '2025.12.1' AND  z.jsbz = 10 AND c.djhm IS NULL 
) a
JOIN t_ckmx b ON a.spbh = b.spbh AND a.pcbh=b.pcbh
GROUP BY b.spbh,b.PCBH

--SELECT * FROM #t
--SELECT * from #t1

--SELECT s.spbh,s.pm,s.gg,s.cjmc,s.JLDW,b.zdjj,a.jiag
--FROM #t a
--left JOIN t_jgxx b ON a.spbh = b.SPBH
--left JOIN v_spxx s ON s.SPBH = b.SPBH
--WHERE a.jiag IS NULL

--SELECT j.spbh,j.zdjj,t.jhj   -- update j set zdjj = t.jhj
--FROM t_jgxx j
--JOIN t_2 t ON t.SPBH = j.SPBH

--SELECT j.spbh,j.jhj,t.jhj   -- update j set jhj = t.jhj
--FROM t_jhdmxb j
--JOIN t_2 t ON t.SPBH = j.SPBH AND j.jhj IS null

INSERT INTO t_ckmx(SPBH, PCBH, DJHM, ORDR, FXRQ, YWTP, JIAG, SL, JINE, YXKW)
SELECT m.spbh,m.pcbh,m.djhm,isnull(e1.id,0) + m.ordr ordr,m.fxrq,1 ywtp,m.jiag,m.sl,m.jiag*m.sl jine,m.yxkw
FROM #t m
LEFT JOIN #t1 e1 ON e1.spbh = m.spbh AND e1.pcbh = m.pcbh

/*
drop table #t
drop table #t1
 */


---------------- 处理单品台帐表t_ckmx数据  结束   --------------------------- 


--------
--------修改进货单上面1分钱进货价情况 

SELECT m.spbh,m.JHDBH,m.LPHM,m.jhj,a.jhj  -- update m set jhj = a.jhj
FROM  t_jhdmxb m
JOIN 
(
SELECT e.spbh,e.jhj,ROW_NUMBER() OVER (PARTITION BY e.spbh ORDER BY e.spbh,e.pcbh,c.jhrq desc) AS id
FROM t_jhdmxb e
JOIN (
	SELECT m.spbh,m.pcbh
	FROM t_jhdmxb m
	JOIN t_jhdzb z ON z.JHDBH = m.JHDBH
	WHERE jhrq > '2025.12.1' AND jhj = 0.01 AND lphm = 'LPHM'
) b ON e.spbh = b.spbh  -- AND e.pcbh=b.pcbh
JOIN t_jhdzb c ON c.JHDBH = e.JHDBH
WHERE e.JHJ <> 0.01
) a ON a.SPBH = m.SPBH AND m.LPHM = 'LPHM'
WHERE a.id = 1 
--ORDER BY a.jhj

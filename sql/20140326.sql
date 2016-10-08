--DROP TABLE T_spxx_jybg
--GO
--CREATE TABLE T_spxx_jybg
--(
--	id INT IDENTITY(1,1) NOT NULL,
--	spbh NVARCHAR(16) NOT NULL,
--	pcbh NVARCHAR(32) NOT NULL,
--	fileNM NVARCHAR(32) NOT NULL,
--	PRIMARY KEY(id)
--)

--SELECT distinct s.spbh, s.PM, s.GG,s.CJMC,s.PZWH,m.pcbh,g.GYSBH,g.GYSMC
--FROM T_CKDMXB m
--JOIN t_ckdzb z ON z.CKDBH = m.CKDBH
--JOIN T_JHDMXB jm ON m.SPBH=jm.spbh AND m.PCBH=jm.PCBH
--JOIN t_jhdzb jz ON jz.JHDBH = jm.JHDBH
--JOIN t_gysxx g ON jz.GYSBH=g.GYSBH
--JOIN v_spxx s ON m.spbh=s.spbh
--left JOIN (
--SELECT DISTINCT spbh,pcbh
--FROM t_spxx_jybg
--) e ON m.spbh=e.spbh AND e.pcbh=m.pcbh
--WHERE z.JSDW='109' AND z.bz <> '...' and e.spbh IS null
--ORDER BY g.GYSBH,s.SPBH


INSERT INTO t_bjdmxb(BJDBH, SPBH, DWBH, LSZK, JLSJ, LSJ, JPFJ, PFJ, JGBJ, GBJ, DBJ,BJYY, jhyj, hyj)
--SELECT 'BJ14000029',e.spbh,m.DWBH, m.LSZK, m.JLSJ, m.LSJ, m.JPFJ, m.PFJ, m.JGBJ,m.GBJ, m.DBJ, m.BJYY, m.jhyj, m.hyj
--FROM 
--(
--	SELECT distinct m.spbh,m.pcbh
--	FROM t_ckdmxb m
--	JOIN t_ckdzb z ON m.CKDBH=z.CKDBH
--	WHERE z.JSDW='109' AND yxbz = 0
--) e
--left join T_BJDMXB m ON e.spbh=m.SPBH
--WHERE m.BJDBH = 'BJ14000021'
--UNION
SELECT 'BJ14000029',e.SPBH,'***' dwbh,100 lszk, j.LSJ,0, j.PFJ,j.pfj,  j.gbj,j.GBJ,j.ZDJJ, '',j.hyj,0
FROM 
(
	SELECT distinct m.spbh
	FROM t_ckdmxb m
	JOIN t_ckdzb z ON m.CKDBH=z.CKDBH
	WHERE z.JSDW='109' AND yxbz=0
) e
JOIN t_jgxx j ON j.spbh = e.spbh



--INSERT INTO t_bjdzb(BJDBH, BJRQ, PZR, KPR, BZ, JSBZ, DWBH, DWMC)
--SELECT 'BJ14000029',GETDATE(),z.PZR, z.KPR, z.BZ, z.JSBZ, '109', 'ºë¼Ã¾Åµê'
--FROM t_bjdzb z
--WHERE z.BJDBH='BJ14000028'


ALTER TABLE t_lsdzb 
add IDNumber VARCHAR(32) NULL

ALTER TABLE t_lsdzb 
ADD CustomerName VARCHAR(16) NULL



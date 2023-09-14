--TRUNCATE TABLE	t_1 ;
--GO

--SELECT spbh,pcbh FROM t_1;

SELECT t.spbh,t.pcbh,b.jhj,c.GYSBH,d.gysmc
FROM (
SELECT a.id,a.spbh,a.pcbh,MAX(b.id) jhmxid
FROM t_1 a
left JOIN t_jhdmxb b ON a.spbh=b.spbh AND a.pcbh=b.pcbh
left JOIN t_jhdzb c ON c.JHDBH = b.JHDBH
GROUP BY a.id,a.spbh,a.pcbh
 ) t
left JOIN t_jhdmxb b ON t.jhmxid=b.id
left JOIN t_jhdzb c ON c.JHDBH = b.JHDBH
left JOIN t_gysxx d ON d.GYSBH = c.GYSBH 
ORDER BY t.id



SELECT t.spbh,t.pcbh,b.jhj,c.GYSBH,d.gysmc
FROM (
SELECT a.id,a.spbh,a.pcbh,MAX(b.id) jhmxid
FROM t_ckdmxb a
left JOIN t_jhdmxb b ON a.spbh=b.spbh AND a.pcbh=b.pcbh
left JOIN t_jhdzb c ON c.JHDBH = b.JHDBH
WHERE a.ckdbh = 'CK22000014'
GROUP BY a.id,a.spbh,a.pcbh
 ) t
left JOIN t_jhdmxb b ON t.jhmxid=b.id
left JOIN t_jhdzb c ON c.JHDBH = b.JHDBH
left JOIN t_gysxx d ON d.GYSBH = c.GYSBH 
ORDER BY t.id

SELECT T_CKDMXB.SPBH, v_spxx_qtcx.PM,v_spxx_qtcx.GG,v_spxx_qtcx.JLDW, v_spxx_qtcx.SCCJ,v_spxx_qtcx.hyj,v_spxx_qtcx.gbj,   
T_CKDMXB.PCBH,T_CKDMXB.JHJ,T_CKDMXB.LSJ,T_CKDMXB.SHUL,T_CKDMXB.YXKW,T_CKDMXB.CKDBH, T_CKDMXB.NOTE,
v_spxx_qtcx.pzwh,t_ckdmxb.cd,e.jhj,e.GYSBH,e.gysmc
FROM T_CKDMXB
JOIN v_spxx_qtcx  ON  T_CKDMXB.SPBH = v_spxx_qtcx.SPBH
JOIN (SELECT t.id,t.spbh,t.pcbh,b.jhj,c.GYSBH,d.gysmc
	FROM (
		SELECT a.id,a.spbh,a.pcbh,MAX(b.id) jhmxid
		FROM t_ckdmxb a
		JOIN t_ckdzb z ON a.CKDBH=z.CKDBH
		left JOIN t_jhdmxb b ON a.spbh=b.spbh AND a.pcbh=b.pcbh
		left JOIN t_jhdzb c ON c.JHDBH = b.JHDBH
		WHERE a.ckdbh = 'CK22000014' AND z.ckrq >= c.jhrq
		GROUP BY a.id,a.spbh,a.pcbh ) t
	left JOIN t_jhdmxb b ON t.jhmxid=b.id
	left JOIN t_jhdzb c ON c.JHDBH = b.JHDBH
	left JOIN t_gysxx d ON d.GYSBH = c.GYSBH 
	) e ON e.id=t_ckdmxb.id
WHERE ckdbh = 'CK22000014' AND isnull(t_ckdmxb.FLAG,1) = 1  

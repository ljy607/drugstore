DECLARE @cgr VARCHAR(3),@zlgly VARCHAR(3),@zlfzr VARCHAR(3)
SELECT @cgr = '124',@zlgly='020',@zlfzr='014'

DELETE FROM T_SYPZSPB

SELECT ts.spbh,MIN(z.JHRQ) jhrq
INTO #t
FROM T_jhdmxb ts
JOIN t_jhdzb z ON ts.jhdbh = z.JHDBH
JOIN v_spxx s ON ts.spbh = s.SPBH
WHERE z.jhrq > '2013-05-31'
AND ts.spbh NOT IN (
	SELECT m.spbh
	FROM t_jhdmxb m 
	JOIN t_jhdzb z ON m.jhdbh=z.jhdbh
	WHERE z.jhrq <'2013-06-01' )
AND s.ypfl IN('01','04','07')
GROUP BY ts.SPBH

--SELECT * FROM #t

INSERT INTO t_sypzspb(pm, gg, pzwh, sccj, cctj, lb, cgyj, cgr, cgrq, zlglyyj,
            zlgly, zlglyrq, zlglybz, zlfzryj, zlfzr, zlfzrrq, zlfzrbz, flag)
            
SELECT e1.pm,e1.GG, e1.PZWH,e1.CJMC,e1.cctj,
CASE e1.isMHJ WHEN 1 THEN '含麻黄碱' else case e1.gmp when 'Y' then '处方药' else '非处方药' end end as MHJ,
N'' cgyj,@cgr cgr,DATEADD(DAY,-10,e.jhrq) cgrq,
N'经审核资质齐全，材料完备，同意采购' zlglyyj,@zlgly,DATEADD(DAY,-9,e.jhrq) zlglyrq,8,
N'同意质量管理员意见，同意采购' zlfzryj,@zlfzr,DATEADD(DAY,-8,e.jhrq),8,8
FROM #t e
JOIN v_spxx e1 ON e.spbh=e1.SPBH
WHERE e.spbh = e1.SPBH

DROP TABLE #t

GO


--SELECT  TOP 10 *
--FROM T_SYPZSPB ts



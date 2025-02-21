SELECT *  -- update a set a.scsbyy = '',scbz = 0
FROM t_ybjk_spxx a
WHERE scbz = -1


SELECT ybbm,spbh, pm,yblx,ybscbz  -- update a  set ybscbz = 0
FROM t_yb_spxx a
WHERE 1=1
--and yblx = 1 AND LEN(ybbm) > 25
AND ybbm IN( 'XR05CBA101E012010100066','XR05XXA191A017010103864','ZA06CBX0358010102144'
,'ZB01BAH0272010101190','201709010753090010101000100000000','XR05CBA101E012010100066'
,'XB03XAL066A001010100372','XC09AAP027A001010100847','XC09AAP027A001010100847','XD11AXJ070U001010100922'
,'XD01ACT058F002010100107')

SELECT ybbm,spbh, pm,yblx,ybscbz  -- update a  set ybscbz = 0
FROM t_yb_spxx a
WHERE 1=1
--and yblx = 1 AND LEN(ybbm) > 25
AND ybbm IN('XD01ACT058F002010100107')

SELECT m.*,s.ybbm,s.yblx,s.ybscbz   -- delete m
FROM t_ybjk_spxxmx m
JOIN t_yb_spxx s ON s.YBBM = m.YBBM
WHERE s.ybscbz = 0


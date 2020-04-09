SELECT *
FROM t_zgxx
WHERE bm = '000'

-- ≤È—Ø»®œﬁ
SELECT c.xm,c.bh,a.*
FROM t_usrfunc a
JOIN T_FUNCS b ON a.FUNCID=b.FUNCID AND a.FUNCTP=b.FUNTP
JOIN t_zgxx c ON a.ZGBH=c.BH
WHERE b.id = 8

SELECT *
FROM T_FUNCS tf


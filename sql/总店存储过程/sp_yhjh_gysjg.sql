
---------------2019年4月6日 21:15:32-----------------------
/******************* 过程说明 *****************************************************************
  要货计划录入时获取供应商价格 
  参数	@spbh   	货号
  结果	生成供应商价格记录信息
  变更	修改要货计划供应商选择，提醒询价日期  2018年11月25日 15:14:52
		证照过期的供应商直接过滤，不出现在推荐供应商中 2019年4月6日 21:10:08
		询价单增加日期控制 1 年内 2021年11月25日 17:40:43
		询价单增加备注 2025年5月22日 10:48:11
**********************************************************************************************/
ALTER PROCEDURE [dbo].[sp_yhjh_gysjg] @spbh NVARCHAR(16) AS
begin

CREATE TABLE #t 
(
	gysbh NVARCHAR(16),
	jhj DECIMAL(14,4) null DEFAULT 0,
	zhjj NVARCHAR(32) NULL DEFAULT 0,
	xjjg DECIMAL(14,4) null DEFAULT 0,
	gsyzrq DATETIME NULL,
	jyxkzrq DATETIME NULL,
	gsprq DATETIME NULL,
	frrq DATETIME NULL,
	xyrq DATETIME NULL,
	xjrq DATETIME NULL,
	bz NVARCHAR(100) NULL
)

CREATE TABLE #tt
(
	gysbh NVARCHAR(16),
	xjjg DECIMAL(14,4) NULL DEFAULT 0,
	xjrq DATETIME NULL,
	bz NVARCHAR(100) NULL
)



INSERT INTO #t(gysbh, jhj, zhjj, gsyzrq, jyxkzrq, gsprq, frrq, xyrq)
SELECT z.GYSBH,min(m.jhj) jhj2year ,
(select top 1 cast(e.jhj AS NVARCHAR(16)) +'  '+ convert(varchar(10),e1.jhrq,102) from t_jhdmxb e join t_jhdzb e1 on e.jhdbh = e1.jhdbh 
where e.spbh = @spbh and e1.gysbh=z.gysbh and e1.jhrq > dateadd(month,-6,getdate()) order by e1.jhrq desc ) as zhjj,
g.gsyzrq,g.jyxkzrq,g.gsprq,g.frrq,g.xyrq
FROM  T_JHDZB z,t_jhdmxb m,t_gysxx g
WHERE z.jhdbh = m.jhdbh and
	   z.gysbh = g.gysbh and
		m.spbh = @spbh and
		z.jhrq > dateadd(month,-24,getdate()) AND
		( GETDATE() < g.jyxkzrq AND 
GETDATE() < g.gsprq AND 
GETDATE() < g.gsyzrq AND 
GETDATE() < g.xyrq AND 
GETDATE() < g.frrq AND 
GETDATE() < g.ywyyxq AND
GETDATE() < g.cwyxq )
group by z.gysbh,g.gsyzrq,g.jyxkzrq,g.gsprq,g.frrq,g.xyrq
order by min(m.jhj)

-----询价价格
INSERT INTO #tt(gysbh, xjjg,xjrq,bz)
SELECT t.gysbh,t1.jg,t.rq,t1.bz
FROM t_xjdzb AS T
JOIN t_xjdmxb AS t1 ON t1.xjdbh = T.xjdbh 
JOIN t_gysxx AS g ON g.gysbh = T.gysbh
WHERE t.rq > dateadd(month,-12,getdate())and t1.spbh = @spbh and 1>(SELECT COUNT(*) 
         FROM t_xjdzb e 
         JOIN t_xjdmxb e1 ON e1.xjdbh = e.xjdbh
         WHERE e.gysbh=T.gysbh AND t1.spbh = e1.spbh AND e.rq>T.rq
) AND
( GETDATE() < g.jyxkzrq AND 
GETDATE() < g.gsprq AND 
GETDATE() < g.gsyzrq AND 
GETDATE() < g.xyrq AND 
GETDATE() < g.frrq AND 
GETDATE() < g.ywyyxq AND
GETDATE() < g.cwyxq )

UPDATE e
SET e.xjjg = e1.xjjg,e.xjrq = e1.xjrq,e.bz=e1.bz
FROM #t e
JOIN #tt e1 ON e.gysbh = e1.gysbh

INSERT INTO #t(gysbh, xjjg, gsyzrq, jyxkzrq, gsprq, frrq,xyrq,xjrq,bz)
SELECT e1.GYSBH,e.xjjg,e1.gsyzrq, e1.jyxkzrq, e1.gsprq, e1.frrq, e1.xyrq,e.xjrq,e.bz
FROM #tt e
JOIN t_gysxx e1 ON e1.gysbh = e.gysbh
LEFT JOIN #t e2 ON e2.gysbh = e.gysbh
WHERE e2.gysbh IS NULL AND
( GETDATE() < e1.jyxkzrq AND 
GETDATE() < e1.gsprq AND 
GETDATE() < e1.gsyzrq AND 
GETDATE() < e1.xyrq AND 
GETDATE() < e1.frrq AND 
GETDATE() < e1.ywyyxq AND
GETDATE() < e1.cwyxq )


SELECT * FROM #t ORDER BY jhj asc

DROP TABLE #t
DROP TABLE #tt

END




DROP PROCEDURE sp_tjhz
GO

--银行账务核对
CREATE PROCEDURE sp_tjhz @rq CHAR(6)
AS 
BEGIN

----输出表，营业员各个分类金额
CREATE TABLE #t
(
	yyybh char(3),
	aje DECIMAL(14,2) DEFAULT 0,
	bje DECIMAL(14,2) DEFAULT 0,
	cje DECIMAL(14,2) DEFAULT 0,
	tj DECIMAL(14,2) DEFAULT 0
)

----插入当月产生营业额的营业员
INSERT INTO #t(yyybh)
SELECT DISTINCT yyybh
FROM t_lsdzb z
JOIN t_lsdmxb m ON m.LSDBH = z.LSDBH
WHERE convert(char(6),z.rq,112) =@rq

CREATE TABLE #tt
(
	yyybh char(3),
	je DECIMAL(14,2) DEFAULT 0
)

CREATE TABLE #ta
(
	yyybh char(3),
	je DECIMAL(14,2) DEFAULT 0
)

CREATE TABLE #tb
(
	yyybh char(3),
	je DECIMAL(14,2) DEFAULT 0
)

CREATE TABLE #tc
(
	yyybh char(3),
	je DECIMAL(14,2) DEFAULT 0
)

------- 虚拟商品，不参加提奖 挂号、煎药等费用
CREATE TABLE #sp
(
	spbh NVARCHAR(16)
)
INSERT INTO #sp( spbh)
SELECT spbh FROM t_spxx WHERE spbh LIKE '99998%'
INSERT INTO #sp(spbh)
SELECT spbh FROM t_spxx WHERE spbh LIKE '99999%'



-- A类
INSERT INTO #tt(yyybh,je)
SELECT  T_LSDMXB.YYYBH,   
sum(round(( t_lsdzb.zdzk / 100.0 ) *  t_lsdmxb.lsj * t_lsdmxb.sl * (t_lsdmxb.zk/100.0) * t_lsdzb.js ,2)) as hjje
FROM T_LSDZB   
join T_LSDMXB on  T_LSDZB.LSDBH = T_LSDMXB.LSDBH
join t_lslrl on round((t_lsdmxb.lsj - isnull(T_LSDMXB.jhjhs,0))/t_lsdmxb.lsj,2) between t_lslrl.sx and t_lslrl.xx
left JOIN #sp e ON t_lsdmxb.spbh = e.spbh
where t_lslrl.NameText='A' 
AND convert(char(6),t_lsdzb.rq,112) = @rq
AND e.spbh IS NULL
GROUP BY t_lsdmxb.YYYBH

INSERT INTO #ta(yyybh,je)
SELECT T_LSDMXB.YYYBH,   
sum(round(( t_lsdzb.zdzk / 100.0 ) *  t_lsdmxb.lsj * t_lsdmxb.sl * (t_lsdmxb.zk/100.0) * t_lsdzb.js ,2)) as hjje
FROM T_LSDZB   
join T_LSDMXB on  T_LSDZB.LSDBH = T_LSDMXB.LSDBH
left join t_lslrl on round((t_lsdmxb.lsj - isnull(T_LSDMXB.jhjhs,0))/t_lsdmxb.lsj,2) between t_lslrl.sx and t_lslrl.xx
--JOIN t_spxx s ON t_lsdmxb.spbh=s.spbh 
--JOIN dbo.fn_SplitToTable('14,16,19,21,22,26,29,30',',') fstt ON s.LBBH=fstt.[value]
JOIN dbo.fn_SplitToTable('14,16,19,21,22,26,29,30',',') fstt ON t_lsdmxb.jylb = fstt.[value]
where t_lslrl.NameText='A'
AND convert(char(6),t_lsdzb.rq,112) = @rq
GROUP BY t_lsdmxb.YYYBH

UPDATE a 
SET a.aje=b.je - isnull(c.je,0)
FROM #t a
JOIN #tt b ON a.yyybh=b.yyybh
left JOIN #ta c ON a.yyybh=c.yyybh

DELETE FROM #tt

--B类
INSERT INTO #tt(yyybh,je)
SELECT  T_LSDMXB.YYYBH,   
sum(round(( t_lsdzb.zdzk / 100.0 ) *  t_lsdmxb.lsj * t_lsdmxb.sl * (t_lsdmxb.zk/100.0) * t_lsdzb.js ,2)) as hjje
FROM T_LSDZB   
join T_LSDMXB on  T_LSDZB.LSDBH = T_LSDMXB.LSDBH
left join t_lslrl on round((t_lsdmxb.lsj - isnull(T_LSDMXB.jhjhs,0))/t_lsdmxb.lsj,2) between t_lslrl.sx and t_lslrl.xx
where t_lslrl.NameText='B'
AND convert(char(6),t_lsdzb.rq,112) = @rq
GROUP BY t_lsdmxb.YYYBH

INSERT INTO #tb(yyybh,je)
SELECT T_LSDMXB.YYYBH,   
sum(round(( t_lsdzb.zdzk / 100.0 ) *  t_lsdmxb.lsj * t_lsdmxb.sl * (t_lsdmxb.zk/100.0) * t_lsdzb.js ,2)) as hjje
FROM T_LSDZB   
join T_LSDMXB on  T_LSDZB.LSDBH = T_LSDMXB.LSDBH
left join t_lslrl on round((t_lsdmxb.lsj - isnull(T_LSDMXB.jhjhs,0))/t_lsdmxb.lsj,2) between t_lslrl.sx and t_lslrl.xx
--JOIN t_spxx s ON t_lsdmxb.spbh=s.spbh 
--JOIN dbo.fn_SplitToTable('14,16,19,21,22,26,29,30',',') fstt ON s.LBBH=fstt.[value]
JOIN dbo.fn_SplitToTable('14,16,19,21,22,26,29,30',',') fstt ON t_lsdmxb.jylb = fstt.[value]
where t_lslrl.NameText='B'
AND convert(char(6),t_lsdzb.rq,112) = @rq
GROUP BY t_lsdmxb.YYYBH

UPDATE a 
SET a.bje=b.je- isnull(c.je,0)
FROM #t a
JOIN #tt b ON a.yyybh=b.yyybh
left JOIN #tb c ON a.yyybh=c.yyybh

DELETE FROM #tt

--c类
INSERT INTO #tt(yyybh,je)
SELECT  T_LSDMXB.YYYBH,   
sum(round(( t_lsdzb.zdzk / 100.0 ) *  t_lsdmxb.lsj * t_lsdmxb.sl * (t_lsdmxb.zk/100.0) * t_lsdzb.js ,2)) as hjje
FROM T_LSDZB   
join T_LSDMXB on  T_LSDZB.LSDBH = T_LSDMXB.LSDBH
left join t_lslrl on round((t_lsdmxb.lsj - isnull(T_LSDMXB.jhjhs,0))/t_lsdmxb.lsj,2) between t_lslrl.sx and t_lslrl.xx
where t_lslrl.NameText='C'
AND convert(char(6),t_lsdzb.rq,112) = @rq
GROUP BY t_lsdmxb.YYYBH

INSERT INTO #tc(yyybh,je)
SELECT T_LSDMXB.YYYBH,   
sum(round(( t_lsdzb.zdzk / 100.0 ) *  t_lsdmxb.lsj * t_lsdmxb.sl * (t_lsdmxb.zk/100.0) * t_lsdzb.js ,2)) as hjje
FROM T_LSDZB   
join T_LSDMXB on  T_LSDZB.LSDBH = T_LSDMXB.LSDBH
left join t_lslrl on round((t_lsdmxb.lsj - isnull(T_LSDMXB.jhjhs,0))/t_lsdmxb.lsj,2) between t_lslrl.sx and t_lslrl.xx
--JOIN t_spxx s ON t_lsdmxb.spbh=s.spbh 
--JOIN dbo.fn_SplitToTable('14,16',',') fstt ON s.LBBH=fstt.[value]
JOIN dbo.fn_SplitToTable('14,16',',') fstt ON t_lsdmxb.jylb = fstt.[value]
where --t_lslrl.NameText='C' AND		--要减去全部的提奖类品种
convert(char(6),t_lsdzb.rq,112) = @rq
GROUP BY t_lsdmxb.YYYBH

--C类提奖金额 = 全部C类营业额 + A类提奖营业额 + B类提奖提交营业额 - 全部的T类品种（14,16）
UPDATE a 
SET a.cje=b.je+isnull(c.je,0)+isnull(e.je,0) -isnull(d.je,0)
FROM #t a
JOIN #tt b ON a.yyybh=b.yyybh
left JOIN #tb c ON a.yyybh=c.yyybh
left JOIN #tc d ON d.yyybh = a.yyybh
left JOIN #ta e ON e.yyybh=a.yyybh

--单独提奖品种
DELETE FROM #tt
INSERT INTO #tt(yyybh,je)
select a.yyybh,sum(a.sl * c.tjje) tjje
from t_lsdmxb a
join t_lsdzb b on a.lsdbh = b.lsdbh
join t_tjsp c on a.spbh = c.spbh
where convert(char(6),b.rq,112) = @rq AND c.flag=1
group by a.YYYBH
UPDATE e
SET e.tj = a.je
FROM #t e
JOIN #tt a ON a.yyybh = e.yyybh

----收款员
INSERT INTO #t(yyybh,tj)
SELECT  T_LSDzB.kpr,   
sum(round(( t_lsdzb.zdzk / 100.0 ) *  t_lsdmxb.lsj * t_lsdmxb.sl * (t_lsdmxb.zk/100.0) * t_lsdzb.js ,2)) as hjje
FROM T_LSDZB   
join T_LSDMXB on  T_LSDZB.LSDBH = T_LSDMXB.LSDBH
left JOIN #sp e ON t_lsdmxb.spbh = e.spbh
where convert(char(6),t_lsdzb.rq,112) = @rq AND e.spbh IS NULL
GROUP BY t_lsdzb.kpr


DELETE FROM #t WHERE aje=0 AND bje=0 AND cje=0 AND tj = 0

SELECT *
FROM #t 


DROP TABLE #t
DROP TABLE #tt
DROP TABLE #ta
DROP TABLE #tb
DROP TABLE #tc

END
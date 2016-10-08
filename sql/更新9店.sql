

--SET IDENTITY_INSERT t_options ON
--INSERT INTO t_options(id ,	pid,code,name,note,sort)
--VALUES(5,0,'TJML','特价毛利','标识特价的毛利率',0)
--SET IDENTITY_INSERT t_options OFF
--INSERT INTO t_options(pid,code,name,note,sort)
--VALUES(5,'1','0.1','标识特价的毛利率',0)

--SET IDENTITY_INSERT t_options ON
--INSERT INTO t_options(id ,	pid,code,name,note,sort)
--VALUES(6,0,'HYZK','会员日活动折扣','会员日活动折扣率',0)
--SET IDENTITY_INSERT t_options OFF
--INSERT INTO t_options(pid,code,name,note,sort)
--VALUES(6,'1','95','会员日活动会员价折扣',0)

--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--             parameter)
--VALUES(16,N'特价商品',3,0,N'特价商品','image\tom_wap.gif','w_tjsp',1,1,0)

------修改表结构，增加税务标志
--ALTER TABLE T_LSDZB
--ADD SWBZ TINYINT DEFAULT 0

--GO



if object_id('SP_LS_SW') is not null
	DROP PROCEDURE SP_LS_SW
GO
/******************* 过程说明 *****************************************************************
  生成零售记录，增加一个字段，t_lsdzb.swbz 
  参数	@rq		日期
		@ml   	毛利
  结果	生成零售记录记录信息
**********************************************************************************************/
CREATE PROCEDURE [dbo].[SP_LS_SW] @rq CHAR(8),@ml DECIMAL(4,2) AS
begin

--SELECT @rq = '20160309',@ml = 0.5

CREATE TABLE #t
(
	id INT IDENTITY(1,1),
	lsdbh NVARCHAR(16),
	ml DECIMAL(18,6),
	ysje DECIMAL(18,2),
	fp TINYINT NULL
)

CREATE TABLE #tt 
(
	lsdbh NVARCHAR(16)
)

INSERT INTO #t(lsdbh,ml, ysje,fp)
SELECT z.lsdbh,(z.YSJE-SUM(z.js*m.sl*m.jhj))/z.ysje AS ml,z.YSJE,z.FPHM
FROM t_lsdzb z
JOIN t_lsdmxb m ON m.LSDBH = z.LSDBH
WHERE CONVERT(CHAR(8),z.rq,112)=@rq 
GROUP BY z.lsdbh,z.YSJE,z.FPHM
ORDER BY ml ASC

--SELECT a.*
--FROM T_LSDZB a 
--JOIN #t a1 ON a1.LSDBH = a.LSDBH


--保留发生退货的
INSERT INTO #tt(lsdbh)
SELECT z.lsdbh
FROM t_lsdzb z
WHERE CONVERT(CHAR(8),z.rq,112)=@rq AND z.bz LIKE 'TH%'
UNION
SELECT SUBSTRING(z.bz,3,16) AS dh
FROM t_lsdzb z
WHERE CONVERT(CHAR(8),z.rq,112)=@rq AND z.bz LIKE 'TH%'

--保留开发票的
INSERT INTO #tt(lsdbh)
SELECT z.lsdbh
FROM #t z
left JOIN #tt z1 ON z.LSDBH=z1.lsdbh
WHERE z.fp = 1 AND z1.lsdbh IS NULL


--保留符合毛利的
INSERT INTO #tt(lsdbh)
SELECT z.lsdbh
FROM #t z
left JOIN #tt z1 ON z.LSDBH=z1.lsdbh
WHERE z.ml <=@ml AND z1.lsdbh IS NULL

--SELECT SUM(a1.ysje)
--FROM #tt a
--JOIN #t a1 ON a1.lsdbh = a.lsdbh

------SELECT z.*
UPDATE z 
SET z.SWBZ = 1
FROM t_lsdzb z
JOIN #tt z1 ON z1.LSDBH = z.LSDBH



DROP TABLE #t
DROP TABLE #tt

END





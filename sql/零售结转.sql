/************
* 总店执行
if object_id('t_skjl') is not null
	DROP TABLE t_skjl
GO
CREATE TABLE t_skjl
(
	id INT IDENTITY(1,1) NOT NULL,
	rq DATETIME NOT NULL,
	fdbh NVARCHAR(8) NOT NULL,
	je DECIMAL(16,2) NOT NULL,
	flag TINYINT DEFAULT 0 NOT NULL,
	PRIMARY KEY(id)
)

INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG, parameter,fdbz)
VALUES(06,N'零售收款记录',3,3,N'零售收款记录','image\tom_wap.gif','w_skjl',1,1,0,1)

************/

------结转零售明细
--if object_id('t_lsmx_sw') is not null
--	DROP TABLE t_lsmx_sw
--GO
--CREATE TABLE t_lsmx_sw
--(
--	id INT IDENTITY(1,1) not NULL ,
--	code NVARCHAR(8) NOT NULL,
--	lsdbh NVARCHAR(16) NOT NULL,
--	rq DATETIME NOT null,
--	js INT NOT null,
--	zdzk TINYINT NOT NULL,
--	spbh NVARCHAR(16) NOT NULL,
--	sl DECIMAL(10,4) NOT NULL,
--	lsj DECIMAL(10,4) NOT NULL,
--	zk TINYINT NOT NULL,
--	jhj DECIMAL(10,4) NOT NULL,
--		je DECIMAL(14,2) NOT NULL,
--	 PRIMARY KEY(id)
--)
--GO

--if object_id('t_lszb_sw') is not null
--	DROP TABLE t_lszb_sw
--GO
--------零售结转主表
--CREATE TABLE t_lszb_sw
--(
--	id INT IDENTITY(1,1) not NULL ,
--	code NVARCHAR(8) NOT NULL,
--	rq DATETIME NOT null,
--	jine DECIMAL(16,2) NOT NULL,
--	jhjje DECIMAL(16,2) NOT NULL,
--	flag TINYINT DEFAULT 0 NULL,
--	PRIMARY KEY(id)
--)
--GO

--ALTER TABLE T_OTHER
--ADD v1 DECIMAL(10,4) NULL,
-- v2 DECIMAL(10,4) NULL,
--v3 DECIMAL(10,4) NULL,
--v4 DECIMAL(10,4) NULL,
--je int null,
--memo NVARCHAR(16) NULL

--INSERT INTO T_OTHER(OTP,VAL,v1,v2,v3,v4,je,memo)
--VALUES( 2, '',0.4, 0.5,0.3,0.6,60000,'毛利')

--INSERT INTO t_other(otp,val,memo) VALUES(1,'123456',N'医师密码')

--if object_id('t_jz') is not null
--	DROP TABLE t_jz
--GO
--CREATE TABLE t_jz
--(
--	code NVARCHAR(8) NOT NULL,
--	rq DATETIME NOT NULL,
--	je DECIMAL(10,2) NOT NULL,
--	jewr DECIMAL(10,2) NULL DEFAULT 0,
--	jefxj DECIMAL(10,2) NULL DEFAULT 0,
--	flag TINYINT NOT NULL DEFAULT 0,
--	PRIMARY KEY(code)
--)
--GO
--if object_id('t_jzmx') is not null
--	DROP TABLE t_jzmx
--GO
--CREATE TABLE t_jzmx
--(
--	id INT IDENTITY(1,1) NOT NULL,
--	code NVARCHAR(8) NOT NULL,
--	yyybh NVARCHAR(8) NOT NULL,
--	je DECIMAL(10,2) NOT NULL,
--	jewr DECIMAL(10,2) NOT NULL DEFAULT 0,
--	flag TINYINT NOT NULL DEFAULT 0,
--	PRIMARY KEY(id)
--)
--GO




if object_id('SP_lsjz') is not null
	DROP PROCEDURE SP_lsjz
GO
/******************* 过程说明 *****************************************************************
  
**********************************************************************************************/
CREATE PROCEDURE [dbo].[SP_lsjz] @rq DATETIME AS
BEGIN 

declare @code NVARCHAR(8), @r1 DECIMAL(10,4),@r2 DECIMAL (10,4),@r3 DECIMAL(10,4),@r4 DECIMAL(10,4)
DECLARE @day DATETIME,@temp DECIMAL(10,4),@je INT

SELECT @r1=v1,@r2=v2,@r3=v3,@r4=v4,@je = je
FROM T_OTHER to1
WHERE to1.OTP=2

SELECT @code = CONVERT(CHAR(8),@rq,112)

------计算最后一天的日期
SELECT @day = DATEADD(MONTH,DATEDIFF(MONTH,'19911231',@rq),'19911231')


-----显示部分
CREATE table #t1
(
	id INT IDENTITY(1,1),
	lsdbh NVARCHAR(16),
	rq DATETIME,
	js INT,
	zdzk TINYINT,
	spbh NVARCHAR(16),
	sl DECIMAL(10,4),
	lsj DECIMAL(10,4),
	zk TINYINT,
	jhj DECIMAL(10,4),
	fphm NVARCHAR(20),
	mll DECIMAL(10,6),
	je DECIMAL(16,2)
)

------隐藏部分
CREATE TABLE #t2
(
	id INT ,
	lsdbh NVARCHAR(16),
	rq DATETIME,
	js INT,
	zdzk TINYINT,
	spbh NVARCHAR(16),
	sl DECIMAL(10,4),
	lsj DECIMAL(10,4),
	zk TINYINT,
	jhj DECIMAL(10,4),
	fphm NVARCHAR(20), 
	mll DECIMAL(10,6),
	je DECIMAL(16,2)
)

UPDATE m SET m.jhj = m.lsj
FROM T_LSDMXB m
JOIN t_lsdzb z ON m.LSDBH=z.LSDBH
WHERE convert(CHAR(8),z.RQ,112)=@code AND m.jhj = 0

INSERT INTO #t1(lsdbh, rq, js, zdzk, spbh, sl, lsj, zk, jhj,fphm,mll,je)
SELECT m.LSDBH,z.rq,z.js,z.ZDZK,m.SPBH,m.sl,m.lsj,m.zk,m.jhj,isnull(z.FPHM,'0'),
(m.zk/100.0*z.zdzk/100.0*m.lsj -m.jhj)/(m.zk/100.0*z.zdzk/100.0*m.lsj),
m.zk/100.0*z.zdzk/100.0*m.lsj*z.js*m.SL
FROM t_lsdmxb m
JOIN t_lsdzb z ON z.LSDBH = m.LSDBH
WHERE convert(CHAR(8),z.RQ,112)=@code 

INSERT INTO #t2(id,lsdbh, rq, js, zdzk, spbh, sl, lsj, zk, jhj,fphm,mll,je)
SELECT id,LSDBH,rq,js,ZDZK,SPBH,sl,lsj,zk,jhj,fphm,mll,je
FROM #t1 z
WHERE fphm = '1'

--计算当月的毛利
SELECT @temp = SUM(jine-jhjje)/SUM(jine)
FROM t_lszb_sw
WHERE LEFT(code,6) = LEFT(@code,6)

IF @temp < @r1 
	set @r3 = @r3 * 1.1
ELSE IF @temp > @r2
	set @r4 = @r4 * 0.9

INSERT INTO #t2(id,lsdbh, rq, js, zdzk, spbh, sl, lsj, zk, jhj,fphm,mll,je)
SELECT id,LSDBH,rq,js,ZDZK,SPBH,sl,lsj,zk,jhj,fphm,mll,je
FROM #t1 z
WHERE mll BETWEEN @r3 AND @r4

----如果有金额限制则判断每日营业额是否超过平均值的1.5，超过部分扣除
IF @je >0
BEGIN			
	SELECT @temp = SUM(je),@je = @je/day(@day) FROM #t2 
	IF  @temp > @je * 1.5 
	BEGIN		
		DECLARE @id INT,@amt DECIMAL(10,2)
		SET @je = @je * 1.1
		declare auth_cur cursor for
		SELECT id, je from #t2 WHERE fphm='0' ORDER BY rq DESC

		open auth_cur
		fetch next from auth_cur into @id,@amt		
		while (@@fetch_status=0)
		  BEGIN
		  	SET @temp = @temp - @amt
			IF @temp < @je
				BREAK
			
			DELETE FROM #t2 WHERE id = @id
			
			fetch next from auth_cur into @id,@amt	
		  end
		close auth_cur
		deallocate auth_cur	
	END
	ELSE IF @temp < @je * 0.55
	BEGIN
		DELETE FROM #t2
		INSERT INTO #t2(id,lsdbh, rq, js, zdzk, spbh, sl, lsj, zk, jhj,fphm,mll,je)
		SELECT id,LSDBH,rq,js,ZDZK,SPBH,sl,lsj,zk,jhj,fphm,mll,je
		FROM #t1 z
		WHERE fphm = '1'
		
		SET @r1 = @r1 * 0.7
		
		INSERT INTO #t2(id,lsdbh, rq, js, zdzk, spbh, sl, lsj, zk, jhj,fphm,mll,je)
		SELECT id,LSDBH,rq,js,ZDZK,SPBH,sl,lsj,zk,jhj,fphm,mll,je
		FROM #t1 z
		WHERE mll BETWEEN @r3 AND @r4

	END
		
END
	
	

/*******
----IF @amt <> @je 
----	if @amt > @je 		----隐藏部分过多	
----	BEGIN
		
----		declare auth_cur cursor for
----		SELECT id, je
----		from #t2
----		WHERE mll >= @r2
----		ORDER BY rq ASC

----		open auth_cur
----		fetch next from auth_cur into @id,@temp		
----		while (@@fetch_status=0)
----		  BEGIN
----		  	set @amt = @amt - @temp
----			IF @amt < @je 
----				BREAK
----			INSERT INTO #t1(lsdbh, rq, js, zdzk, spbh, sl, lsj, zk, jhj,je,mll)
----			SELECT lsdbh, rq, js, zdzk, spbh, sl, lsj, zk, jhj, je,mll
----			FROM #t2 
----			WHERE id = @id
			
----			DELETE FROM #t2 WHERE id = @id
			
----			fetch next from auth_cur into @id,@temp	
----		  end
----		close auth_cur
----		deallocate auth_cur	
----	END
----	ELSE
----	BEGIN
		
----		declare cur2 cursor for
----		SELECT id, je
----		from #t1
----		WHERE fphm = '0'
----		ORDER BY rq DESC

----		open cur2
----		fetch next from cur2 into @id,@temp		
----		while (@@fetch_status=0)
----		  BEGIN
----		  	set @amt = @amt + @temp
		  	
----		  	INSERT INTO #t2(id,lsdbh, rq, js, zdzk, spbh, sl, lsj, zk, jhj,je,mll)
----			SELECT id,lsdbh, rq, js, zdzk, spbh, sl, lsj, zk, jhj, je,mll
----			FROM #t1 
----			WHERE id = @id
			
----			DELETE FROM #t1 WHERE id = @id
			
----			IF @amt > @je 
----				BREAK
			
----			fetch next from cur2 into @id,@temp	
----		  end
----		close cur2
----		deallocate cur2		
----	END
********************/
--SELECT SUM(je) FROM #t1
--SELECT SUM(je) FROM #t2

--SELECT SUM((zk/100.0*zdzk/100.0*lsj -jhj)*js*sl)/sum((zk/100.0*zdzk/100.0*lsj)*js*sl)
--FROM #t1 

INSERT INTO t_lsmx_sw(code, lsdbh, rq, js, zdzk, spbh, sl, lsj, zk, jhj,je)
SELECT @code,lsdbh, rq, js, zdzk, spbh, sl, lsj, zk, jhj,je
FROM #t2

INSERT INTO t_lszb_sw(code, rq, jine,jhjje, flag)
SELECT @code,@rq,SUM(je),sum(js*sl*jhj),1
FROM #t2

DROP TABLE #t1
DROP TABLE #t2

END

--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG, parameter)
--VALUES(18,N'零售统计',2,5,N'零售统计','image\tom_wap.gif','w_lscx_sw',1,1,0)

--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG, parameter)
--VALUES(19,N'零售对账',2,5,N'零售对账','image\tom_wap.gif','w_lscxdz_sw',1,1,0)

--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG, parameter)
--VALUES(20,N'零售结账',2,2,N'零售结账','image\tom_wap.gif','w_jz',1,1,0)




----测试代码
--DECLARE @rq DATETIME, @i INT
--SELECT @rq = Dateadd(day,-1,'2015-11-1'),@i = 1

--WHILE @i < 32
--BEGIN
--	EXEC [dbo].[SP_lsjz] @rq 
--	select @i = @i + 1,@rq=Dateadd(day,-1,@rq)
--END

--SELECT @rq = Dateadd(day,-3,GETDATE()),@r1=0.555,@r2=0.6,@je = 6000,@i = 1

--WHILE @i < 13
--BEGIN
--	EXEC [dbo].[SP_lsjz] @rq, @r1 ,@r2 ,@je 
--	select @i = @i + 1,@rq=Dateadd(day,-1,@rq)
--END


----SELECT SUM(e.je)
----FROM (

----SELECT convert(CHAR(8),z.RQ,112) code,round(SUM(z.ZDZK/100.0*z.js*m.zk/100.0*sl*m.lsj),2) je
----FROM t_lsdmxb m
----JOIN t_lsdzb z ON z.LSDBH = m.LSDBH
----WHERE convert(CHAR(8),z.RQ,112) BETWEEN '20151001' AND '20151031'
----AND (m.zk/100.0*z.zdzk/100.0*m.lsj -m.jhj)/(m.zk/100.0*z.zdzk/100.0*m.lsj)<0.4
----GROUP BY convert(CHAR(8),z.RQ,112)
----) e

--SELECT --convert(CHAR(8),z.RQ,112) code,round(SUM(z.ZDZK/100.0*z.js*m.zk/100.0*sl*m.lsj),2) je,
--round(SUM((z.ZDZK/100.0*z.js*m.zk/100.0*sl*m.lsj)-(z.js*m.sl*m.jhj))/SUM(z.ZDZK/100.0*z.js*m.zk/100.0*sl*m.lsj),2)
--FROM t_lsdmxb m
--JOIN t_lsdzb z ON z.LSDBH = m.LSDBH
--WHERE convert(CHAR(8),z.RQ,112) BETWEEN '20151101' AND '20151131'
--AND (m.zk/100.0*z.zdzk/100.0*m.lsj -m.jhj)/(m.zk/100.0*z.zdzk/100.0*m.lsj)<0.555
----GROUP BY convert(CHAR(8),z.RQ,112)

----SELECT tls.*,e.je, e.je - tls.jine,(jine-jhjje)/jine
----FROM t_lszb_sw tls,
----(
----SELECT convert(CHAR(8),z.RQ,112) code,round(SUM(z.ZDZK/100.0*z.js*m.zk/100.0*sl*m.lsj),2) je
----FROM t_lsdmxb m
----JOIN t_lsdzb z ON z.LSDBH = m.LSDBH
----WHERE convert(CHAR(8),z.RQ,112) BETWEEN '20151101' AND '20151112'
----GROUP BY convert(CHAR(8),z.RQ,112)
----) e

----WHERE tls.code = e.CODe 
----ORDER BY tls.code

--SELECT SUM(jine-jhjje)/SUM(jine)
--FROM t_lszb_sw
--WHERE left(code,6) = '201510'

--------提奖预警
--SELECT tt.spbh,s.PM,s.GG,s.CJMC,j.jg,tt.TJJE
--FROM T_TJSP tt
--JOIN (SELECT spbh,t_jgxx.ZDJJ,( CASE hyj WHEN 0 THEN lsj ELSE lsj end) jg
--        FROM t_jgxx )j ON j.SPBH = tt.SPBH
--JOIN v_spxx s ON s.SPBH = j.SPBH
--WHERE  j.jg - j.ZDJJ <=  tt.TJJE







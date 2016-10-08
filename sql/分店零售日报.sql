ALTER TABLE T_OTHER
ADD memo NVARCHAR(16) NULL
GO
INSERT INTO t_other(otp,val,memo) VALUES(1,'123456',N'医师密码')

if object_id('t_jz') is not null
	DROP TABLE t_jz
GO
CREATE TABLE t_jz
(
	code NVARCHAR(8) NOT NULL,
	rq DATETIME NOT NULL,
	je DECIMAL(10,2) NOT NULL,
	jewr DECIMAL(10,2) NULL DEFAULT 0,
	jefxj DECIMAL(10,2) NULL DEFAULT 0,
	jeyq DECIMAL(10,2) NULL DEFAULT 0,
	jezp DECIMAL(10,2) NULL DEFAULT 0,
	flag TINYINT NOT NULL DEFAULT 0,
	PRIMARY KEY(code)
)
GO
if object_id('t_jzmx') is not null
	DROP TABLE t_jzmx
GO
CREATE TABLE t_jzmx
(
	id INT IDENTITY(1,1) NOT NULL,
	code NVARCHAR(8) NOT NULL,
	yyybh NVARCHAR(8) NOT NULL,
	je DECIMAL(10,2) NOT NULL,
	jewr DECIMAL(10,2) NOT NULL DEFAULT 0,
	flag TINYINT NOT NULL DEFAULT 0,
	PRIMARY KEY(id)
)
GO



if object_id('t_sw_rb') is not null
	DROP TABLE t_sw_rb
GO
CREATE TABLE t_sw_rb
(
	code varCHAR(8) NOT NULL,
	je MONEY NOT NULL DEFAULT 0,
	jhje MONEY NOT NULL DEFAULT 0,
	flag TINYINT,
	PRIMARY KEY(code)
)
GO
if object_id('t_sw_rbmx') is not null
	DROP TABLE t_sw_rbmx
GO
CREATE TABLE t_sw_rbmx
(
	id INT IDENTITY(1,1) NOT NULL,
	code varCHAR(8) NOT NULL,
	spbh NVARCHAR(16) NOT NULL,
	sl INT NOT NULL DEFAULT 0,
	je MONEY NOT NULL DEFAULT 0,
	jhje MONEY NOT NULL DEFAULT 0,	
	PRIMARY KEY(id)
)
GO

/******************************
* 销售日报生成
******************************/
if object_id('sp_lsrb') is not null
	DROP PROCEDURE sp_lsrb
GO
CREATE    PROCEDURE sp_lsrb
@rq char(8),
@je decimal(10,2),
@ml DECIMAL(8,4) 
AS

begin tran

declare @hj decimal(10,2)
declare @spbh varchar(20)
declare @id int
declare @shul decimal(10,2)
declare @jine decimal(10,2)
declare @jhj decimal(10,2)

create table #t
(
	id INT IDENTITY(1,1),	
	spbh  varchar(15) null,
	shul  decimal(8,2) default 0 null,
	jine  decimal(8,2) default 0 null,
	jhje   decimal(10,4) default 0 NULL,
	ml DECIMAL(8,6) NULL,
	flag  INT NULL
)

create table #tt
(
	id INT,
	spbh  varchar(15) null,
	shul  decimal(8,2) default 0 null,
	jine  decimal(8,2) default 0 null,
	jhje   decimal(10,4) default 0 NULL,
	ml DECIMAL(8,6) NULL,
	flag INT NULL
)

INSERT INTO #t(spbh,shul,jine,jhje,flag)
select a.spbh, a.SL*b.JS,b.ZDZK/100.0*b.JS*a.sl*a.lsj*a.zk/100.0,a.jhj*a.sl*b.JS,isnull(b.FPHM,'0')
FROM t_lsdmxb a
JOIN t_lsdzb b ON a.lsdbh=b.LSDBH
WHERE convert(char(8),b.rq,112) = @rq 

UPDATE #t SET ml = (jine-jhje)/jine

INSERT INTO #tt(id,spbh,shul,jine,jhje,flag)
SELECT id,spbh,shul,jine,jhje,flag
FROM #t 
WHERE ml <= @ml OR flag = '1'

SELECT @hj = SUM(jine)- @je FROM #tt

IF @hj > 0
BEGIN
	declare cur1 cursor for 
	SELECT spbh,shul,jine,jhje,id
	FROM #tt
	WHERE flag = '0'
	ORDER BY ml DESC
	OPEN cur1	
	
	FETCH NEXT FROM cur1 
	INTO @spbh, @shul,@jine,@jhj,@id

	WHILE @@FETCH_STATUS = 0 and @hj > 0
	BEGIN
		IF @hj > @jine 
		begin
			set @hj=@hj - @jine
			DELETE FROM #tt WHERE id=@id
		END
		
		FETCH NEXT FROM cur1 
		INTO @spbh, @shul,@jine,@jhj,@id
	END

	CLOSE cur1

	DEALLOCATE cur1
END
ELSE IF @hj < 0
BEGIN
	declare cur2 cursor for 
	SELECT a.spbh,a.shul,a.jine,a.jhje,a.id
	FROM #t a
	LEFT JOIN #tt b ON a.id=b.id
	WHERE b.id IS NULL
	ORDER BY a.ml
	OPEN cur2

	FETCH NEXT FROM cur2 
	INTO @spbh, @shul,@jine,@jhj,@id

	WHILE @@FETCH_STATUS = 0 and @hj < 0
	BEGIN
		IF @hj + @je >50
		BEGIN 
			set @hj = @hj + @jine
			insert into #tt(id,spbh,shul,jine,jhje)
			values(@id,@spbh,@shul,@jine,@jhj)
		END
		
		FETCH NEXT FROM cur2 
		INTO @spbh, @shul,@jine,@jhj,@id
	END

	CLOSE cur2

	DEALLOCATE cur2

END	

INSERT INTO t_sw_rbmx(code,spbh,sl,je,jhje)
SELECT @rq,spbh,shul,jine,jhje
FROM #tt

INSERT INTO t_sw_rb(code,je,jhje,flag)
SELECT @rq,SUM(jine),SUM(jhje),0
FROM #tt


commit

GO

INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG, parameter)
VALUES(18,N'销售日报维护',2,5,N'销售日报维护','image\tom_wap.gif','w_lsrb',1,1,0)

INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG, parameter)
VALUES(19,N'零售对账',2,5,N'零售对账','image\tom_wap.gif','w_lscxdz_sw',1,1,0)


INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG, parameter)
VALUES(20,N'零售结账',2,2,N'零售结账','image\tom_wap.gif','w_jz',1,1,0)

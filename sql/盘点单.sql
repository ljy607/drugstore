--盘点单

CREATE TABLE T_PDDZB
(
	PDDBH VARCHAR(13) NOT NULL,
	PDRQ DATETIME NULL,
	DWBH VARCHAR(3) NULL,
	HWBH VARCHAR(8) NULL,
	BZ	NVARCHAR(64) NULL,
	FLAG TINYINT DEFAULT 0 NULL,
	PRIMARY KEY ( PDDBH )	
)
drop table t_pddmxb
CREATE TABLE T_PDDMXB
(
	PDDBH VARCHAR(13) NOT NULL,
	SPBH VARCHAR(32) NOT NULL,
	PCBH VARCHAR(32) NOT NULL,
	KCPCBH varchar(32) null,
	SL DECIMAL(10,2) DEFAULT 0 NULL,
	CHSL DECIMAL(10,2) DEFAULT 0 NULL, 
	YXRQ DATETIME NULL,
	KCYXRQ datetime null,
	BZ  nvarchar(128) null,
	PRIMARY KEY ( PDDBH,SPBH,PCBH )	
)

--存货信息表
CREATE TABLE T_CHXX(
	[HWBH] [varchar](8) NOT NULL,
	[SPBH] [varchar](32) NOT NULL,
	[PCBH] [varchar](32) NOT NULL,
	[CHSL] [decimal](8, 2) NULL,
	[yxrq] DATETIME NULL,
	[jiag] DECIMAL(10,4) DEFAULT 0 NULL,
	[FLAG] [tinyint] default 1 NULL,
	[bz] nvarchar(128) null,
	PRIMARY KEY ( HWBH,SPBH,PCBH )	
)
GO

INSERT INTO T_CHXX(HWBH,SPBH,PCBH,CHSL,FLAG)
SELECT a.HWBH, a.SPBH, a.PCBH, a.CHSL, a.FLAG
FROM T_CHXX_HW a
GO

UPDATE a 
SET yxrq = b.YXRQ
FROM T_CHXX a
JOIN t_chxx_PC b ON b.spbh = a.spbh AND b.pcbh = a.pcbh
GO

alter table t_ckdmxb 
add id int identity(1,1) not null
go

alter table T_LSDMXB 
add jhj decimal(10,4) default 0 null
go

alter table T_LSDMXB 
add bz Nvarchar(128) null
go

alter table T_LSDMXB_LS 
add jhj decimal(10,4) default 0 null
go

INSERT INTO T_FUNCS(	FUNCID,	FUNNM,	FUNTP,	GRPID,	FUNMS,	TPLJ,	FUNFM,	FLAG,	UFLAG)
VALUES(	'09',	N'盘点单录入',	1,	3,	N'盘点单录入',	'image\tom_wap.gif',	'w_pddlr',	1,	1)
GO



declare @sp varchar(32),@pc varchar(32)
declare @rq datetime

--------------------------------------------------------------
-- 更新有效期
--------------------------------------------------------------
declare cur_yxq cursor for 
select distinct spbh,pcbh from t_chxx where yxrq is null

OPEN cur_yxq
	
FETCH NEXT FROM cur_yxq INTO  @sp, @pc

WHILE @@FETCH_STATUS = 0 
begin
	select top 1 @rq = yxrq from t_ckdmxb where spbh = @sp and pcbh = @pc
	if @rq is null or year(@rq) = 1900 
		select top 1 @rq = yxrq from t_dbdmxb where spbh = @sp and pcbh = @pc
		
	update t_chxx
	set yxrq = @rq
	where spbh = @sp and pcbh = @pc
	
	FETCH NEXT FROM cur_yxq into @sp, @pc
end

CLOSE cur_yxq

DEALLOCATE cur_yxq
select * from t_chxx where yxrq is null

-------------------------------------------------------------------------
-- 更新进货价
-------------------------------------------------------------------------
declare cur_jhj cursor for 
select distinct spbh,pcbh from t_chxx where jiag = 0

OPEN cur_jhj	
FETCH NEXT FROM cur_jhj INTO  @sp, @pc

WHILE @@FETCH_STATUS = 0 
begin
	select top 1 @rq = yxrq from t_ckdmxb where spbh = @sp and pcbh = @pc
	if @rq is null or year(@rq) = 1900 
		select top 1 @rq = yxrq from t_dbdmxb where spbh = @sp and pcbh = @pc
		
	update t_chxx
	set yxrq = @rq
	where spbh = @sp and pcbh = @pc
	
	FETCH NEXT FROM cur_jhj into @sp, @pc
end

CLOSE cur_jhj
DEALLOCATE cur_jhj

select * from t_chxx where jiag = 0

-- --------------------------------------------------------------------------
-- 批量更新价格
-- --------------------------------------------------------------------------
SELECT distinct a.spbh,a.pcbh,b.JHJ
INTO #t
FROM t_chxx a
JOIN T_CKDMXB b ON b.SPBH = a.SPBH AND b.PCBH = a.PCBH
WHERE a.jiag = 0 and EXISTS
          (Select COUNT(1)
         FROM T_CKDMXB
           WHERE spbh=b.spbh AND pcbh = b.pcbh and id > b.id
         HAVING COUNT(1) < 1)
ORDER BY a.spbh,a.PCBH

UPDATE a
SET a.jiag = e.jhj
FROM T_CHXX a
JOIN #t e ON e.SPBH = a.SPBH AND e.PCBH = a.PCBH

DROP TABLE #t

SELECT distinct a.spbh,a.pcbh,b.JHJ
INTO #tt
FROM t_chxx a
JOIN hj00.dbo.T_jhDMXB b ON b.SPBH = a.SPBH AND b.PCBH = a.PCBH
WHERE a.jiag = 0 AND EXISTS
          (Select COUNT(1)
         FROM hj00.dbo.T_jhDMXB
           WHERE spbh=b.spbh AND pcbh = b.pcbh and id > b.id
         HAVING COUNT(1) < 1)
ORDER BY a.spbh,a.PCBH

UPDATE a
SET a.jiag = e.jhj
FROM T_CHXX a
JOIN #tt e ON e.SPBH = a.SPBH AND e.PCBH = a.PCBH


DROP TABLE #tt

IF OBJECT_ID('t_xhdmxb') IS NOT NULL
	DROP TABLE t_xhdmxb
GO

IF OBJECT_ID('t_xhdzb') IS NOT NULL
	DROP TABLE t_xhdzb
GO


CREATE TABLE t_xhdzb
(
	xhdbh NVARCHAR(16) NOT NULL,
	xhdw  NVARCHAR(3) NOT NULL,
	xhrq DATETIME NOT NULL,
	zbr  NVARCHAR(3) NOT NULL,
	shr  NVARCHAR(3) NULL,
	zxr  NVARCHAR(3) NULL,
	bz   NVARCHAR(128) NULL,
	yxbz INT NOT NULL DEFAULT 0,
	PRIMARY KEY (xhdbh)
)

CREATE TABLE T_xhdmxb
(
	id INT IDENTITY(1,1) NOT NULL,
	xhdbh NVARCHAR(16) NOT NULL,
	spbh NVARCHAR(32) NOT NULL,
	pcbh NVARCHAR(32) NOT NULL,
	yxrq DATETIME NOT NULL,
	xhsl DECIMAL(16,2) NOT NULL DEFAULT 0,
	jg	DECIMAL(16,2) NOT NULL DEFAULT 0,
	dqcl DECIMAL(16,2) NOT NULL DEFAULT 0,
	hwbh nVARCHAR(8) NOT NULL,
	xhyy NVARCHAR(64) NULL,
	PRIMARY KEY (id)
)

Alter table t_xhdmxb add  foreign key(xhdbh) references t_xhdzb (xhdbh)  on update no action on delete no action 
GO
--商品信息
ALTER TABLE T_SPXX
ADD yhlx SMALLINT DEFAULT 0
GO
UPDATE t_spxx 
SET yhlx = 0
GO
--养护记录
ALTER TABLE T_YHJLMX
ADD CCTJ NVARCHAR(32) NULL
GO
ALTER TABLE T_YHJLMX
ADD BHGSL INT NULL DEFAULT 0
GO
ALTER TABLE T_YHJLMX
ADD YXRQ DATETIME NULL 
GO
ALTER TABLE T_YHJLMX
ADD yhlx SMALLINT NULL 
GO


if object_id('SP_YHJL') is not null
	DROP PROCEDURE SP_YHJL
GO
/******************* 过程说明 *****************************************************************
  生成养护记录
  参数	@dh	养护编号
        @yhr	养护人
  结果	生成养护记录信息
**********************************************************************************************/
CREATE PROCEDURE SP_YHJL @dh char(6),@yhr char(3) AS
begin

if not exists(
select *
from t_yhjlzb
where convert(char(6), yhrq,112) = @dh
)
begin

	insert into t_yhjlzb(yhjlbh,yhrq,yhr,bz)
	values(@dh,getdate(),@yhr,'')
	
	insert into t_yhjlmx(yhjlbh,hwbh,sl,yhsl,jl,bz,CCTJ,bhgsl,yhlx)
	select @dh,hwbh,count(distinct spbh),0,N'合格','',N'符合要求',0,0
	from t_chxx
	group by hwbh
	order by hwbh
	
	update t_yhjlmx
	set yhsl = sl
	where yhjlbh = @dh
	
	INSERT INTO t_yhjlmx(yhjlbh,hwbh,PCBH,sl,yxrq,yhsl,jl,bz,CCTJ,bhgsl,yhlx)
	SELECT @dh,c.spbh,c.PCBH,c.CHSL, c.yxrq,c.CHSL,N'合格','',N'符合要求',0,1
	FROM t_chxx c
	JOIN T_SPXX ts ON c.spbh=ts.spbh
	WHERE ts.yhlx <> 0
end

end 

GO

IF OBJECT_ID('t_GongGao') IS NOT NULL
	DROP TABLE t_GongGao
GO

CREATE TABLE t_GongGao
(
	ggid INT NOT NULL,
	Title  NVARCHAR(32) NOT NULL,
	RQ DATETIME NOT NULL,
	zbr  NVARCHAR(3) NOT NULL,
	shr  NVARCHAR(3) NULL,
	ydr	NVARCHAR(3) NULL,
	ydsj DATETIME NULL,
	ggnr TEXT NOT NULL,
	yxbz INT NOT NULL DEFAULT 0,
	PRIMARY KEY (ggid)
)
GO

--质量信息反馈单
IF OBJECT_ID('T_ZLXXFK') IS NOT NULL
	DROP TABLE T_ZLXXFK
GO

CREATE TABLE T_ZLXXFK
(
	ZLXXFKID INT IDENTITY(1,1) NOT NULL,
	Title  NVARCHAR(32) NOT NULL,
	RQ DATETIME NOT NULL,
	dwbh NVARCHAR(3) NOT NULL,
	zbr  NVARCHAR(3) NOT NULL,
	shr  NVARCHAR(3) NULL,
	ydr	NVARCHAR(3) NULL,
	zlxx TEXT NOT NULL,
	yxbz INT NOT NULL DEFAULT 0,
	PRIMARY KEY (ZLXXFKID)
)
GO


INSERT INTO [T_FUNCS]([FUNCID], [FUNNM], [FUNTP], [GRPID], [FUNMS], [TPLJ], [FUNFM], [FLAG], [UFLAG])
VALUES(19, N'不合格商品销毁', 1, 0, N'不合格商品销毁', 'image\tom_wap.gif', 'w_xhdlr', 1, 1)

INSERT INTO [T_FUNCS]([FUNCID], [FUNNM], [FUNTP], [GRPID], [FUNMS], [TPLJ], [FUNFM], [FLAG], [UFLAG])
VALUES(20, N'公告', 1, 0, N'公告', 'image\tom_wap.gif', 'w_gonggao', 1, 1)

INSERT INTO [T_FUNCS]([FUNCID], [FUNNM], [FUNTP], [GRPID], [FUNMS], [TPLJ], [FUNFM], [FLAG], [UFLAG])
VALUES(21, N'质量信息反馈', 1, 0, N'质量信息反馈', 'image\tom_wap.gif', 'w_zlxxfk', 1, 1)

----连接公司执行
--INSERT INTO [T_FUNCS]([FUNCID], [FUNNM], [FUNTP], [GRPID], [FUNMS], [TPLJ], [FUNFM], [FLAG], [UFLAG])
--VALUES('05', N'审核销毁单', 2, 2, N'审核销毁单', 'image\tom_wap.gif', 'w_xhdsh', 1, 1)

--INSERT INTO [T_FUNCS]([FUNCID], [FUNNM], [FUNTP], [GRPID], [FUNMS], [TPLJ], [FUNFM], [FLAG], [UFLAG])
--VALUES(20, N'首营商品查询', 1, 0, N'首营商品查询', 'image\tom_wap.gif', 'w_syspxx', 1, 1)

--INSERT INTO [T_FUNCS]([FUNCID], [FUNNM], [FUNTP], [GRPID], [FUNMS], [TPLJ], [FUNFM], [FLAG], [UFLAG])
--VALUES(21, N'公告', 1, 0, N'公告', 'image\tom_wap.gif', 'w_gonggao', 1, 1)
--INSERT INTO [T_FUNCS]([FUNCID], [FUNNM], [FUNTP], [GRPID], [FUNMS], [TPLJ], [FUNFM], [FLAG], [UFLAG])
--VALUES(22, N'质量信息反馈', 1, 0, N'质量信息反馈', 'image\tom_wap.gif', 'w_zlxxfk', 1, 1)


--ALTER TABLE t_gysxx
--ADD SFSYQY TINYINT NULL DEFAULT 0
--GO
--UPDATE t_gysxx 
--SET sfsyqy=0
--GO

--IF OBJECT_ID('t_GongGaoDW') IS NOT NULL
--	DROP TABLE t_GongGaoDW
--GO
--IF OBJECT_ID('t_GongGao') IS NOT NULL
--	DROP TABLE t_GongGao
--GO

--CREATE TABLE t_GongGao
--(
--	ggid INT IDENTITY(1,1) NOT NULL,
--	Title  NVARCHAR(32) NOT NULL,
--	RQ DATETIME NOT NULL,
--	zbr  NVARCHAR(3) NOT NULL,
--	shr  NVARCHAR(3) NULL,
--	ydr	NVARCHAR(3) NULL,
--	ggnr TEXT NOT NULL,
--	yxbz INT NOT NULL DEFAULT 0,
--	PRIMARY KEY (ggid)
--)
--GO


--CREATE TABLE t_GongGaoDW
--(
--	ggdwid INT IDENTITY(1,1) NOT NULL,
--	ggid INT NOT NULL,
--	dwbh  NVARCHAR(3) NOT NULL,
--	ydsj DATETIME NULL,
--	ydr  NVARCHAR(3) NULL,
--	ggflag TINYINT NULL DEFAULT 0,
--	PRIMARY KEY (ggdwid)
--)
--GO

--Alter table t_GongGaoDW add  foreign key(ggid) references t_GongGao (ggid)  on update no action on delete no action 
--GO

--质量信息反馈单
--IF OBJECT_ID('T_ZLXXFK') IS NOT NULL
--	DROP TABLE T_ZLXXFK
--GO

--CREATE TABLE T_ZLXXFK
--(
--	ZLXXFKID INT NOT NULL,
--	Title  NVARCHAR(32) NOT NULL,
--	RQ DATETIME NOT NULL,
--	dwbh NVARCHAR(3) NOT NULL,
--	zbr  NVARCHAR(3) NOT NULL,
--	shr  NVARCHAR(3) NULL,
--	ydr	NVARCHAR(3) NULL,
--	zlxx TEXT NOT NULL,
--	yxbz INT NOT NULL DEFAULT 0,
--	PRIMARY KEY (ZLXXFKID)
--)
--GO






--SELECT * FROM t_funcs WHERE FUNTP=1

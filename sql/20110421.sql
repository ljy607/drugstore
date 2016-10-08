
--反药商品
DROP TABLE T_YPZT
GO

CREATE TABLE T_YPZT
(
	BH int identity(1,1) NOT NULL,
	MC NVARCHAR(30) NOT NULL,
	BZ NVARCHAR(64) NULL,
	GXRQ  DATETIME null default getdate(),
	GXZ   CHAR(3) NULL, 
	PRIMARY KEY ( BH )	
)

alter table t_spxx
add ypztbh int null

--单独总店运行--------------------------------------------------------------
if object_id('V_SPXX_QTCX') is not null
	drop view V_SPXX_QTCX
go
create VIEW V_SPXX_QTCX 
(SPBH,PM,LBBH,GG,JLDW,JC,SB,SCCJ,LSJ,PFJ,GBJ,hyj,ZDJJ,FLAG,PZWH,ypztbh,ypztmc) 
AS SELECT T_SPXX.SPBH, T_SPXX.PM, T_SPXX.LBBH, T_SPXX.GG, T_JLDW.JLDW, 
 T_SPXX.JC, T_SPXX.SB, T_SCCJ.JC AS SCCJ, T_JGXX.LSJ, T_JGXX.PFJ, 
 T_JGXX.GBJ, t_jgxx.hyj, T_JGXX.ZDJJ, T_SPXX.FLAG, T_SPXX.PZWH,t_spxx.ypztbh,t_ypzt.mc
FROM dbo.T_SPXX 
LEFT OUTER JOIN dbo.T_JLDW ON dbo.T_SPXX.JLDWBH = dbo.T_JLDW.JLDWBH 
LEFT OUTER JOIN dbo.T_SCCJ ON dbo.T_SPXX.CJBH = dbo.T_SCCJ.CJBH 
LEFT OUTER JOIN dbo.T_JGXX ON dbo.T_SPXX.SPBH = dbo.T_JGXX.SPBH
left outer join dbo.t_ypzt on dbo.t_spxx.ypztbh = dbo.t_ypzt.bh

GO
---------------------------------------------------------------------------




--单独分店运行---------------------------------------------------------------
alter table t_spxx
add lb varchar(20) null,jky tinyint null,jgzt nvarchar(8) null 

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[V_SPXX_QTCX]') and OBJECTPROPERTY(id, N'IsView') = 1)
	drop view [dbo].[V_SPXX_QTCX]
GO
--商品信息前台查询用
CREATE VIEW dbo.V_SPXX_QTCX
AS
SELECT dbo.T_SPXX.SPBH, dbo.T_SPXX.PM, dbo.T_SPXX.LBBH, dbo.T_SPXX.GG, 
      dbo.T_JLDW.JLDW, dbo.T_SPXX.JC, dbo.T_SPXX.SB, dbo.T_SCCJ.JC AS SCCJ, 
      dbo.T_JGXX.LSJ, dbo.T_JGXX.DBJ, dbo.T_JGXX.PFJ, dbo.T_JGXX.GBJ, 
      dbo.T_JGXX.ZK, dbo.T_SPXX.PZWH, dbo.T_JGXX.hyj,dbo.t_spxx.ypztbh,dbo.t_ypzt.mc as ypztmc
FROM dbo.T_SPXX LEFT OUTER JOIN
      dbo.T_JLDW ON dbo.T_SPXX.JLDWBH = dbo.T_JLDW.JLDWBH LEFT OUTER JOIN
      dbo.T_SCCJ ON dbo.T_SPXX.CJBH = dbo.T_SCCJ.CJBH LEFT OUTER JOIN
      dbo.T_JGXX ON dbo.T_SPXX.SPBH = dbo.T_JGXX.SPBH left outer join
      dbo.t_ypzt on dbo.t_spxx.ypztbh = dbo.t_ypzt.bh

GO


INSERT INTO T_FUNCS(	FUNCID,	FUNNM,	FUNTP,	GRPID,	FUNMS,	TPLJ,	FUNFM,	FLAG,	UFLAG)
VALUES(	'13',	N'提奖药品',	3,	0,	N'提奖药品',	'image\tom_wap.gif',	'w_tjyp',	1,	1)
GO
--------------------------------------------------------------------------------



INSERT INTO T_FUNCS(	FUNCID,	FUNNM,	FUNTP,	GRPID,	FUNMS,	TPLJ,	FUNFM,	FLAG,	UFLAG)
VALUES(	'14',	N'药品状态',	6,	0,	N'药品状态',	'image\tom_wap.gif',	'w_ypzt',	1,	1)
GO

DROP TABLE T_TJSP
--提奖商品
CREATE TABLE T_TJSP
(
	SPBH NVARCHAR(30) NOT NULL,
	TJJE DECIMAL(10,4) NULL DEFAULT 0,
	BZ NVARCHAR(64) NULL,
	GXRQ  DATETIME null default getdate(),
	GXZ   CHAR(3) NULL, 
	PRIMARY KEY ( SPBH )	
)

INSERT INTO T_FUNCS(	FUNCID,	FUNNM,	FUNTP,	GRPID,	FUNMS,	TPLJ,	FUNFM,	FLAG,	UFLAG)
VALUES(	'15',	N'提奖药品',	6,	0,	N'提奖药品',	'image\tom_wap.gif',	'w_tjyp',	1,	1)
GO


INSERT INTO T_FUNCS(	FUNCID,	FUNNM,	FUNTP,	GRPID,	FUNMS,	TPLJ,	FUNFM,	FLAG,	UFLAG)
VALUES(	'15',	N'零售提奖查询',	2,	2,	N'零售提奖查询',	'image\tom_wap.gif',	'w_tjsptj',	1,	1)
GO
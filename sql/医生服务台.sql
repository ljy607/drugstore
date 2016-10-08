--品信息前台查询用
ALTER VIEW [dbo].[V_SPXX_QTCX]
AS
SELECT dbo.T_SPXX.SPBH, dbo.T_SPXX.PM, dbo.T_SPXX.LBBH, dbo.T_SPXX.GG, 
      dbo.T_JLDW.JLDW, dbo.T_SPXX.JC, dbo.T_SPXX.SB, dbo.T_SCCJ.jc AS SCCJ, 
      dbo.T_JGXX.LSJ, dbo.T_JGXX.DBJ, dbo.T_JGXX.PFJ, dbo.T_JGXX.GBJ, 
      dbo.T_JGXX.ZK, dbo.T_SPXX.PZWH, dbo.T_JGXX.hyj,dbo.t_spxx.ypztbh,dbo.t_ypzt.mc as ypztmc,t_spxx.ypfl,t_spxx.jfbz
FROM dbo.T_SPXX LEFT OUTER JOIN
      dbo.T_JLDW ON dbo.T_SPXX.JLDWBH = dbo.T_JLDW.JLDWBH LEFT OUTER JOIN
      dbo.T_SCCJ ON dbo.T_SPXX.CJBH = dbo.T_SCCJ.CJBH LEFT OUTER JOIN
      dbo.T_JGXX ON dbo.T_SPXX.SPBH = dbo.T_JGXX.SPBH left outer join
      dbo.t_ypzt on dbo.t_spxx.ypztbh = dbo.t_ypzt.bh
GO

ALTER TABLE T_LSDZB_LS
ADD cfid NVARCHAR(11) NULL
GO

if object_id('SP_GETSPXX_YP') is NOT NULL 
	DROP PROCEDURE SP_GETSPXX_YP
GO
--模糊查找商品的工具-------------------------------------------------------------
CREATE PROCEDURE SP_GETSPXX_YP @spbh varchar(16) AS
	SELECT  T_SPXX.SPBH, T_SPXX.PM,T_SPXX.GG, T_JLDW.JLDW, T_SPXX.JC, T_SCCJ.JC as SCCJ,T_JGXX.LSJ, T_JGXX.PFJ, T_JGXX.GBJ,T_JGXX.zk
	FROM T_SPXX LEFT OUTER JOIN
		  T_JLDW ON T_SPXX.JLDWBH = T_JLDW.JLDWBH LEFT OUTER JOIN
		  T_SCCJ ON T_SPXX.CJBH = T_SCCJ.CJBH LEFT OUTER JOIN
		  T_JGXX ON T_SPXX.SPBH = T_JGXX.SPBH
	WHERE t_spxx.ypfl = '07' and (T_SPXX.SPBH like '%' + @spbh + '%' OR T_SPXX.PM like '%' + @spbh + '%' OR T_SPXX.JC like '%' + @spbh + '%')
	order by t_spxx.spbh

GO


if object_id('t_ysxx') is not null
	DROP TABLE t_ysxx
GO
-------医生信息
CREATE TABLE t_ysxx
(
	id INT IDENTITY(1,1) NOT NULL,
	zgbh NVARCHAR(16) NOT NULL,	--职工编号，来源于T_ZGXX表
	ghf	INT NULL DEFAULT 0,		--挂号费
	memo NVARCHAR(64) NULL,
	flag TINYINT NOT NULL DEFAULT 0,
	PRIMARY KEY(id)
)
GO

if object_id('t_ys_hzxx') is not null
	DROP TABLE t_ys_hzxx
GO
------患者信息
CREATE TABLE t_ys_hzxx
(
	hzid NVARCHAR(16) NOT NULL,
	hzxm NVARCHAR(16) NOT NULL,		--姓名
	hzxb NVARCHAR(8) NULL,	--性别
	nl	INT NOT NULL,	--年龄
	dh NVARCHAR(16) NULL,					--电话
	dz   NVARCHAR(32) NULL,			--地址
	rq DATETIME NOT NULL DEFAULT GETDATE(),      			
	gxrq DATETIME NOT NULL DEFAULT GETDATE(),
	PRIMARY KEY(hzid)                            	
)
GO
if object_id('t_ys_cf') is not null
	DROP TABLE t_ys_cf
GO
-----处方信息
CREATE TABLE t_ys_cf
(
	cfid NVARCHAR(11) NOT NULL,
	hzid INT NOT NULL,		--患者编号
	bqms NVARCHAR(512) NULL,  --病情描述
	rq DATETIME NOT NULL DEFAULT GETDATE(),  --            		
	js INT NOT NULL DEFAULT 1,	--中药剂数
	ysid NVARCHAR(8) NOT NULL,	--医生编号
	memo NVARCHAR(128) NULL,
	flag TINYINT NOT NULL DEFAULT 0,
	cflx TINYINT NOT NULL DEFAULT 1, --处方类型 1、内方 2、外方
	hjdbh NVARCHAR(16) NULL,
	lsdbh NVARCHAR(16) NULL,
	PRIMARY KEY (cfid)
)
GO
if object_id('t_ys_cfmx') is not null
	DROP TABLE t_ys_cfmx
GO
--处方明细
CREATE TABLE t_ys_cfmx
(
	id INT IDENTITY(1,1) NOT NULL,
	cfid NVARCHAR(11) NOT NULL,		--处方编号
	spbh NVARCHAR(16) NOT NULL, 
	pcbh NVARCHAR(32) NOT NULL,
	sl	INT NOT NULL,
	memo NVARCHAR(32) NULL,
	PRIMARY KEY(id)                 		
)
GO


INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG, parameter)
VALUES(25,N'中医处方管理',1,5,N'中医处方管理','image\tom_wap.gif','w_ysgzt',1,1,0)

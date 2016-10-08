--------------------------------------------------
--一次性执行
INSERT INTO T_Options(	ID,	OptionID,Name)
VALUES(	15,4,N'进货入库明细表')
INSERT INTO T_Options(	ID,	OptionID,Name)
VALUES(	16,4,N'要货计划明细表')
INSERT INTO T_Options(	ID,	OptionID,Name)
VALUES(	17,4,N'变价明细表')
INSERT INTO T_Options(	ID,	OptionID,Name)
VALUES(	18,4,N'调拨明细表')
INSERT INTO T_Options(	ID,	OptionID,Name)
VALUES(	22,4,N'损益明细表')
INSERT INTO T_Options(	ID,	OptionID,Name)
VALUES(	23,4,N'出库明细表')
INSERT INTO T_Options(	ID,	OptionID,Name)
VALUES(	24,4,N'退库明细表')
INSERT INTO T_Options(	ID,	OptionID,Name)
VALUES(	80,4,N'不合格药品明细表')
GO

SELECT *
INTO t_options_old
FROM t_options to1
GO
DROP TABLE t_options
GO
CREATE TABLE t_options
(
	id int IDENTITY(1,1) NOT NULL,
	pid INT DEFAULT 0 NOT NULL,
	code NVARCHAR(8) NOT NULL,
	name NVARCHAR(16) NOT NULL,
	note NVARCHAR(32) NULL,
	sort INT NULL DEFAULT 0,
	PRIMARY KEY(id)
)
GO

dbcc checkident(t_options,reseed,100)
GO

SET IDENTITY_INSERT t_options ON 
INSERT INTO t_options(id,pid,code,NAME,note)
VALUES(1,0,'djlb',N'单据类别',N'单据类别，用于拆分出库单')
INSERT INTO t_options(id,pid,code,NAME,note)
VALUES(2,0,'yplb',N'药品类别',N'药品类别')
INSERT INTO t_options(id,pid,code,NAME,note)
VALUES(3,0,'GSP',N'gsp报表',N'gsp报表标题')
INSERT INTO t_options(id,pid,code,NAME,note)
VALUES(4,0,'dj',N'单据',N'单据标题')
SET IDENTITY_INSERT t_options OFF
 
INSERT INTO t_options(pid,code,name,note)
SELECT optionid,id,NAME,name
FROM t_options_old

DROP TABLE t_options_old
GO

INSERT INTO T_Options(CODE,pID,Name)
VALUES(	11,4,N'退货到供应商明细表')
INSERT INTO T_Options(CODE,pID,Name)
VALUES(	33,4,N'分店要货计划明细表')

--一次性执行结束---------------------------------------------

ALTER VIEW [dbo].[V_SPXX]
AS
SELECT dbo.T_SPXX.SPBH, dbo.T_SPXX.LBBH, dbo.T_SPXX.SBBZ, dbo.T_SPXX.XQBJ, dbo.T_SPXX.TZM, dbo.T_SPXX.PM, dbo.T_SPXX.JC, dbo.T_SPXX.SB, 
dbo.T_SPXX.PZWH, dbo.T_SPXX.GG, dbo.T_SPXX.JLDWBH, dbo.T_SPXX.CJBH, dbo.T_SPXX.YXQX, dbo.T_SPXX.ZDJL, dbo.T_SPXX.BZ, dbo.T_SPXX.GXRQ, 
dbo.T_SPXX.GXZ, dbo.T_SPXX.FLAG, dbo.T_SPXX.YHBZ, dbo.T_SPXX.JX, dbo.T_SPXX.GMP, dbo.T_SPXX.GB, dbo.T_SPXX.CD, dbo.T_SPXX.yplb, dbo.T_SPXX.hxmc, 
dbo.T_SPXX.lb, dbo.T_SPXX.jky, dbo.T_SPXX.jgzt, dbo.T_SPXX.ypztbh, dbo.T_SPXX.jfbz, dbo.T_SPXX.yhlx, dbo.T_SPXX.IsMHJ, dbo.T_SPXX.cctj, dbo.T_SPLB.SPLB, 
dbo.T_JLDW.JLDW, dbo.T_SCCJ.JC AS CJJC, dbo.T_SCCJ.CJMC, dbo.T_JX.MC AS jxmc, dbo.T_YPZT.MC AS ypztmc,dbo.t_spxx.ypfl,dbo.t_options.Name AS YPFLMC
FROM         dbo.T_SCCJ RIGHT OUTER JOIN
dbo.T_SPXX ON dbo.T_SCCJ.CJBH = dbo.T_SPXX.CJBH LEFT OUTER JOIN
dbo.T_SPLB ON dbo.T_SPXX.LBBH = dbo.T_SPLB.SPLBBH LEFT OUTER JOIN
dbo.T_JLDW ON dbo.T_SPXX.JLDWBH = dbo.T_JLDW.JLDWBH LEFT OUTER JOIN
dbo.T_JX ON dbo.T_SPXX.JX = dbo.T_JX.ID LEFT OUTER JOIN
dbo.T_YPZT ON dbo.T_SPXX.ypztbh = dbo.T_YPZT.BH LEFT OUTER JOIN 
dbo.t_options ON dbo.t_options.code = dbo.t_spxx.ypfl AND dbo.t_options.pid = 2

GO

UPDATE a
SET a.flag = 0
FROM t_funcs a
WHERE a.FUNNM='更改商品存放库位'
GO


ALTER TABLE T_YHJLMX
ADD hw VARCHAR(8) NULL
GO
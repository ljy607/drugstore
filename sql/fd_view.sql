--品信息前台查询用
if object_id('V_SPXX_QTCX') is not null
	drop VIEW V_SPXX_QTCX
GO
CREATE VIEW V_SPXX_QTCX
AS
SELECT dbo.T_SPXX.SPBH, dbo.T_SPXX.PM, dbo.T_SPXX.LBBH, dbo.T_SPXX.GG, 
      dbo.T_JLDW.JLDW, dbo.T_SPXX.JC, dbo.T_SPXX.SB, dbo.T_SCCJ.jc AS SCCJ, 
      dbo.T_JGXX.LSJ, dbo.T_JGXX.DBJ, dbo.T_JGXX.PFJ, dbo.T_JGXX.GBJ, 
      dbo.T_JGXX.ZK, dbo.T_SPXX.PZWH, dbo.T_JGXX.hyj,dbo.t_spxx.ypztbh,dbo.t_ypzt.mc as ypztmc,
      t_spxx.ypfl,t_spxx.jfbz,t_spxx.hxmc,t_splb.SPLB AS splb,t_spxx.ybbm,t_spxx.FLAG,t_spxx.scqyxkzh,t_spxx.MarketBy
FROM dbo.T_SPXX LEFT OUTER JOIN
      dbo.T_JLDW ON dbo.T_SPXX.JLDWBH = dbo.T_JLDW.JLDWBH LEFT OUTER JOIN
      dbo.T_SCCJ ON dbo.T_SPXX.CJBH = dbo.T_SCCJ.CJBH LEFT OUTER JOIN
      dbo.T_JGXX ON dbo.T_SPXX.SPBH = dbo.T_JGXX.SPBH left outer join
      dbo.t_ypzt on dbo.t_spxx.ypztbh = dbo.t_ypzt.bh LEFT OUTER JOIN 
      t_splb ON t_spxx.lbbh = t_splb.SPLBBH  

GO


---- 商品编码类型 2024年11月4日 14:34:07
alter VIEW [dbo].[V_SPXX]
AS
SELECT dbo.T_SPXX.SPBH, dbo.T_SPXX.LBBH, dbo.T_SPXX.SBBZ, dbo.T_SPXX.XQBJ, dbo.T_SPXX.TZM, dbo.T_SPXX.PM, dbo.T_SPXX.JC, dbo.T_SPXX.SB, 
dbo.T_SPXX.PZWH, dbo.T_SPXX.GG, dbo.T_SPXX.JLDWBH, dbo.T_SPXX.CJBH, dbo.T_SPXX.YXQX, dbo.T_SPXX.ZDJL, dbo.T_SPXX.BZ, dbo.T_SPXX.GXRQ, 
dbo.T_SPXX.GXZ, dbo.T_SPXX.FLAG, dbo.T_SPXX.YHBZ, dbo.T_SPXX.JX, dbo.T_SPXX.GMP, dbo.T_SPXX.GB, dbo.T_SPXX.CD, dbo.T_SPXX.yplb, dbo.T_SPXX.hxmc, 
dbo.T_SPXX.lb, dbo.T_SPXX.jky, dbo.T_SPXX.jgzt, dbo.T_SPXX.ypztbh, dbo.T_SPXX.jfbz, dbo.T_SPXX.yhlx, dbo.T_SPXX.IsMHJ, dbo.T_SPXX.cctj, dbo.T_SPLB.SPLB, 
dbo.T_JLDW.JLDW, dbo.T_SCCJ.jc AS CJJC, dbo.T_SCCJ.CJMC, dbo.T_JX.MC AS jxmc, dbo.T_YPZT.MC AS ypztmc,dbo.t_spxx.ypfl,dbo.t_options.Name AS YPFLMC,
CASE isnull(T_SPXX.hxmc,'') WHEN '' THEN T_SPXX.pm ELSE T_SPXX.hxmc END AS xspm,t_spxx.spbm AS spbm,t_spxx.ybbm,t_spxx.pzwhyxq,t_spxx.sxyxq,
t_spxx.scqyxkzh,t_spxx.MarketBy,t_spxx.spbmlx
FROM         dbo.T_SCCJ RIGHT OUTER JOIN
dbo.T_SPXX ON dbo.T_SCCJ.CJBH = dbo.T_SPXX.CJBH LEFT OUTER JOIN
dbo.T_SPLB ON dbo.T_SPXX.LBBH = dbo.T_SPLB.SPLBBH LEFT OUTER JOIN
dbo.T_JLDW ON dbo.T_SPXX.JLDWBH = dbo.T_JLDW.JLDWBH LEFT OUTER JOIN
dbo.T_JX ON dbo.T_SPXX.JX = dbo.T_JX.ID LEFT OUTER JOIN
dbo.T_YPZT ON dbo.T_SPXX.ypztbh = dbo.T_YPZT.BH LEFT OUTER JOIN 
dbo.t_options ON dbo.t_options.code = dbo.t_spxx.ypfl AND dbo.t_options.pid = 2


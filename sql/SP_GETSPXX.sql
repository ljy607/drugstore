-- 17、18 未执行 2022年12月9日 20:09:16
--模糊查找商品的工具-------------------------------------------------------------
ALTER PROCEDURE [dbo].[SP_GETSPXX] @spbh varchar(16) AS
	SELECT  T_SPXX.SPBH, T_SPXX.PM,T_SPXX.GG, T_JLDW.JLDW, T_SPXX.JC, T_SCCJ.JC as SCCJ,T_JGXX.LSJ, T_JGXX.PFJ, T_JGXX.GBJ,T_JGXX.zk
	FROM T_SPXX LEFT OUTER JOIN
		  T_JLDW ON T_SPXX.JLDWBH = T_JLDW.JLDWBH LEFT OUTER JOIN
		  T_SCCJ ON T_SPXX.CJBH = T_SCCJ.CJBH LEFT OUTER JOIN
		  T_JGXX ON T_SPXX.SPBH = T_JGXX.SPBH
	WHERE (t_spxx.spbm = @spbh or T_SPXX.SPBH like '%' + @spbh + '%' OR T_SPXX.PM like '%' + @spbh + '%' OR T_SPXX.JC like '%' + @spbh + '%')
	order by t_spxx.spbh

GO



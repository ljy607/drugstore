USE [hj06]
GO

/****** Object:  StoredProcedure [dbo].[sp_chcx_ypzt]    Script Date: 06/23/2026 13:22:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


--获取存货，按照药品状态--------------------------------------------
ALTER PROCEDURE [dbo].[sp_chcx_ypzt]  @ypzt  INT AS
begin
	select a.spbh,a.pcbh,a.chsl,a.jiag,a.hwbh,b.ypztbh,c.lsj,d.ckrq,DATEDIFF(day, d.ckrq, getdate()) as num
	from  T_CHXX a
	join v_spxx b on a.spbh = b.spbh
	join t_jgxx c on a.spbh = c.spbh
	left join (
		select e.spbh,e2.ckrq
		from t_chxx e
		join (	select a.spbh
			from t_chxx a
			join t_ckdmxb b on a.spbh = b.spbh
			group by a.spbh
			having(count(a.spbh)) =1
		) e3 on e.spbh = e3.spbh
		join t_ckdmxb e1 on e3.spbh = e1.spbh
		join t_ckdzb e2 on e1.ckdbh = e2.ckdbh
	) d on a.spbh = d.spbh
	where b.ypztbh = @ypzt AND a.chsl > 0
	order by a.spbh,a.pcbh
end


GO



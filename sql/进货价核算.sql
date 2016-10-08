
if object_id('SP_MLHS') is not null
	DROP PROCEDURE SP_MLHS
GO

create PROCEDURE SP_MLHS @sdw varchar(3),@yf varchar(6),@splb varchar(2) AS
begin


	create table #t
	(
	fgsbh varchar(3),
	spbh varchar(16),
	pcbh varchar(32),
	sl decimal(14,2) null,
	jhj decimal(14,4)  null,
	lsj decimal(14,4)  null,
	lsml decimal(10,2) null,
	jhjhs decimal(14,4) null,
	jine decimal(14,2) null,
	lsmlhs decimal(10,2) null
	)
	
	if( @splb <> '') 
		begin
		insert into #t(fgsbh,spbh,pcbh,jhj,lsj,sl,jine)
		select a.fgsbh, a.spbh,a.pcbh,a.jhj, a.jine/shul as lsj,a.shul,a.jine
		from t_lshzb a
		join t_spxx b on b.spbh = a.spbh and b.lbbh = @splb
		where a.fgsbh = @sdw and convert(char(6),a.lsrq,112) = @yf
		end
	else
		begin
		insert into #t(fgsbh,spbh,pcbh,jhj,lsj,sl,jine)
		select a.fgsbh, a.spbh,a.pcbh,a.jhj, a.jine/shul as lsj,a.shul,a.jine
		from t_lshzb a
		where a.fgsbh = @sdw and convert(char(6),a.lsrq,112) = @yf
		end
	
		
	update #t
	set lsml = (lsj - jhj)/ jhj
	where isnull(jhj,0)>0	
	
	
	update #t
	set #t.jhjhs = #t.jhj + (#t.lsj - #t.jhj) * isnull(b.jslr,0)
	--select *
	from #t 
	left join T_MLFB b on #t.lsml > b.mls and #t.lsml <= b.mlx

	--select * from #t where isnull(jhjhs,0) = 0

	update #t
	set lsmlhs = (lsj-jhjhs)/jhjhs
	where isnull(jhjhs,0) >0
	
	select b.pm,b.gg,b.cjmc,a.*
	from #t a
	join v_spxx b on a.spbh = b.spbh
	order by a.spbh
	
	--select sum(sl * jhjhs),sum(jine) from #t
	
	
	drop table #t
end





if object_id('SP_MLHS_MLZB') is not null
	DROP PROCEDURE SP_MLHS_MLZB
GO

create PROCEDURE SP_MLHS_MLZB @sdw varchar(3),@yf varchar(6) AS
begin


	create table #t
	(
	spbh varchar(16),
	pcbh varchar(32),
	sl decimal(14,2) null,
	jhj decimal(14,4)  null,
	lsj decimal(14,4)  null,
	lsml decimal(10,2) null,
	jine decimal(18,2) null
	)
	
	insert into #t(spbh,pcbh,jhj,lsj,sl,jine)
	select a.spbh,a.pcbh,a.jhj, a.jine/a.shul as lsj,a.shul,a.jine
	from t_lshzb a
	where a.fgsbh = @sdw and convert(char(6),a.lsrq,112) = @yf
	
	update #t
	set lsml = (lsj - jhj)/ jhj
	where isnull(jhj,0)>0
	
	
	--计算毛利占比
	declare @lshj decimal(14,2)
	select @lshj = sum(jine) from #t
	
	select b.mls,b.mlx,sum(jine)/@lshj mlzb,sum(jine) jexj
	from #t a 
	left join T_MLFB b on a.lsml > b.mls and a.lsml <= b.mlx
	group by  b.mls,b.mlx
	order by b.mls
	
	drop table #t
end




/******************************************************
创建毛利比率分配表

if object_id('T_MLFB') is not null
	DROP table T_MLFB
GO

create table T_MLFB
(
MLFBID int identity(1,1) not null,
MLS decimal(10,2) null,
MLX decimal(10,2) null,
JSLR decimal(18,2) null
)

insert into T_MLFB(mls,mlx,jslr)values(0.05, 0.1, 0.05)
insert into T_MLFB(mls,mlx,jslr)values(0.1, 0.2, 0.1)
insert into T_MLFB(mls,mlx,jslr)values(0.2, 0.4, 0.2)
insert into T_MLFB(mls,mlx,jslr)values(0.4, 0.7, 0.35)
insert into T_MLFB(mls,mlx,jslr)values(0.7, 1, 0.55)
insert into T_MLFB(mls,mlx,jslr)values(1, 1.5, 0.7)
insert into T_MLFB(mls,mlx,jslr)values(1.5, 2, 0.6)
insert into T_MLFB(mls,mlx,jslr)values(2, 2.5, 0.55)
insert into T_MLFB(mls,mlx,jslr)values(2.5, 3, 0.5)
insert into T_MLFB(mls,mlx,jslr)values(3, 5, 0.3)
insert into T_MLFB(mls,mlx,jslr)values(5, 7, 0.35)
insert into T_MLFB(mls,mlx,jslr)values(7, 10, 0.45)
insert into T_MLFB(mls,mlx,jslr)values(10, 99999999, 0.6)

**************************************************************/




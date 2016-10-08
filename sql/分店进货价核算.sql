
/*********************************************
*功能：核算毛利
**********************************************/
if object_id('SP_MLHS') is not null
	DROP PROCEDURE SP_MLHS
GO

create PROCEDURE SP_MLHS @yf varchar(6),@splb varchar(2),@spzt varchar(1),@yyybh varchar(3) AS
begin


	create table #t
	(
	spbh varchar(16),
	pcbh varchar(32),
	sl decimal(14,2) null,
	jhj decimal(14,4)  null,
	lsj decimal(14,4)  null,
	lsml decimal(10,2) null,
	jhjhs decimal(14,4) null,
	jine decimal(14,2) null,
	lsmlhs decimal(10,2) null,
	yyybh varchar(3) null
	)
	
	if( @splb <> '') 
		begin
		insert into #t(spbh,pcbh,jhj,lsj,sl,jine,yyybh)
		select a.spbh,a.pcbh,a.jhj, round(a.lsj * a.zk * c.zdzk / 10000.0,2) as lsj,a.sl,round(c.js * a.sl * a.lsj * a.zk * c.zdzk / 10000.0 ,2) as jine,a.yyybh
		from t_lsdmxb a
		join t_lsdzb c on c.lsdbh = a.lsdbh
		join t_spxx b on b.spbh = a.spbh and b.lbbh = @splb
		where convert(char(6),c.rq,112) = @yf
		end
	else
		begin
		insert into #t(spbh,pcbh,jhj,lsj,sl,jine,yyybh)
		select a.spbh,a.pcbh,a.jhj, round(a.lsj * a.zk * c.zdzk / 10000.0,2) as lsj,a.sl,round(c.js * a.sl * a.lsj * a.zk * c.zdzk / 10000.0 ,2) as jine,a.yyybh
		from t_lsdmxb a
		join t_lsdzb c on c.lsdbh = a.lsdbh
		where convert(char(6),c.rq,112) = @yf
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
	
	if (@spzt <> '' and @yyybh <> '')
		select b.pm,b.gg,b.cjmc,a.*,c.nametext as spzt
		from #t a
		join v_spxx b on a.spbh = b.spbh
		left join t_lslrl c on lsmlhs between c.sx and c.xx
		where c.NameText = @spzt and a.yyybh = @yyybh
		order by a.spbh
	else if (@spzt = '' and @yyybh <> '')
		select b.pm,b.gg,b.cjmc,a.*,c.nametext as spzt
		from #t a
		join v_spxx b on a.spbh = b.spbh
		left join t_lslrl c on lsmlhs between c.sx and c.xx
		where a.yyybh = @yyybh
		order by a.spbh
	else if (@spzt <> '' and @yyybh = '')
		select b.pm,b.gg,b.cjmc,a.*,c.nametext as spzt
		from #t a
		join v_spxx b on a.spbh = b.spbh
		left join t_lslrl c on lsmlhs between c.sx and c.xx
		where c.NameText = @spzt
		order by a.spbh
	else
		select b.pm,b.gg,b.cjmc,a.*,c.nametext as spzt
		from #t a
		join v_spxx b on a.spbh = b.spbh
		left join t_lslrl c on lsmlhs between c.sx and c.xx
		order by a.spbh
	
	--select sum(sl * jhjhs),sum(jine) from #t
	
	
	drop table #t
end

go


/***************************************************************
*功能：计算毛利占比
****************************************************************/
if object_id('SP_MLHS_MLZB') is not null
	DROP PROCEDURE SP_MLHS_MLZB
GO

create PROCEDURE SP_MLHS_MLZB @yf varchar(6) AS
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
	select a.spbh,a.pcbh,a.jhj, round(a.lsj * a.zk * c.zdzk / 10000.0,2) as lsj,a.sl,round(c.js * a.sl * a.lsj * a.zk * c.zdzk / 10000.0 ,2) as jine
	from t_lsdmxb a
	join t_lsdzb c on c.lsdbh = a.lsdbh
	where convert(char(6),c.rq,112) = @yf

	--select a.spbh,a.pcbh,a.jhj, a.jine/a.shul as lsj,a.shul,a.jine
	--from t_lshzb a
	--where a.fgsbh = @sdw and convert(char(6),a.lsrq,112) = @yf
	
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


go



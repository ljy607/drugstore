drop procedure [dbo].[sp_SPLR]
go

create procedure [dbo].[sp_SPLR]
@type int,			-- 1：按商品查 2：按显示类别(T_LSLRL)查 10：全部
@id   varchar(30)	-- 1：spbh 2：T_LSLRL ID 10：
as

begin

create table #Result
(
spbh varchar(30) null,
pcbh varchar(30) null,
pm   varchar(128) null,
sccj varchar(128) null,
gg   varchar(32) null,
lsRate varchar(16) null
)

/*
create table #t(spbh varchar(30) null,pcbh varchar(30) null,jhj decimal(10,2) null default 0)
--计算库存商品零售价
insert into #t(spbh,pcbh,jhj)
select c.spbh,c.pcbh,sum(m.jiag*m.sl)/sum(m.sl) as jhj
from t_ckmx m
join t_chxx_pc c on m.spbh = c.spbh and m.pcbh = c.pcbh
where ywtp in (0,1,2,3)
group by c.spbh,c.pcbh
*/

create table #tab(spbh varchar(30) null,pcbh varchar(30) null,lsRate decimal(10,2) null default 0)
--select m.spbh,m.pcbh,v.pm,v.sccj,v.gg,(v.lsj - m.jhj * (1+l.rate)) /v.lsj as lsRate
insert #tab(spbh,pcbh,lsrate)
select m.spbh,m.pcbh,(v.lsj - m.jhj * (1+l.rate)) /v.lsj as lsRate
--from #t m
from v_spXX_Jhj m
join v_spxx_qtcx v on m.spbh = v.spbh
join t_chxx_pc p on m.spbh = p.spbh and m.pcbh = p.pcbh
join t_splb l on v.lbbh = l.splbbh

if @type = 10	--全部
	insert into #Result(spbh,pcbh,pm,sccj,gg,lsRate)
	select m.spbh,m.pcbh,v.pm,v.sccj,v.gg,isnull((select NameText from T_LSLRL where m.lsrate between sx and xx),'')
	from #tab m
	join v_spxx_qtcx v on m.spbh = v.spbh
	join t_splb l on v.lbbh = l.splbbh 
	
	
else if @type = 1	--按单个商品
	insert into #Result(spbh,pcbh,pm,sccj,gg,lsRate)
	select m.spbh,m.pcbh,v.pm,v.sccj,v.gg,isnull((select NameText from T_LSLRL where m.lsrate between sx and xx),'')
	from #tab m
	join v_spxx_qtcx v on m.spbh = v.spbh
	join t_splb l on v.lbbh = l.splbbh 
	where m.spbh = @id
	

else if @type = 2	--按类别查
	insert into #Result(spbh,pcbh,pm,sccj,gg,lsRate)
	select m.spbh,m.pcbh,v.pm,v.sccj,v.gg,@id
	from #tab m
	join v_spxx_qtcx v on m.spbh = v.spbh
	join t_splb l on v.lbbh = l.splbbh 
	join T_LSLRL s on m.lsrate between s.sx and s.xx
	where s.nametext = @id
	
	
	
select * from #Result order by spbh,pcbh

--drop table #t
drop table #tab
drop table #Result


end

alter table t_spxx
add jgzt nvarchar(8)


--更新药品价格状态，用最后一次进货价格计算
declare @spxx table(spbh varchar(30),jhj decimal(10,2))

insert into @spxx
select m.spbh,sum(m.jhj*m.sl)/sum(m.sl) jhj
from t_jhdmxb m
join t_jhdzb z on m.jhdbh = z.jhdbh
join 
(
	--最后进货信息
	select m.spbh,max(z.jhrq) jhrq
	from t_jhdmxb m
	join t_jhdzb z on m.jhdbh = z.jhdbh
	where m.sl > 0
	group by m.spbh
)
n on m.spbh = n.spbh and z.jhrq = n.jhrq
where m.sl > 0
group by m.spbh
order by m.spbh

declare @tab table(spbh varchar(30),lsRate decimal(10,2))

insert into @tab
select m.spbh,(v.lsj - m.jhj * (1+l.rate)) /v.lsj as lsRate
from @spxx m
join v_spxx_qtcx v on m.spbh = v.spbh
join t_splb l on v.lbbh = l.splbbh
where v.lsj > 0
order by m.spbh

declare @r table (spbh varchar(30),rate char(1))
insert into @r(spbh,rate)
select m.spbh,isnull((select NameText from T_LSLRL where m.lsrate between sx and xx),'')
--select m.spbh,v.pm,v.sccj,v.gg,isnull((select NameText from T_LSLRL where m.lsrate between sx and xx),'')
from @tab m
join v_spxx_qtcx v on m.spbh = v.spbh
join t_splb l on v.lbbh = l.splbbh 

update t_spxx
set t_spxx.jgzt = b.rate
from t_spxx,@r b
where t_spxx.spbh = b.spbh

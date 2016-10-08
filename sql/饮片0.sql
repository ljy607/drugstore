
create table #t
(
spbh varchar(32) null
)

create table #tt
(
jhdbh varchar(32) null,
jhrq datetime null
)


insert into #t
select m.spbh
from 
(
select a.spbh 
from t_jhdmxb a
join t_jhdzb b on a.jhdbh = b.jhdbh
join v_spxx c on c.spbh = a.spbh and c.lbbh = '07'
where b.jhrq < '2011-5-1'

union

select a.spbh
from zddb2010.dbo.t_jhdmxb a
join zddb2010.dbo.t_jhdzb b on a.jhdbh = b.jhdbh
join zddb2010.dbo.v_spxx c on c.spbh = a.spbh and c.lbbh = '07'
where b.jhrq < '2011-5-1'

) m
left join 
(

select a.spbh
from t_jhdmxb a
join t_jhdzb b on a.jhdbh = b.jhdbh
join v_spxx c on c.spbh = a.spbh and c.lbbh = '07'
where b.jhrq > '2011-04-30'
) p  on p.spbh = m.spbh

where p.spbh is null

insert into #tt (jhdbh,jhrq)
select b.jhdbh,max(b.jhrq)
from t_jhdmxb a
join t_jhdzb b on a.jhdbh = b.jhdbh
join v_spxx c on c.spbh = a.spbh and c.lbbh = '07'
join t_gysxx d on d.gysbh = b.gysbh
join #t e on e.spbh = a.spbh
group by b.jhdbh


select distinct a.spbh,a.pcbh,c.pm,b.gysbh,d.gysmc,b.jhrq --,g.jsdw,g.ckrq
into #jh
from t_jhdmxb a
join t_jhdzb b on a.jhdbh = b.jhdbh
join v_spxx c on c.spbh = a.spbh and c.lbbh = '07'
join t_gysxx d on d.gysbh = b.gysbh
join #tt e on e.jhdbh = b.jhdbh
--left join t_ckdmxb f on f.spbh = a.spbh and f.pcbh = a.pcbh
--left join t_ckdzb g on g.ckdbh = f.ckdbh

delete from #tt

insert into #tt(jhdbh,jhrq)
select b.ckdbh,max(b.ckrq)
from t_ckdmxb a
join t_ckdzb b on b.ckdbh = a.ckdbh 
join #jh c on c.spbh = a.spbh and c.pcbh = a.pcbh
group by b.ckdbh

union

select b.ckdbh,max(b.ckrq)
from zddb2010.dbo.t_ckdmxb a
join zddb2010.dbo.t_ckdzb b on b.ckdbh = a.ckdbh 
join #jh c on c.spbh = a.spbh and c.pcbh = a.pcbh
group by b.ckdbh

select a.*,d.jsdw,d.ckrq
from #jh a
left join t_ckdmxb b on b.spbh = a.spbh and b.pcbh = a.pcbh
join t_ckdzb d on d.ckdbh = b.ckdbh
join #tt c on c.jhdbh = b.ckdbh



drop table #t
drop table #tt
drop table #jh
--drop table #ck



/*
select distinct a.spbh,a.pcbh,c.pm,b.gysbh,d.gysmc
from t_jhdmxb a
join t_jhdzb b on a.jhdbh = b.jhdbh
join v_spxx c on c.spbh = a.spbh and c.lbbh = '07'
join t_gysxx d on d.gysbh = b.gysbh
where b.jhrq > '2011-04-30'
*/



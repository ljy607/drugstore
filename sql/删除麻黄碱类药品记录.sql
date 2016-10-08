create table #sp(spbh nvarchar(16))
create table #gys(gysbh nvarchar(8))

create table #spph(spbh nvarchar(16),pcbh nvarchar(16))

insert into #sp(spbh) values('10117')
insert into #sp(spbh) values('10114')
insert into #sp(spbh) values('109171')
insert into #sp(spbh) values('10120')
insert into #sp(spbh) values('10367')
insert into #sp(spbh) values('103671')
insert into #sp(spbh) values('401632')
insert into #sp(spbh) values('100582')
insert into #sp(spbh) values('109172')
insert into #sp(spbh) values('10946')
insert into #sp(spbh) values('409156')

--insert into #gys(gysbh) values('00070')
--insert into #gys(gysbh) values('00115')
--insert into #gys(gysbh) values('00496')
--insert into #gys(gysbh) values('00281')
--insert into #gys(gysbh) values('00536')
--insert into #gys(gysbh) values('00497')
--insert into #gys(gysbh) values('00025')
--insert into #gys(gysbh) values('00050')
--insert into #gys(gysbh) values('00036')

INSERT INTO #gys(gysbh) VALUES('00516')

insert into #spph(spbh,pcbh)
select distinct a.spbh,a.pcbh
from t_jhdmxb a
join t_jhdzb b on a.jhdbh=b.jhdbh
join #sp c on a.spbh=c.spbh
join #gys d on b.gysbh=d.gysbh
 
----进货单
----DELETE a
select b.gysbh,g.gysmc,b.jhrq,a.spbh,s.pm,s.gg,s.cjmc,a.sl,b.jhrq
from t_jhdmxb a
join t_jhdzb b on a.jhdbh=b.jhdbh
join #sp c on a.spbh=c.spbh
join #gys d on b.gysbh=d.gysbh
join v_spxx s on a.spbh=s.spbh
join t_gysxx g on b.gysbh=g.gysbh
WHERE b.jhrq < '2014-09-30'

/*
----出库单 --确认哪些批号可以删除
select e1.*
from #spph e
join t_ckdmxb e1 on e.spbh=e1.spbh and e.pcbh=e1.pcbh

----退货单
select e1.*
from #spph e
join t_thdmxb e1 on e.spbh=e1.spbh and e.pcbh=e1.pcbh

----退库单
select e1.*
from #spph e
join t_tkdmxb e1 on e.spbh=e1.spbh and e.pcbh=e1.pcbh

----ckmx  --这个可以不删除
select e1.*
from #spph e
join t_ckmx e1 on e.spbh=e1.spbh and e.pcbh=e1.pcbh

----损益单
select e1.*
from #spph e
join t_bsdmxb e1 on e.spbh=e1.spbh and e.pcbh=e1.pcbh

----盘点单
select e1.*
from #spph e
join t_pddmxb e1 on e.spbh=e1.spbh and e.pcbh=e1.pcbh

----分公司库存--需要确定删除哪些批号的
select e1.*
from #spph e
join t_fgskc e1 on e.spbh=e1.spbh and e.pcbh=e1.pcbh
*/

------库存  --需要确认哪些批号要删除的
--select e1.*
--from #spph e
--join t_chxx e1 on e.spbh=e1.spbh and e.pcbh=e1.pcbh







drop table #sp
drop table #gys
drop table #spph


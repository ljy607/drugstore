--t_ckdmxb
IF EXISTS (SELECT name FROM sysindexes 
      WHERE name = 'IX_Ck_Spbh_Pcbh')
   DROP INDEX t_ckdmxb.IX_Ck_Spbh_Pcbh
GO

CREATE INDEX IX_Ck_Spbh_Pcbh
   ON t_ckdmxb (spbh, pcbh)
go 

--t_lsdmxb
IF EXISTS (SELECT name FROM sysindexes 
      WHERE name = 'IX_Ls_Spbh_Pcbh')
   DROP INDEX t_lsdmxb.IX_Ls_Spbh_Pcbh
GO

CREATE INDEX IX_Ls_Spbh_Pcbh
   ON t_lsdmxb (spbh, pcbh)

go 

--获取月销售记录
select m.spbh,m.pcbh,count(m.sl) as sl,m.lsj
into #t
from t_lsdmxb m
join t_lsdzb z on m.lsdbh = z.lsdbh
where convert(char(6),z.rq,112) = '200812' and m.yyybh = '023'
group by m.spbh,m.pcbh,m.lsj

--获取进货价
select m.spbh,m.pcbh,sum(m.jhj*m.shul)/sum(m.shul) as jhj--m.jhj,m.shul
into #jhj
from t_ckdmxb m
join #t t on m.spbh = t.spbh and m.pcbh = t.pcbh
group by m.spbh,m.pcbh

select e.spbh,e.pcbh,e.sl,e.lsj,e1.jhj
from #t e
join #jhj e1 on e.spbh = e1.spbh and e.pcbh = e1.pcbh
where lsj > e1.jhj * (1 + 0.08)

/*
select spbh,pcbh,sum(jhj*shul)/sum(shul)
from #tt
group by spbh,pcbh
*/

drop table #jhj
drop table #t
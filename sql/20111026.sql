alter table t_lsdmxb
add jhjhs decimal(15,4) null default 0
go

alter table t_lsdmxb_ls
add jhjhs decimal(15,4) null default 0
go



update a
set a.jhjhs = (1+c.rate) * a.jhj
--select a.jhj,c.rate,(1+c.rate) * a.jhj
from t_lsdmxb a
join t_spxx b on a.spbh = b.spbh
join t_splb c on b.lbbh = c.splbbh
where a.jhj >0 and isnull(a.jhjhs,0) = 0
go
update a
set a.jhjhs = c.jhjhs

--select distinct a.*,c.jhjhs

from t_lsdmxb a
join t_lsdzb b on a.lsdbh = b.lsdbh
join t_lsdmxb c on a.spbh = c.spbh and a.pcbh = c.pcbh 
join t_lsdzb d on c.lsdbh = d.lsdbh 
where b.rq between '2012-5-23' and '2012-5-24' and d.rq between '2012-5-23' and '2012-5-24'
and a.sl < 0 and c.sl > 0 and abs(a.sl) = c.sl

go
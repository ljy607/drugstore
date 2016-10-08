select distinct a.fgsbh, a.spbh,b.pm,b.gg,b.cjmc,a.shul,a.pcbh,d.gysbh,e.gysmc
from t_fgskc a
join v_spxx b on a.spbh = b.spbh
left join t_jhdmxb c on c.spbh = a.spbh and c.pcbh = a.pcbh
left join t_jhdzb d on d.jhdbh = c.jhdbh
left join t_gysxx e on e.gysbh = d.gysbh
where b.jx in('02','38')
--group by a.spbh,b.pm,b.gg,b.cjmc,a.shul,a.pcbh,d.gysbh,e.gysmc
order by a.fgsbh,a.spbh,a.pcbh


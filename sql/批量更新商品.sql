------更新某天后没有进货的商品 ------------------
SELECT a.spbh,pm,gg,gxrq,flag
-- update a set a.flag = 0,a.gxrq=getdate()
FROM t_spxx a  
LEFT JOIN (
select distinct spbh from t_fgskc where shul-yxsl > 0
union
SELECT spbh FROM t_chxx 
union
SELECT distinct m.spbh FROM t_Jhdzb z JOIN t_jhdmxb m ON z.JHDbh=m.JHDBH WHERE z.jhrq >= '2019.7.1' 
) b ON a.spbh = b.spbh 
WHERE a.flag = 1 and b.spbh IS NULL


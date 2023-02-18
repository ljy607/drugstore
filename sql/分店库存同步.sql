select DATEADD(ss,-90,tbsj) from t_chxx_tbjl where id =1;


SELECT spbh,pcbh,yxrq,chsl
FROM t_chxx
WHERE ISNULL(gxrq,GETDATE()) > '2022-11-28 13:09:00.483'



 SELECT * FROM t_chxx WHERE spbh = '11310' AND pcbh = '2105054' ORDER BY gxrq DESC
 
 
 SELECT e.spbh,e.pcbh,e.chsl,e.gxrq,e1.shul,e1.gxrq
 --UPDATE e1 SET e1.shul = e.chsl
 FROM t_chxx e
 JOIN hj00.zddb.dbo.t_fgskc e1 ON e.spbh = e1.spbh AND e.pcbh=e1.pcbh
 WHERE e1.fgsbh = '102' AND e.chsl <> e1.shul
 
 
 SELECT spbh,COUNT(*)
 FROM (
 SELECT distinct spbh,hwbh
 FROM t_chxx 
 ) a
 GROUP BY spbh
 HAVING COUNT(*) > 1
 
 
 
 
 
 
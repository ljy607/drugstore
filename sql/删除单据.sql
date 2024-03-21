select e1.* from t_ckdzb e join t_ckdmxb e1 on e.ckdbh=e1.ckdbh where e.yxbz < 10 
select * from t_ckdzb e where e.yxbz < 10 

select e1.* from t_bsdzb e join t_bsdmxb e1 on e.bsdbh=e1.bsdbh where e.yxbz <10
select e.* from t_bsdzb e where e.yxbz <10

select e.*  -- delete e
from t_bsdzb e WHERE bsdbh IN('BS11124000004','BS10724000003')
select e.*  -- delete e
from t_bsdmxb e WHERE bsdbh IN('BS11124000004','BS10724000003')

select e1.* from t_tkdzb e  join t_tkdmxb e1 on e.tkdbh=e1.tkdbh where e.flag <10 
select e.* from t_tkdzb e where e.flag =5 

select e1.* from t_dbdzb e join t_dbdmxb e1 on e.dbdbh=e1.dbdbh where e.yxbz <10 
select e.* from t_dbdzb e where e.yxbz <10 

SELECT e1.* FROM t_bjdzb e JOIN t_bjdmxb e1 ON e.BJDBH = e1.BJDBH WHERE e.jsbz < 10 
SELECT e.* FROM t_bjdzb e WHERE e.jsbz < 10 

SELECT tym.* FROM T_YHJHZB ty JOIN t_yhjhmx tym ON ty.YHDBH=tym.yhdbh WHERE ty.jsbz < 10
SELECT ty.* FROM T_YHJHZB ty WHERE ty.jsbz < 10

----销毁单----------------
SELECT * FROM T_xhdmxb tx JOIN t_xhdzb tx2 ON tx2.xhdbh = tx.xhdbh WHERE tx2.yxbz=1
SELECT * FROM t_xhdzb tx WHERE tx.yxbz =1

------盘点单 ------------
SELECT b.* FROM t_pddzb a JOIN t_pddmxb b ON b.PDDBH = a.PDDBH  WHERE a.flag IN(1,10)
SELECT a.* FROM t_pddzb a WHERE a.flag in(1,10)
SELECT DISTINCT flag FROM T_PDDZB tp




/* ---------------删除开始-----------------------------

delete e1 from t_bsdzb e join t_bsdmxb e1 on e.bsdbh=e1.bsdbh where e.yxbz <10 
delete e from t_bsdzb e where e.yxbz <10 

delete e1 from t_tkdzb e  join t_tkdmxb e1 on e.tkdbh=e1.tkdbh where e.flag =5
delete e from t_tkdzb e where e.flag =5

--delete e1 from t_dbdzb e join t_dbdmxb e1 on e.dbdbh=e1.dbdbh where e.yxbz <10
--delete e from t_dbdzb e where e.yxbz <10 

--delete e1 FROM t_bjdzb e JOIN t_bjdmxb e1 ON e.BJDBH = e1.BJDBH WHERE e.jsbz < 10
--delete e FROM t_bjdzb e WHERE e.jsbz < 10 

--------销毁单----------------
--DELETE tx FROM T_xhdmxb tx JOIN t_xhdzb tx2 ON tx2.xhdbh = tx.xhdbh WHERE tx2.yxbz=1
--DELETE tx FROM t_xhdzb tx WHERE tx.yxbz =1

--DELETE tym FROM T_YHJHZB ty JOIN t_yhjhmx tym ON ty.YHDBH=tym.yhdbh WHERE ty.jsbz < 10
--DELETE ty FROM T_YHJHZB ty WHERE ty.jsbz < 10

delete b FROM t_pddzb a JOIN t_pddmxb b ON b.PDDBH = a.PDDBH  WHERE a.flag IN(1,10);
delete a FROM t_pddzb a WHERE a.flag in(1,10);

*/







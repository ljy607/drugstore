SELECT *  -- select max(bjdbh) 
FROM t_bjdzb 
WHERE BJRQ > '2026.5.1'

INSERT INTO  t_bjdzb
SELECT 'BJ26000163',GETDATE(),pzr,KPR, '', JSBZ, '', ''
  FROM t_bjdzb WHERE BJDBH = 'BJ26000162'
  
INSERT INTO t_bjdmxb(BJDBH, SPBH, DWBH, LSZK, JLSJ, LSJ, JPFJ, PFJ, JGBJ, GBJ, DBJ,
            BJYY, jhyj, hyj, jdslsj, dslsj)
SELECT 'BJ26000121',s.spbh,'***',100,j.lsj,j.lsj,j.PFJ,j.PFJ,j.gbj,j.gbj,j.zdjj,'',j.hyj,j.hyj,j.dslsj,j.dslsj
FROM t_spxx s
JOIN t_jgxx j ON j.SPBH = s.SPBH
WHERE s.spbh LIKE '7%' AND s.flag = 1  


SELECT *
FROM t_bjdmxb WHERE bjdbh = 'BJ26000120'


--根据导入文件生成变价单
INSERT INTO t_bjdmxb(BJDBH, SPBH, DWBH, LSZK, JLSJ, LSJ, JPFJ, PFJ, JGBJ, GBJ, DBJ,
            BJYY, jhyj, hyj, jdslsj, dslsj)
SELECT DISTINCT 'BJ26000163',s.spbh,'***',100,j.lsj,j.lsj,j.PFJ,j.PFJ,j.gbj,j.gbj,j.zdjj,'',j.hyj,j.hyj,j.dslsj,j.dslsj
FROM t_2 s
JOIN t_jgxx j ON j.SPBH = s.SPBH

SELECT * FROM t_2
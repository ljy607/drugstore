--select * from t_hwxx

UPDATE a
SET a.JHHW = 'L0000',a.LSHW = 'L0000'
--SELECT * 
FROM T_SPHW a
JOIN t_chxx b ON b.SPBH = a.SPBH
WHERE a.spbh NOT LIKE '7%'


UPDATE b
SET b.hwbh = 'L0000'
--SELECT * 
FROM T_SPHW a
JOIN t_chxx b ON b.SPBH = a.SPBH
WHERE a.spbh NOT LIKE '7%'

delete a 
from t_sphw a
left join t_chxx b on a.spbh = b.spbh
where b.spbh is null and a.spbh not like '7%'


--DELETE FROM t_sphw WHERE JHHW <> 'L0000'

--SELECT * FROM T_CHXX tc
--SELECT * FROM t_sphw WHERE JHHW <> 'L0000'

--SELECT * FROM T_HWXX th

--INSERT INTO T_HWXX
--(HWBH,LSHW,HWMC,HWTP,SXKW,CKSX,HWMS,GXRQ,GXZ,FLAG)
--VALUES('L0000','***','临时货位',1,0,0,'临时货位',GETDATE(),'001',1)

 

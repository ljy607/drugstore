--  SELECT MAX(ckdbh) FROM t_ckdzb

DECLARE @i INT,@j INT,@ckdbh NVARCHAR(16),@dh NVARCHAR(255),@jsdw NVARCHAR(3)
SELECT @dh = 'Tk10623000541,TK10623000544,TK10823000329,TK10723000453'
SELECT @ckdbh = 'CK23001704'
SELECT @jsdw = '109'

--SELECT *
--FROM T_TKDMXB tt
--JOIN (SELECT VALUE FROM dbo.fn_splittotable(@dh,',') ) a ON tt.TKDBH = a.[VALUE]


CREATE TABLE #tkd(tkdbh NVARCHAR(16))
INSERT INTO #tkd(tkdbh)
SELECT VALUE FROM dbo.fn_splittotable(@dh,',')

CREATE TABLE #ckd(spbh NVARCHAR(32),pcbh NVARCHAR(32),yxrq DATETIME,jhj DECIMAL(16,4),
lsj DECIMAL(16,4),kcl DECIMAL(10,2),shul DECIMAL(10,2),hwbh NVARCHAR(8),flag TINYINT,id int IDENTITY(1,1)  )
 
INSERT INTO #ckd(spbh, pcbh, yxrq, jhj, lsj, kcl, shul, hwbh, flag)
SELECT m.SPBH, m.PCBH, m.yxrq, j.ZDJJ,j.LSJ, m.shul AS kcl, m.SHUL, h.JHHW,1
FROM T_TKDZB tt
JOIN #tkd a ON a.TKDBH = tt.TKDBH
JOIN t_tkdmxb m ON m.tkdbh = a.tkdbh
left JOIN t_sphw h ON m.spbh=h.spbh
left JOIN t_jgxx j ON m.spbh=j.spbh 
--WHERE j.zdjj IS null

--SELECT  * FROM #ckd where jhj is null
--SELECT * FROM #tkd

SELECT @i = COUNT(*) FROM #ckd

SELECT @j = COUNT(*)
FROM T_TKDZB tt
JOIN #tkd a ON a.TKDBH = tt.TKDBH
JOIN t_tkdmxb m ON m.tkdbh = a.tkdbh

SELECT @i,@j

IF @i = @j 
	BEGIN
		------插入出库单主表
		--INSERT INTO t_ckdzb(CKDBH, CKRQ, JSDW, ZBR, CKR, YXBZ, BZ, wmsflag,zpflag)
		--SELECT @ckdbh,GETDATE(),@jsdw,'028','028',0,@dh,0,1
		
		INSERT INTO T_ckdmxb(CKDBH, ORDR, SPBH, PCBH, YXRQ, JHJ, LSJ, KCL, SHUL,
		            YXKW, FLAG)
		SELECT @ckdbh,id,spbh, pcbh, yxrq, jhj, lsj, kcl, shul, hwbh, flag
		FROM #ckd

	END

SELECT * 
FROM t_ckdzb z
JOIN t_ckdmxb m ON m.CKDBH = z.CKDBH
WHERE z.ckdbh = @ckdbh

DROP TABLE #tkd
DROP TABLE #ckd


/*

SELECT *
FROM t_tkdmxb 
WHERE spbh IN('3030710','42337')

SELECT *
FROM t_jgxx 
WHERE spbh IN('3030710','42337')

SELECT *
FROM t_jhdmxb 
WHERE spbh = '42337' AND pcbh = '221201'

UPDATE t_jgxx SET zdjj = 13.88 WHERE spbh = '42337'

SELECT * 
FROM t_ckdzb z
JOIN t_ckdmxb m ON m.CKDBH = z.CKDBH
WHERE z.ckdbh = 'CK23001704'

update t_ckdmxb set yxkw = 'H01' where ckdbh = 'CK23001704'

 */
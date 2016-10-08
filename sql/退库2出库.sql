
DECLARE @i INT,@j INT,@ckdbh NVARCHAR(16),@dh NVARCHAR(255),@jsdw NVARCHAR(3)
SELECT @dh = 'TK10116000272,TK10116000209,TK10116000257,TK10116000244,TK10116000217,TK10116000229,TK10116000202'
SELECT @ckdbh = 'CK16003813'
SELECT @jsdw = '105'

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
JOIN t_sphw h ON m.spbh=h.spbh
JOIN t_jgxx j ON m.spbh=j.spbh 

SELECT @i = COUNT(*) FROM #ckd

SELECT @j = COUNT(*)
FROM T_TKDZB tt
JOIN #tkd a ON a.TKDBH = tt.TKDBH
JOIN t_tkdmxb m ON m.tkdbh = a.tkdbh

IF @i = @j 
	BEGIN
		----插入出库单主表
		INSERT INTO t_ckdzb(CKDBH, CKRQ, JSDW, ZBR, CKR, YXBZ, BZ, wmsflag,zpflag)
		SELECT @ckdbh,GETDATE(),@jsdw,'028','028',0,@dh,0,1
		
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

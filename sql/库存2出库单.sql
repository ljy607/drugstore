DECLARE @hw NVARCHAR(32),@ckdbh NVARCHAR(16),@dh INT, @jsdw CHAR(3)

SET @hw = 'H01,K0201,K0303,K0403,K0409'
SET @jsdw = '109'

SELECT @ckdbh = MAX(ckdbh) FROM t_ckdzb 

SELECT @ckdbh = SUBSTRING(@ckdbh,7,4)
SELECT @dh = cast(@ckdbh AS INT) + 1
SELECT @ckdbh = 'CK1400' + cast(@dh AS CHAR(4))

CREATE TABLE #t
(
	id INT IDENTITY(1,1),
	spbh NVARCHAR(16),
	pcbh NVARCHAR(16),
	yxrq DATETIME,
	hwbh NVARCHAR(8),
	jhj DECIMAL(14,4),
	lsj DECIMAL(14,2),
	sl DECIMAL(12,2)
)

INSERT INTO #t(spbh,sl, pcbh, yxrq, hwbh, jhj, lsj)
SELECT c.SPBH, c.CHSL, c.PCBH, c.yxrq,c.HWBH, c.jiag,e.LSJ
FROM t_chxx c
JOIN v_spxx_qtcx e ON c.spbh = e.spbh 
JOIN dbo.fn_SplitToTable(@hw,',') h ON c.HWBH=h.[value]
WHERE c.spbh not LIKE '7%'

INSERT INTO t_ckdzb(CKDBH, CKRQ, JSDW, ZBR, CKR, SHR, YXBZ, BZ, ysr, fhr)
SELECT @ckdbh,GETDATE(),@jsdw,'023','023','124',0,'...','',''

INSERT INTO t_ckdmxb(CKDBH, ORDR, SPBH, PCBH, YXRQ, JHJ, LSJ, KCL, SHUL, YXKW,
            NOTE, FLAG)
SELECT @ckdbh,e.id, e.spbh, e.pcbh, e.yxrq, e.jhj, e.lsj, e.sl,e.sl,e.hwbh,'',0
FROM #t e

DROP TABLE #t



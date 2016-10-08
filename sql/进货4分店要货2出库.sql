--SELECT c.spbh,c.pcbh,c.yxrq,m.yhsl,c.chsl,c.jiag,c.HWBH,CASE  when m.yhsl>c.chsl THEN c.chsl ELSE m.yhsl END AS sl
--FROM t_fdyhzb z
--JOIN t_fdyhmxb m ON z.YHDBH = m.YHDBH
--JOIN t_chxx c ON c.spbh=m.spbh
--WHERE z.yhdbh = 'yh10116000047' AND c.hwbh <> 'h01' --AND m.yhsl <= c.chsl
--ORDER BY c.spbh

DECLARE @ckdbh NVARCHAR(16),@jsdw NVARCHAR(3),@yhdbh NVARCHAR(16),@jhdbh NVARCHAR(16)
SELECT  @ckdbh = 'CK16003774',@jsdw = '109',@yhdbh='YH10116000046',@jhdbh='jh16002498'

CREATE TABLE #ckd(spbh NVARCHAR(32),pcbh NVARCHAR(32),yxrq DATETIME,jhj DECIMAL(16,4),
lsj DECIMAL(16,4),kcl DECIMAL(10,2),shul DECIMAL(10,2),hwbh NVARCHAR(8),flag TINYINT,id int IDENTITY(1,1)  )
 
INSERT INTO #ckd(spbh, pcbh, yxrq, jhj, lsj, kcl, shul, hwbh, flag)
SELECT c.spbh,c.pcbh,c.yxq,c.JHJ,c.LSJ,c.SL,c.sl,c.HWBH,1
FROM t_fdyhzb z
JOIN t_fdyhmxb m ON z.YHDBH = m.YHDBH
JOIN t_jhdmxb c ON c.spbh=m.spbh
JOIN t_jgxx j ON c.spbh = j.SPBH
WHERE z.yhdbh = @yhdbh AND c.jhdbh = @jhdbh
ORDER BY c.spbh


--------插入出库单主表
INSERT INTO t_ckdzb(CKDBH, CKRQ, JSDW, ZBR, CKR, YXBZ, BZ, wmsflag,zpflag)
SELECT @ckdbh,GETDATE(),@jsdw,'028','028',0,@yhdbh,0,1

INSERT INTO T_ckdmxb(CKDBH, ORDR, SPBH, PCBH, YXRQ, JHJ, LSJ, KCL, SHUL,YXKW, FLAG)
SELECT @ckdbh,id,spbh, pcbh, yxrq, jhj, lsj, kcl, shul, hwbh, flag
FROM #ckd            
            
            
DROP TABLE #ckd
            

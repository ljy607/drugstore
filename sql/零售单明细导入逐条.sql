----游标循环导入，逐条去库存
----主表批量导入

DECLARE @lsdbh NVARCHAR(15),@ordr INT,@spbh VARCHAR(15),@sl DECIMAL(10,4)
DECLARE @lsj DECIMAL(10,4), @yyybh VARCHAR(12),@guit VARCHAR(12),@ysbh VARCHAR(12),@zk TINYINT,@pcbh VARCHAR(20)
DECLARE @jhj DECIMAL(10,4),@bz NVARCHAR(32),@jhjhs DECIMAL(15,4),@jylb NVARCHAR(2),@feein DECIMAL(10,4)
DECLARE @feeout DECIMAL(10,4),@selfpay2 DECIMAL(10,4)

DECLARE auth_cur CURSOR FOR

SELECT LSDBH, ORDR, SPBH, SL, LSJ, YYYBH, GUIT, YSBH, ZK, pcbh, jhj, bz, jhjhs,
       jylb
FROM hjdb07.dbo.t_lsdmxb 
WHERE lsdbh > '1705160084'

open auth_cur
fetch next from auth_cur INTO @lsdbh,@ordr,	@spbh,@sl,@lsj,@yyybh,@guit,@ysbh,@zk,@pcbh,@jhj,@bz,@jhjhs,@jylb
while (@@fetch_status=0)
  BEGIN
	INSERT INTO t_lsdmxb(LSDBH, ORDR, SPBH, SL, LSJ, YYYBH, GUIT, YSBH, ZK, pcbh,
	            jhj, bz, jhjhs, jylb)
	VALUES(@lsdbh,@ordr,@spbh,@sl,@lsj,@yyybh,@guit,@ysbh,@zk,@pcbh,@jhj,@bz,@jhjhs,@jylb)            
	fetch next from auth_cur into @lsdbh,@ordr,	@spbh,@sl,@lsj,@yyybh,@guit,@ysbh,@zk,@pcbh,@jhj,@bz,@jhjhs,@jylb
  end
close auth_cur
deallocate auth_cur	





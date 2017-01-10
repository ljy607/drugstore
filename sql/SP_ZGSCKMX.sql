SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

ALTER  PROCEDURE SP_ZGSCKMX @sspbh varchar(10), @spcbh varchar(20), @sdjhm varchar(15), @ywrq datetime, @yxrq datetime , 
  @iywtp int, @decjg decimal(8,2), @decsl decimal(8,2), @decjine decimal(10,2), @skw varchar(6) AS
DECLARE @iordrmax int, @icount int
declare @chsl decimal(10,4)
declare @sl int 

--判断是否有存货
if @iywtp < 0
  BEGIN
    SELECT @chsl = isnull(chsl,0) FROM T_CHXX_HW WHERE SPBH = @sspbh AND PCBH = @spcbh
    SELECT @chsl = ISNULL(@chsl,0)
		
    IF @chsl < @decsl
		
      BEGIN
	select @sl = cast(@chsl as int)
        RAISERROR ( '编号为:%s的商品的存货不够(%d)!', 16, 1, @sspbh,@sl)
        --ROLLBACK TRANSACTION
        RETURN
      END
  END

SELECT @yxrq = isnull(@yxrq,getdate())
SELECT @iordrmax = ISNULL(MAX(ISNULL(ORDR,0)),0) + 1 FROM T_CKMX WHERE SPBH = @sspbh   --取最大顺序号
INSERT INTO T_CKMX VALUES (@sspbh, @spcbh, @sdjhm, @iordrmax, @ywrq, @iywtp, @decjg, @decsl, @decjine, @skw)   --写入数据-T_CKMX
SELECT @icount = ISNULL(COUNT(*),0) FROM T_CHXX_PC WHERE SPBH = @sspbh AND PCBH = @spcbh  --T_CHXX_PC表中是否有相应数据
IF @icount > 0    --发现相应的数据 (批次编号,商品编号)
BEGIN
  IF @iywtp >= 0   --入库操作
    BEGIN
      IF @iywtp = 1
        UPDATE T_CHXX_PC SET YXRQ = @yxrq, SHUL = ISNUll(SHUL,0) + @decsl, JINE = JINE + @decjine WHERE  SPBH = @sspbh AND PCBH = @spcbh

      ELSE
        UPDATE T_CHXX_PC SET SHUL = ISNULL(SHUL,0) + @decsl, JINE = JINE + @decjine WHERE  SPBH = @sspbh AND PCBH = @spcbh

      UPDATE T_CHXX_HW SET chsl = isnull(chsl,0) + @decsl WHERE  SPBH = @sspbh AND PCBH = @spcbh	
    END 
  ELSE   --出库操作
    BEGIN
      UPDATE T_CHXX_PC SET YXSL = YXSL + @decsl, YXHK = YXHK + @decjine WHERE  SPBH = @sspbh AND PCBH = @spcbh
      UPDATE T_CHXX_HW SET chsl = chsl - @decsl WHERE  SPBH = @sspbh AND PCBH = @spcbh
    END
END
ELSE   --没有相应数据 
BEGIN
  IF @iywtp >= 0  ---入库操作
    BEGIN
      INSERT INTO T_CHXX_PC(spbh,pcbh,djhm,yxrq,shul,jine,yxsl,yxhk,flag) VALUES ( @sspbh, @spcbh, @sdjhm, @yxrq, @decsl, @decjine, 0, 0,1)
      INSERT INTO T_CHXX_HW(spbh,pcbh,hwbh,chsl,flag) VALUES(@sspbh, @spcbh,@skw,@decsl,1)
    END
  ELSE   ---出库操作
    BEGIN
      RAISERROR ( '编号为:%s的商品的存货不够!', 16, 1, @sspbh )
      --ROLLBACK TRANSACTION
      RETURN
      --INSERT INTO T_CHXX_PC(spbh,pcbh,djhm,yxrq,shul,jine,yxsl,yxhk,flag) VALUES ( @sspbh, @spcbh, @sdjhm, @yxrq, 0, 0, @decsl, @decsl,1 )
    END
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 

GO


IF EXISTS (SELECT name FROM sysobjects
      WHERE name = 'TRI_CKMX_IN' AND type = 'TR')
   DROP TRIGGER TRI_CKMX_IN
GO




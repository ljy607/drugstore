

ALTER TRIGGER [dbo].[TR_JHDMXB_IN] ON [dbo].[T_JHDMXB]
FOR INSERT
AS
DECLARE @sspbh VARCHAR(12), @iordr INT, @decjhj DECIMAL(18,4), @decpfj DECIMAL(18,4), @decgbj DECIMAL(18,4),@jhdbh NVARCHAR(15),@gysbh NVARCHAR(15)

SELECT @sspbh = SPBH, @decjhj = JHJ, @decpfj = PFJ, @decgbj = GBJ,@jhdbh = jhdbh FROM INSERTED
--RAISERROR ( '进货单号为:%s', 16, 1, @jhdbh)
SELECT @gysbh = gysbh FROM t_jhdzb WHERE jhdbh = @jhdbh
SELECT @iordr =  COUNT(*) FROM T_JGXX WHERE SPBH = @sspbh 
--RAISERROR ( '编号为:%s的商品没有确定零售货位!', 16, 1, @sspbh)
--RAISERROR ( '编号为:%s的商品没有确定零售货位!', 16, 1, @jhdbh)
IF @iordr > 0 
   UPDATE T_JGXX SET PFJ = @decpfj, GBJ = @decgbj,zdjj=@decjhj,zhgys = @gysbh WHERE SPBH = @sspbh
ELSE
   INSERT INTO T_JGXX (SPBH, ZDJJ, PFJ, GBJ,zhgys) VALUES (@sspbh, @decjhj, @decpfj, @decgbj,@gysbh )

GO



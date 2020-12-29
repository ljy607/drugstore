
--零售记录明细触发器
--修改记录 
--			增加库存变更时，修改库存同步标志为0  2020年12月1日 17:18:55 
alter   TRIGGER [dbo].[TRI_LSDMXB_IN] ON [dbo].[T_LSDMXB] FOR INSERT AS
begin
	DECLARE @decsl DECIMAL(8,2), @declsj DECIMAL(10,4), @deczk decimal(8,2), @decpcye DECIMAL(8,2), @decsysl DECIMAL(8,2), @deczdzk decimal(8,2)
	DECLARE @sspbh VARCHAR(15), @syxkw VARCHAR(6), @ssppc VARCHAR(20), @sdjbh VARCHAR(15), @dywrq DATETIME
	DECLARE @iordr INT, @itemp INT

	DECLARE @ijs   INT  --剂数
	DECLARE @jhj   DECIMAL(8,4)

	
	----SELECT @sdjbh = LSDBH,@iordr = ORDR, @sspbh = SPBH, @ssppc=PCBH, @decsl = SL, @declsj = LSJ, @deczk = ZK / 100.00,@jhj = isnull(jhj,0) FROM INSERTED
	DECLARE cur CURSOR FOR  SELECT LSDBH,ORDR, SPBH, PCBH, SL, LSJ, ZK / 100.00,isnull(jhj,0) FROM INSERTED
	OPEN cur  
    FETCH NEXT FROM cur INTO @sdjbh,@iordr,@sspbh,@ssppc,@decsl,@declsj,@deczk,@jhj        
    WHILE @@FETCH_STATUS=0  
    BEGIN  
    	SELECT @dywrq = RQ, @deczdzk = ZDZK / 100.00, @ijs = js FROM T_LSDZB WHERE LSDBH = @sdjbh
		SELECT @syxkw = LSHW FROM T_SPHW WHERE SPBH = @sspbh
		SELECT @declsj = @declsj * @deczk * @deczdzk

		SELECT @decsl = @decsl * @ijs --判断是否是饮片，饮片的数量需要乘剂数
		IF @syxkw IS NULL
		  BEGIN
			RAISERROR ( '编号为:%s的商品没有确定零售货位!', 16, 1, @sspbh)
			CLOSE cur  
			DEALLOCATE cur
			ROLLBACK TRANSACTION
			RETURN
		  END

		--判断存货是否够销售
		Declare @chsl decimal(10,4)
		SELECT @chsl = isnull(chsl,0) FROM T_CHXX WHERE SPBH = @sspbh AND PCBH = @ssppc and hwbh = @syxkw
		SELECT @chsl = ISNULL(@chsl,-1)	  -- 没有存货信息 2020年12月29日 14:26:15
		IF @chsl < @decsl		
		  BEGIN
			declare @sl int 
			select @sl = cast(@chsl as int)
			RAISERROR ( '编号为:%s的商品的存货不够(%d)!', 16, 1, @sspbh,@sl)
			CLOSE cur  
			DEALLOCATE cur
			ROLLBACK TRANSACTION
			RETURN
		  END

		--设置柜台 2002-02-22
		UPDATE T_LSDMXB SET GUIT = @syxkw WHERE LSDBH = @sdjbh AND ORDR = @iordr

		SELECT @iordr = ISNULL(MAX(ISNULL(ORDR,0)),0) + 1 FROM T_CKMX WHERE SPBH = @sspbh  --取出最大号

		INSERT INTO T_CKMX (SPBH,PCBH,DJHM,ORDR,FXRQ,YWTP,JIAG,SL,JINE,YXKW)
				VALUES ( @sspbh, @ssppc, @sdjbh, @iordr, @dywrq, -10, @declsj, @decsl, (@declsj * @decsl), @syxkw)

		--判断是否是退货
		IF @decsl < 0 AND @chsl = -1  -- 无存货的情况 2020年12月29日 14:27:19
		BEGIN
			--无存货 新增数据
			SELECT @dywrq = null
			SELECT TOP 1 @dywrq=yxrq FROM t_ckdmxb WHERE spbh = @sspbh AND pcbh = @ssppc ORDER BY id DESC
		
			INSERT INTO t_chxx([HWBH],[SPBH],[PCBH],[CHSL],[yxrq],[jiag],[FLAG],[bz]) 
			VALUES(@syxkw,@sspbh,@ssppc,0-@decsl,@dywrq,@jhj, 1,'零售退货')
			
		END		
		ELSE
		BEGIN			
			UPDATE T_CHXX SET chsl = chsl - @decsl,tbbz = 0 WHERE  SPBH = @sspbh AND PCBH = @ssppc and hwbh = @syxkw			
		END
		
		FETCH NEXT FROM cur INTO @sdjbh,@iordr,@sspbh,@ssppc,@decsl,@declsj,@deczk,@jhj
	END	
	
	CLOSE cur  
    DEALLOCATE cur  
end 

GO











--���ۼ�¼��ϸ������
--�޸ļ�¼ 
--			���ӿ����ʱ���޸Ŀ��ͬ����־Ϊ0  2020��12��1�� 17:18:55 
alter   TRIGGER [dbo].[TRI_LSDMXB_IN] ON [dbo].[T_LSDMXB] FOR INSERT AS
begin
	DECLARE @decsl DECIMAL(8,2), @declsj DECIMAL(10,4), @deczk decimal(8,2), @decpcye DECIMAL(8,2), @decsysl DECIMAL(8,2), @deczdzk decimal(8,2)
	DECLARE @sspbh VARCHAR(15), @syxkw VARCHAR(6), @ssppc VARCHAR(20), @sdjbh VARCHAR(15), @dywrq DATETIME
	DECLARE @iordr INT, @itemp INT

	DECLARE @ijs   INT  --����
	DECLARE @jhj   DECIMAL(8,4),@yyybh VARCHAR(10)

	
	----SELECT @sdjbh = LSDBH,@iordr = ORDR, @sspbh = SPBH, @ssppc=PCBH, @decsl = SL, @declsj = LSJ, @deczk = ZK / 100.00,@jhj = isnull(jhj,0) FROM INSERTED
	-----��Ҫ�ָ����ֶ� 2020��3��2�� 14:24:06 ,������yyybh
	----DECLARE cur CURSOR FOR  SELECT LSDBH,ORDR, SPBH, PCBH, SL, LSJ, ZK / 100.00,isnull(jhj,0), FROM INSERTED  
	
	DECLARE cur CURSOR FOR  SELECT LSDBH,ORDR, SPBH, PCBH, SL, LSJ, ZK / 100.00,isnull(jhj,0),yyybh FROM INSERTED
	OPEN cur  
    FETCH NEXT FROM cur INTO @sdjbh,@iordr,@sspbh,@ssppc,@decsl,@declsj,@deczk,@jhj,@yyybh        
    WHILE @@FETCH_STATUS=0  
    BEGIN  
    	SELECT @dywrq = RQ, @deczdzk = ZDZK / 100.00, @ijs = js FROM T_LSDZB WHERE LSDBH = @sdjbh
		SELECT @syxkw = LSHW FROM T_SPHW WHERE SPBH = @sspbh
		SELECT @declsj = @declsj * @deczk * @deczdzk

		SELECT @decsl = @decsl * @ijs --�ж��Ƿ�����Ƭ����Ƭ��������Ҫ�˼���
		IF @syxkw IS NULL
		  BEGIN
			RAISERROR ( '���Ϊ:%s����Ʒû��ȷ�����ۻ�λ!', 16, 1, @sspbh)
			CLOSE cur  
			DEALLOCATE cur
			ROLLBACK TRANSACTION
			RETURN
		  END

		--�жϴ���Ƿ�����
		Declare @chsl decimal(10,4)
		SELECT @chsl = isnull(chsl,0) FROM T_CHXX WHERE SPBH = @sspbh AND PCBH = @ssppc and hwbh = @syxkw
		SELECT @chsl = ISNULL(@chsl,0)	
		IF @chsl < @decsl		
		  BEGIN
			declare @sl int 
			select @sl = cast(@chsl as int)
			RAISERROR ( '���Ϊ:%s����Ʒ�Ĵ������(%d)!', 16, 1, @sspbh,@sl)
			CLOSE cur  
			DEALLOCATE cur
			ROLLBACK TRANSACTION
			RETURN
		  END
		  
		/*	
		--------��ʱ���Ӹ������ݵ�t_lsdmxb_yjcx��ֻ��¼���ۼ� 2020��3��2�� 13:25:47
		----ȡ��Ʒ���ۼ�
		DECLARE @kpr VARCHAR(10),@membercode VARCHAR(32)
		SELECT @declsj=lsj FROM t_jgxx WHERE spbh=@sspbh
		
		INSERT INTO t_lsdmxb_yjcx(LSDBH,ORDR,SPBH,SL,LSJ,YYYBH,GUIT,ZK,pcbh,jhj,flag) 
		VALUES(@sdjbh, @iordr, @sspbh,@decsl,@declsj,@yyybh,@syxkw,@deczk*100,@ssppc,@jhj,1)
		
		SELECT @kpr = kpr,@membercode=member_code  FROM t_lsdzb WHERE lsdbh = @sdjbh
		UPDATE t_lsdzb_yjcx SET yxbz = 1,kpr = @kpr,member_code = @membercode WHERE lsdbh=@sdjbh
		 
		----------��ʱ���ӽ���------------------------------------
		*/  

		--���ù�̨ 2002-02-22
		UPDATE T_LSDMXB SET GUIT = @syxkw WHERE LSDBH = @sdjbh AND ORDR = @iordr

		SELECT @iordr = ISNULL(MAX(ISNULL(ORDR,0)),0) + 1 FROM T_CKMX WHERE SPBH = @sspbh  --ȡ������

		INSERT INTO T_CKMX (SPBH,PCBH,DJHM,ORDR,FXRQ,YWTP,JIAG,SL,JINE,YXKW)
				VALUES ( @sspbh, @ssppc, @sdjbh, @iordr, @dywrq, -10, @declsj, @decsl, (@declsj * @decsl), @syxkw)

		--�ж��Ƿ����˻�
		IF @decsl < 0 AND @chsl = 0
		BEGIN
			--�޴�� ��������
			SELECT @dywrq = null
			SELECT TOP 1 @dywrq=yxrq FROM t_ckdmxb WHERE spbh = @sspbh AND pcbh = @ssppc ORDER BY id DESC
		
			INSERT INTO t_chxx([HWBH],[SPBH],[PCBH],[CHSL],[yxrq],[jiag],[FLAG],[bz]) 
			VALUES(@syxkw,@sspbh,@ssppc,0-@decsl,@dywrq,@jhj, 1,'�����˻�')
			
		END		
		ELSE
		BEGIN			
			UPDATE T_CHXX SET chsl = chsl - @decsl,tbbz = 0 WHERE  SPBH = @sspbh AND PCBH = @ssppc and hwbh = @syxkw			
		END
		
		FETCH NEXT FROM cur INTO @sdjbh,@iordr,@sspbh,@ssppc,@decsl,@declsj,@deczk,@jhj,@yyybh
	END	
	
	CLOSE cur  
    DEALLOCATE cur  
end 

GO



--�ֹ�˾���--------------------------------------------------------------
/******************* ����˵�� *****************************************************************
  �����̣���¼���
  ����	@dh	�������
        @yhr	������
  ���	��¼���
  �޸�	2016.10.15	���Ӽ�¼�������ڡ���������
		2019��5��3�� 14:17:56	���Ӳ��ء���������
		2020��12��1�� 17:33:41	���䶯���޸Ŀ��ͬ����־Ϊ0				
**********************************************************************************************/
alter    PROCEDURE [dbo].[SP_ZGSCKMX] @sspbh varchar(10), @spcbh varchar(20), @sdjhm varchar(15), @ywrq datetime, @yxrq datetime , 
  @iywtp int, @decjg decimal(10,4), @decsl decimal(10,2), @decjine decimal(10,2), @skw varchar(6),
  @scrq DATETIME = NULL,@dhrq DATETIME = NULL,@sccj NVARCHAR(32) = NULL,@cd NVARCHAR(16) = NULL AS
begin
	DECLARE @iordrmax int, @icount int
	declare @chsl decimal(10,2)
	declare @sl int 

	--�ж��Ƿ��д��
	if @iywtp < 0
	BEGIN
		SELECT @chsl = isnull(chsl,0) FROM T_CHXX WHERE SPBH = @sspbh AND PCBH = @spcbh and hwbh = @skw
		SELECT @chsl = ISNULL(@chsl,0)
			
		IF @chsl < @decsl			
		BEGIN
			select @sl = cast(@chsl as int)
				RAISERROR ( '���Ϊ:%s����Ʒ�Ĵ������(%d)!', 16, 1, @sspbh,@sl)
				--ROLLBACK TRANSACTION
				RETURN
		END
	END
	
	IF @dhrq IS NULL 
		set @dhrq = @ywrq

	SELECT @yxrq = isnull(@yxrq,getdate())
	SELECT @iordrmax = ISNULL(MAX(ISNULL(ORDR,0)),0) + 1 FROM T_CKMX WHERE SPBH = @sspbh   --ȡ���˳���
	INSERT INTO T_CKMX VALUES (@sspbh, @spcbh, @sdjhm, @iordrmax, @ywrq, @iywtp, @decjg, @decsl, @decjine, @skw)   --д������-T_CKMX
	SELECT @icount = ISNULL(COUNT(*),0) FROM T_CHXX WHERE SPBH = @sspbh AND PCBH = @spcbh and hwbh = @skw  
	IF @icount > 0    --������Ӧ������ (���α��,��Ʒ���)
	BEGIN
	  IF @iywtp >= 0   --������
		BEGIN
		  IF @iywtp = 1
			UPDATE T_CHXX 
			SET YXRQ = @yxrq, CHSL = ISNUll(CHSL,0) + @decsl, JIAG = ((chsl * jiag) + (@decsl * @decjg))/(chsl + @decsl),
			sccj = @sccj,tbbz = 0
			WHERE  SPBH = @sspbh AND PCBH = @spcbh and hwbh = @skw
		  ELSE
			UPDATE T_CHXX SET CHSL = ISNUll(CHSL,0) + @decsl, YXRQ = @yxrq,tbbz = 0 WHERE  SPBH = @sspbh AND PCBH = @spcbh and hwbh = @skw
		END 
	  ELSE   --�������
		BEGIN
		  UPDATE T_CHXX SET chsl = chsl - @decsl,tbbz = 0 WHERE  SPBH = @sspbh AND PCBH = @spcbh and hwbh = @skw
		END
	END
	ELSE   --û����Ӧ���� 
	BEGIN
	  IF @iywtp >= 0  ---������
		BEGIN
			IF @scrq IS NULL 
			BEGIN
				SELECT @scrq = MIN(m.scrq)
				FROM t_ckdzb z
				JOIN t_ckdmxb m ON m.ckDBH = z.ckDBH
				WHERE m.spbh = @sspbh AND pcbh = @spcbh

			END
		  INSERT INTO T_CHXX(spbh,pcbh,hwbh,chsl,yxrq,JIAG,flag,scrq,dhrq,sccj,cd) 
		  VALUES(@sspbh, @spcbh,@skw,@decsl,@yxrq,@decjg,1,@scrq,@dhrq,@sccj,@cd)
		END
	  ELSE   ---�������
		BEGIN
		  RAISERROR ( '���Ϊ:%s����Ʒ�Ĵ������!', 16, 1, @sspbh )
		  --ROLLBACK TRANSACTION
		  RETURN
		  
		END
	END
end

GO



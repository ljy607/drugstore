--------------- 2017��12��2�� 16:25:16 -----------------
--���ӣ��ж���Ա�ǹ㰲�ų�������Ʒά����Ա��ֻ�����ȡ��������Ʒ �ж��û� 019--������ ִ��

--create PROCEDURE [dbo].[SP_GETSPXX09] @spbh varchar(16) AS
--SELECT  T_SPXX.SPBH, T_SPXX.PM,T_SPXX.GG, T_JLDW.JLDW, T_SPXX.JC, T_SCCJ.JC as SCCJ,T_JGXX.LSJ, T_JGXX.PFJ, T_JGXX.GBJ
--FROM T_SPXX LEFT OUTER JOIN
--      T_JLDW ON T_SPXX.JLDWBH = T_JLDW.JLDWBH LEFT OUTER JOIN
--      T_SCCJ ON T_SPXX.CJBH = T_SCCJ.CJBH LEFT OUTER JOIN
--      T_JGXX ON T_SPXX.SPBH = T_JGXX.SPBH
--WHERE t_spxx.ypfl = '09' AND (T_SPXX.SPBH like '%' + @spbh + '%' OR T_SPXX.PM like '%' + @spbh + '%' OR T_SPXX.JC like '%' + @spbh + '%' OR t_spxx.spbm = @spbh)
--order by t_spxx.spbh

--GO

---------2017��12��2�� 16:30:06------------
--������Ʒ֧��ɨ���ѯ

--alter PROCEDURE [dbo].[SP_GETSPXX09] @spbh varchar(16) AS
--SELECT  T_SPXX.SPBH, T_SPXX.PM,T_SPXX.GG, T_JLDW.JLDW, T_SPXX.JC, T_SCCJ.JC as SCCJ,T_JGXX.LSJ, T_JGXX.PFJ, T_JGXX.GBJ
--FROM T_SPXX LEFT OUTER JOIN
--      T_JLDW ON T_SPXX.JLDWBH = T_JLDW.JLDWBH LEFT OUTER JOIN
--      T_SCCJ ON T_SPXX.CJBH = T_SCCJ.CJBH LEFT OUTER JOIN
--      T_JGXX ON T_SPXX.SPBH = T_JGXX.SPBH
--WHERE (T_SPXX.SPBH like '%' + @spbh + '%' OR T_SPXX.PM like '%' + @spbh + '%' OR T_SPXX.JC like '%' + @spbh + '%' OR t_spxx.spbm = @spbh)
--order by t_spxx.spbh

--GO



--if object_id('SP_FKTZ_QK') is not null
--	drop PROCEDURE SP_FKTZ_QK
--GO


--/******************* ����˵�� ******************
--  ��Ӧ��Ƿ��̨��
--  ���  �����Ӧ��Ƿ��̨�˱�
--************************************************/
------�������ڣ�����������ͳ��
----
--CREATE PROCEDURE SP_FKTZ_QK @jsrq VARCHAR(8) AS
--begin

--	DECLARE @table TABLE
--	(
--		gysbh NVARCHAR(32),
--		gysmc NVARCHAR(128),
--		jh DECIMAL(18,2) DEFAULT 0,
--		th DECIMAL(18,2) DEFAULT 0,
--		ye DECIMAL(18,2) DEFAULT 0
--	)

--	INSERT INTO @table(gysbh, jh)
--	SELECT a.GYSBH,SUM(ROUND(b.jhj * b.sl,2))
--	FROM T_JHDZB a 
--	JOIN T_JHDMXB b ON b.JHDBH = a.JHDBH 
--	WHERE a.JSBZ = 10 AND isnull(b.fkbz,0) = 0 AND b.fk = 1 AND convert(char(8),a.dhRQ,112) <= @jsrq
--	GROUP BY a.GYSBH
	
--	DECLARE @t TABLE ( gysbh VARCHAR(32),th DECIMAL(18,2))	
--	INSERT INTO @t(gysbh, th)
--	SELECT a.GYSBH,SUM(ISNULL(ROUND(a.jhj * a.thsl,2),0))
--	FROM T_THDMXB a
--	JOIN T_THDZB b ON b.THDBH = a.THDBH
--	WHERE b.YXBZ = 10 AND ISNULL(a.fkbz,0) = 0 AND a.fk = 1 AND convert(char(8),b.thRQ,112) <= @jsrq
--	GROUP BY a.GYSBH
	
--	UPDATE a
--	SET a.th = b.th 
--	FROM @table a
--	JOIN @t b ON b.gysbh = a.gysbh
	
--	UPDATE a
--	SET a.gysmc = b.GYSMC
--	FROM @table a
--	JOIN T_GYSXX b ON b.gysbh = a.gysbh
	
--	UPDATE @table 
--	SET ye = jh - th
	

--	SELECT * FROM @table ORDER BY gysbh
--END








--if object_id('SP_ZGSCKMX') is not null
--	drop PROCEDURE SP_ZGSCKMX
--GO

----�ܹ�˾���--------------------------------------------------------------
--/******************* ����˵�� *****************************************************************
--  �����̣���¼���
--  ����	@dh	�������
--        @yhr	������
--  ���	��¼���
--  �޸�	2016.10.15	���Ӽ�¼�������ڡ���������				
--**********************************************************************************************/
--CREATE   PROCEDURE [dbo].[SP_ZGSCKMX] @sspbh varchar(10), @spcbh varchar(20), @sdjhm varchar(15), @ywrq datetime, @yxrq datetime , 
--  @iywtp int, @decjg decimal(10,4), @decsl decimal(10,2), @decjine decimal(10,2), @skw varchar(6),@scrq DATETIME = NULL,@dhrq DATETIME = NULL AS
--begin
--	DECLARE @iordrmax int, @icount int
--	declare @chsl decimal(10,2)
--	declare @sl int 

--	--�ж��Ƿ��д��
--	if @iywtp < 0
--	BEGIN
--		SELECT @chsl = isnull(chsl,0) FROM T_CHXX WHERE SPBH = @sspbh AND PCBH = @spcbh and hwbh = @skw
--		SELECT @chsl = ISNULL(@chsl,0)
			
--		IF @chsl < @decsl			
--		BEGIN
--			select @sl = cast(@chsl as int)
--				RAISERROR ( '���Ϊ:%s����Ʒ�Ĵ������(%d)!', 16, 1, @sspbh,@sl)
--				--ROLLBACK TRANSACTION
--				RETURN
--		END
--	END
	
--	IF @dhrq IS NULL 
--		set @dhrq = @ywrq

--	SELECT @yxrq = isnull(@yxrq,getdate())
--	SELECT @iordrmax = ISNULL(MAX(ISNULL(ORDR,0)),0) + 1 FROM T_CKMX WHERE SPBH = @sspbh   --ȡ���˳���
--	INSERT INTO T_CKMX VALUES (@sspbh, @spcbh, @sdjhm, @iordrmax, @ywrq, @iywtp, @decjg, @decsl, @decjine, @skw)   --д������-T_CKMX
--	SELECT @icount = ISNULL(COUNT(*),0) FROM T_CHXX WHERE SPBH = @sspbh AND PCBH = @spcbh and hwbh = @skw  
--	IF @icount > 0    --������Ӧ������ (���α��,��Ʒ���)
--	BEGIN
--	  IF @iywtp >= 0   --������
--		BEGIN
--		  IF @iywtp = 1
--			UPDATE T_CHXX 
--			SET YXRQ = @yxrq, CHSL = ISNUll(CHSL,0) + @decsl, JIAG = ((chsl * jiag) + (@decsl * @decjg))/(chsl + @decsl),
--				scrq = @scrq,dhrq = @dhrq
--			WHERE  SPBH = @sspbh AND PCBH = @spcbh and hwbh = @skw
--		  ELSE
--			UPDATE T_CHXX SET CHSL = ISNUll(CHSL,0) + @decsl, YXRQ = @yxrq WHERE  SPBH = @sspbh AND PCBH = @spcbh and hwbh = @skw
--		END 
--	  ELSE   --�������
--		BEGIN
--		  UPDATE T_CHXX SET chsl = chsl - @decsl WHERE  SPBH = @sspbh AND PCBH = @spcbh and hwbh = @skw
--		END
--	END
--	ELSE   --û����Ӧ���� 
--	BEGIN
--	  IF @iywtp >= 0  ---������
--		BEGIN
--			IF @scrq IS NULL 
--			BEGIN
--				SELECT @dhrq = MAX(z.jhrq),@scrq = MIN(m.scrq)
--				FROM t_jhdzb z
--				JOIN t_jhdmxb m ON m.JHDBH = z.JHDBH
--				WHERE m.spbh = @sspbh AND pcbh = @spcbh

--			END
--		  INSERT INTO T_CHXX(spbh,pcbh,hwbh,chsl,yxrq,JIAG,flag,scrq,dhrq) VALUES(@sspbh, @spcbh,@skw,@decsl,@yxrq,@decjg,1,@scrq,@dhrq)
--		END
--	  ELSE   ---�������
--		BEGIN
--		  RAISERROR ( '���Ϊ:%s����Ʒ�Ĵ������!', 16, 1, @sspbh )
--		  --ROLLBACK TRANSACTION
--		  RETURN
		  
--		END
--	END
--end


--GO



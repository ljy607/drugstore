--if object_id('SP_ZGSCKMX') is not null
--	drop PROCEDURE SP_ZGSCKMX
--GO

----�ֹ�˾���--------------------------------------------------------------
--/******************* ����˵�� *****************************************************************
--  �����̣���¼���
--  ����	@dh	�������
--        @yhr	������
--  ���	��¼���
--  �޸�	2016.10.15	���Ӽ�¼�������ڡ���������				
--**********************************************************************************************/
--CREATE    PROCEDURE [dbo].[SP_ZGSCKMX] @sspbh varchar(10), @spcbh varchar(20), @sdjhm varchar(15), @ywrq datetime, @yxrq datetime , 
--  @iywtp int, @decjg decimal(10,4), @decsl decimal(10,2), @decjine decimal(10,2), @skw varchar(6),
--  @scrq DATETIME = NULL,@dhrq DATETIME = NULL,@sccj NVARCHAR(32) = NULL AS
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
--			sccj = @sccj
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
--				SELECT @scrq = MIN(m.scrq)
--				FROM t_ckdzb z
--				JOIN t_ckdmxb m ON m.ckDBH = z.ckDBH
--				WHERE m.spbh = @sspbh AND pcbh = @spcbh

--			END
--		  INSERT INTO T_CHXX(spbh,pcbh,hwbh,chsl,yxrq,JIAG,flag,scrq,dhrq,sccj) 
--		  VALUES(@sspbh, @spcbh,@skw,@decsl,@yxrq,@decjg,1,@scrq,@dhrq,@sccj)
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

--if object_id('SP_JCJL') is not null
--	drop PROCEDURE SP_JCJL
--GO
--/******************* ����˵�� *****************************************************************
--  ���ɳ���ҩƷ����¼
--  ����	@dh	��鵥��
--        @yhr	�����
--  ���	���ɼ���¼��Ϣ
--  ����	2019��4��3�� 17:43:58
--**********************************************************************************************/
--create PROCEDURE [dbo].[SP_JCJL] @dh char(6),@yhr char(3) AS
--begin

--if not exists(
--select *
--from T_JCDZB
--where convert(char(6), rq,112) = @dh
--)
--begin

--	insert into T_JCDZB(JCDBH,rq,ZBR,bz)
--	values(@dh,getdate(),@yhr,'')
	
--	insert into T_JCDMXB(JCDBH,hwbh,sl,JCSL,jl,bz,CCTJ,bhgsl,LX)
--	select @dh,hwbh,count(distinct spbh),0,N'�ϸ�','',N'��������',0,0
--	from t_chxx
--	group by hwbh
--	order by hwbh
	
--	update T_JCDMXB
--	set JCSL = sl
--	where JCDBH = @dh
	
--	INSERT INTO T_JCDMXB(JCDBH,hwbh,spbh,PCBH,sl,yxrq,JCSL,jl,bz,CCTJ,bhgsl,LX)
--	SELECT @dh,c.hwbh,c.spbh,c.PCBH,c.CHSL, c.yxrq,c.CHSL,N'�ϸ�','',N'��������',0,1
--	FROM t_chxx c
--	JOIN T_SPXX ts ON c.spbh=ts.spbh
--	WHERE ts.YHLX <> 0
	
--	--��Ч��180���Ʒ�ֽ���������¼
--	INSERT INTO T_JCDMXB(JCDBH,hwbh,spbh,PCBH,sl,yxrq,JCSL,jl,bz,CCTJ,bhgsl,LX)
--	SELECT @dh,c.hwbh,c.spbh,c.PCBH,c.CHSL, c.yxrq,c.CHSL,N'�ϸ�','��Ч��' + cast(DATEDIFF(day,GETDATE(),c.yxrq) as varchar(10)) + '��',N'����Ҫ��',0,1
--	FROM t_chxx c
--	left JOIN T_JCDMXB ts ON c.spbh = ts.spbh AND c.pcbh = ts.pcbh AND ts.JCDBH = @dh
--	WHERE ts.spbh IS NULL AND DATEDIFF(day,GETDATE(),c.yxrq) < 181
	
--	--��ҩ��Ƭ
--	INSERT INTO T_JCDMXB(JCDBH,hwbh,spbh,PCBH,sl,yxrq,JCSL,jl,bz,CCTJ,bhgsl,LX)
--	SELECT @dh,c.hwbh,c.spbh,c.PCBH,c.CHSL, c.yxrq,c.CHSL,N'�ϸ�','��ҩ��Ƭ',N'��������',0,1
--	FROM t_chxx c
--	JOIN t_spxx s ON c.spbh = s.SPBH AND s.ypfl = '07'
--	left JOIN T_JCDMXB ts ON c.spbh = ts.spbh AND c.pcbh = ts.pcbh AND ts.JCDBH = @dh
--	WHERE ts.spbh IS NULL  
	
--	--����1��
--	INSERT INTO T_JCDMXB(JCDBH,hwbh,spbh,PCBH,sl,yxrq,JCSL,jl,bz,CCTJ,bhgsl,LX)
--	SELECT @dh,c.hwbh,c.spbh,c.PCBH,c.CHSL, c.yxrq,c.CHSL,N'�ϸ�','����1��',N'��������',0,1
--	FROM t_chxx c
--	JOIN 
--	(
--		SELECT e.spbh, e.pcbh
--		FROM (
--			SELECT cm.spbh,cm.pcbh,MAX(cz.ckrq) AS ckrq
--			FROM t_ckdzb cz
--			JOIN t_ckdmxb cm ON cm.CKDBH = cz.CKDBH
--			JOIN t_chxx ch ON cm.spbh = ch.spbh AND ch.pcbh = cm.pcbh
--			GROUP BY cm.spbh,cm.PCBH
--		) e
--		left JOIN 
--		(
--			SELECT ch.spbh,ch.pcbh,MAX(lz.rq) AS lsrq
--			FROM t_lsdzb lz
--			JOIN t_lsdmxb lm ON lm.LSDBH = lz.LSDBH
--			JOIN t_chxx ch ON ch.SPBH = lm.SPBH AND ch.pcbh = lm.pcbh
--			GROUP BY ch.spbh,ch.pcbh
--		) e1 ON e1.spbh = e.spbh AND e1.pcbh = e.pcbh
--		WHERE (e1.spbh IS NULL AND DATEDIFF(DAY,e.ckrq,GETDATE()) > 365) OR 
--		DATEDIFF(day,e1.lsrq,GETDATE()) > 365
--	) a ON a.SPBH = c.SPBH AND a.PCBH = c.PCBH
--	left JOIN T_JCDMXB ts ON c.spbh = ts.spbh AND c.pcbh = ts.pcbh AND ts.JCDBH = @dh
--	WHERE ts.spbh IS NULL 
--end

--end 

--GO





----ģ��������Ʒ�Ĺ���-------------------------------------------------------------
----2017��12��2�� 15:24:05 ����ɨ���ѯ��Ʒ
----
--ALTER PROCEDURE [dbo].[SP_GETSPXX] @spbh varchar(16) AS
--	SELECT  T_SPXX.SPBH, T_SPXX.PM,T_SPXX.GG, T_JLDW.JLDW, T_SPXX.JC, T_SCCJ.JC as SCCJ,T_JGXX.LSJ, T_JGXX.PFJ, T_JGXX.GBJ,T_JGXX.zk
--	FROM T_SPXX LEFT OUTER JOIN
--		  T_JLDW ON T_SPXX.JLDWBH = T_JLDW.JLDWBH LEFT OUTER JOIN
--		  T_SCCJ ON T_SPXX.CJBH = T_SCCJ.CJBH LEFT OUTER JOIN
--		  T_JGXX ON T_SPXX.SPBH = T_JGXX.SPBH
--	WHERE (T_SPXX.SPBH like '%' + @spbh + '%' OR T_SPXX.PM like '%' + @spbh + '%' OR T_SPXX.JC like '%' + @spbh + '%' OR T_SPXX.spbm =  + @spbh )
--	order by t_spxx.spbh

--GO





--if object_id('SP_CKD2YHD') is not null
--	drop PROCEDURE SP_CKD2YHD
--GO
--/******************* ����˵�� *****************************************************************
--  ���ⵥ��Ҫ�����ȽϺ˶ԣ�Ҫ���������ڳ��������ĸ���Ҫ������Ϊ�������������ⵥ�д��ڶ�Ҫ������
--  �����ڵ���Ʒ���ӵ�Ҫ���ƻ���
--  ����	@yhdbh   Ҫ�������
--		@ckdbhs  �˶Եĳ��ⵥ�ţ�������ţ����ŷָ�
--  ���
--  ���£�2017��3��31�� 11:50:41 ���Ӹ���Ҫ���ƻ������ֶ�	
--		2017��5��18�� 12:51:19 �������Ҫ���ƻ�ʱ�����ж�����cksl > 0
--**********************************************************************************************/
--CREATE PROCEDURE SP_CKD2YHD @yhdbh NVARCHAR(16), @ckdbhs Nvarchar(4000) AS
--BEGIN
--	--��ȡҪ���ƻ������ordrֵ
--	DECLARE @id INT
--	SELECT @id=MAX(ordr)+1 FROM t_yhjhmx WHERE yhdbh=@yhdbh
--	DECLARE @sql NVARCHAR(4000)
--	SET @sql = '
--	create table #t
--	(	
--	id INT IDENTITY('+cast(@id AS VARCHAR(8))+',1), 
--	SPBH NVARCHAR(16) , 
--	ckSL DECIMAL(10,2),
--	cd nvarchar(16) null
--	)	
		
--	insert into #t(spbh,cksl)
--	SELECT e.spbh,SUM(e.shul) sl
--	FROM t_ckdmxb e 
--	JOIN fn_SplitToTable('''+@ckdbhs+''','','') e1 ON e.ckDBH=e1.value
--	GROUP BY e.spbh
	
--	---���²���
--	update e 
--	set e.cd = e2.cd
--	FROM #t e
--	join t_ckdmxb e2 on e.spbh = e2.spbh
--	JOIN fn_SplitToTable('''+@ckdbhs+''','','') e1 ON e2.ckDBH=e1.value
	
--	--���µ�������
--	update e
--	set e.flag = 255,e.dhsl = e1.cksl,e.cd = e1.cd
--	from t_yhjhmx e
--	join #t e1 on e.spbh = e1.spbh
	
--	--����Ҫ���ƻ���Ҫ������=�������� --Ҫ������<��������
--	update e
--	set e.yhsl = e1.cksl
--	from t_yhjhmx e
--	join #t e1 on e.spbh = e1.spbh 
--	where e.yhsl < e1.cksl
	
--	--����Ҫ���ƻ��в����ڵĳ�����Ʒ��¼
--	insert into t_yhjhmx(YHDBH, YHRQ, ORDR, SPBH, KLOW, DCL, YHSL, LSJ, FLAG,dhsl,cd)
--	SELECT '''+@yhdbh+''',GETDATE(),e.id,e.SPBH,0,0,e.ckSL,e1.LSJ,255,e.ckSL,e.cd
--	FROM #t e
--	JOIN v_spxx_qtcx e1 ON e.spbh = e1.SPBH
--	LEFT JOIN t_yhjhmx e2 ON e.spbh = e2.SPBH AND e2.YHDBH='''+@yhdbh+'''
--	WHERE e2.spbh IS NULL  
		
		
--	drop table #t'
	
--	--PRINT @sql 
	
--	EXEC(@sql)
	
--end 

--GO




--if object_id('sp_tjhz') is not null
--	drop PROCEDURE sp_tjhz
--GO

------�άͳ��----
----2016.1.10 �޸����ӱ���Ʒ�������ά�������
----2017.1.11 ����Ʒ�� �����ά 2017.1.11
----2017.7.4  ����c���ά������left join ��ʽ
----2017.12.21���㳬���൥���ύ ��Ӫ���09
----2018.12.19 �����ά�޸� ����Ʒ�࣬��Ҫ�������۵���ľ�Ӫ�����м���

--CREATE PROCEDURE sp_tjhz @rq CHAR(6)
--AS 
--BEGIN

--CREATE TABLE #t
--(
--	yyybh char(3),
--	aje DECIMAL(14,2) DEFAULT 0,
--	bje DECIMAL(14,2) DEFAULT 0,
--	cje DECIMAL(14,2) DEFAULT 0,
--	tj DECIMAL(14,2) DEFAULT 0,
--	tstjje DECIMAL(14,2) DEFAULT 0,		--���������άƷ�����۶Ŀǰֻ��23-����Ʒ��
--	cstjje decimal(14,2) default 0		--������Ʒ�����ά��09-������Ʒ
--)

--INSERT INTO #t(yyybh)
--SELECT DISTINCT yyybh
--FROM t_lsdzb z
--JOIN t_lsdmxb m ON m.LSDBH = z.LSDBH
--WHERE convert(char(6),z.rq,112) =@rq

--CREATE TABLE #tt
--(
--	yyybh char(3),
--	je DECIMAL(14,2) DEFAULT 0
--)

--CREATE TABLE #ta
--(
--	yyybh char(3),
--	je DECIMAL(14,2) DEFAULT 0
--)

--CREATE TABLE #tb
--(
--	yyybh char(3),
--	je DECIMAL(14,2) DEFAULT 0
--)

--CREATE TABLE #tc
--(
--	yyybh char(3),
--	je DECIMAL(14,2) DEFAULT 0
--)

--------- ������Ʒ�����μ��ά �Һš���ҩ�ȷ���
--CREATE TABLE #sp
--(
--	spbh NVARCHAR(16),
--	flag TINYINT NULL DEFAULT 0
--)
--INSERT INTO #sp( spbh)
--SELECT spbh FROM t_spxx WHERE spbh LIKE '99998%'
--INSERT INTO #sp(spbh)
--SELECT spbh FROM t_spxx WHERE spbh LIKE '99999%'

---------����Ʒ�� �����ά 2017.1.11
----INSERT INTO #sp(spbh,flag)
----SELECT spbh,1 FROM t_spxx WHERE lbbh = '23' --��Ӫ�����23��ȫ����Ʒ�������ά

-------������ �����ά 2017.12.21
--INSERT INTO #sp(spbh,flag)
--SELECT spbh,2 FROM t_spxx WHERE lbbh = '09' --��Ӫ�����09�ĳ�����ȫ����Ʒ�������ά


---- A��
--INSERT INTO #tt(yyybh,je)
--SELECT  T_LSDMXB.YYYBH,   
--sum(round(( t_lsdzb.zdzk / 100.0 ) *  t_lsdmxb.lsj * t_lsdmxb.sl * (t_lsdmxb.zk/100.0) * t_lsdzb.js ,2)) as hjje
--FROM T_LSDZB   
--join T_LSDMXB on  T_LSDZB.LSDBH = T_LSDMXB.LSDBH
--join t_lslrl on round((t_lsdmxb.lsj - isnull(T_LSDMXB.jhjhs,0))/t_lsdmxb.lsj,2) between t_lslrl.sx and t_lslrl.xx
--left JOIN #sp e ON t_lsdmxb.spbh = e.spbh
--where t_lslrl.NameText='A' 
--AND convert(char(6),t_lsdzb.rq,112) = @rq
--AND e.spbh IS NULL
--GROUP BY t_lsdmxb.YYYBH

--INSERT INTO #ta(yyybh,je)
--SELECT T_LSDMXB.YYYBH,   
--sum(round(( t_lsdzb.zdzk / 100.0 ) *  t_lsdmxb.lsj * t_lsdmxb.sl * (t_lsdmxb.zk/100.0) * t_lsdzb.js ,2)) as hjje
--FROM T_LSDZB   
--join T_LSDMXB on  T_LSDZB.LSDBH = T_LSDMXB.LSDBH
--left join t_lslrl on round((t_lsdmxb.lsj - isnull(T_LSDMXB.jhjhs,0))/t_lsdmxb.lsj,2) between t_lslrl.sx and t_lslrl.xx
----JOIN t_spxx s ON t_lsdmxb.spbh=s.spbh 
----JOIN dbo.fn_SplitToTable('14,16,19,21,22,26,29,30',',') fstt ON s.LBBH=fstt.[value]
--JOIN dbo.fn_SplitToTable('14,16,19,21,22,26,29,30',',') fstt ON t_lsdmxb.jylb = fstt.[value]
--where t_lslrl.NameText='A'
--AND convert(char(6),t_lsdzb.rq,112) = @rq
--GROUP BY t_lsdmxb.YYYBH

--UPDATE a 
--SET a.aje=b.je-isnull(c.je,0)
--FROM #t a
--JOIN #tt b ON a.yyybh=b.yyybh
--left JOIN #ta c ON a.yyybh=c.yyybh

--DELETE FROM #tt

----B��
--INSERT INTO #tt(yyybh,je)
--SELECT  T_LSDMXB.YYYBH,   
--sum(round(( t_lsdzb.zdzk / 100.0 ) *  t_lsdmxb.lsj * t_lsdmxb.sl * (t_lsdmxb.zk/100.0) * t_lsdzb.js ,2)) as hjje
--FROM T_LSDZB   
--join T_LSDMXB on  T_LSDZB.LSDBH = T_LSDMXB.LSDBH
--left join t_lslrl on round((t_lsdmxb.lsj - isnull(T_LSDMXB.jhjhs,0))/t_lsdmxb.lsj,2) between t_lslrl.sx and t_lslrl.xx
--left JOIN #sp e ON t_lsdmxb.spbh = e.spbh
--where t_lslrl.NameText='B'
--AND convert(char(6),t_lsdzb.rq,112) = @rq
--AND e.spbh IS NULL
--GROUP BY t_lsdmxb.YYYBH

--INSERT INTO #tb(yyybh,je)
--SELECT T_LSDMXB.YYYBH,   
--sum(round(( t_lsdzb.zdzk / 100.0 ) *  t_lsdmxb.lsj * t_lsdmxb.sl * (t_lsdmxb.zk/100.0) * t_lsdzb.js ,2)) as hjje
--FROM T_LSDZB   
--join T_LSDMXB on  T_LSDZB.LSDBH = T_LSDMXB.LSDBH
--left join t_lslrl on round((t_lsdmxb.lsj - isnull(T_LSDMXB.jhjhs,0))/t_lsdmxb.lsj,2) between t_lslrl.sx and t_lslrl.xx
----JOIN t_spxx s ON t_lsdmxb.spbh=s.spbh 
----JOIN dbo.fn_SplitToTable('14,16,19,21,22,26,29,30',',') fstt ON s.LBBH=fstt.[value]
--JOIN dbo.fn_SplitToTable('14,16,19,21,22,26,29,30',',') fstt ON t_lsdmxb.jylb = fstt.[value]
--where t_lslrl.NameText='B'
--AND convert(char(6),t_lsdzb.rq,112) = @rq
--GROUP BY t_lsdmxb.YYYBH

--UPDATE a 
--SET a.bje=b.je- isnull(c.je,0)
--FROM #t a
--JOIN #tt b ON a.yyybh=b.yyybh
--left JOIN #tb c ON a.yyybh=c.yyybh

--DELETE FROM #tt

----c��
--INSERT INTO #tt(yyybh,je)
--SELECT  T_LSDMXB.YYYBH,   
--sum(round(( t_lsdzb.zdzk / 100.0 ) *  t_lsdmxb.lsj * t_lsdmxb.sl * (t_lsdmxb.zk/100.0) * t_lsdzb.js ,2)) as hjje
--FROM T_LSDZB   
--join T_LSDMXB on  T_LSDZB.LSDBH = T_LSDMXB.LSDBH
--left join t_lslrl on round((t_lsdmxb.lsj - isnull(T_LSDMXB.jhjhs,0))/t_lsdmxb.lsj,2) between t_lslrl.sx and t_lslrl.xx
--left JOIN #sp e ON t_lsdmxb.spbh = e.spbh
--where t_lslrl.NameText='C'
--AND convert(char(6),t_lsdzb.rq,112) = @rq
--AND e.spbh IS NULL
--GROUP BY t_lsdmxb.YYYBH

--INSERT INTO #tc(yyybh,je)
--SELECT T_LSDMXB.YYYBH,   
--sum(round(( t_lsdzb.zdzk / 100.0 ) *  t_lsdmxb.lsj * t_lsdmxb.sl * (t_lsdmxb.zk/100.0) * t_lsdzb.js ,2)) as hjje
--FROM T_LSDZB   
--join T_LSDMXB on  T_LSDZB.LSDBH = T_LSDMXB.LSDBH
--left join t_lslrl on round((t_lsdmxb.lsj - isnull(T_LSDMXB.jhjhs,0))/t_lsdmxb.lsj,2) between t_lslrl.sx and t_lslrl.xx
----JOIN t_spxx s ON t_lsdmxb.spbh=s.spbh 
----JOIN dbo.fn_SplitToTable('14,16',',') fstt ON s.LBBH=fstt.[value]
--JOIN dbo.fn_SplitToTable('14,16',',') fstt ON t_lsdmxb.jylb = fstt.[value]
--where --t_lslrl.NameText='C' AND		--Ҫ��ȥȫ�����ά��Ʒ��
--convert(char(6),t_lsdzb.rq,112) = @rq
--GROUP BY t_lsdmxb.YYYBH

----2017.7.4  ���ĳ�ƫ����ģʽ
--UPDATE a 
--SET a.cje=isnull(b.je,0)+isnull(c.je,0)+isnull(e.je,0) -isnull(d.je,0)
--FROM #t a
--left JOIN #tt b ON a.yyybh=b.yyybh
--left JOIN #tb c ON a.yyybh=c.yyybh
--left JOIN #tc d ON d.yyybh = a.yyybh
--left JOIN #ta e ON e.yyybh=a.yyybh

----�����άƷ��
--DELETE FROM #tt
--INSERT INTO #tt(yyybh,je)
--select a.yyybh,sum(a.sl * c.tjje) tjje
--from t_lsdmxb a
--join t_lsdzb b on a.lsdbh = b.lsdbh
--join t_tjsp c on a.spbh = c.spbh
--where convert(char(6),b.rq,112) = @rq AND c.flag=1
--group by a.YYYBH
--UPDATE e
--SET e.tj = a.je
--FROM #t e
--JOIN #tt a ON a.yyybh = e.yyybh

--------�����ά��Ʒ���۽��
--DELETE FROM #tt
--INSERT INTO #tt(yyybh,je)
--select a.yyybh,sum(round(( b.zdzk / 100.0 ) *  a.lsj * a.sl * (a.zk/100.0) * b.js ,2)) as hjje
--from t_lsdmxb a
--join t_lsdzb b on a.lsdbh = b.lsdbh
----join #sp c on a.spbh = c.spbh
--where convert(char(6),b.rq,112) = @rq AND a.jylb = '23'		----Ŀǰֻ�б���Ʒ�� 2018��12��19�� 08:52:31
--group by a.YYYBH
--UPDATE e
--SET e.tstjje = a.je
--FROM #t e
--JOIN #tt a ON a.yyybh = e.yyybh

--------2017.12.21 ������Ʒ���۽��
--DELETE FROM #tt
--INSERT INTO #tt(yyybh,je)
--select a.yyybh,sum(round(( b.zdzk / 100.0 ) *  a.lsj * a.sl * (a.zk/100.0) * b.js ,2)) as hjje
--from t_lsdmxb a
--join t_lsdzb b on a.lsdbh = b.lsdbh
----join #sp c on a.spbh = c.spbh
--where convert(char(6),b.rq,112) = @rq AND a.jylb = '09'		----������Ʒ���  2018��12��19�� 08:53:38
--group by a.YYYBH
--UPDATE e
--SET e.cstjje = a.je
--FROM #t e
--JOIN #tt a ON a.yyybh = e.yyybh


------�տ�Ա
--INSERT INTO #t(yyybh,tj)
--SELECT  T_LSDzB.kpr,   
--sum(round(( t_lsdzb.zdzk / 100.0 ) *  t_lsdmxb.lsj * t_lsdmxb.sl * (t_lsdmxb.zk/100.0) * t_lsdzb.js ,2)) as hjje
--FROM T_LSDZB   
--join T_LSDMXB on  T_LSDZB.LSDBH = T_LSDMXB.LSDBH
--left JOIN #sp e ON t_lsdmxb.spbh = e.spbh AND e.flag = 0
--where convert(char(6),t_lsdzb.rq,112) = @rq AND e.spbh IS NULL
--GROUP BY t_lsdzb.kpr



--DELETE FROM #t WHERE aje=0 AND bje=0 AND cje=0 AND tj = 0

--SELECT *
--FROM #t 

--DROP TABLE #sp
--DROP TABLE #t
--DROP TABLE #tt
--DROP TABLE #ta
--DROP TABLE #tb
--DROP TABLE #tc

--END
--GO


--if object_id('SP_YHJL') is not null
--	drop PROCEDURE SP_YHJL
--GO

--/******************* ����˵�� *****************************************************************
--  ����������¼
--  ����	@dh	�������
--        @yhr	������
--  ���	����������¼��Ϣ
--  �޸�	2016.10.15	������¼������Ч�ڰ�������Ʒ��ȫ����ҩ��Ƭ������1�����Ʒ				
--**********************************************************************************************/
--create PROCEDURE [dbo].[SP_YHJL] @dh char(6),@yhr char(3) AS
--begin

--if not exists(
--select *
--from t_yhjlzb
--where convert(char(6), yhrq,112) = @dh
--)
--begin

--	insert into t_yhjlzb(yhjlbh,yhrq,yhr,bz)
--	values(@dh,getdate(),@yhr,'')
	
--	insert into t_yhjlmx(yhjlbh,hwbh,sl,yhsl,jl,bz,CCTJ,bhgsl,yhlx)
--	select @dh,hwbh,count(distinct spbh),0,N'�ϸ�','',N'����Ҫ��',0,0
--	from t_chxx
--	group by hwbh
--	order by hwbh
	
--	update t_yhjlmx
--	set yhsl = sl
--	where yhjlbh = @dh
	
--	INSERT INTO t_yhjlmx(yhjlbh,hwbh,spbh,PCBH,sl,yxrq,yhsl,jl,bz,CCTJ,bhgsl,yhlx)
--	SELECT @dh,c.hwbh,c.spbh,c.PCBH,c.CHSL, c.yxrq,c.CHSL,N'�ϸ�','',N'����Ҫ��',0,1
--	FROM t_chxx c
--	JOIN T_SPXX ts ON c.spbh=ts.spbh
--	WHERE ts.yhlx <> 0
	
--	--��Ч��180���Ʒ�ֽ���������¼
--	INSERT INTO t_yhjlmx(yhjlbh,hwbh,spbh,PCBH,sl,yxrq,yhsl,jl,bz,CCTJ,bhgsl,yhlx)
--	SELECT @dh,c.hwbh,c.spbh,c.PCBH,c.CHSL, c.yxrq,c.CHSL,N'�ϸ�','��Ч��' + cast(DATEDIFF(day,GETDATE(),c.yxrq) as varchar(10)) + '��',N'����Ҫ��',0,1
--	FROM t_chxx c
--	left JOIN t_yhjlmx ts ON c.spbh = ts.spbh AND c.pcbh = ts.pcbh AND ts.YHJLBH = @dh
--	WHERE ts.spbh IS NULL AND DATEDIFF(day,GETDATE(),c.yxrq) < 181
	
--	--��ҩ��Ƭ
--	INSERT INTO t_yhjlmx(yhjlbh,hwbh,spbh,PCBH,sl,yxrq,yhsl,jl,bz,CCTJ,bhgsl,yhlx)
--	SELECT @dh,c.hwbh,c.spbh,c.PCBH,c.CHSL, c.yxrq,c.CHSL,N'�ϸ�','��ҩ��Ƭ',N'����Ҫ��',0,1
--	FROM t_chxx c
--	JOIN t_spxx s ON c.spbh = s.SPBH AND s.ypfl = '07'
--	left JOIN t_yhjlmx ts ON c.spbh = ts.spbh AND c.pcbh = ts.pcbh AND ts.YHJLBH = @dh
--	WHERE ts.spbh IS NULL  
	
--	--����1��
--	INSERT INTO t_yhjlmx(yhjlbh,hwbh,spbh,PCBH,sl,yxrq,yhsl,jl,bz,CCTJ,bhgsl,yhlx)
--	SELECT @dh,c.hwbh,c.spbh,c.PCBH,c.CHSL, c.yxrq,c.CHSL,N'�ϸ�','����1��',N'����Ҫ��',0,1
--	FROM t_chxx c
--	JOIN 
--	(
--		SELECT e.spbh, e.pcbh
--		FROM (
--			SELECT cm.spbh,cm.pcbh,MAX(cz.ckrq) AS ckrq
--			FROM t_ckdzb cz
--			JOIN t_ckdmxb cm ON cm.CKDBH = cz.CKDBH
--			JOIN t_chxx ch ON cm.spbh = ch.spbh AND ch.pcbh = cm.pcbh
--			GROUP BY cm.spbh,cm.PCBH
--		) e
--		left JOIN 
--		(
--			SELECT ch.spbh,ch.pcbh,MAX(lz.rq) AS lsrq
--			FROM t_lsdzb lz
--			JOIN t_lsdmxb lm ON lm.LSDBH = lz.LSDBH
--			JOIN t_chxx ch ON ch.SPBH = lm.SPBH AND ch.pcbh = lm.pcbh
--			GROUP BY ch.spbh,ch.pcbh
--		) e1 ON e1.spbh = e.spbh AND e1.pcbh = e.pcbh
--		WHERE (e1.spbh IS NULL AND DATEDIFF(DAY,e.ckrq,GETDATE()) > 365) OR 
--		DATEDIFF(day,e1.lsrq,GETDATE()) > 365
--	) a ON a.SPBH = c.SPBH AND a.PCBH = c.PCBH
--	left JOIN t_yhjlmx ts ON c.spbh = ts.spbh AND c.pcbh = ts.pcbh AND ts.YHJLBH = @dh
--	WHERE ts.spbh IS NULL 
--end

--end 
--GO



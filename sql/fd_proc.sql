--if object_id('SP_ZGSCKMX') is not null
--	drop PROCEDURE SP_ZGSCKMX
--GO

----分公司冲库--------------------------------------------------------------
--/******************* 过程说明 *****************************************************************
--  冲库过程，记录库存
--  参数	@dh	养护编号
--        @yhr	养护人
--  结果	记录库存
--  修改	2016.10.15	增加记录生产日期、到货日期				
--**********************************************************************************************/
--CREATE    PROCEDURE [dbo].[SP_ZGSCKMX] @sspbh varchar(10), @spcbh varchar(20), @sdjhm varchar(15), @ywrq datetime, @yxrq datetime , 
--  @iywtp int, @decjg decimal(10,4), @decsl decimal(10,2), @decjine decimal(10,2), @skw varchar(6),
--  @scrq DATETIME = NULL,@dhrq DATETIME = NULL,@sccj NVARCHAR(32) = NULL AS
--begin
--	DECLARE @iordrmax int, @icount int
--	declare @chsl decimal(10,2)
--	declare @sl int 

--	--判断是否有存货
--	if @iywtp < 0
--	BEGIN
--		SELECT @chsl = isnull(chsl,0) FROM T_CHXX WHERE SPBH = @sspbh AND PCBH = @spcbh and hwbh = @skw
--		SELECT @chsl = ISNULL(@chsl,0)
			
--		IF @chsl < @decsl			
--		BEGIN
--			select @sl = cast(@chsl as int)
--				RAISERROR ( '编号为:%s的商品的存货不够(%d)!', 16, 1, @sspbh,@sl)
--				--ROLLBACK TRANSACTION
--				RETURN
--		END
--	END
	
--	IF @dhrq IS NULL 
--		set @dhrq = @ywrq

--	SELECT @yxrq = isnull(@yxrq,getdate())
--	SELECT @iordrmax = ISNULL(MAX(ISNULL(ORDR,0)),0) + 1 FROM T_CKMX WHERE SPBH = @sspbh   --取最大顺序号
--	INSERT INTO T_CKMX VALUES (@sspbh, @spcbh, @sdjhm, @iordrmax, @ywrq, @iywtp, @decjg, @decsl, @decjine, @skw)   --写入数据-T_CKMX
--	SELECT @icount = ISNULL(COUNT(*),0) FROM T_CHXX WHERE SPBH = @sspbh AND PCBH = @spcbh and hwbh = @skw  
--	IF @icount > 0    --发现相应的数据 (批次编号,商品编号)
--	BEGIN
--	  IF @iywtp >= 0   --入库操作
--		BEGIN
--		  IF @iywtp = 1
--			UPDATE T_CHXX 
--			SET YXRQ = @yxrq, CHSL = ISNUll(CHSL,0) + @decsl, JIAG = ((chsl * jiag) + (@decsl * @decjg))/(chsl + @decsl),
--			sccj = @sccj
--			WHERE  SPBH = @sspbh AND PCBH = @spcbh and hwbh = @skw
--		  ELSE
--			UPDATE T_CHXX SET CHSL = ISNUll(CHSL,0) + @decsl, YXRQ = @yxrq WHERE  SPBH = @sspbh AND PCBH = @spcbh and hwbh = @skw
--		END 
--	  ELSE   --出库操作
--		BEGIN
--		  UPDATE T_CHXX SET chsl = chsl - @decsl WHERE  SPBH = @sspbh AND PCBH = @spcbh and hwbh = @skw
--		END
--	END
--	ELSE   --没有相应数据 
--	BEGIN
--	  IF @iywtp >= 0  ---入库操作
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
--	  ELSE   ---出库操作
--		BEGIN
--		  RAISERROR ( '编号为:%s的商品的存货不够!', 16, 1, @sspbh )
--		  --ROLLBACK TRANSACTION
--		  RETURN
		  
--		END
--	END
--end
--GO

--if object_id('SP_JCJL') is not null
--	drop PROCEDURE SP_JCJL
--GO
--/******************* 过程说明 *****************************************************************
--  生成陈列药品检查记录
--  参数	@dh	检查单号
--        @yhr	检查人
--  结果	生成检查记录信息
--  创建	2019年4月3日 17:43:58
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
--	select @dh,hwbh,count(distinct spbh),0,N'合格','',N'继续销售',0,0
--	from t_chxx
--	group by hwbh
--	order by hwbh
	
--	update T_JCDMXB
--	set JCSL = sl
--	where JCDBH = @dh
	
--	INSERT INTO T_JCDMXB(JCDBH,hwbh,spbh,PCBH,sl,yxrq,JCSL,jl,bz,CCTJ,bhgsl,LX)
--	SELECT @dh,c.hwbh,c.spbh,c.PCBH,c.CHSL, c.yxrq,c.CHSL,N'合格','',N'继续销售',0,1
--	FROM t_chxx c
--	JOIN T_SPXX ts ON c.spbh=ts.spbh
--	WHERE ts.YHLX <> 0
	
--	--近效期180天的品种进入养护记录
--	INSERT INTO T_JCDMXB(JCDBH,hwbh,spbh,PCBH,sl,yxrq,JCSL,jl,bz,CCTJ,bhgsl,LX)
--	SELECT @dh,c.hwbh,c.spbh,c.PCBH,c.CHSL, c.yxrq,c.CHSL,N'合格','有效期' + cast(DATEDIFF(day,GETDATE(),c.yxrq) as varchar(10)) + '天',N'符合要求',0,1
--	FROM t_chxx c
--	left JOIN T_JCDMXB ts ON c.spbh = ts.spbh AND c.pcbh = ts.pcbh AND ts.JCDBH = @dh
--	WHERE ts.spbh IS NULL AND DATEDIFF(day,GETDATE(),c.yxrq) < 181
	
--	--中药饮片
--	INSERT INTO T_JCDMXB(JCDBH,hwbh,spbh,PCBH,sl,yxrq,JCSL,jl,bz,CCTJ,bhgsl,LX)
--	SELECT @dh,c.hwbh,c.spbh,c.PCBH,c.CHSL, c.yxrq,c.CHSL,N'合格','中药饮片',N'继续销售',0,1
--	FROM t_chxx c
--	JOIN t_spxx s ON c.spbh = s.SPBH AND s.ypfl = '07'
--	left JOIN T_JCDMXB ts ON c.spbh = ts.spbh AND c.pcbh = ts.pcbh AND ts.JCDBH = @dh
--	WHERE ts.spbh IS NULL  
	
--	--滞销1年
--	INSERT INTO T_JCDMXB(JCDBH,hwbh,spbh,PCBH,sl,yxrq,JCSL,jl,bz,CCTJ,bhgsl,LX)
--	SELECT @dh,c.hwbh,c.spbh,c.PCBH,c.CHSL, c.yxrq,c.CHSL,N'合格','滞销1年',N'继续销售',0,1
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





----模糊查找商品的工具-------------------------------------------------------------
----2017年12月2日 15:24:05 增加扫码查询商品
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
--/******************* 过程说明 *****************************************************************
--  出库单与要货单比较核对，要货数量少于出库数量的更新要货数量为出库数量，出库单中存在而要货单中
--  不存在的商品增加到要货计划中
--  参数	@yhdbh   要货单编号
--		@ckdbhs  核对的出库单号，多个单号，逗号分割
--  结果
--  更新：2017年3月31日 11:50:41 增加更新要货计划产地字段	
--		2017年5月18日 12:51:19 最后增加要货计划时增加判断条件cksl > 0
--**********************************************************************************************/
--CREATE PROCEDURE SP_CKD2YHD @yhdbh NVARCHAR(16), @ckdbhs Nvarchar(4000) AS
--BEGIN
--	--获取要货计划表最大ordr值
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
	
--	---更新产地
--	update e 
--	set e.cd = e2.cd
--	FROM #t e
--	join t_ckdmxb e2 on e.spbh = e2.spbh
--	JOIN fn_SplitToTable('''+@ckdbhs+''','','') e1 ON e2.ckDBH=e1.value
	
--	--更新到货数量
--	update e
--	set e.flag = 255,e.dhsl = e1.cksl,e.cd = e1.cd
--	from t_yhjhmx e
--	join #t e1 on e.spbh = e1.spbh
	
--	--更新要货计划的要货数量=到货数量 --要货数量<到货数量
--	update e
--	set e.yhsl = e1.cksl
--	from t_yhjhmx e
--	join #t e1 on e.spbh = e1.spbh 
--	where e.yhsl < e1.cksl
	
--	--增加要货计划中不存在的出库商品记录
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

------提奖统计----
----2016.1.10 修改增加保健品类特殊提奖计算规则
----2017.1.11 保健品类 单独提奖 2017.1.11
----2017.7.4  计算c类提奖都采用left join 方式
----2017.12.21计算超市类单独提交 经营类别09
----2018.12.19 单独提奖修改 保健品类，需要按照零售单里的经营类别进行计算

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
--	tstjje DECIMAL(14,2) DEFAULT 0,		--单独阶梯提奖品种销售额，目前只有23-保健品类
--	cstjje decimal(14,2) default 0		--超市商品单独提奖，09-超市商品
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

--------- 虚拟商品，不参加提奖 挂号、煎药等费用
--CREATE TABLE #sp
--(
--	spbh NVARCHAR(16),
--	flag TINYINT NULL DEFAULT 0
--)
--INSERT INTO #sp( spbh)
--SELECT spbh FROM t_spxx WHERE spbh LIKE '99998%'
--INSERT INTO #sp(spbh)
--SELECT spbh FROM t_spxx WHERE spbh LIKE '99999%'

---------保健品类 单独提奖 2017.1.11
----INSERT INTO #sp(spbh,flag)
----SELECT spbh,1 FROM t_spxx WHERE lbbh = '23' --经营类别是23的全部商品，单独提奖

-------超市类 单独提奖 2017.12.21
--INSERT INTO #sp(spbh,flag)
--SELECT spbh,2 FROM t_spxx WHERE lbbh = '09' --经营类别是09的超市类全部商品，单独提奖


---- A类
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

----B类
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

----c类
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
--where --t_lslrl.NameText='C' AND		--要减去全部的提奖类品种
--convert(char(6),t_lsdzb.rq,112) = @rq
--GROUP BY t_lsdmxb.YYYBH

----2017.7.4  都改成偏连接模式
--UPDATE a 
--SET a.cje=isnull(b.je,0)+isnull(c.je,0)+isnull(e.je,0) -isnull(d.je,0)
--FROM #t a
--left JOIN #tt b ON a.yyybh=b.yyybh
--left JOIN #tb c ON a.yyybh=c.yyybh
--left JOIN #tc d ON d.yyybh = a.yyybh
--left JOIN #ta e ON e.yyybh=a.yyybh

----单独提奖品种
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

--------阶梯提奖商品销售金额
--DELETE FROM #tt
--INSERT INTO #tt(yyybh,je)
--select a.yyybh,sum(round(( b.zdzk / 100.0 ) *  a.lsj * a.sl * (a.zk/100.0) * b.js ,2)) as hjje
--from t_lsdmxb a
--join t_lsdzb b on a.lsdbh = b.lsdbh
----join #sp c on a.spbh = c.spbh
--where convert(char(6),b.rq,112) = @rq AND a.jylb = '23'		----目前只有保健品类 2018年12月19日 08:52:31
--group by a.YYYBH
--UPDATE e
--SET e.tstjje = a.je
--FROM #t e
--JOIN #tt a ON a.yyybh = e.yyybh

--------2017.12.21 超市商品销售金额
--DELETE FROM #tt
--INSERT INTO #tt(yyybh,je)
--select a.yyybh,sum(round(( b.zdzk / 100.0 ) *  a.lsj * a.sl * (a.zk/100.0) * b.js ,2)) as hjje
--from t_lsdmxb a
--join t_lsdzb b on a.lsdbh = b.lsdbh
----join #sp c on a.spbh = c.spbh
--where convert(char(6),b.rq,112) = @rq AND a.jylb = '09'		----超市商品类别  2018年12月19日 08:53:38
--group by a.YYYBH
--UPDATE e
--SET e.cstjje = a.je
--FROM #t e
--JOIN #tt a ON a.yyybh = e.yyybh


------收款员
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

--/******************* 过程说明 *****************************************************************
--  生成养护记录
--  参数	@dh	养护编号
--        @yhr	养护人
--  结果	生成养护记录信息
--  修改	2016.10.15	养护记录增加有效期半年内商品、全部中药饮片、滞销1年的商品				
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
--	select @dh,hwbh,count(distinct spbh),0,N'合格','',N'符合要求',0,0
--	from t_chxx
--	group by hwbh
--	order by hwbh
	
--	update t_yhjlmx
--	set yhsl = sl
--	where yhjlbh = @dh
	
--	INSERT INTO t_yhjlmx(yhjlbh,hwbh,spbh,PCBH,sl,yxrq,yhsl,jl,bz,CCTJ,bhgsl,yhlx)
--	SELECT @dh,c.hwbh,c.spbh,c.PCBH,c.CHSL, c.yxrq,c.CHSL,N'合格','',N'符合要求',0,1
--	FROM t_chxx c
--	JOIN T_SPXX ts ON c.spbh=ts.spbh
--	WHERE ts.yhlx <> 0
	
--	--近效期180天的品种进入养护记录
--	INSERT INTO t_yhjlmx(yhjlbh,hwbh,spbh,PCBH,sl,yxrq,yhsl,jl,bz,CCTJ,bhgsl,yhlx)
--	SELECT @dh,c.hwbh,c.spbh,c.PCBH,c.CHSL, c.yxrq,c.CHSL,N'合格','有效期' + cast(DATEDIFF(day,GETDATE(),c.yxrq) as varchar(10)) + '天',N'符合要求',0,1
--	FROM t_chxx c
--	left JOIN t_yhjlmx ts ON c.spbh = ts.spbh AND c.pcbh = ts.pcbh AND ts.YHJLBH = @dh
--	WHERE ts.spbh IS NULL AND DATEDIFF(day,GETDATE(),c.yxrq) < 181
	
--	--中药饮片
--	INSERT INTO t_yhjlmx(yhjlbh,hwbh,spbh,PCBH,sl,yxrq,yhsl,jl,bz,CCTJ,bhgsl,yhlx)
--	SELECT @dh,c.hwbh,c.spbh,c.PCBH,c.CHSL, c.yxrq,c.CHSL,N'合格','中药饮片',N'符合要求',0,1
--	FROM t_chxx c
--	JOIN t_spxx s ON c.spbh = s.SPBH AND s.ypfl = '07'
--	left JOIN t_yhjlmx ts ON c.spbh = ts.spbh AND c.pcbh = ts.pcbh AND ts.YHJLBH = @dh
--	WHERE ts.spbh IS NULL  
	
--	--滞销1年
--	INSERT INTO t_yhjlmx(yhjlbh,hwbh,spbh,PCBH,sl,yxrq,yhsl,jl,bz,CCTJ,bhgsl,yhlx)
--	SELECT @dh,c.hwbh,c.spbh,c.PCBH,c.CHSL, c.yxrq,c.CHSL,N'合格','滞销1年',N'符合要求',0,1
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



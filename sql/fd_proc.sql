if object_id('SP_ZGSCKMX') is not null
	drop PROCEDURE SP_ZGSCKMX
GO

--分公司冲库--------------------------------------------------------------
/******************* 过程说明 *****************************************************************
  冲库过程，记录库存
  参数	@dh	养护编号
        @yhr	养护人
  结果	记录库存
  修改	2016.10.15	增加记录生产日期、到货日期				
**********************************************************************************************/
CREATE    PROCEDURE [dbo].[SP_ZGSCKMX] @sspbh varchar(10), @spcbh varchar(20), @sdjhm varchar(15), @ywrq datetime, @yxrq datetime , 
  @iywtp int, @decjg decimal(10,4), @decsl decimal(10,2), @decjine decimal(10,2), @skw varchar(6),@scrq DATETIME = NULL,@dhrq DATETIME = NULL AS
begin
	DECLARE @iordrmax int, @icount int
	declare @chsl decimal(10,2)
	declare @sl int 

	--判断是否有存货
	if @iywtp < 0
	BEGIN
		SELECT @chsl = isnull(chsl,0) FROM T_CHXX WHERE SPBH = @sspbh AND PCBH = @spcbh and hwbh = @skw
		SELECT @chsl = ISNULL(@chsl,0)
			
		IF @chsl < @decsl			
		BEGIN
			select @sl = cast(@chsl as int)
				RAISERROR ( '编号为:%s的商品的存货不够(%d)!', 16, 1, @sspbh,@sl)
				--ROLLBACK TRANSACTION
				RETURN
		END
	END
	
	IF @dhrq IS NULL 
		set @dhrq = @ywrq

	SELECT @yxrq = isnull(@yxrq,getdate())
	SELECT @iordrmax = ISNULL(MAX(ISNULL(ORDR,0)),0) + 1 FROM T_CKMX WHERE SPBH = @sspbh   --取最大顺序号
	INSERT INTO T_CKMX VALUES (@sspbh, @spcbh, @sdjhm, @iordrmax, @ywrq, @iywtp, @decjg, @decsl, @decjine, @skw)   --写入数据-T_CKMX
	SELECT @icount = ISNULL(COUNT(*),0) FROM T_CHXX WHERE SPBH = @sspbh AND PCBH = @spcbh and hwbh = @skw  
	IF @icount > 0    --发现相应的数据 (批次编号,商品编号)
	BEGIN
	  IF @iywtp >= 0   --入库操作
		BEGIN
		  IF @iywtp = 1
			UPDATE T_CHXX SET YXRQ = @yxrq, CHSL = ISNUll(CHSL,0) + @decsl, JIAG = ((chsl * jiag) + (@decsl * @decjg))/(chsl + @decsl)
			WHERE  SPBH = @sspbh AND PCBH = @spcbh and hwbh = @skw
		  ELSE
			UPDATE T_CHXX SET CHSL = ISNUll(CHSL,0) + @decsl, YXRQ = @yxrq WHERE  SPBH = @sspbh AND PCBH = @spcbh and hwbh = @skw
		END 
	  ELSE   --出库操作
		BEGIN
		  UPDATE T_CHXX SET chsl = chsl - @decsl WHERE  SPBH = @sspbh AND PCBH = @spcbh and hwbh = @skw
		END
	END
	ELSE   --没有相应数据 
	BEGIN
	  IF @iywtp >= 0  ---入库操作
		BEGIN
			IF @scrq IS NULL 
			BEGIN
				SELECT @scrq = MIN(m.scrq)
				FROM t_ckdzb z
				JOIN t_ckdmxb m ON m.ckDBH = z.ckDBH
				WHERE m.spbh = @sspbh AND pcbh = @spcbh

			END
		  INSERT INTO T_CHXX(spbh,pcbh,hwbh,chsl,yxrq,JIAG,flag,scrq,dhrq) VALUES(@sspbh, @spcbh,@skw,@decsl,@yxrq,@decjg,1,@scrq,@dhrq)
		END
	  ELSE   ---出库操作
		BEGIN
		  RAISERROR ( '编号为:%s的商品的存货不够!', 16, 1, @sspbh )
		  --ROLLBACK TRANSACTION
		  RETURN
		  
		END
	END
end


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



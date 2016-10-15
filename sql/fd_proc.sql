if object_id('SP_YHJL') is not null
	drop PROCEDURE SP_YHJL
GO

/******************* 过程说明 *****************************************************************
  生成养护记录
  参数	@dh	养护编号
        @yhr	养护人
  结果	生成养护记录信息
  修改	2016.10.15	养护记录增加有效期半年内商品、全部中药饮片、滞销1年的商品				
**********************************************************************************************/
create PROCEDURE [dbo].[SP_YHJL] @dh char(6),@yhr char(3) AS
begin

if not exists(
select *
from t_yhjlzb
where convert(char(6), yhrq,112) = @dh
)
begin

	insert into t_yhjlzb(yhjlbh,yhrq,yhr,bz)
	values(@dh,getdate(),@yhr,'')
	
	insert into t_yhjlmx(yhjlbh,hwbh,sl,yhsl,jl,bz,CCTJ,bhgsl,yhlx)
	select @dh,hwbh,count(distinct spbh),0,N'合格','',N'符合要求',0,0
	from t_chxx
	group by hwbh
	order by hwbh
	
	update t_yhjlmx
	set yhsl = sl
	where yhjlbh = @dh
	
	INSERT INTO t_yhjlmx(yhjlbh,hwbh,spbh,PCBH,sl,yxrq,yhsl,jl,bz,CCTJ,bhgsl,yhlx)
	SELECT @dh,c.hwbh,c.spbh,c.PCBH,c.CHSL, c.yxrq,c.CHSL,N'合格','',N'符合要求',0,1
	FROM t_chxx c
	JOIN T_SPXX ts ON c.spbh=ts.spbh
	WHERE ts.yhlx <> 0
	
	--近效期180天的品种进入养护记录
	INSERT INTO t_yhjlmx(yhjlbh,hwbh,spbh,PCBH,sl,yxrq,yhsl,jl,bz,CCTJ,bhgsl,yhlx)
	SELECT @dh,c.hwbh,c.spbh,c.PCBH,c.CHSL, c.yxrq,c.CHSL,N'合格','有效期' + cast(DATEDIFF(day,GETDATE(),c.yxrq) as varchar(10)) + '天',N'符合要求',0,1
	FROM t_chxx c
	left JOIN t_yhjlmx ts ON c.spbh = ts.spbh AND c.pcbh = ts.pcbh AND ts.YHJLBH = @dh
	WHERE ts.spbh IS NULL AND DATEDIFF(day,GETDATE(),c.yxrq) < 181
	
	--中药饮片
	INSERT INTO t_yhjlmx(yhjlbh,hwbh,spbh,PCBH,sl,yxrq,yhsl,jl,bz,CCTJ,bhgsl,yhlx)
	SELECT @dh,c.hwbh,c.spbh,c.PCBH,c.CHSL, c.yxrq,c.CHSL,N'合格','中药饮片',N'符合要求',0,1
	FROM t_chxx c
	JOIN t_spxx s ON c.spbh = s.SPBH AND s.ypfl = '07'
	left JOIN t_yhjlmx ts ON c.spbh = ts.spbh AND c.pcbh = ts.pcbh AND ts.YHJLBH = @dh
	WHERE ts.spbh IS NULL  
	
	--滞销1年
	INSERT INTO t_yhjlmx(yhjlbh,hwbh,spbh,PCBH,sl,yxrq,yhsl,jl,bz,CCTJ,bhgsl,yhlx)
	SELECT @dh,c.hwbh,c.spbh,c.PCBH,c.CHSL, c.yxrq,c.CHSL,N'合格','滞销1年',N'符合要求',0,1
	FROM t_chxx c
	JOIN 
	(
		SELECT e.spbh, e.pcbh
		FROM (
			SELECT cm.spbh,cm.pcbh,MAX(cz.ckrq) AS ckrq
			FROM t_ckdzb cz
			JOIN t_ckdmxb cm ON cm.CKDBH = cz.CKDBH
			JOIN t_chxx ch ON cm.spbh = ch.spbh AND ch.pcbh = cm.pcbh
			GROUP BY cm.spbh,cm.PCBH
		) e
		left JOIN 
		(
			SELECT ch.spbh,ch.pcbh,MAX(lz.rq) AS lsrq
			FROM t_lsdzb lz
			JOIN t_lsdmxb lm ON lm.LSDBH = lz.LSDBH
			JOIN t_chxx ch ON ch.SPBH = lm.SPBH AND ch.pcbh = lm.pcbh
			GROUP BY ch.spbh,ch.pcbh
		) e1 ON e1.spbh = e.spbh AND e1.pcbh = e.pcbh
		WHERE (e1.spbh IS NULL AND DATEDIFF(DAY,e.ckrq,GETDATE()) > 365) OR 
		DATEDIFF(day,e1.lsrq,GETDATE()) > 365
	) a ON a.SPBH = c.SPBH AND a.PCBH = c.PCBH
	left JOIN t_yhjlmx ts ON c.spbh = ts.spbh AND c.pcbh = ts.pcbh AND ts.YHJLBH = @dh
	WHERE ts.spbh IS NULL 
end

end 




GO



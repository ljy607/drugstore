/******************* ����˵�� *****************************************************************
  ����������¼
  ����	@dh	�������
        @yhr	������
  ���	����������¼��Ϣ
  �޸�	2016.10.15	������¼������Ч�ڰ�������Ʒ��ȫ����ҩ��Ƭ������1�����Ʒ		
		2019.06.22  1������Ч�ڵĲ���������¼	
		2021��9��22�� 10:05:58 ���Ӵ����������0������	
**********************************************************************************************/
ALTER PROCEDURE [dbo].[SP_YHJL] @dh char(6),@yhr char(3) AS
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
	select @dh,hwbh,count(distinct spbh),0,N'�ϸ�','',N'����Ҫ��',0,0
	from t_chxx 
	WHERE chsl > 0
	group by hwbh
	order by hwbh
	
	update t_yhjlmx
	set yhsl = sl
	where yhjlbh = @dh
	
	INSERT INTO t_yhjlmx(yhjlbh,hwbh,spbh,PCBH,sl,yxrq,yhsl,jl,bz,CCTJ,bhgsl,yhlx)
	SELECT @dh,c.hwbh,c.spbh,c.PCBH,c.CHSL, c.yxrq,c.CHSL,N'�ϸ�','',N'����Ҫ��',0,1
	FROM t_chxx c
	JOIN T_SPXX ts ON c.spbh=ts.spbh
	WHERE ts.yhlx <> 0 AND c.chsl > 0
	
	--��Ч�� 31 - 180���Ʒ�ֽ���������¼
	INSERT INTO t_yhjlmx(yhjlbh,hwbh,spbh,PCBH,sl,yxrq,yhsl,jl,bz,CCTJ,bhgsl,yhlx)
	SELECT @dh,c.hwbh,c.spbh,c.PCBH,c.CHSL, c.yxrq,c.CHSL,N'�ϸ�','��Ч��' + cast(DATEDIFF(day,GETDATE(),c.yxrq) as varchar(10)) + '��',N'����Ҫ��',0,1
	FROM t_chxx c
	left JOIN t_yhjlmx ts ON c.spbh = ts.spbh AND c.pcbh = ts.pcbh AND ts.YHJLBH = @dh
	WHERE ts.spbh IS NULL AND DATEDIFF(day,GETDATE(),c.yxrq) BETWEEN 31 AND 181
	AND c.chsl > 0
	
	----��ҩ��Ƭ
	--INSERT INTO t_yhjlmx(yhjlbh,hwbh,spbh,PCBH,sl,yxrq,yhsl,jl,bz,CCTJ,bhgsl,yhlx)
	--SELECT @dh,c.hwbh,c.spbh,c.PCBH,c.CHSL, c.yxrq,c.CHSL,N'�ϸ�','��ҩ��Ƭ',N'����Ҫ��',0,1
	--FROM t_chxx c
	--JOIN t_spxx s ON c.spbh = s.SPBH AND s.ypfl = '07'
	--left JOIN t_yhjlmx ts ON c.spbh = ts.spbh AND c.pcbh = ts.pcbh AND ts.YHJLBH = @dh
	--WHERE ts.spbh IS NULL  
	
	----����1��
	--INSERT INTO t_yhjlmx(yhjlbh,hwbh,spbh,PCBH,sl,yxrq,yhsl,jl,bz,CCTJ,bhgsl,yhlx)
	--SELECT @dh,c.hwbh,c.spbh,c.PCBH,c.CHSL, c.yxrq,c.CHSL,N'�ϸ�','����1��',N'����Ҫ��',0,1
	--FROM t_chxx c
	--JOIN 
	--(
	--	SELECT e.spbh, e.pcbh
	--	FROM (
	--		SELECT cm.spbh,cm.pcbh,MAX(cz.ckrq) AS ckrq
	--		FROM t_ckdzb cz
	--		JOIN t_ckdmxb cm ON cm.CKDBH = cz.CKDBH
	--		JOIN t_chxx ch ON cm.spbh = ch.spbh AND ch.pcbh = cm.pcbh
	--		GROUP BY cm.spbh,cm.PCBH
	--	) e
	--	left JOIN 
	--	(
	--		SELECT ch.spbh,ch.pcbh,MAX(lz.rq) AS lsrq
	--		FROM t_lsdzb lz
	--		JOIN t_lsdmxb lm ON lm.LSDBH = lz.LSDBH
	--		JOIN t_chxx ch ON ch.SPBH = lm.SPBH AND ch.pcbh = lm.pcbh
	--		GROUP BY ch.spbh,ch.pcbh
	--	) e1 ON e1.spbh = e.spbh AND e1.pcbh = e.pcbh
	--	WHERE (e1.spbh IS NULL AND DATEDIFF(DAY,e.ckrq,GETDATE()) > 365) OR 
	--	DATEDIFF(day,e1.lsrq,GETDATE()) > 365
	--) a ON a.SPBH = c.SPBH AND a.PCBH = c.PCBH
	--left JOIN t_yhjlmx ts ON c.spbh = ts.spbh AND c.pcbh = ts.pcbh AND ts.YHJLBH = @dh
	--WHERE ts.spbh IS NULL 
	
end

end 



GO




--�ֵ�ִ��

/******************* ����˵�� *****************************************************************
  ����Ч�ڴ�����¼
  ����	@cxr	������
		@zgr   	�ʹ�Ա
        @yhr	������
        @day	��Ч������
  ���	����Ч�ڴ�����¼��Ϣ
  �޸�	2023��3��21��	����Ϊ0��Ʒ�Ĺ���
**********************************************************************************************/
ALTER PROCEDURE [dbo].[SP_JXQCX] @cxr char(3), @zgr char(3),@yhr char(3),@day int AS
begin

declare @dh char(6)

select @dh = convert(char(6),getdate(),112)

--һ����ֻ������һ��������
if not exists(
select *
from t_cxzb
where cxdbh = @dh
)
begin
	insert into t_cxzb(cxdbh,cxrq,cxr,zgr,yhr,bz)
	values(@dh,getdate(),@cxr,@zgr,@yhr,'')
	
	insert into t_cxmxb(cxdbh,spbh,pcbh,sl,yxrq,bz)
	select @dh, a.spbh,a.pcbh,a.chsl,a.yxrq,''
	from t_chxx a
	join v_spxx b on b.spbh = a.spbh
	WHERE a.chsl > 0 and dateadd(day,@day,getdate()) >= yxrq and b.lbbh <> '07' and b.flag = 1
	
	IF NOT EXISTS (SELECT 1 FROM t_cxmxb WHERE cxdbh=@dh)
		DELETE FROM t_cxzb WHERE cxdbh = @dh
end

end 

GO



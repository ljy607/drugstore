--��ַ��223.72.243.38
--�˿ڣ�10187
--�û�����hjyf
--���룺  hjyf@bjkhx@2024
--���ݿ⣺ khx_wtps



--������棺
select * from khx.khx_wtps.dbo.v_hjyf_xkphkc

--�����ο�棺 hshjΪ������
select * from khx.khx_wtps.dbo.v_hjyf_khxspkc
--��Ʒ��Ӧ��ϵ��
select * from khx.khx_wtps.dbo.v_hjyf_spdygx
--�����ο��������Ʒ��Ӧ��ϵ��
select * 
from khx.khx_wtps.dbo.v_hjyf_khxspkc a
left join khx.khx_wtps.dbo.v_hjyf_spdygx b on a.spid=b.spid 

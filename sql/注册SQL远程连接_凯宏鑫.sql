---- ɾ�����ӷ������﷨ 
---- exec sp_dropserver 'HJWL', 'droplogins '

EXEC  sp_addlinkedserver
      @server='khx',--�����ʵķ��������� 
      @srvproduct='',
      @provider='SQLOLEDB',
      @datasrc='223.72.243.38,10187'   --Ҫ���ʵķ�����


EXEC sp_addlinkedsrvlogin
     'khx', --�����ʵķ���������
     'false',
     NULL,
     'hjyf', --�ʺ�
     'hjyf@bjkhx@2024' --����

go

select * from khx.khx_wtps.dbo.v_hjyf_xkphkc

go

/*
* 
��ַ��223.72.243.38
�˿ڣ�10187
�û�����hjyf
���룺  hjyf@bjkhx@2024
���ݿ⣺ khx_wtps


use khx_wtps
--������棺
select * from v_hjyf_xkphkc

--�����ο�棺 hshjΪ������
select * from v_hjyf_khxspkc
--��Ʒ��Ӧ��ϵ��
select * from v_hjyf_spdygx
--�����ο��������Ʒ��Ӧ��ϵ��
select * from v_hjyf_khxspkc a
left join v_hjyf_spdygx b on a.spid=b.spid 

*/


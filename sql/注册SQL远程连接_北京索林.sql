---- ɾ�����ӷ������﷨ 
 exec sp_dropserver 'bjsl', 'droplogins '

EXEC  sp_addlinkedserver
      @server='bjsl',--�����ʵķ���������  ��������
      @srvproduct='',
      @provider='SQLOLEDB',
      @datasrc='210.13.54.210,1000'   --Ҫ���ʵķ�����


EXEC sp_addlinkedsrvlogin
     'bjsl', --�����ʵķ���������
     'false',
     NULL,
     'sa', --�ʺ�
     'abcd@1234' --����

GO

-- 210.13.54.210,1000  �˺ţ�TEST001   ���룺TEST001@1   

select * from bjsl.�м��_cs.dbo.Book_�ջ���¼���ؽӿڱ�_each be

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


---- ɾ�����ӷ������﷨ 
---- exec sp_dropserver 'HJWL', 'droplogins '

EXEC  sp_addlinkedserver
      @server='HJ00',--�����ʵķ��������� 
      @srvproduct='',
      @provider='SQLOLEDB',
      @datasrc='192.168.200.254'   --Ҫ���ʵķ�����


EXEC sp_addlinkedsrvlogin
     'HJ00', --�����ʵķ���������
     'false',
     NULL,
     'sa', --�ʺ�
     'sfyd7830' --����

go

select * from HJ00.zddb.dbo.t_hosts

go


---- ɾ�����ӷ������﷨ 
---- exec sp_dropserver 'hjkf', 'droplogins '

EXEC  sp_addlinkedserver
      @server='hjgs',--�����ʵķ��������� 
      @srvproduct='',
      @provider='SQLOLEDB',
      @datasrc='192.168.15.254'   --Ҫ���ʵķ�����


EXEC sp_addlinkedsrvlogin
     'hjgs', --�����ʵķ���������
     'false',
     NULL,
     'sa', --�ʺ�
     'sfyd7830' --����

go

select * from hjgs.zddb.dbo.t_hosts

go


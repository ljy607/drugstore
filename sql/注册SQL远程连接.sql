---- 删除链接服务器语法 
---- exec sp_dropserver 'HJWL', 'droplogins '

EXEC  sp_addlinkedserver
      @server='HJ00',--被访问的服务器别名 
      @srvproduct='',
      @provider='SQLOLEDB',
      @datasrc='192.168.200.254'   --要访问的服务器


EXEC sp_addlinkedsrvlogin
     'HJ00', --被访问的服务器别名
     'false',
     NULL,
     'sa', --帐号
     'sfyd7830' --密码

go

select * from HJ00.zddb.dbo.t_hosts

go


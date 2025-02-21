---- 删除链接服务器语法 
---- exec sp_dropserver 'hjkf', 'droplogins '

EXEC  sp_addlinkedserver
      @server='hjgs',--被访问的服务器别名 
      @srvproduct='',
      @provider='SQLOLEDB',
      @datasrc='192.168.15.254'   --要访问的服务器


EXEC sp_addlinkedsrvlogin
     'hjgs', --被访问的服务器别名
     'false',
     NULL,
     'sa', --帐号
     'sfyd7830' --密码

go

select * from hjgs.zddb.dbo.t_hosts

go


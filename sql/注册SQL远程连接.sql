 --------删除链接服务器语法 
 --exec sp_dropserver 'hj07', 'droplogins '

EXEC  sp_addlinkedserver
      @server='hj3d',--被访问的服务器别名 
      @srvproduct='',
      @provider='SQLOLEDB',
      @datasrc='192.168.14.100'   --要访问的服务器


EXEC sp_addlinkedsrvlogin
     'hj3d', --被访问的服务器别名
     'false',
     NULL,
     'sa', --帐号
     'sfyd7830' --密码

go

select * from hj3d.hjdb07.dbo.t_hosts

go

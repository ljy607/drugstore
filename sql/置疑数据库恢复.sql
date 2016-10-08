/*步骤：

一、备份“置疑”数据库的数据文件，因为日志文件.ldf出错，可以只备份.mdf文件。

二、打开企业管理器（SQL Server Enterprise Manager），删除“置疑”数据库，如果提示删除错误，可以重启数据库服务器，然后再试。

三、在企业管理器中，新建同名数据库（假如数据库为test），注意建立的数据库名称，还有数据文件名要保持和原数据库一致。

四、停止数据库服务器。

五、将刚才新建数据库生成的数据库的日志文件test_log.ldf删除，用要恢复的数据库.mdf文件覆盖刚才生成的数据库数据文件test_data.mdf。

六、启动数据库服务器。此时会看到数据库test的状态为“置疑”。这时候不能对此数据库进行任何操作。

*/
use master
go
sp_configure 'allow updates',1
go
RECONFIGURE with override
GO
update sysdatabases set status=-32768 where dbid=DB_ID('test')
go
dbcc rebuild_log('test','d:\database\test_Log.LDF')
go
dbcc checkdb('test')
go
sp_dboption 'test','dbo use only','false'
go
sp_configure 'allow updates',0
go 
reconfigure with override
go
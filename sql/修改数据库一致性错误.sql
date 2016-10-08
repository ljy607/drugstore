----切断所有数据库连接
use master
declare @spid int,@str varchar(100),@dbid int,@dbname varchar(255)
set @dbname='hjdb05' --Replace with you Database Name,try it
select @dbid=dbid from master.dbo.sysdatabases WHERE name = @dbname
declare cur_spid cursor local for
select spid from master.dbo.sysprocesses where dbid=@dbid
open cur_spid
fetch from cur_spid into @spid
while @@fetch_status=0
begin
set @str='kill '+Cast(@spid as varchar(10))
exec(@str)
fetch from cur_spid into @spid
end
close cur_spid
deallocate cur_spid
GO

USE hjdb05
GO

----单用户模式
sp_dboption 'hjdb05', 'single user', 'true'
GO

DBCC CHECKTABLE('T_CKDMXB',REPAIR_REBUILD)
go
DBCC CHECKDB ('T_CKDMXB',Repair_Fast)
go

DBCC CHECKTABLE('T_CKDMXB',repair_allow_data_loss)
go

----取消单用户模式
sp_dboption 'hjdb05', 'single user', 'false'


SELECT DATABASEPROPERTY ('hjdb05','IsSingleUser')



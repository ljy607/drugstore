
-------sql2000清空日志------------
--use master 
--go
--backup  log  hjdb  with  no_log
--go
--DBCC  SHRINKdatabase  (hjdb)


-----sql2008 清空日志 hj00----------
USE [master]
GO
ALTER DATABASE hj00 SET RECOVERY SIMPLE WITH NO_WAIT
GO
ALTER DATABASE hj00 SET RECOVERY SIMPLE --简单模式
GO
USE hj00
GO
DBCC SHRINKFILE (N'zddb_Log' , 11, TRUNCATEONLY)  
GO

----这里的hj01_Log 如果不知道在sys.database_files里是什么名字的话，可以用以下注释的语句进行查询 
--USE hj00 
--GO 
--SELECT file_id, name FROM sys.database_files; 
--GO

USE [master]
GO
ALTER DATABASE hj00 SET RECOVERY FULL WITH NO_WAIT
GO
ALTER DATABASE hj00 SET RECOVERY FULL --还原为完全模式
GO

-------清空日志 hj01 -------------
--USE [master]
--GO
--ALTER DATABASE hj01 SET RECOVERY SIMPLE WITH NO_WAIT
--GO
--ALTER DATABASE hj01 SET RECOVERY SIMPLE --简单模式
--GO
--USE hj01
--GO
--DBCC SHRINKFILE (N'ydtdata_Log' , 11, TRUNCATEONLY)  
--GO

------这里的hj01_Log 如果不知道在sys.database_files里是什么名字的话，可以用以下注释的语句进行查询 
----USE hj00 
----GO 
----SELECT file_id, name FROM sys.database_files; 
----GO

--USE [master]
--GO
--ALTER DATABASE hj01 SET RECOVERY FULL WITH NO_WAIT
--GO
--ALTER DATABASE hj01 SET RECOVERY FULL --还原为完全模式
--GO


-----sql2008 清空日志 分店----------
USE [master]
GO
ALTER DATABASE hjdb05 SET RECOVERY SIMPLE WITH NO_WAIT
GO
ALTER DATABASE hjdb05 SET RECOVERY SIMPLE --简单模式
GO
USE hjdb05
GO
DBCC SHRINKFILE (N'ydtdata_Log' , 11, TRUNCATEONLY)  
GO

----这里的hj01_Log 如果不知道在sys.database_files里是什么名字的话，可以用以下注释的语句进行查询 
--USE hjdb05 
--GO 
--SELECT file_id, name FROM sys.database_files; 
--GO

USE [master]
GO
ALTER DATABASE hjdb05 SET RECOVERY FULL WITH NO_WAIT
GO
ALTER DATABASE hjdb05 SET RECOVERY FULL --还原为完全模式
GO
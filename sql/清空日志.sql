
-------sql2000�����־------------
--use master 
--go
--backup  log  hjdb  with  no_log
--go
--DBCC  SHRINKdatabase  (hjdb)


-----sql2008 �����־ hj00----------
USE [master]
GO
ALTER DATABASE hj00 SET RECOVERY SIMPLE WITH NO_WAIT
GO
ALTER DATABASE hj00 SET RECOVERY SIMPLE --��ģʽ
GO
USE hj00
GO
DBCC SHRINKFILE (N'zddb_Log' , 11, TRUNCATEONLY)  
GO

----�����hj01_Log �����֪����sys.database_files����ʲô���ֵĻ�������������ע�͵������в�ѯ 
--USE hj00 
--GO 
--SELECT file_id, name FROM sys.database_files; 
--GO

USE [master]
GO
ALTER DATABASE hj00 SET RECOVERY FULL WITH NO_WAIT
GO
ALTER DATABASE hj00 SET RECOVERY FULL --��ԭΪ��ȫģʽ
GO

-------�����־ hj01 -------------
--USE [master]
--GO
--ALTER DATABASE hj01 SET RECOVERY SIMPLE WITH NO_WAIT
--GO
--ALTER DATABASE hj01 SET RECOVERY SIMPLE --��ģʽ
--GO
--USE hj01
--GO
--DBCC SHRINKFILE (N'ydtdata_Log' , 11, TRUNCATEONLY)  
--GO

------�����hj01_Log �����֪����sys.database_files����ʲô���ֵĻ�������������ע�͵������в�ѯ 
----USE hj00 
----GO 
----SELECT file_id, name FROM sys.database_files; 
----GO

--USE [master]
--GO
--ALTER DATABASE hj01 SET RECOVERY FULL WITH NO_WAIT
--GO
--ALTER DATABASE hj01 SET RECOVERY FULL --��ԭΪ��ȫģʽ
--GO


-----sql2008 �����־ �ֵ�----------
USE [master]
GO
ALTER DATABASE hjdb05 SET RECOVERY SIMPLE WITH NO_WAIT
GO
ALTER DATABASE hjdb05 SET RECOVERY SIMPLE --��ģʽ
GO
USE hjdb05
GO
DBCC SHRINKFILE (N'ydtdata_Log' , 11, TRUNCATEONLY)  
GO

----�����hj01_Log �����֪����sys.database_files����ʲô���ֵĻ�������������ע�͵������в�ѯ 
--USE hjdb05 
--GO 
--SELECT file_id, name FROM sys.database_files; 
--GO

USE [master]
GO
ALTER DATABASE hjdb05 SET RECOVERY FULL WITH NO_WAIT
GO
ALTER DATABASE hjdb05 SET RECOVERY FULL --��ԭΪ��ȫģʽ
GO
--SELECT file_id, name FROM sys.database_files;

--1.设置数据库为单用户模式(会立即断开其他所有用户的连接)
ALTER DATABASE hjdb06
SET SINGLE_USER
WITH ROLLBACK IMMEDIATE;
GO

--2.修复数据库(允许数据丢失)
DBCC CHECKDB ('hjdb06', REPAIR_ALLOW_DATA_LOSS)

--3.单用户模式关闭(多用户模式开启)
ALTER DATABASE hjdb06
SET MULTI_USER;
GO
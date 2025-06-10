--SELECT file_id, name FROM sys.database_files;

--1.设置数据库为单用户模式(会立即断开其他所有用户的连接)
ALTER DATABASE zddb
SET SINGLE_USER
WITH ROLLBACK IMMEDIATE;
GO

--2.修复数据库(允许数据丢失)
DBCC CHECKDB ('zddb', REPAIR_ALLOW_DATA_LOSS)

--3.单用户模式关闭(多用户模式开启)
ALTER DATABASE zddb
SET MULTI_USER;
GO

/*

--查看表的问题，如果出现一致性错误时，通过命令修复表
DBCC CHECKTABLE('t_bjyj_rckmx') 
go

--1.设置数据库为单用户模式(会立即断开其他所有用户的连接)
ALTER DATABASE zddb
SET SINGLE_USER
WITH ROLLBACK IMMEDIATE;
GO

--2.修复数据库(允许数据丢失)
dbcc checktable('t_bjyj_rckmx',REPAIR_ALLOW_DATA_LOSS)
--DBCC CHECKTABLE ('t_bjyj_rckmx',repair_rebuild)

--3.单用户模式关闭(多用户模式开启)
ALTER DATABASE zddb
SET MULTI_USER;
GO
                          
                 
--REPAIR_REBUILD	重建索引并修复结构错误	索引损坏但无数据丢失风险
--REPAIR_ALLOW_DATA_LOSS	允许数据丢失修复页级错误	严重物理损坏    
--
--
------删除约束、索引 
--ALTER TABLE t_bjyj_rckmx
--DROP CONSTRAINT PK__t_bjyj_rckmx__5BED93EA;

------重建索引
--CREATE INDEX PK__t_bjyj_rckmx__5BED93EA ON t_bjyj_rckmx(bill_code,ordr);
     

*/


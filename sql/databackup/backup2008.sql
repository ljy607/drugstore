print '开始备份药店管理系统数据库，请稍后......'
GO

DECLARE  
@backupTime VARCHAR(20)		--备份时间
DECLARE  
@fileName VARCHAR(1000)		--备份路径
SELECT 
 @backupTime=(CONVERT(VARCHAR(8), GETDATE(), 112) +REPLACE(CONVERT(VARCHAR(5), GETDATE(), 114), ':', ''))   
SELECT @fileName='D:\databackup\'+@backupTime+'.bak' 
backup database hjdb2 to disk=@fileName

PRINT '备份药店管理系统数据库完成。'

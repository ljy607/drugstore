print '��ʼ����ҩ�����ϵͳ���ݿ⣬���Ժ�......'
GO

DECLARE  
@backupTime VARCHAR(20)		--����ʱ��
DECLARE  
@fileName VARCHAR(1000)		--����·��
SELECT 
 @backupTime=(CONVERT(VARCHAR(8), GETDATE(), 112) +REPLACE(CONVERT(VARCHAR(5), GETDATE(), 114), ':', ''))   
SELECT @fileName='D:\databackup\'+@backupTime+'.bak' 
backup database hjdb2 to disk=@fileName

PRINT '����ҩ�����ϵͳ���ݿ���ɡ�'

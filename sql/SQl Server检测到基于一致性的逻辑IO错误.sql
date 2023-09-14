--SELECT file_id, name FROM sys.database_files;

--1.�������ݿ�Ϊ���û�ģʽ(�������Ͽ����������û�������)
ALTER DATABASE hjdb06
SET SINGLE_USER
WITH ROLLBACK IMMEDIATE;
GO

--2.�޸����ݿ�(�������ݶ�ʧ)
DBCC CHECKDB ('hjdb06', REPAIR_ALLOW_DATA_LOSS)

--3.���û�ģʽ�ر�(���û�ģʽ����)
ALTER DATABASE hjdb06
SET MULTI_USER;
GO

/*

--�鿴������⣬�������һ���Դ���ʱ��ͨ�������޸���
DBCC CHECKTABLE('t_ckmx') 
go

--1.�������ݿ�Ϊ���û�ģʽ(�������Ͽ����������û�������)
ALTER DATABASE zddb
SET SINGLE_USER
WITH ROLLBACK IMMEDIATE;
GO

--2.�޸����ݿ�(�������ݶ�ʧ)
DBCC CHECKTABLE ('t_ckmx',repair_rebuild)

--3.���û�ģʽ�ر�(���û�ģʽ����)
ALTER DATABASE zddb
SET MULTI_USER;
GO
                          
                          

*/


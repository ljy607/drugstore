
------sql2008R2 EXPRESS �汾�������ݿ�ű�
----1.�鿴SQL �汾:

--select @@VERSION 
----���Կ��� Express Edition ������Ѱ�

----Microsoft SQL Server 2008 R2 (SP2) - 10.50.4000.0 (X64)   Jun 28 2012 08:36:30   
----Copyright (c) Microsoft Corporation  Express Edition (64-bit) on 
----Windows NT 6.1 <X64> (Build 7601: Service Pack 1) (Hypervisor)

----2. sqlserver 2008 r2 express�汾�ǲ����Զ����ݹ��ܵ�, ������Ҫ�ֶ�дsql�ű�, �͸�ϵͳ��Ӽƻ�������ִ��

----3. ����Ҫ��ű��ݵķ����´���Ŀ¼, ����D:\databackup. ���ýű�����Ϊ JFSuQian.sql , 
----Ȼ��ŵ�D:\databackup��, �����ǽű�����:

--print ����ʼ�����ռ����ݿ⡮
GO  
DECLARE  
@backupTime VARCHAR(20)  --����ʱ��
DECLARE  
@fileName VARCHAR(1000)    --����·��
SELECT 
 @backupTime=(CONVERT(VARCHAR(8), GETDATE(), 112) +REPLACE(CONVERT(VARCHAR(5), GETDATE(), 114), ��:��, ����))   
SELECT @fileName=��D:\databackup\JFSuQian_��+@backupTime+��.bak�� 
backup database ���ݿ����� to disk=@fileName 
--print ����ʼ�����ռ����ݿ⡮
--

----4. ����bat�ļ�,���������⽨��һ��txt���ı��ļ�, �������������, Ȼ�󽫸�txt���ı��ļ�, ����ΪJFSuQian.bat, Ҳ�ŵ�D:\databackupĿ¼��

----cd C:\Program Files\Microsoft SQL Server\100\Tools\Binn  
----sqlcmd -S . -i D:\databackup\JPKFSuQian.sql
----����:
----��һ��: �����SqlServer�İ�װ·��
----���ڶ���: ��Ҫִ�е�sql�ű�·��, ��������ǰ��д���Ǹ����ݽű�

----5. ����ɾ�����ݵ�bat�ļ�, �����Ĳ�һ��, ���������⽨��һ��txt�ı��ļ�, ������������, Ȼ�󽫸�txt�ļ�, ����Ϊdel_4_bak.bat, Ҳ�ŵ�D:\databackup

----forfiles /p C:\SqlDataBack\JPKF_DATA_BACKUP /m *.bak /d -4 /c "cmd /c del /f @path"
----  ����: /p   �ڸ�·��������Ҫ�������ļ�

----          /m    ��������. Ĭ��ƥ������

----          /d    ʹ���������������ļ�. Ĭ�ϲ���Ϊ+. Ĭ�ϵ�λΪ ��

----          /c    ��Ҫִ�е�cmd����,����ʹ�á���������,  ����Ĭ�������� "cmd /c echo @file"[�����ļ�������]

----6. ����׼�����������, �����������ƻ�����, ����ÿ��ִ��

----�����������Ͻ�(Сͼ��)�������ߡ�����ƻ�����(��ͼ), ����Ĳ�������:
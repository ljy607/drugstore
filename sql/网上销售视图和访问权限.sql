 ----STOCK | �������
 ----TRIPARTITE_ERP_ID |��Ʒid
 ----MEDICINE_NAME  |��Ʒ����
 ----SPEC       |���
 ----MANUFACTURER  |��������
 ----PHARMACY_ID  |ҩ��id
 ----COST_PRICE      |�ɱ���
 ----RETAIL_PRICE  |���ۼ�
 ----GOODS_BARCODE    |��Ʒ����
 ----APPROVAL_NUMBER 
 
 --CREATE VIEW view_o2o_stock AS   
 --SELECT e.chsl AS STOCK, e.spbh AS TRIPARTITE_ERP_ID,e2.pm AS MEDICINE_NAME,e2.gg AS SPEC,e2.CJMC AS MANUFACTURER,
 --'3807' AS PHARMACY_ID,e1.hyj AS COST_PRICE,e1.lsj AS RETAIL_PRICE,e2.spbm AS GOODS_BARCODE,
 --e2.PZWH AS APPROVAL_NUMBER
 --FROM t_chxx e
 --JOIN t_jgxx e1 ON e1.SPBH = e.SPBH
 --JOIN v_spxx e2 ON e2.SPBH = e1.SPBH
 
 --GO
 

 ----���ֻ�������ָ������û�
 ----������¼�û����û� ���� ���ݿ�
exec sp_addlogin 'ds','wsxs2019#','hjdb07'
GO
-----���û����뵽��ǰ���ݿ�
exec sp_grantdbaccess 'ds'
GO

----grant select/update/delete on   TABLEA/VIEWB  to test  >>�����û������ѯ/����/ɾ�� ��TABLEA��Ȩ�޻���ͼVIEWB��Ȩ��
GRANT SELECT ON dbo.view_o2o_stock TO ds
GO

-------������ɫ
--EXEC sp_addrole 'dsread_role' ;  
--GO
 
------����select��Ȩ�޸���ɫdsread_role  
--GRANT SELECT ON dbo.view_o2o_stock TO dsread_role
--GO
  
------����ɫdsread_role�����ds  
--EXEC sp_addrolemember 'dsread_role','ds';  


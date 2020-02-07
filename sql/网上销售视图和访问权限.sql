 ----STOCK | 库存数量
 ----TRIPARTITE_ERP_ID |商品id
 ----MEDICINE_NAME  |商品名称
 ----SPEC       |规格
 ----MANUFACTURER  |生产厂家
 ----PHARMACY_ID  |药店id
 ----COST_PRICE      |成本价
 ----RETAIL_PRICE  |销售价
 ----GOODS_BARCODE    |商品条码
 ----APPROVAL_NUMBER 
 
 --CREATE VIEW view_o2o_stock AS   
 --SELECT e.chsl AS STOCK, e.spbh AS TRIPARTITE_ERP_ID,e2.pm AS MEDICINE_NAME,e2.gg AS SPEC,e2.CJMC AS MANUFACTURER,
 --'3807' AS PHARMACY_ID,e1.hyj AS COST_PRICE,e1.lsj AS RETAIL_PRICE,e2.spbm AS GOODS_BARCODE,
 --e2.PZWH AS APPROVAL_NUMBER
 --FROM t_chxx e
 --JOIN t_jgxx e1 ON e1.SPBH = e.SPBH
 --JOIN v_spxx e2 ON e2.SPBH = e1.SPBH
 
 --GO
 

 ----添加只允许访问指定表的用户
 ----创建登录用户，用户 密码 数据库
exec sp_addlogin 'ds','wsxs2019#','hjdb07'
GO
-----将用户加入到当前数据库
exec sp_grantdbaccess 'ds'
GO

----grant select/update/delete on   TABLEA/VIEWB  to test  >>给该用户赋予查询/更新/删除 表TABLEA的权限或试图VIEWB的权限
GRANT SELECT ON dbo.view_o2o_stock TO ds
GO

-------创建角色
--EXEC sp_addrole 'dsread_role' ;  
--GO
 
------分配select的权限给角色dsread_role  
--GRANT SELECT ON dbo.view_o2o_stock TO dsread_role
--GO
  
------将角色dsread_role分配给ds  
--EXEC sp_addrolemember 'dsread_role','ds';  



update T_DBDZB
set djhm = substring(DBDBH,1,7)+ '0' + substring(DBDBH,8,3)
where len(djhm) = 10 

update T_DBDMXB
set djhm = substring(DBDBH,1,7)+ '0' + substring(DBDBH,8,3)
where len(djhm) = 10 

update T_ckmx
set djhm = substring(DJHM,1,7)+ '0' + substring(DJHM,8,3)
where len(djhm) = 10 and substring(djhm,1,2)='DB'; 



alter table T_BSDMXB 
Add YXRQ DateTime null



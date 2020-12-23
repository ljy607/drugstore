--# 查询字段备注信息
SELECT A.name AS table_name,B.name AS column_name,C.value AS column_description
FROM sys.tables A INNER JOIN sys.columns B
ON B.object_id = A.object_id LEFT JOIN sys.extended_properties C
ON C.major_id = B.object_id AND C.minor_id = B.column_id
WHERE A.name ='t_jz'


------sqlserver 查询某个表的列名称、说明、备注、类型等
SELECT 
    表名       = case when a.colorder=1 then d.name else '' end,
    表说明     = case when a.colorder=1 then isnull(f.value,'') else '' end,
    字段序号   = a.colorder,
    字段名     = a.name,
    字段说明   = isnull(g.[value],'')
FROM     syscolumns a
left join    systypes b on    a.xusertype=b.xusertype
inner join    sysobjects d on     a.id=d.id  and d.xtype='U' and  d.name<>'dtproperties'
left join     syscomments e on    a.cdefault=e.id
left join sys.extended_properties   g on     a.id=G.major_id and a.colid=g.minor_id  
left join sys.extended_properties f on     d.id=f.major_id and f.minor_id=0
where  d.name='t_chxx_tbjl'    --如果只查询指定表,加上此where条件，tablename是要查询的表名；去除where条件查询所有的表信息
order by  a.id,a.colorder


--------为字段添加注释
--------Eg. execute sp_addextendedproperty 'MS_Description','字段备注信息','user','dbo','table','字段所属的表名','column','添加注释的字段名';
--execute sp_addextendedproperty 'MS_Description','入机金额','user','dbo','table','t_jz','column','je';
--execute sp_addextendedproperty 'MS_Description','未入机金额','user','dbo','table','t_jz','column','jewr';
--execute sp_addextendedproperty 'MS_Description','刷卡金额','user','dbo','table','t_jz','column','jefxj';
--execute sp_addextendedproperty 'MS_Description','用券金额','user','dbo','table','t_jz','column','jeyq';
--execute sp_addextendedproperty 'MS_Description','支票金额','user','dbo','table','t_jz','column','jezp';
--execute sp_addextendedproperty 'MS_Description','微信金额','user','dbo','table','t_jz','column','jeweixin';
--execute sp_addextendedproperty 'MS_Description','支付宝金额','user','dbo','table','t_jz','column','jezhifubao';
--execute sp_addextendedproperty 'MS_Description','其他金额','user','dbo','table','t_jz','column','jeqita';
--execute sp_addextendedproperty 'MS_Description','医保金额','user','dbo','table','t_jz','column','jeyibao';
--execute sp_addextendedproperty 'MS_Description','微信手机金额','user','dbo','table','t_jz','column','jeweixinsj';
--execute sp_addextendedproperty 'MS_Description','支付宝手机金额','user','dbo','table','t_jz','column','jezhifubaosj';
--execute sp_addextendedproperty 'MS_Description','待付金额','user','dbo','table','t_jz','column','jedaifu';
--execute sp_addextendedproperty 'MS_Description','现金金额','user','dbo','table','t_jz','column','jexj';
 
--修改字段注释
--execute sp_updateextendedproperty 'MS_Description','add by liyc.','user','dbo','table','DiagRecord','column','DiagTypeCode';

--# ��ѯ�ֶα�ע��Ϣ
SELECT A.name AS table_name,B.name AS column_name,C.value AS column_description
FROM sys.tables A INNER JOIN sys.columns B
ON B.object_id = A.object_id LEFT JOIN sys.extended_properties C
ON C.major_id = B.object_id AND C.minor_id = B.column_id
WHERE A.name ='t_jz'


------sqlserver ��ѯĳ����������ơ�˵������ע�����͵�
SELECT 
    ����       = case when a.colorder=1 then d.name else '' end,
    ��˵��     = case when a.colorder=1 then isnull(f.value,'') else '' end,
    �ֶ����   = a.colorder,
    �ֶ���     = a.name,
    �ֶ�˵��   = isnull(g.[value],'')
FROM     syscolumns a
left join    systypes b on    a.xusertype=b.xusertype
inner join    sysobjects d on     a.id=d.id  and d.xtype='U' and  d.name<>'dtproperties'
left join     syscomments e on    a.cdefault=e.id
left join sys.extended_properties   g on     a.id=G.major_id and a.colid=g.minor_id  
left join sys.extended_properties f on     d.id=f.major_id and f.minor_id=0
where  d.name='t_chxx_tbjl'    --���ֻ��ѯָ����,���ϴ�where������tablename��Ҫ��ѯ�ı�����ȥ��where������ѯ���еı���Ϣ
order by  a.id,a.colorder


--------Ϊ�ֶ����ע��
--------Eg. execute sp_addextendedproperty 'MS_Description','�ֶα�ע��Ϣ','user','dbo','table','�ֶ������ı���','column','���ע�͵��ֶ���';
--execute sp_addextendedproperty 'MS_Description','������','user','dbo','table','t_jz','column','je';
--execute sp_addextendedproperty 'MS_Description','δ������','user','dbo','table','t_jz','column','jewr';
--execute sp_addextendedproperty 'MS_Description','ˢ�����','user','dbo','table','t_jz','column','jefxj';
--execute sp_addextendedproperty 'MS_Description','��ȯ���','user','dbo','table','t_jz','column','jeyq';
--execute sp_addextendedproperty 'MS_Description','֧Ʊ���','user','dbo','table','t_jz','column','jezp';
--execute sp_addextendedproperty 'MS_Description','΢�Ž��','user','dbo','table','t_jz','column','jeweixin';
--execute sp_addextendedproperty 'MS_Description','֧�������','user','dbo','table','t_jz','column','jezhifubao';
--execute sp_addextendedproperty 'MS_Description','�������','user','dbo','table','t_jz','column','jeqita';
--execute sp_addextendedproperty 'MS_Description','ҽ�����','user','dbo','table','t_jz','column','jeyibao';
--execute sp_addextendedproperty 'MS_Description','΢���ֻ����','user','dbo','table','t_jz','column','jeweixinsj';
--execute sp_addextendedproperty 'MS_Description','֧�����ֻ����','user','dbo','table','t_jz','column','jezhifubaosj';
--execute sp_addextendedproperty 'MS_Description','�������','user','dbo','table','t_jz','column','jedaifu';
--execute sp_addextendedproperty 'MS_Description','�ֽ���','user','dbo','table','t_jz','column','jexj';
 
--�޸��ֶ�ע��
--execute sp_updateextendedproperty 'MS_Description','add by liyc.','user','dbo','table','DiagRecord','column','DiagTypeCode';

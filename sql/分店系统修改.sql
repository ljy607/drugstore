-----------2018��9��25�� 14:27:31----------------------
----���Ӱ�ӪҵԱ����ͳ������ë��-----
--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES(21,'�������ݷ���',2,2,'�������ݷ���','image\tom_wap.gif','w_tjfx_ls',1,1,0)


----------2018��8��31�� 18:00:45 --------------
-------��Ʒ���� ������ҵ���֤��
--ALTER TABLE t_spxx 
--ADD scqyxkzh NVARCHAR(32) NULL		----������ҵ���֤��

--ALTER TABLE t_jz
--ADD jeyibao	DECIMAL(18,2) NULL			----ҽ��֧�����


-----------2018��4��2�� 10:34:51---------------
--------��Ʒ��Ϣ����������Ч�ڣ���׼�ĺ���Ч��
--ALTER TABLE t_spxx 
--ADD sxyxq DATETIME NULL,   ----������Ч��
--pzwhyxq DATETIME NULL  ----��׼�ĺ���Ч��


------------2017��5��19�� 18:18:11---------------
----�޸�Ҫ���ƻ����yhsl�ľ���
--ALTER TABLE t_yhjhmx
--ALTER COLUMN yhsl DECIMAL(10,2) NOT NULL

------------2017��4��30�� 17:29:36--------------------
----�˿ⵥ������������
--ALTER TABLE t_tkdmxb 
--ADD scrq DATETIME NULL

-----�������� ΢�š�֧����������������
--ALTER TABLE t_jz
--ADD jeweixin MONEY NULL, jezhifubao MONEY NULL, jeqita MONEY NULL

--CREATE FUNCTION [dbo].[fn_cfmxConcat](@district nvarchar(255)) 
--RETURNS varchar(8000) 
--AS 
--BEGIN -----������ϸҩƷ��ת��
--    DECLARE @str varchar(8000) 
--    SET @str = '' 
  
--    SELECT @str = @str + ' ' + left(e3.pm + '   ',5) + RIGHT('    ' + cast(e1.sl AS VARCHAR(4)),4) + ' g'
--	FROM t_ys_cfmx e1
--	JOIN t_spxx e3 ON e3.spbh=e1.spbh
--	WHERE e1.cfid = @district
    
--    RETURN STUFF( @str, 1, 1, '') 
--END 
--GO 

------------2017��3��31�� 18:36:31-----------------
----Ҫ���ƻ����Ӳ���
--ALTER TABLE t_yhjhmx 
--ADD cd NVARCHAR(16) NULL

---------2017��3��8�� 15:52:45-----------
----�ֵ���ⵥ���Ӳ����ֶΣ���¼��Ƭ�Ĳ���
--ALTER TABLE t_ckdmxb 
--ADD cd NVARCHAR(16) NULL

----��Ʒ��Ϣ���ӹ�������
--ALTER TABLE T_SPXX
--ADD gnzz NVARCHAR(64) NULL	--��������

---------2017��1��8�� 17:53:25-----------
------�ֵ����Ӿ����ѯ����-------------------
--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES(11,'�����ѯ',4,2,'�����ѯ','image\tom_wap.gif','w_jlcx',1,1,0)


---------2016��10��15��-------------------
----���ⵥ�����������ڡ����˱�־
--ALTER TABLE T_CKDMXB
--ADD scrq DATETIME NULL,fhflag TINYINT NULL

----�����Ϣ�����������ڡ�����ʱ��
--ALTER TABLE T_CHXX
--ADD scrq DATETIME NULL, dhrq DATETIME NULL

--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES(26,'����Աȷ���ջ�',1,2,'����Աȷ���ջ�','image\tom_wap.gif','w_ckdrk',1,1,0)

------��ҩ��Ʒ����������������¼����������
--ALTER TABLE T_FYSP
--ADD sl INT NULL,	--������������		
--lx TINYINT NULL		--���� 1-��ҩ��¼ 2-��Ƭ��������������¼
--GO
--UPDATE T_FYSP
--SET lx = 1


------------------------------------------------------------------
--2016��8��24�� 08:46:39----------------------------------
---������ϸ���¼��Ӫ��𣬱��ڵ�����Ӫ���Ӱ����ʷ�ά����-----
--

--ALTER TABLE t_lsdmxb 
--ADD jylb NVARCHAR(2) NULL ----��Ӧt_spxx���lbbh
--GO

--UPDATE m SET jylb = s.LBBH
--FROM t_lsdmxb m
--JOIN t_spxx s ON m.spbh = s.SPBH
--JOIN t_lsdzb z ON z.LSDBH = m.LSDBH
--WHERE z.rq > '2016-8-23' AND m.jylb IS NULL



                          
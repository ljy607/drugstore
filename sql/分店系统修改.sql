------------2019��3��1�� 09:48:06---------------
------�����ؼ���Ʒά������
--CREATE TABLE t_spxx_tj
--(
--	spbh NVARCHAR(10) NOT NULL,
--	PRIMARY KEY(spbh)
--)

-------------2019��2��25�� 10:34:52-----------------
------��˾������Ա�ֵ�����ڼ�¼ͬ����ʷ�ͻ������
--ALTER TABLE t_member
--ADD tbflag TINYINT NULL DEFAULT 0 ;

--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('02','ͬ����Ա��Ϣ',5,0,'ͬ����Ա��Ϣ','image\tom_wap.gif','w_member_tbsj',1,1,0)


------------2019��2��22�� 14:25:26-----------
--------��Ʒ��Ϣ���Ӿ��鷶Χ�����ڿ���ĳЩ��Ʒ���ܳ��⵽ĳ���ֵ�------------
--SET IDENTITY_INSERT t_options ON
--INSERT INTO t_options(id,pid, code, name, note, sort)
--VALUES(7,0,'jyfw',N'��Ӫ��Χ',N'��Ӫ��Χ',200)
--SET IDENTITY_INSERT t_options OFF

------�ֵ꾭Ӫ��Χ
--CREATE TABLE t_dwxx_jyfw
--(
--	id INT IDENTITY(1,1) NOT NULL,
--	dwbh VARCHAR(3) NOT NULL,
--	jyfwid INT NOT NULL,
--  flag TINYINT NULL,
--	PRIMARY KEY(id)
--)

--INSERT INTO t_options(pid, code, name, note, sort)
--VALUES(7,'1',N'ҩƷ',N'ҩƷ',200)
--INSERT INTO t_options(pid, code, name, note, sort)
--VALUES(7,'2',N'��Ƭ',N'��Ƭ',200)
--INSERT INTO t_options(pid, code, name, note, sort)
--VALUES(7,'3',N'һ��ҽ����е',N'һ��ҽ����е',200)
--INSERT INTO t_options(pid, code, name, note, sort)
--VALUES(7,'4',N'����ҽ����е',N'����ҽ����е',200)
--INSERT INTO t_options(pid, code, name, note, sort)
--VALUES(7,'5',N'����ҽ����е',N'����ҽ����е',200)
--INSERT INTO t_options(pid, code, name, note, sort)
--VALUES(7,'6',N'�ٻ�',N'�ٻ�',200)
--INSERT INTO t_options(pid, code, name, note, sort)
--VALUES(7,'7',N'����',N'����',200)

------��Ʒ���Ӿ�Ӫ��Χ����
--ALTER TABLE T_SPXX
--ADD jyfwid INT NULL
--GO

--UPDATE s SET s.jyfwid = 2
--FROM t_spxx s
--WHERE s.SPBH LIKE '7%'

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



                          
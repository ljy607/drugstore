----------�ⲿ���۵����Ӵ��������װ�ѡ����ͷ������ֶ����� 2022��9��26�� 09:35:11 --------------------
--alter TABLE [dbo].[T_LSDZB_W]
--add dbd decimal(10,2) DEFAULT 0,
--    bzf decimal(10,2) DEFAULT 0,
--    psf decimal(10,2) DEFAULT 0;
--GO

--EXEC sp_addextendedproperty 'MS_Description', '�����', 'SCHEMA', dbo, 'table', T_LSDZB_W, 'column', dbd;
--EXEC sp_addextendedproperty 'MS_Description', '��װ��', 'SCHEMA', dbo, 'table', T_LSDZB_W, 'column', bzf;
--EXEC sp_addextendedproperty 'MS_Description', '���ͷ�', 'SCHEMA', dbo, 'table', T_LSDZB_W, 'column', psf;

---------------- ���������������۶� 2022��9��21�� 14:16:57  ------------
--ALTER TABLE t_jz
--ADD jemeituan DECIMAL(18,2) DEFAULT 0;
--GO

--EXEC sp_updateextendedproperty 'MS_Description', '���˼�¼', 'user', dbo, 'table', t_jz, null, null;
--EXEC sp_addextendedproperty 'MS_Description', '�������۶�', 'user', dbo, 'table', t_jz, 'column', jemeituan;

--------��Ʒ��Ϣ����27λ���ұ��룬����ҽ����е/�Ĳĵ�ҽ������ 2022��9��13�� 17:12:16 ------------------
--alter TABLE T_SPXX
--add gjgbbm VARCHAR(60);
--GO
--EXEC sp_addextendedproperty 'MS_Description', '���ҹ��Ĳı���;27λ���ҹ��Ĳı��룬����ҽ������', 'user', dbo, 'table', T_SPXX, 'column', gjgbbm;


----------�����ⲿ����¼�빦�� 2022��6��2�� 11:07:13 ------------------------

--IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[T_LSDZB_W]') AND type in (N'U'))
--DROP TABLE [dbo].[T_LSDZB_W];
--CREATE TABLE [dbo].[T_LSDZB_W](
--    LSDBH varchar(15) NOT NULL,
--    RQ DATETIME,
--    YSJE decimal(10,2) NOT NULL DEFAULT  (0),
--    SSJE decimal(10,2) NOT NULL DEFAULT  0,
--    DDLY varchar(10) NOT NULL,
--    WBDDBH varchar(60),
--    BZ varchar(50),
--    KPR varchar(10),
--    YXBZ tinyint,
--    PRIMARY KEY (LSDBH)
--)

--EXEC sp_addextendedproperty 'MS_Description', '�ⲿ���۶�������', 'SCHEMA', dbo, 'table', T_LSDZB_W, null, null;
--EXEC sp_addextendedproperty 'MS_Description', '���۵���', 'SCHEMA', dbo, 'table', T_LSDZB_W, 'column', LSDBH;
--EXEC sp_addextendedproperty 'MS_Description', '��������', 'SCHEMA', dbo, 'table', T_LSDZB_W, 'column', RQ;
--EXEC sp_addextendedproperty 'MS_Description', 'Ӧ�ս��', 'SCHEMA', dbo, 'table', T_LSDZB_W, 'column', YSJE;
--EXEC sp_addextendedproperty 'MS_Description', 'ʵ�ս��', 'SCHEMA', dbo, 'table', T_LSDZB_W, 'column', SSJE;
--EXEC sp_addextendedproperty 'MS_Description', '������Դ;���š�ƴ��ࡢ������', 'SCHEMA', dbo, 'table', T_LSDZB_W, 'column', DDLY;
--EXEC sp_addextendedproperty 'MS_Description', '�ⲿ�������', 'SCHEMA', dbo, 'table', T_LSDZB_W, 'column', WBDDBH;
--EXEC sp_addextendedproperty 'MS_Description', '��ע', 'SCHEMA', dbo, 'table', T_LSDZB_W, 'column', BZ;
--EXEC sp_addextendedproperty 'MS_Description', '¼����', 'SCHEMA', dbo, 'table', T_LSDZB_W, 'column', KPR;
--EXEC sp_addextendedproperty 'MS_Description', '״̬', 'SCHEMA', dbo, 'table', T_LSDZB_W, 'column', YXBZ;

--IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[T_LSDMXB_W]') AND type in (N'U'))
--DROP TABLE [dbo].[T_LSDMXB_W];
--CREATE TABLE [dbo].[T_LSDMXB_W](
--    ID INT NOT NULL IDENTITY(1,1),
--    LSDBH varchar(15) NOT NULL,
--    SPBH varchar(15) NOT NULL,
--    PCBH varchar(20),
--    SL decimal(10,2) NOT NULL DEFAULT  (0),
--    LSJ decimal(10,2) NOT NULL DEFAULT  (0),
--    YYYBH varchar(10),
--    GUIT varchar(10),
--    YSBH varchar(10),
--    JHJ decimal(10,2) DEFAULT  (0),
--    JHJHS decimal(10,2) DEFAULT  (0),
--    JYLB varchar(5),
--    PRIMARY KEY (ID)
--);

--EXEC sp_addextendedproperty 'MS_Description', '�ⲿ���۶�����ϸ��', 'SCHEMA', dbo, 'table', T_LSDMXB_W, null, null;
--EXEC sp_addextendedproperty 'MS_Description', '��ֵ', 'SCHEMA', dbo, 'table', T_LSDMXB_W, 'column', ID;
--EXEC sp_addextendedproperty 'MS_Description', '���۵���', 'SCHEMA', dbo, 'table', T_LSDMXB_W, 'column', LSDBH;
--EXEC sp_addextendedproperty 'MS_Description', '����', 'SCHEMA', dbo, 'table', T_LSDMXB_W, 'column', SPBH;
--EXEC sp_addextendedproperty 'MS_Description', '����', 'SCHEMA', dbo, 'table', T_LSDMXB_W, 'column', PCBH;
--EXEC sp_addextendedproperty 'MS_Description', '����', 'SCHEMA', dbo, 'table', T_LSDMXB_W, 'column', SL;
--EXEC sp_addextendedproperty 'MS_Description', '����', 'SCHEMA', dbo, 'table', T_LSDMXB_W, 'column', LSJ;
--EXEC sp_addextendedproperty 'MS_Description', 'ӪҵԱ���', 'SCHEMA', dbo, 'table', T_LSDMXB_W, 'column', YYYBH;
--EXEC sp_addextendedproperty 'MS_Description', '��λ', 'SCHEMA', dbo, 'table', T_LSDMXB_W, 'column', GUIT;
--EXEC sp_addextendedproperty 'MS_Description', 'ҩʦ���', 'SCHEMA', dbo, 'table', T_LSDMXB_W, 'column', YSBH;
--EXEC sp_addextendedproperty 'MS_Description', '������', 'SCHEMA', dbo, 'table', T_LSDMXB_W, 'column', JHJ;
--EXEC sp_addextendedproperty 'MS_Description', '�����', 'SCHEMA', dbo, 'table', T_LSDMXB_W, 'column', JHJHS;
--EXEC sp_addextendedproperty 'MS_Description', '��Ӫ���', 'SCHEMA', dbo, 'table', T_LSDMXB_W, 'column', JYLB;


------   ��Ʒ��Ϣ�����Ƿ��˻�����ʶ 2022��2��25�� 14:57:19 ------------------
--ALTER TABLE t_spxx 
--ADD sfth TINYINT DEFAULT 0 ;
--execute sp_addextendedproperty 'MS_Description','�Ƿ�֧���˻���','user','dbo','table','t_spxx','column','sfth';


---------------�����ڲ����� 2021��7��5�� 18:07:22 ���� 25�� δ����-----------------
--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('17','�ڲ�����',3,2,'�ڲ�����','image\tom_wap.gif','w_kfls',0,1,0)

------�޸ļ۸�״̬���� 2021��2��19�� 16:24:56
--UPDATE t_lslrl SET sx = -100,xx = 0.2 WHERE id = 1
--UPDATE t_lslrl SET sx =0.21 ,xx = 0.4 WHERE id = 2
--UPDATE t_lslrl SET sx =0.41 ,xx = 0.6 WHERE id = 3
--UPDATE t_lslrl SET sx =0.61 ,xx = 10 WHERE id = 4

--------�������Ӹ���ʱ���ֶΣ���¼������ʱ�� 2020��12��29�� 14:22:44
--ALTER TABLE t_chxx 
--ADD gxrq DATETIME DEFAULT GETDATE()
--execute sp_addextendedproperty 'MS_Description','����ʱ��','user','dbo','table','t_chxx','column','gxrq';

--UPDATE t_chxx SET gxrq = GETDATE()

--alter TRIGGER [dbo].[tri_del_chxx] ON [dbo].[T_CHXX] 
--FOR UPDATE
--AS
--UPDATE a SET a.gxrq = GETDATE()
--FROM t_chxx a
--JOIN INSERTED b ON a.spbh=b.spbh AND a.pcbh=b.pcbh AND a.hwbh=b.hwbh
--GO

--CREATE TABLE t_chxx_tbjl
--(
--	[id] [int] IDENTITY(1,1) NOT NULL,
--	tbsj DATETIME NOT NULL,		--ͬ��ʱ��
--	tbjls INT,					--ͬ����¼��
--	PRIMARY KEY(id) 
--)
--EXECUTE sp_addextendedproperty 'MS_Description', 'ͬ�������־��¼��', 'user', 'dbo', 'table', 't_chxx_tbjl', NULL;
--execute sp_addextendedproperty 'MS_Description','���ͬ��ʱ��','user','dbo','table','t_chxx_tbjl','column','tbsj';
--execute sp_addextendedproperty 'MS_Description','����¼����','user','dbo','table','t_chxx_tbjl','column','tbjls';
------��ʼ��һ��ͬ����¼
--insert into t_chxx_tbjl(tbsj) values('2020.12.28')


----------�ֵ�������� Ԥ��Ԥ������� 2020��11��10�� 17:53:33  -------
--ALTER TABLE t_jz 
--ADD yczhifubao MONEY NULL,ycweixin money,yczhifubaosj money null,ycweixinsj money null,ycxianjin money null,jeyucun money null
--execute sp_addextendedproperty 'MS_Description','Ԥ��֧����','user','dbo','table','t_jz','column','yczhifubao';
--execute sp_addextendedproperty 'MS_Description','Ԥ��֧�����ֻ�','user','dbo','table','t_jz','column','yczhifubaosj';
--execute sp_addextendedproperty 'MS_Description','Ԥ��΢��','user','dbo','table','t_jz','column','ycweixin';
--execute sp_addextendedproperty 'MS_Description','Ԥ��΢���ֻ�','user','dbo','table','t_jz','column','ycweixinsj';
--execute sp_addextendedproperty 'MS_Description','Ԥ��������','user','dbo','table','t_jz','column','jeyucun';
--execute sp_addextendedproperty 'MS_Description','Ԥ���ֽ�','user','dbo','table','t_jz','column','ycxianjin';

--------�ֵ�������� ��������¼ 2020��4��3�� 11:33:17  --------
--ALTER TABLE t_jz 
--ADD jedaifu MONEY NULL,bz NVARCHAR(128) null,jexj money null

--SET IDENTITY_INSERT t_options ON
--INSERT INTO t_options(id,pid, code, name, note, sort, flag)
--VALUES(99,0,'dkh',N'��ͻ�',N'��ͻ�',200,1)
--SET IDENTITY_INSERT t_options OFF

--SELECT * FROM t_jz WHERE isnull(jexj,0) = 0

--UPDATE t_jz
--SET jexj =  isnull(je,0) + isnull(jewr,0) - isnull(jefxj,0)  -  isnull(jeyq,0)
--  -  isnull(jezp,0)  -  isnull(jeweixin,0)  -  isnull(jezhifubao,0)
--    -  isnull(jeyibao,0)  +  isnull(jeqita,0) - isnull(jeweixinsj,0) - isnull(jezhifubaosj,0)
--    -isnull(jedaifu,0)
--WHERE isnull(jexj,0) = 0    
    

--------�ֵ��޸� 2020��2��12�� 15:36:17 ��������-------
--alter table t_ckdzb
--add flag tinyint null default 1

--alter table t_ckdmxb
--add flag tinyint null default 1

--alter table t_lsdmxb
--add flag tinyint null default 1

--alter table t_tkdzb
--add delflag tinyint null default 1

--alter table t_tkdmxb
--add delflag tinyint null default 1

--alter table t_bsdzb
--add delflag tinyint null default 1

--alter table t_bsdmxb
--add delflag tinyint null default 1

--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('140','��������',4,0,'��������','image\tom_wap.gif','w_djcx_edit',1,1,0)

-------------2019��10��30�� 10:54:51---------------------
-------�۸���Ϣ���ӵ��̼۸���Ϣ------------
--ALTER TABLE t_jgxx
--ADD dslsj DECIMAL(10,4) NULL  ----�������ۼ�
--ALTER TABLE t_bjdmxb 
--ADD jdslsj DECIMAL(10,4) NULL, dslsj DECIMAL(10,4) null                           


-----�������� ΢���ֻ���֧�����ֻ�������
--ALTER TABLE t_jz
--ADD jeweixinsj MONEY NULL, jezhifubaosj MONEY NULL


-------------2019��8��10�� 16:31:02-----------
-------------�޸Ļ�Ա���Ա���ֶγ���---------
---- ɾ������ 
--ALTER TABLE t_member DROP CONSTRAINT pk_t_member_key;
---- �޸��ֶγ���
--Alter table t_member alter column code  varchar(32) not null;
---- �������
--Alter table t_member add constraint pk_t_member_key primary key (code);

---- �޸��ֶγ���
--Alter table t_member_jfdh alter column code  varchar(32) not null;
--Alter table t_lsdzb alter column member_code  varchar(32) null;
--Alter table t_lsdzb_ls alter column member_code  varchar(32) null;


-------------2019��7��24�� 11:31:30--------------
--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('13','�޸���������',4,0,'�޸���������','image\tom_wap.gif','w_temp_lsd',1,1,0)

--------------2019��7��7�� 12:34:44-----------
------ 17.100δִ��
--ALTER TABLE t_member
--ADD wxcode NVARCHAR(32) NULL

--------------2019��5��19�� 19:46:50-----------
--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('12','�����޸�',4,0,'�����޸�','image\tom_wap.gif','w_djxg',1,1,0)

---------------2019��5��3�� 12:19:01---------------
-------�˿ⵥ�����������ҺͲ���,�����Ƭ���غ�������������
--ALTER TABLE T_TKDMXB 
--ADD cd NVARCHAR(16) NULL,sccj NVARCHAR(32) null
--ALTER TABLE T_chxx
--ADD cd NVARCHAR(16) null


---------------2019��4��18�� 17:20:14-----------
---------���ⵥ�����������ң������Ƭ�ĳ��Ҳ��̶�����
--ALTER TABLE t_ckdmxb 
--ADD sccj NVARCHAR(32) NULL

--ALTER TABLE t_chxx 
--ADD sccj NVARCHAR(32) NULL

--------------2019��4��16�� 13:28:34------------
---------�޸�ϵͳѡ�����״̬�ֶ�
--ALTER TABLE t_options
--ADD flag TINYINT null DEFAULT 1

--UPDATE t_options
--SET	flag = 1

--UPDATE t_options
--SET	flag = 0
--WHERE pid = 3 AND code = '13'


------------2019��4��14�� 12:47:05-----------
---------���ӳ��м��ƻ�����--------
--INSERT INTO t_options(pid, code, name, note, sort)
--VALUES(3,14,'���ϸ�ҩƷ��¼','���ϸ�ҩƷ��¼',0)

--CREATE TABLE [dbo].[t_bhgmxb](
--	[id] [int] IDENTITY(1,1) NOT NULL,
--	[bhgbh] [nvarchar](16) NOT NULL,
--	[spbh] [nvarchar](16) NOT NULL,
--	[pcbh] [nvarchar](16) NOT NULL,
--	[yxrq] [datetime] NOT NULL,
--	[sl] [decimal](16, 2) NOT NULL,
--	[dqcl] [decimal](16, 2) NOT NULL,
--	[jg] [decimal](16, 4) NOT NULL,
--	[hwbh] [nvarchar](8) NOT NULL,
--	[bz] [nvarchar](64) NULL,
--	[clbf] [nvarchar](16) NULL,
--PRIMARY KEY(ID)
--)
--CREATE TABLE [dbo].[t_bhgzb](
--	[bhgbh] [nvarchar](16) NOT NULL,
--	[dwbh] [char](3) NOT NULL,
--	[rq] [datetime] NOT NULL,
--	[zbr] [char](3) NOT NULL,
--	[shr] [char](3) NULL,
--	[zxr] [char](3) NULL,
--	[bz] [nvarchar](32) NULL,
--	[yxbz] [tinyint] NOT NULL,
--	PRIMARY KEY([bhgbh] )
--)
--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('29','���ϸ�ҩƷ��¼',1,0,'���ϸ�ҩƷ��¼','image\tom_wap.gif','w_bhglr',1,1,0)


--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('28','����ҩƷ���ƻ�',1,0,'����ҩƷ���ƻ�','image\tom_wap.gif','w_yhjl_jh',1,1,0)


-------------2019��4��3�� 15:44:23---------------
--------���ӳ���ҩƷ����¼����---------
--INSERT INTO t_options(pid, code, name, note, sort)
--VALUES(3,13,'����ҩƷ����¼','����ҩƷ����¼',0)

----����ҩƷ�������
--CREATE TABLE T_JCDZB
--(
--	[JCDBH] [varchar](15) NOT NULL,
--	[RQ] [datetime] NOT NULL,
--	[BZ] [nvarchar](64) NULL,
--	[ZBR] [varchar](12) NULL,
--	[FLAG] [tinyint] NULL default 0,
--	PRIMARY KEY(JCDBH)
--)
--EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ҩƷ�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_JCDZB'
------����ҩƷ�����ϸ��
--CREATE TABLE T_JCDMXB(
--	[ID] [int] IDENTITY(1,1) NOT NULL,
--	[JCDBH] [varchar](16) NOT NULL,
--	[HWBH] [varchar](8) NOT NULL,
--	[SPBH] [nvarchar](32) NULL,
--	[PCBH] [varchar](32) NULL,
--	[YXRQ] [datetime] NULL,
--	[SL] [int] NOT NULL,
--	[JCSL] [int] NOT NULL,
--	[JL] [nvarchar](128) NULL,
--	[BZ] [nvarchar](128) NULL,
--	[CCTJ] [nvarchar](32) NULL,
--	[BHGSL] [int] NULL,
--	[lx] TINYINT NULL,
--	PRIMARY KEY(ID)
--)
--EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ҩƷ�����ϸ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_JCDMXB'

------���Ӵ�������˵�-------
--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('27','����ͳ��',1,0,'����ͳ��','image\tom_wap.gif','w_timer',0,1,0)
--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('28','����ҩƷ���',4,0,'����ҩƷ���','image\tom_wap.gif','w_jcdlr',1,1,0)


--------2019��3��19�� 09:57:10----------
------�޸�������Ϣ ��ַ��Ϣ����  addr
--ALTER TABLE T_HOSTS
--ALTER COLUMN addr NVARCHAR(64) NULL
--GO

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



                          
---- 2024��3��15�� 16:59:30
ALTER TABLE t_gysxx 
ALTER COLUMN gysmc VARCHAR(100)

INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
VALUES('13','��Ӫ������',7,1,'��Ӫ������','image\tom_wap.gif','w_spjylb',1,1,0);

--ALTER TABLE t_fdyhzb 
--ALTER COLUMN bz VARCHAR(200)

--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('12','����ҩ��Խӱ�',7,3,'����ҩ��Խӱ�','image\tom_wap.gif','w_bjyjdj',1,1,0);


--ALTER table t_dwxx 
--ALTER COLUMN dwdz VARCHAR(200) NULL

--ALTER TABLE t_gysxx 
--ALTER COLUMN lxdz VARCHAR(100)

--ALTER TABLE t_gysxx 
--ALTER COLUMN sh VARCHAR(50)

--ALTER TABLE t_gysxx 
--ALTER COLUMN yhzh VARCHAR(50)

--ALTER table t_gysxx 
--ADD khh VARCHAR(100) NULL

-------��λ��Ϣ ���Ӳֿ��ַ 2024��3��4�� 17:25:09
--ALTER table t_dwxx 
--ADD ckdz VARCHAR(500) NULL

--update a set a.yjtx=1,gsprq=null,lb=RIGHT(lb,4)
--FROM T_gysxx a

-------- ��Ӧ�����Ӳֿ��ַ��Ϣ 2024��3��4�� 15:17:00
--ALTER TABLE t_gysxx 
--ADD ckdz VARCHAR(1000) NULL

--ALTER TABLE t_gysxx 
--DROP CONSTRAINT PK__T_GYSXX__30F848ED

--ALTER TABLE t_gysxx 
--ADD CONSTRAINT pk_gysbh PRIMARY KEY(gysbh)

--ALTER TABLE t_ckdzb 
--ADD srcbillcode VARCHAR(60) NULL DEFAULT ''  -- �ⲿ���� �����γ��ⵥ�� 

--/* ������ί��⣬�޸���ر����������������ӳ��� */
--ALTER TABLE t_jhdzb 
--add [srcbillcode] VARCHAR(60);	-- �ⲿ���� 
                              
--ALTER TABLE t_jhdzb
--ALTER COLUMN ysr VARCHAR(16);                          

---- �ܵ�Ҫ���ƻ� �����Ƿ��ϴ������α�־                             	
--ALTER TABLE t_yhjhzb 
--ADD isdone CHAR(1) DEFAULT 'N' NULL;        

---- �ֵ�Ҫ���ƻ� �����Ƿ��ϴ������α�־                             	
--ALTER TABLE t_fdyhzb 
--ADD isdone CHAR(1) DEFAULT 'N' NULL;  

--ALTER TABLE t_sccj 
--ALTER column cjmc VARCHAR(100) NULL;

--ALTER TABLE t_tkdzb 
--ADD isdone CHAR(1) DEFAULT 'N' ;

--ALTER TABLE t_thdzb 
--ADD isdone CHAR(1) DEFAULT 'N' ;

-- --��Ʒ��Ϣ����������ɳ������ֶ� 2023��12��14�� 14:18:33
--ALTER TABLE T_SPXX
--ADD MarketBy VARCHAR(100) NULL

------�����ⲿ���۶��� 2022��10��9�� 14:13:18  -------------------
--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('13','����������ѯ',3,1,'����������ѯ','image\tom_wap.gif','w_lsdcx_w',1,1,0);

--CREATE TABLE T_LSDZB_W(
--    fgsbh VARCHAR(15) NOT NULL,
--    LSDBH varchar(15) NOT NULL,
--    RQ datetime,
--    YSJE decimal(10,2) NOT NULL DEFAULT  (0),
--    SSJE decimal(10,2) NOT NULL DEFAULT  0,
--    dbd decimal(10,2),
--    bzf decimal(10,2),
--    psf decimal(10,2),
--    DDLY varchar(10) NOT NULL,
--    WBDDBH varchar(60),
--    BZ varchar(50),
--    KPR varchar(10),
--    YXBZ tinyint,
--    PRIMARY KEY (fgsbh,LSDBH)
--);
--go

--EXEC sp_addextendedproperty 'MS_Description', '�ⲿ���۶�������', 'user', dbo, 'table', T_LSDZB_W, null, null;
--EXEC sp_addextendedproperty 'MS_Description', '�ֵ���', 'user', dbo, 'table', T_LSDZB_W, 'column', fgsbh;
--EXEC sp_addextendedproperty 'MS_Description', '���۵���', 'user', dbo, 'table', T_LSDZB_W, 'column', LSDBH;
--EXEC sp_addextendedproperty 'MS_Description', '��������', 'user', dbo, 'table', T_LSDZB_W, 'column', RQ;
--EXEC sp_addextendedproperty 'MS_Description', 'Ӧ�ս��', 'user', dbo, 'table', T_LSDZB_W, 'column', YSJE;
--EXEC sp_addextendedproperty 'MS_Description', 'ʵ�ս��', 'user', dbo, 'table', T_LSDZB_W, 'column', SSJE;
--EXEC sp_addextendedproperty 'MS_Description', '�����', 'user', dbo, 'table', T_LSDZB_W, 'column', dbd;
--EXEC sp_addextendedproperty 'MS_Description', '��װ��', 'user', dbo, 'table', T_LSDZB_W, 'column', bzf;
--EXEC sp_addextendedproperty 'MS_Description', '���ͷ�', 'user', dbo, 'table', T_LSDZB_W, 'column', psf;
--EXEC sp_addextendedproperty 'MS_Description', '������Դ;���š�ƴ��ࡢ������', 'user', dbo, 'table', T_LSDZB_W, 'column', DDLY;
--EXEC sp_addextendedproperty 'MS_Description', '�ⲿ�������', 'user', dbo, 'table', T_LSDZB_W, 'column', WBDDBH;
--EXEC sp_addextendedproperty 'MS_Description', '��ע', 'user', dbo, 'table', T_LSDZB_W, 'column', BZ;
--EXEC sp_addextendedproperty 'MS_Description', '¼����', 'user', dbo, 'table', T_LSDZB_W, 'column', KPR;
--EXEC sp_addextendedproperty 'MS_Description', '״̬', 'user', dbo, 'table', T_LSDZB_W, 'column', YXBZ;

--CREATE TABLE T_LSDMXB_W(
--    ID int NOT NULL IDENTITY(1,1),
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
--go

--EXEC sp_addextendedproperty 'MS_Description', '�ⲿ���۶�����ϸ��', 'user', dbo, 'table', T_LSDMXB_W, null, null;
--EXEC sp_addextendedproperty 'MS_Description', '��ֵ', 'user', dbo, 'table', T_LSDMXB_W, 'column', ID;
--EXEC sp_addextendedproperty 'MS_Description', '���۵���', 'user', dbo, 'table', T_LSDMXB_W, 'column', LSDBH;
--EXEC sp_addextendedproperty 'MS_Description', '����', 'user', dbo, 'table', T_LSDMXB_W, 'column', SPBH;
--EXEC sp_addextendedproperty 'MS_Description', '����', 'user', dbo, 'table', T_LSDMXB_W, 'column', PCBH;
--EXEC sp_addextendedproperty 'MS_Description', '����', 'user', dbo, 'table', T_LSDMXB_W, 'column', SL;
--EXEC sp_addextendedproperty 'MS_Description', '����', 'user', dbo, 'table', T_LSDMXB_W, 'column', LSJ;
--EXEC sp_addextendedproperty 'MS_Description', 'ӪҵԱ���', 'user', dbo, 'table', T_LSDMXB_W, 'column', YYYBH;
--EXEC sp_addextendedproperty 'MS_Description', '��λ', 'user', dbo, 'table', T_LSDMXB_W, 'column', GUIT;
--EXEC sp_addextendedproperty 'MS_Description', 'ҩʦ���', 'user', dbo, 'table', T_LSDMXB_W, 'column', YSBH;
--EXEC sp_addextendedproperty 'MS_Description', '������', 'user', dbo, 'table', T_LSDMXB_W, 'column', JHJ;
--EXEC sp_addextendedproperty 'MS_Description', '�����', 'user', dbo, 'table', T_LSDMXB_W, 'column', JHJHS;
--EXEC sp_addextendedproperty 'MS_Description', '��Ӫ���', 'user', dbo, 'table', T_LSDMXB_W, 'column', JYLB;


--------------------�����¼���ӷ������ֶ� 2022��9��19�� 09:51:37 ---------------
--alter TABLE T_FKJLZB
--ADD ZKJE decimal(19,4) DEFAULT  0;
--GO

--EXEC sp_addextendedproperty 'MS_Description', '', 'user', dbo, 'table', T_FKJLZB, null, null;
--EXEC sp_addextendedproperty 'MS_Description', '�����¼���', 'user', dbo, 'table', T_FKJLZB, 'column', FKJLBH;
--EXEC sp_addextendedproperty 'MS_Description', '��Ӧ�̱��', 'user', dbo, 'table', T_FKJLZB, 'column', GYSBH;
--EXEC sp_addextendedproperty 'MS_Description', '��������', 'user', dbo, 'table', T_FKJLZB, 'column', FKRQ;
--EXEC sp_addextendedproperty 'MS_Description', '������', 'user', dbo, 'table', T_FKJLZB, 'column', FKJE;
--EXEC sp_addextendedproperty 'MS_Description', '�˻����', 'user', dbo, 'table', T_FKJLZB, 'column', THJE;
--EXEC sp_addextendedproperty 'MS_Description', '������', 'user', dbo, 'table', T_FKJLZB, 'column', FKR;
--EXEC sp_addextendedproperty 'MS_Description', '��ע', 'user', dbo, 'table', T_FKJLZB, 'column', BZ;
--EXEC sp_addextendedproperty 'MS_Description', '������;��������Ϊ�۳������һ���֣�ͬ�˻ؽ��', 'user', dbo, 'table', T_FKJLZB, 'column', ZKJE;

--alter TABLE t_jhpfd
--add wrje decimal(18,2) DEFAULT 0;
--GO

--EXEC sp_addextendedproperty 'MS_Description', '����Ʊ����', 'user', dbo, 'table', t_jhpfd, null, null;
--EXEC sp_addextendedproperty 'MS_Description', '', 'user', dbo, 'table', t_jhpfd, 'column', id;
--EXEC sp_addextendedproperty 'MS_Description', '��Ӧ�̱��', 'user', dbo, 'table', t_jhpfd, 'column', gysbh;
--EXEC sp_addextendedproperty 'MS_Description', '��Ӧ������', 'user', dbo, 'table', t_jhpfd, 'column', gysmc;
--EXEC sp_addextendedproperty 'MS_Description', '��������', 'user', dbo, 'table', t_jhpfd, 'column', jhrq;
--EXEC sp_addextendedproperty 'MS_Description', '��Ʊ����', 'user', dbo, 'table', t_jhpfd, 'column', lpzs;
--EXEC sp_addextendedproperty 'MS_Description', 'Ʊ����', 'user', dbo, 'table', t_jhpfd, 'column', pmje;
--EXEC sp_addextendedproperty 'MS_Description', '����Ʒ��', 'user', dbo, 'table', t_jhpfd, 'column', ghpz;
--EXEC sp_addextendedproperty 'MS_Description', '���˽��', 'user', dbo, 'table', t_jhpfd, 'column', cjje;
--EXEC sp_addextendedproperty 'MS_Description', 'δ�ս��', 'user', dbo, 'table', t_jhpfd, 'column', wsje;
--EXEC sp_addextendedproperty 'MS_Description', 'δ��Ʒ����;0 �ѱ��棬 1 ����ˣ�2 �����', 'user', dbo, 'table', t_jhpfd, 'column', wspzs;
--EXEC sp_addextendedproperty 'MS_Description', '��־', 'user', dbo, 'table', t_jhpfd, 'column', flag;
--EXEC sp_addextendedproperty 'MS_Description', 'δ������', 'user', dbo, 'table', t_jhpfd, 'column', wrje;

--CREATE TABLE t_jhdmxb_jg(
--    id INT NOT NULL,
--    jhdbh VARCHAR(32),
--    spbh VARCHAR(32),
--    jhj decimal(18,2),
--    qjhj decimal(18,2),
--    bz VARCHAR(64),
--    PRIMARY KEY (id)
--);
--GO
--EXEC sp_addextendedproperty 'MS_Description', '�Ǽۼ�¼��ϸ��', 'user', dbo, 'table', t_jhdmxb_jg, null, null;
--EXEC sp_addextendedproperty 'MS_Description', 'ID;t_jhdmxb.id', 'user', dbo, 'table', t_jhdmxb_jg, 'column', id;
--EXEC sp_addextendedproperty 'MS_Description', '���������', 'user', dbo, 'table', t_jhdmxb_jg, 'column', jhdbh;
--EXEC sp_addextendedproperty 'MS_Description', '����', 'user', dbo, 'table', t_jhdmxb_jg, 'column', spbh;
--EXEC sp_addextendedproperty 'MS_Description', '������', 'user', dbo, 'table', t_jhdmxb_jg, 'column', jhj;
--EXEC sp_addextendedproperty 'MS_Description', '�ϴν�����', 'user', dbo, 'table', t_jhdmxb_jg, 'column', qjhj;
--EXEC sp_addextendedproperty 'MS_Description', '�Ǽ�ԭ��', 'user', dbo, 'table', t_jhdmxb_jg, 'column', bz;

--CREATE TABLE t_jhdzb_jg(
--    jhdbh VARCHAR(32) NOT NULL,
--    jhrq datetime,
--    gysbh VARCHAR(16),
--    flag tinyint DEFAULT  0,
--    PRIMARY KEY (jhdbh)
--);
--go

--EXEC sp_addextendedproperty 'MS_Description', '�Ǽۼ�¼����', 'SCHEMA', dbo, 'table', t_jhdzb_jg, null, null;
--EXEC sp_addextendedproperty 'MS_Description', '���������', 'SCHEMA', dbo, 'table', t_jhdzb_jg, 'column', jhdbh;
--EXEC sp_addextendedproperty 'MS_Description', '��������', 'SCHEMA', dbo, 'table', t_jhdzb_jg, 'column', jhrq;
--EXEC sp_addextendedproperty 'MS_Description', '��Ӧ�̱��', 'SCHEMA', dbo, 'table', t_jhdzb_jg, 'column', gysbh;
--EXEC sp_addextendedproperty 'MS_Description', '״̬', 'SCHEMA', dbo, 'table', t_jhdzb_jg, 'column', flag;

--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('15','�����Ǽ�ԭ��',2,1,'�����Ǽ�ԭ��','image\tom_wap.gif','w_jhd_jgsm',1,1,0);


------------------��Ʒ��Ϣ����ҽ����е/�Ĳĵ�27λ���ҹ��Ĳı����ֶ� 2022��9��13�� 16:44:51 ----------------
--alter TABLE T_SPXX
--add gjgbbm VARCHAR(60);
--GO
--EXEC sp_addextendedproperty 'MS_Description', '���ҹ��Ĳı���;27λ���ҹ��Ĳı��룬����ҽ������', 'user', dbo, 'table', T_SPXX, 'column', gjgbbm;

-----------���ۻ��ܱ����Ӻ�������۽�� 2022��9��7�� 14:17:52 -----------------
--alter TABLE T_LSHZB
--ADD HSJE decimal(10,2) ;
--GO

--EXEC sp_addextendedproperty 'MS_Description', '', 'user', dbo, 'table', T_LSHZB, null, null;
--EXEC sp_addextendedproperty 'MS_Description', '�ֹ�˾����', 'user', dbo, 'table', T_LSHZB, 'column', FGSBH;
--EXEC sp_addextendedproperty 'MS_Description', '��������', 'user', dbo, 'table', T_LSHZB, 'column', LSRQ;
--EXEC sp_addextendedproperty 'MS_Description', '���', 'user', dbo, 'table', T_LSHZB, 'column', ORDR;
--EXEC sp_addextendedproperty 'MS_Description', '����', 'user', dbo, 'table', T_LSHZB, 'column', SPBH;
--EXEC sp_addextendedproperty 'MS_Description', '����', 'user', dbo, 'table', T_LSHZB, 'column', PCBH;
--EXEC sp_addextendedproperty 'MS_Description', '����', 'user', dbo, 'table', T_LSHZB, 'column', SHUL;
--EXEC sp_addextendedproperty 'MS_Description', '���۽��', 'user', dbo, 'table', T_LSHZB, 'column', JINE;
--EXEC sp_addextendedproperty 'MS_Description', '������', 'user', dbo, 'table', T_LSHZB, 'column', JHJ;
--EXEC sp_addextendedproperty 'MS_Description', '����Ʊ��־', 'user', dbo, 'table', T_LSHZB, 'column', KFP;
--EXEC sp_addextendedproperty 'MS_Description', '����������', 'user', dbo, 'table', T_LSHZB, 'column', HSJE;
--GO

--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('12','�ֵ�ë������',3,1,'�ֵ�ë������','image\tom_wap.gif','w_cw_fdmlhs',1,1,0);
--go

--/***********************************************
--* ���ۼ�¼�ϴ�
--***********************************************/
--ALTER PROCEDURE [dbo].[SP_LSUPLOAD] @sdwbh varchar(12), @dtywrq datetime, @spbh varchar(16), @spcbh varchar(20)
--, @decsl decimal(8,2), @decjine decimal(8,2),@decjhj decimal(10,4),@dechsje decimal(10,2)=null
--AS
--DECLARE @iordr int
--SELECT @iordr = ISNULL(MAX(ORDR),0) + 1 FROM T_LSHZB WHERE FGSBH = @sdwbh AND LSRQ = @dtywrq
--INSERT INTO T_LSHZB(fgsbh,lsrq,ordr,spbh,pcbh,shul,jine,jhj,HSJE)
-- VALUES ( @sdwbh, @dtywrq, @iordr, @spbh, @spcbh, @decsl, @decjine,@decjhj,@dechsje )

--GO

----------------- �����¼���ӳ��� 2022��8��14�� 16:39:01 ----------------
--ALTER TABLE t_ysjl
--ADD chex VARCHAR(16) NULL;
--GO
--EXEC sp_addextendedproperty 'MS_Description', '����', 'user', dbo, 'table', t_ysjl, 'column', chex;



----------------- ��Ӧ������Ԥ���������� 2022��7��27�� 10:29:35------------------
--ALTER TABLE T_GYSXX
--ADD yjtx TINYINT DEFAULT 1;
--GO
--EXEC sp_addextendedproperty 'MS_Description', 'Ԥ������', 'user', dbo, 'table', T_GYSXX, 'column', yjtx;
--UPDATE T_GYSXX SET yjtx = 1 ;

----------------- ���ӷ�������¼ 2022��7��11�� 09:48:01  -------------------
--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('10','�������',3,0,'�������','image\tom_wap.gif','w_spxx_fk',1,1,0);

--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('11','������˲�ѯ',3,0,'�������','image\tom_wap.gif','w_spxx_fkcx',1,1,0);


--CREATE TABLE t_spxx_fkjl(
--    fkbh VARCHAR(32) NOT NULL,
--    fkrq DATETIME,
--    fkje DECIMAL(10,2),
--    zbr VARCHAR(10),
--    bz varchar(128),
--    PRIMARY KEY (fkbh)
--);
--EXEC sp_addextendedproperty 'MS_Description', '�����¼', 'user', dbo, 'table', t_spxx_fkjl, null, null;
--EXEC sp_addextendedproperty 'MS_Description', '��ֵ', 'user', dbo, 'table', t_spxx_fkjl, 'column', fkbh;
--EXEC sp_addextendedproperty 'MS_Description', '��������', 'user', dbo, 'table', t_spxx_fkjl, 'column', fkrq;
--EXEC sp_addextendedproperty 'MS_Description', '������', 'user', dbo, 'table', t_spxx_fkjl, 'column', fkje;
--EXEC sp_addextendedproperty 'MS_Description', '������', 'user', dbo, 'table', t_spxx_fkjl, 'column', zbr;
--EXEC sp_addextendedproperty 'MS_Description', '��ע', 'user', dbo, 'table', t_spxx_fkjl, 'column', bz;

----DROP TABLE IF EXISTS t_spxx_fkjlmx;
--CREATE TABLE t_spxx_fkjlmx(
--    id INT NOT NULL IDENTITY(1,1),
--    fkbh VARCHAR(32),
--    spxx_fk_id INT,
--    fkje DECIMAL(10,2),
--    jhdmxid INT,
--    jhsl decimal(10,2),
--    PRIMARY KEY (id)
--);
--EXEC sp_addextendedproperty 'MS_Description', '�����¼��ϸ', 'user', dbo, 'table', t_spxx_fkjlmx, null, null;
--EXEC sp_addextendedproperty 'MS_Description', '��ֵ', 'user', dbo, 'table', t_spxx_fkjlmx, 'column', id;
--EXEC sp_addextendedproperty 'MS_Description', '������', 'user', dbo, 'table', t_spxx_fkjlmx, 'column', fkbh;
--EXEC sp_addextendedproperty 'MS_Description', '������Ʒ', 'user', dbo, 'table', t_spxx_fkjlmx, 'column', spxx_fk_id;
--EXEC sp_addextendedproperty 'MS_Description', '������', 'user', dbo, 'table', t_spxx_fkjlmx, 'column', fkje;
--EXEC sp_addextendedproperty 'MS_Description', '��������ϸID', 'user', dbo, 'table', t_spxx_fkjlmx, 'column', jhdmxid;
--EXEC sp_addextendedproperty 'MS_Description', '��������', 'user', dbo, 'table', t_spxx_fkjlmx, 'column', jhsl;


-----���ӷ�����Ʒ��¼����¼��Ʒ�ķ������ϵ����Ϣ�����ڲ�ѯͳ�Ʒ����� 2022��3��4�� 08:59:10------------
--CREATE TABLE t_spxx_fk(
--    id INT NOT NULL IDENTITY(1,1),
--    spbh VARCHAR(32),
--    gysbh VARCHAR(10),
--    fkje DECIMAL(10,2),
--    lxr VARCHAR(16),
--    lxdh VARCHAR(16),
--    PRIMARY KEY (id)
--)
--EXEC sp_addextendedproperty 'MS_Description', '������Ʒ��¼��Ϣ', 'user', dbo, 'table', t_spxx_fk, null, null;
--EXEC sp_addextendedproperty 'MS_Description', '��ֵ', 'user', dbo, 'table', t_spxx_fk, 'column', id;
--EXEC sp_addextendedproperty 'MS_Description', '����', 'user', dbo, 'table', t_spxx_fk, 'column', spbh;
--EXEC sp_addextendedproperty 'MS_Description', '��Ӧ�̱��', 'user', dbo, 'table', t_spxx_fk, 'column', gysbh;
--EXEC sp_addextendedproperty 'MS_Description', '������;ÿ�������ķ�����', 'user', dbo, 'table', t_spxx_fk, 'column', fkje;
--EXEC sp_addextendedproperty 'MS_Description', '��ϵ��', 'user', dbo, 'table', t_spxx_fk, 'column', lxr;
--EXEC sp_addextendedproperty 'MS_Description', '��ϵ�绰', 'user', dbo, 'table', t_spxx_fk, 'column', lxdh;

--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('28','����ҩƷ',6,0,'����ҩƷ','image\tom_wap.gif','w_fkyp',1,1,0)
--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('09','�������ѯ',3,0,'�������ѯ','image\tom_wap.gif','w_fkcx',1,1,0)


--------   ��Ʒ��Ϣ�����Ƿ��˻�����ʶ 2022��2��25�� 14:57:19 ------------------
--ALTER TABLE t_spxx 
--ADD sfth TINYINT DEFAULT 0 ;
--execute sp_addextendedproperty 'MS_Description','�Ƿ�֧���˻���','user','dbo','table','t_spxx','column','sfth';


-- ��Ʒ��Ϣ��������ҩƷ��ʶ 2022��1��28�� 17:26:32 ---------------------
--ALTER TABLE t_spxx 
--ADD slyp TINYINT DEFAULT 0 ;
--execute sp_addextendedproperty 'MS_Description','����ҩƷ','user','dbo','table','t_spxx','column','slyp';

-----------------2021��9��10�� 13:26:24 ������Ӫ��ҵ���ݵ��� -----------------
--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('11','��Ӫ��ҵ����',7,0,'��Ӫ��ҵ����','image\tom_wap.gif','w_syqyspb_tz',1,1,0)


----------------2021��6��30�� 18:16:46 ���ӵ�����λ���˻����Ĺ���  --------------
--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('27','�˻���λ���˻���',6,1,'�˻���λ���˻���','image\tom_wap.gif','w_tzhw_th',0,1,0)


------------2021��4��13�� 14:55:09 ��Ʒ��Ϣ����OTC��־ ----------------
--ALTER TABLE t_spxx 
--ADD otc TINYINT DEFAULT 0

---------2021��4��6�� 13:21:30 ����������ⵥ�������� ------------------
--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('10','���۳��ⵥ����',7,0,'���۳��ⵥ����','image\tom_wap.gif','w_wdck',1,1,0)
------ ��ʼ���ֵ���Ϣ
--INSERT INTO t_dwxx(dwbh,dwmc,jc,dwdz,fzr,dyhw,gxrq,sffd)
--VALUES('201','����','����','����','001','201',getdate(),0)


---------2021��2��3�� 09:48:10 ���Ӳɹ�״̬��ϵͳѡ��ά�� --------
--UPDATE t_options SET flag = 0 WHERE id not IN(3,4,99) AND id < 101

--SET IDENTITY_INSERT t_options ON
--INSERT INTO t_options(id,pid, code, name, note, sort, flag)
--VALUES(7,0,'gnzz',N'��������',N'��������',200,1)
--SET IDENTITY_INSERT t_options OFF

--SET IDENTITY_INSERT t_options ON
--INSERT INTO t_options(id,pid, code, name, note, sort, flag)
--VALUES(8,0,'gnzz',N'�ɹ�״̬',N'�ɹ�״̬',200,1)
--SET IDENTITY_INSERT t_options OFF



------����������Ʒ��Ϣ�� 2021��2��2�� 09:48:54
--CREATE TABLE t_spxx_wangshou
--(
--	spbh NVARCHAR(32) NOT NULL,
--	jhj DECIMAL(11,2) DEFAULT 0 NOT NULL,
--	lsj DECIMAL(11,2) DEFAULT 0 NOT NULL,
--	hyj DECIMAL(11,2) DEFAULT 0 NOT NULL,
--	flag TINYINT DEFAULT 1 NOT NULL,
--	PRIMARY KEY(spbh)
--)

--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('09','������Ʒά��',7,0,'������Ʒά��','image\tom_wap.gif','w_spxx_wangshou',1,1,0)



------- �ܵ�ϵͳ�ֹ�˾������Ӹ�������  2020��12��29�� 16:24:01
--alter table t_fgskc
--add gxrq datetime default getdate()
--execute sp_addextendedproperty 'MS_Description','����ʱ��','user','dbo','table','t_fgskc','column','gxrq';

----------�ֵ�������� Ԥ��Ԥ������� 2020��11��10�� 17:53:33  -------
--ALTER TABLE t_jz 
--ADD yczhifubao MONEY NULL,ycweixin money,yczhifubaosj money null,ycweixinsj money null,ycxianjin money null,jeyucun money null
--execute sp_addextendedproperty 'MS_Description','Ԥ��֧����','user','dbo','table','t_jz','column','yczhifubao';
--execute sp_addextendedproperty 'MS_Description','Ԥ��֧�����ֻ�','user','dbo','table','t_jz','column','yczhifubaosj';
--execute sp_addextendedproperty 'MS_Description','Ԥ��΢��','user','dbo','table','t_jz','column','ycweixin';
--execute sp_addextendedproperty 'MS_Description','Ԥ��΢���ֻ�','user','dbo','table','t_jz','column','ycweixinsj';
--execute sp_addextendedproperty 'MS_Description','Ԥ��������','user','dbo','table','t_jz','column','jeyucun';
--execute sp_addextendedproperty 'MS_Description','Ԥ���ֽ�','user','dbo','table','t_jz','column','ycxianjin';

---------2020��4��10�� 12:59:24 ��������׷Ʊ��� -----
--ALTER TABLE t_jz
--ADD jezhui MONEY NULL DEFAULT 0

---------2020��4��3�� 16:20:48 ���Ӵ�ͻ���ϵͳѡ��ά�� --------
--SET IDENTITY_INSERT t_options ON
--INSERT INTO t_options(id,pid, code, name, note, sort, flag)
--VALUES(99,0,'dkh',N'��ͻ�',N'��ͻ�',200,1)
--SET IDENTITY_INSERT t_options OFF

---------2020��2��12�� 15:56:29  �����������ع���  --------------
--alter table t_ckdzb
--add flag tinyint null default 1

--alter table t_ckdmxb
--add flag tinyint null default 1

--alter table t_jhdzb
--add flag tinyint null default 1

--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('07','��������',5,0,'��������','image\tom_wap.gif','w_djcx_edit',1,1,0)

---------------2020��2��8�� 11:49:27-------------
-------������ʱ���� ��Ʒ������¼��ѯ --------
--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('30','��Ʒ������¼',4,1,'��Ʒ������¼','image\tom_wap.gif','w_jhjlcx',1,1,0)

--create nonclustered index Index_jhdmxb_spbh on t_jhdmxb(spbh)
--with(drop_existing=on)

-------------2019��10��30�� 10:54:51---------------------
-------�۸���Ϣ���ӵ��̼۸���Ϣ------------
--ALTER TABLE t_jgxx
--ADD dslsj DECIMAL(10,4) NULL  ----�������ۼ�
--ALTER TABLE t_bjdmxb 
--ADD jdslsj DECIMAL(10,4) NULL, dslsj DECIMAL(10,4) null                           
 

-------------2019��10��28�� 11:05:40-------------
---------���ӻ�Ա��Ϣ��ѯ����-------
--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('26','��Ա��Ϣ',6,0,'��Ա��Ϣ','image\tom_wap.gif','w_member',1,1,0)


-------------2019��9��16�� 15:20:10--------------
--------------��������-------------
--cREATE TABLE [dbo].[t_jz](
--	dwbh NVARCHAR(8) NOT NULL,
--	[code] [nvarchar](8) NOT NULL,
--	[rq] [datetime] NOT NULL,
--	[je] [decimal](10, 2) NOT NULL,
--	[jewr] [decimal](10, 2) NULL,
--	[jefxj] [decimal](10, 2) NULL,
--	[jeyq] [decimal](10, 2) NULL,
--	[jezp] [decimal](10, 2) NULL,
--	[jeweixin] [money] NULL,
--	[jezhifubao] [money] NULL,
--	[jeqita] [money] NULL,
--	[jeyibao] [decimal](18, 2) NULL,
--	[jeweixinsj] [money] NULL,
--	[jezhifubaosj] [money] NULL,
--	PRIMARY KEY(dwbh,code)
--)

--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('08','���۽��˼�¼',3,2,'���۽��˼�¼','image\tom_wap.gif','w_jz',1,1,0)


--------------2019��5��6�� 19:36:47 ------------------
-------�˿ⵥ���Ӹ��˺������
--ALTER TABLE T_TKDZB
--ADD fhr NVARCHAR(8) NULL
--GO
--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('34','���˷ֵ��˿�����',1,0,'���˷ֵ��˿�����','image\tom_wap.gif','w_tkdrk',1,1,0)


---------------2019��5��3�� 12:19:01---------------
-------�˿ⵥ�����������ҺͲ���,�����Ƭ���غ�������������
--ALTER TABLE T_TKDMXB 
--ADD cd NVARCHAR(16) NULL,sccj NVARCHAR(32) null
--ALTER TABLE T_chxx
--ADD cd NVARCHAR(16) NULL
--ALTER TABLE T_THDMXB 
--ADD cd NVARCHAR(16) NULL,sccj NVARCHAR(32) null
--ALTER TABLE t_thdzb
--ADD gysbh NVARCHAR(10) NULL

-----------2019��5��1�� 13:32:51---------------------
----------�����¼���ӳ��ⵥ��-----
--ALTER TABLE t_ysjl
--ADD ckdbh NVARCHAR(128) NULL
--ADD zxsl INT DEFAULT 0 NULL

-----------2019��4��19�� 20:55:36-------------
-----------���ӳ����幦��-----
--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('33','������',1,0,'������','image\tom_wap.gif','w_ckdlr_hc',1,1,0)

--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('24','��Ӧ����Ϣά��',6,0,'��Ӧ����Ϣά��','image\tom_wap.gif','w_gysxxlr',1,1,0)

--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('25','��Ӧ����Ϣ���',6,0,'��Ӧ����Ϣ���','image\tom_wap.gif','w_gysxxsh',1,1,0)


---------------2019��4��18�� 13:40:47---------------
--------���ⵥ����sccj����Ƭ���������Ҷ�Ӧ��ϵ�Ƕ�̬��----------------
--ALTER TABLE t_chxx 
--ADD sccj NVARCHAR(32) NULL

--ALTER TABLE t_ckdmxb 
--ADD sccj NVARCHAR(32) NULL



----------2019��4��14�� 15:38:15
----------�����¼--------------
--CREATE TABLE t_ysjl
--(
--	id INT IDENTITY(1,1) NOT NULL,
--	jsdw NVARCHAR(8) NULL,
--	rq DATETIME NULL,
--	cph NVARCHAR(16) NULL,
--	chek NVARCHAR(16) NULL,
--	pjfs TINYINT NULL,
--	spjs INT NULL,
--	qssj DATETIME NULL,
--	ddsj DATETIME NULL,
--	bzzk NVARCHAR(16) NULL,
--	jsr NVARCHAR(8) NULL,
--	PRIMARY KEY(id)
--)

--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('32','�����¼',1,0,'�����¼','image\tom_wap.gif','w_ysjllr',1,1,0)

--INSERT INTO t_options(pid, code, name, note, sort,flag)
--VALUES(3,19,'�����¼','�����¼',200,1)


------------2019��4��8�� 11:33:46 -----------
-----------���Ӽ��鱨���¼��-------------
--ALTER TABLE T_spxx_jybg
--ADD filePath NVARCHAR(128) NULL
--GO
--ALTER TABLE t_spxx_jybg
--alter column fileNM NVARCHAR(32) NULL
--GO
--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('29','�����ƻ�',4,3,'�����ƻ�','image\tom_wap.gif','w_yhjl_jh',1,1,0)

--SET IDENTITY_INSERT t_options ON
--INSERT INTO t_options(id,pid, code, name, note, sort, flag)
--VALUES(6,0,'wmslb',N'�ִ����',N'�ִ����',200,1)
--SET IDENTITY_INSERT t_options OFF

--INSERT INTO t_options(pid, code, name, note, sort, flag)
--VALUES(6,'NFY',N'�ڷ�ҩ',N'�ڷ�ҩ',200,1)
--INSERT INTO t_options(pid, code, name, note, sort, flag)
--VALUES(6,'HMHJ',N'��Ƽ���Ƽ�',N'��Ƽ���Ƽ�',200,1)
--INSERT INTO t_options(pid, code, name, note, sort, flag)
--VALUES(6,'WYY',N'����ҩ',N'����ҩ',200,1)
--INSERT INTO t_options(pid, code, name, note, sort, flag)
--VALUES(6,'QX',N'ҽ����е',N'ҽ����е',200,1)
--INSERT INTO t_options(pid, code, name, note, sort, flag)
--VALUES(6,'SLQX',N'����ҽ����е',N'����ҽ����е',200,1)
--INSERT INTO t_options(pid, code, name, note, sort, flag)
--VALUES(6,'RYXD',N'����Ʒ��������Ʒ',N'����Ʒ��������Ʒ',200,1)
--INSERT INTO t_options(pid, code, name, note, sort, flag)
--VALUES(6,'BJSP',N'����ʳƷ',N'����ʳƷ',200,1)
--INSERT INTO t_options(pid, code, name, note, sort, flag)
--VALUES(6,'SP',N'ʳƷ',N'ʳƷ',200,1)
--INSERT INTO t_options(pid, code, name, note, sort, flag)
--VALUES(6,'ZYYP',N'��ҩ��Ƭ',N'��ҩ��Ƭ',200,1)
--INSERT INTO t_options(pid, code, name, note, sort, flag)
--VALUES(6,'DXZYYP',N'������ҩ��Ƭ',N'������ҩ��Ƭ',200,1)


-------------2019��4��6�� 19:16:57 ------------------
-------gsp�������� ���ϸ�ҩƷ��¼ -----------
--INSERT INTO t_options(pid, code, name, note, sort,flag)
--VALUES(3,18,'���ϸ�ҩƷ��¼','���ϸ�ҩƷ��¼',190,1)

--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('31','����ͳ��',1,0,'����ͳ��','image\tom_wap.gif','w_timer',1,1,0)


------------2019��4��2�� 13:56:55-----------------
----------����������Ҫ�������ȣ�����ѡ����Ҫ����
--ALTER TABLE T_JHDZB
--ALTER COLUMN yhdbh NVARCHAR(128) NULL


------------2019��2��28�� 09:44:15-----------------
------Ҫ����ʶ��Ҫ������Ӧ��ͬ������------
--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--            fdbz, parameter)
--VALUES('05','Ҫ���ƻ�ͬ��Ҫ����־',5,1,'Ҫ���ƻ�ͬ��Ҫ����־','image\tom_wap.gif','w_yhd_tbyhbz',1,1,1,0)

--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--            fdbz, parameter)
--VALUES('06','Ҫ���ƻ�ͬ����Ӧ��',5,1,'Ҫ���ƻ�ͬ����Ӧ��','image\tom_wap.gif','w_yhd_tbgys',1,1,1,0)


-------------2019��2��25�� 10:34:52-----------------
------��˾������Ա�ֵ�����ڼ�¼ͬ����ʷ�ͻ������
--CREATE TABLE t_member_fd
--(
--	dwbh NVARCHAR(8) NOT NULL,
--	code NVARCHAR(10) NOT NULL,
--	jine DECIMAL(10,2) NULL,
--	flag TINYINT NULL DEFAULT 1,
--	PRIMARY KEY (dwbh,code)
--)

----------2019��2��22�� 17:52:58------------------
------���Ӽ��鱨����鹦��--------
--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--            fdbz, parameter)
--VALUES(14,'����Ҫ���Ա�',2,0,'���鱨��˶�','image\tom_wap.gif','w_jybghd',1,1,1,0)


-----------2019��2��21�� 17:27:42----------------
------���������Ӽ��鱨����·��--------------
--ALTER TABLE t_jhdmxb 
--ADD jybgpath NVARCHAR(128) NULL
--GO

-----------2019��2��20�� 17:00:47------------
------��λ��Ϣ���� Ӫҵִ�գ�ҩƷ��Ӫ���֤����֤���ں���Ч��
--ALTER TABLE t_dwxx 
--add yyzzfzrq DATETIME NULL,yyzzyxrq DATETIME NULL,ypjyxkzfzrq DATETIME NULL,ypjyxkzyxrq DATETIME NULL
--GO


-----------2019��2��19�� 16:02:49-----------
------����������Ҫ�����š����ⵥ���ֶΣ����ڸ���Ҫ�����Զ���ֳ��ⵥ
--ALTER TABLE t_jhdzb 
--ADD fdyhd NVARCHAR(255) NULL,fdckd NVARCHAR(255) NULL,zdfh tinyint null default 0
--GO

-----------2019��2��12�� 09:41:20---------------
------��Ա��Ϣ���Ӻ�ͬ��Ч�ڡ����֤��Ч��
--ALTER TABLE T_ZGXX
--ADD SFZYXQ DATETIME NULL,HTYXQ DATETIME NULL
--GO


----------2019��1��19�� 17:11:26------------------
------���ӽ�������Ҫ�����ȶԹ���--------
--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--            fdbz, parameter)
--VALUES(30,'����Ҫ���Ա�',1,0,'����Ҫ���Ա�','image\tom_wap.gif','w_jh4yh',1,1,1,0)



----------2018��12��20�� 15:38:02------------------
------������Ʒ��Ϣ�޸Ĺ���--------
--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--            fdbz, parameter)
--VALUES(23,'��Ʒ��Ϣ�޸�',6,0,'��Ʒ��Ϣ�޸�','image\tom_wap.gif','w_spxx_bg',0,1,1,0)


----------   2018��11��25�� 18:24:13 ---------------------------
------��۵����ӱ�۵�λ��¼��
--CREATE TABLE t_bjddw
--(
--	id INT IDENTITY(1,1) NOT NULL,
--	bjdbh NvarCHAR(10) NOT NULL,
--	dwbh NVARCHAR(10) NOT NULL,
--	flag TINYINT DEFAULT 0,
--	PRIMARY KEY(id)
--)


-----------2018��9��1�� 10:29:36 ---------
-------Ҫ���ƻ�����һ�� �Ƿ����
--ALTER TABLE T_YHJHMX
--ADD isdb TINYINT NULL		----�Ƿ����

-----------2018��7��26�� 17:29:11------------
-------������Ʒ��Ϣ��������
--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--            fdbz, parameter)
--VALUES(22,'��Ʒ��Ϣ���',6,0,'��Ʒ��Ϣ���','image\tom_wap.gif','w_spxxwh_main_sh',1,1,1,0)

-------��Ʒ���� ������ҵ���֤��
--ALTER TABLE t_spxx 
--ADD scqyxkzh NVARCHAR(32) NULL		----������ҵ���֤��

--ALTER TABLE t_jhdmxb 
--ADD scqyxkzh NVARCHAR(32) NULL		----������ҵ���֤��
 

------------2018��5��12�� 11:45:32-----------
--------��Ʒ��Ϣ���Ӿ��鷶Χ�����ڿ���ĳЩ��Ʒ���ܳ��⵽ĳ���ֵ�------------
--SET IDENTITY_INSERT t_options ON
--INSERT INTO t_options(id,pid, code, name, note, sort, flag)
--VALUES(5,0,'jyfw',N'��Ӫ��Χ',N'��Ӫ��Χ',200,1)
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

--INSERT INTO t_options(pid, code, name, note, sort, flag)
--VALUES(5,'1',N'ҩƷ',N'ҩƷ',200,1)
--INSERT INTO t_options(pid, code, name, note, sort, flag)
--VALUES(5,'2',N'��Ƭ',N'��Ƭ',200,1)
--INSERT INTO t_options(pid, code, name, note, sort, flag)
--VALUES(5,'3',N'һ��ҽ����е',N'һ��ҽ����е',200,1)
--INSERT INTO t_options(pid, code, name, note, sort, flag)
--VALUES(5,'4',N'����ҽ����е',N'����ҽ����е',200,1)
--INSERT INTO t_options(pid, code, name, note, sort, flag)
--VALUES(5,'5',N'����ҽ����е',N'����ҽ����е',200,1)
--INSERT INTO t_options(pid, code, name, note, sort, flag)
--VALUES(5,'6',N'�ٻ�',N'�ٻ�',200,1)
--INSERT INTO t_options(pid, code, name, note, sort, flag)
--VALUES(5,'7',N'����',N'����',200,1)

------��Ʒ���Ӿ�Ӫ��Χ����
--ALTER TABLE T_SPXX
--ADD jyfwid INT NULL


-----------2018��4��2�� 10:34:51---------------
--------��Ʒ��Ϣ����������Ч�ڣ���׼�ĺ���Ч��
--ALTER TABLE t_spxx 
--ADD sxyxq DATETIME NULL,   ----������Ч��
--pzwhyxq DATETIME NULL  ----��׼�ĺ���Ч��

------------2018��1��24�� 17:04:38--------------------
-------���ӹ�Ӧ�̹���ͳ�Ƶ�������
--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--            fdbz, parameter)
--VALUES(28,'����Ʒ��ͳ��',4,0,'����Ʒ��ͳ��','image\tom_wap.gif','w_jhpztj',1,1,1,0)



--------------2017��12��2�� 16:16:04---------------
----��Ʒ������ӳ�����
--INSERT INTO t_options(pid, code, name, note, sort, flag)
--VALUES(2,'09','����','��������Ʒ',200,1)

----��ʼ�����н���¼��ר���ʺ�
--INSERT INTO t_zgxx(BH, XM, XB, SYSID, XL, ZC, ZW, SFZH, BM, QX, MM, JG, LXDZ, YZBM,
--            CSRQ, DH1, DH2, JBGZ, RZSJ, LZSJ, MEMO, GXRQ, GXZ, FLAG, tjyxrq)
--SELECT '999', '���н���', XB, SYSID, XL, ZC, ZW, SFZH, BM, QX, '999', JG, LXDZ, YZBM, CSRQ, DH1,
--       DH2, JBGZ, RZSJ, LZSJ, MEMO, GXRQ, GXZ, FLAG, tjyxrq
--FROM t_zgxx
--WHERE bh = '001'


----------------2017��4��30�� 17:48:29--------------
----�˿������������
--ALTER TABLE t_tkdmxb 
--ADD scrq DATETIME NULL

----������ת���ⵥ�����������ڡ�����
--ALTER TABLE t_ckdmxb_temp
--ADD  scrq DATETIME NULL,cd NVARCHAR(16) NULL

----------------2017��3��30�� 18:32:14-----------------------------------------
----���������Ӳ����ֶΣ���¼��Ƭ�Ĳ���
--ALTER TABLE t_jhdmxb 
--ADD cd NVARCHAR(16) NULL

----Ҫ���ƻ����Ӳ���
--ALTER TABLE t_yhjhmx 
--ADD cd NVARCHAR(16) NULL


----��Ӧ������ҵ��Ա��������Ա��Ϣ
--ALTER TABLE T_GYSXX
--ADD ywyxm NVARCHAR(16) NULL,	--ҵ��Ա����
--	ywydh VARCHAR(16) NULL,		--ҵ��Ա�绰
--	ywysfzh VARCHAR(18) NULL,	--ҵ��Ա���֤
--	ywyyxq	DATETIME NULL,		--ҵ��Ա��Ч��
--	cwxm NVARCHAR(16) NULL,		--��������
--	cwdh VARCHAR(16) NULL,		--����绰
--	cwsfzh VARCHAR(18) NULL,	--�������֤
--	cwyxq DATETIME null   		--������Ч��

----------------2017��3��7�� 18:33:44-----------------------------------------
----���Ӹ����¼��ѯ
--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--            fdbz, parameter)
--VALUES('07','�����¼��ѯ',3,1,'�����¼��ѯ','image\tom_wap.gif','w_fkjl_cx',1,1,1,0)

----��ӪƷ������������׼��������ַ
--ALTER TABLE T_SYPZSPB 
--ADD scbz NVARCHAR(64) NULL, --������׼
--    scdz NVARCHAR(64) NULL  --������ַ

----��Ӫ��ҵ����ҵ��Ա��������Ա��Ϣ
--ALTER TABLE T_SYQYSPB
--ADD ywyxm NVARCHAR(16) NULL,	--ҵ��Ա����
--	ywydh VARCHAR(16) NULL,		--ҵ��Ա�绰
--	ywysfzh VARCHAR(18) NULL,	--ҵ��Ա���֤
--	ywyyxq	DATETIME NULL,		--ҵ��Ա��Ч��
--	cwxm NVARCHAR(16) NULL,		--��������
--	cwdh VARCHAR(16) NULL,		--����绰
--	cwsfzh VARCHAR(18) NULL,	--�������֤
--	cwyxq DATETIME null   		--������Ч��

----���ⵥ���Ӳ��أ���Ƭ��Ҫ���Ӳ���¼���ֶ�
--ALTER TABLE t_ckdmxb 
--ADD cd NVARCHAR(16) NULL		--��Ƭ����

----��Ʒ��Ϣ���ӹ�������
--ALTER TABLE T_SPXX
--ADD gnzz NVARCHAR(64) NULL



---------------2016��11��19�� 16:25:07----------------------
-----����ҽ��ҩƷĿ¼
--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--            fdbz, parameter)
--VALUES(21,'ҽ��ҩƷĿ¼',6,0,'ҽ��ҩƷĿ¼','image\tom_wap.gif','w_yb_spxx_main',1,1,1,0)


--------2016.10.15-----------------
-----�޸Ŀ������ҩƷ��������,��������
--ALTER TABLE t_chxx 
--ADD scrq DATETIME NULL,dhrq DATETIME

-----�޸ĳ��ⵥ����ҩƷ��������
--ALTER TABLE t_ckdmxb
--ADD scrq DATETIME NULL

------��ҩ��Ʒ����������������¼����������
--ALTER TABLE T_FYSP
--ADD sl INT NULL,	--������������		
--lx TINYINT NULL		--���� 1-��ҩ��¼ 2-��Ƭ��������������¼
--GO
--UPDATE T_FYSP
--SET lx = 1



--------2016.9.29-----------------
-----�޸�ȫ����������������
--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--            fdbz, parameter)
--VALUES(28,'����Աȷ�ϳ���',1,0,'����Աȷ�ϳ���','image\tom_wap.gif','w_ckdrk',1,1,1,0)

--ALTER TABLE t_thdzb
--ADD shr NVARCHAR(3) NULL
--GO

--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--            fdbz, parameter)
--VALUES(29,'����Աȷ���˻�',1,0,'����Աȷ���˻�','image\tom_wap.gif','w_thdrk',1,1,1,0)




--------2016.8.27----------------------------------
-----1�����е����������� 2�����е��������������� 3����Ա��λ

-------ȡ���ܵ���Ƭװ����¼
--ALTER table t_options
--ADD flag TINYINT NULL DEFAULT 1
--GO
--UPDATE t_options SET flag = 1
--GO
--UPDATE t_options SET flag = 0 WHERE id = 115
--GO

--INSERT INTO t_options(pid,code, name, note, sort,flag)
--VALUES(3,16,N'�����˻ؼ�¼','',0,1)
--GO


-------  2016.7.31 start   ---------------------
-------  ������������ 
--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--            fdbz, parameter)
--VALUES(27,'�ۺϲ�ѯ',4,0,'�ۺϲ�ѯ','image\tom_wap.gif','w_zh_report',1,1,0,0)

----ѯ�۵�ά��
--DROP TABLE T_xjdzb
--CREATE TABLE t_xjdzb
--(
--	xjdbh NVARCHAR(16) NOT NULL,
--	gysbh NVARCHAR(10) NOT NULL,
--	rq DATETIME NOT NULL,
--	bz NVARCHAR(32) NULL,
--	flag TINYINT NULL DEFAULT 0,
--	PRIMARY KEY(xjdbh)
--)

--CREATE TABLE t_xjdmxb
--(
--	xjdbh NVARCHAR(16) NOT NULL,
--	spbh NVARCHAR(16) NOT NULL,
--	jg	DECIMAL(14,4) NULL DEFAULT 0,
--	bz NVARCHAR(32),
--	PRIMARY KEY(xjdbh,spbh)
--)

--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--            fdbz, parameter)
--VALUES(23,'ѯ�۵�¼��',1,0,'ѯ�۵�¼��','image\tom_wap.gif','w_xjdlr',1,1,0,0)





----2016.7.3 start------------------------------------
----������Ʒ��Ӧ�����ƣ���Ҫ������Ƽ���ҩƷ���ƣ�Ҫ���ƻ�����Ҫ��֤�ܹ�Ӧ�����Ƶ���Ʒ��������ҲҪ��֤
--CREATE TABLE T_R_SP_GYS
--(
--	id INT IDENTITY(1,1) NOT NULL,
--	spbh NVARCHAR(16) NOT NULL,
--	gysbh NVARCHAR(16) NOT NULL,
--	PRIMARY KEY(id)
--)

--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--            fdbz, parameter)
--VALUES(20,'ҩƷ�޶���Ӧ��ά��',6,0,'ҩƷ�޶���Ӧ��ά��','image\tom_wap.gif','w_sp_gys',1,1,0,0)

-----ѡ��Ӧ�̽ű�
----SELECT z.GYSBH,min(m.jhj) AS jhj ,(select top 1 e.jhj from t_jhdmxb e join t_jhdzb e1 on e.jhdbh = e1.jhdbh 
----where e.spbh = '10114' and e1.gysbh=z.gysbh and e1.jhrq > dateadd(month,-6,getdate()) order by e1.jhrq desc ) as zhjj,
----g.gsyzrq,g.jyxkzrq,g.gsprq,g.frrq,g.xyrq
----FROM  T_JHDZB z
----join t_jhdmxb m ON m.JHDBH = z.JHDBH
----join t_gysxx g ON z.GYSBH=g.GYSBH
----WHERE m.spbh = '10114' and
----		z.jhrq > dateadd(month,-24,getdate())
----group by z.gysbh,g.gsyzrq,g.jyxkzrq,g.gsprq,g.frrq,g.xyrq

----UNION

----SELECT r.GYSBH,min(a.jhj) AS jhj ,(select top 1 e.jhj from t_jhdmxb e join t_jhdzb e1 on e.jhdbh = e1.jhdbh 
----where e.spbh = '10114' and e1.gysbh=r.gysbh and e1.jhrq > dateadd(month,-6,getdate()) order by e1.jhrq desc ) as zhjj,
----a.gsyzrq,a.jyxkzrq,a.gsprq,a.frrq,a.xyrq
----FROM t_r_sp_gys r
----left join (
----	select z.gysbh,z.JHRQ,m.jhj,m.spbh,g.gsyzrq, g.jyxkzrq, g.gsprq, g.xyrq,g.frrq
----    from T_JHDZB z
----	join t_jhdmxb m ON m.JHDBH = z.JHDBH AND m.spbh = '10114'
----	join t_gysxx g ON z.GYSBH=g.GYSBH
----) a ON r.gysbh = a.gysbh AND r.spbh = a.spbh and a.jhrq > dateadd(month,-24,getdate())
----WHERE r.spbh = '10114' 
----group by r.gysbh,a.gsyzrq,a.jyxkzrq,a.gsprq,a.frrq,a.xyrq
----order by jhj





-----------------2016.7.3 end--------------------------------

----ALTER TABLE t_jhdzb 
----ADD zpflag TINYINT

----ALTER TABLE t_ckdzb 
----ADD zpflag TINYINT

----------2016.6.18
------���ӽ�����ϸ���˱�־��1����ͨ�� 0����δͨ�� null δ����
----ALTER TABLE t_jhdmxb 
----ADD fhflag TINYINT

-------���ӽ�������⹦�ܣ������г�
----INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
----            fdbz, parameter)
----VALUES('03','����Աȷ�����',1,0,'����Աȷ�����','image\tom_wap.gif','w_jhdrk',1,1,1,0)

--------2016.06.27----------------------
------�ܵ���������ӵ���ʱ�䣬Ĭ�ϵ���
----ALTER TABLE t_jhdzb 
----ADD dhrq DATETIME NULL





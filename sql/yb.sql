-------ҽ�������ֵ�
--CREATE TABLE t_yb_sjzd
--(
--	id INT IDENTITY(1,1) NOT NULL,
--	code NVARCHAR(8) NOT NULL,
--	pcode NVARCHAR(8) NULL,
--	codevalue NVARCHAR(32) NULL,
--	sort INT DEFAULT 0,
--	PRIMARY KEY (id)
--)
------��Ʒ��Ϣ����ҽ�������ֶ�
--ALTER TABLE T_SPXX
--ADD ybbm NVARCHAR(50) NULL
--GO

--ALTER TABLE T_LSDZB
--ADD tradeno NVARCHAR(24) NULL
--GO

-------������������ cashe�����ֽ�֧����fund ҽ������֧����personcountpay ҽ�������ʺ�֧��
--ALTER TABLE t_lsdzb 
--ADD cash DECIMAL(10,2) NULL ,fund DECIMAL(10,2) NULL,personcountpay DECIMAL(10,2) NULL
--GO

----������ϸ feein ҽ���ڽ�� feeout ҽ������ selfpay2 �����Ը�2
--ALTER TABLE t_lsdmxb 
--ADD feein DECIMAL(10,4) NULL,feeout DECIMAL(10,4) NULL,selfpay2 DECIMAL(10,4) NULL
--GO

-----2016��12��23�� ����ҩ�����ֶ� 
--ALTER TABLE t_lsdmxb 
--ADD yjm varchar(4000) NULL
--GO

--DROP TABLE t_yb_rxdiagnosisinfo
--GO
------ҽ�����䴦����Ϣ 2016��10��29�� 12:22:44
--CREATE TABLE t_yb_rxdiagnosisinfo
--(
--	id INT IDENTITY(1,1) NOT NULL,
--	icno VARCHAR(12) NULL,		--ҽ��Ӧ�ú�
--	micode VARCHAR(8) NULL,		--����ҽԺ
--	rxno VARCHAR(22) NULL,		--���䴦����ˮ��:��RX��(2λ)+ҽ�ƻ������루8����룩����֧������(2�Ҷ���)��6λϵͳ���ڣ���070308��+6λ���
--	curetype CHAR(2) NULL,		--ҽ����� 11�����19�����
--	isspecifiedhosp TINYINT NULL,	--����ҽԺ״̬ 1���Ǳ��˶���ҽԺ��A��ҽԺ��ר��ҽԺ��2�����Ǳ��˶���ҽԺ3��ת��
--	diagnoseno VARCHAR(9) NULL,		--������
--	recipedate CHAR(14) NULL,		--��������/ʱ��
--	recipetype CHAR(1) NULL,		--������� 1��ҽ���ڴ���2��ҽ���⴦��
--	diagnosename NVARCHAR(100) NULL,	--�������
--	diagnosecode NVARCHAR(20) NULL,		--��ϱ���
--	medicalrecord NVARCHAR(800) NULL,	--������Ϣ
--	sectioncode varCHAR(4) NULL,		--����Ʊ����
--	sectionname NVARCHAR(40) NULL,		--����Ʊ�����
--	hissectionname NVARCHAR(40) NULL,	--ҽԺ��Ժ����Ʊ�����
--	drname NVARCHAR(40) NULL,		--ҽʦ����
--	drid NVARCHAR(20) NULL,		--ҽʦ����
--	drlevel NVARCHAR(40) NULL,	--ҽʦְ��
--	registertradeno VARCHAR(22) NULL,	--�ҺŽ�����ˮ��
--	billstype CHAR(1) NULL,		--�������� 2-��ҩ���г�ҩ������4-�в�ҩ������ 
--	flag TINYINT NULL DEFAULT 0,	--��־ 0 δ�ɽ� 1 �ѳɽ� 2-���˷�
--	PRIMARY KEY(id)	
--)
--drop table t_yb_rxdiagnosisinfo_items
--go
------ҽ�����䴦����ϸ��Ϣ
--CREATE TABLE t_yb_rxdiagnosisinfo_items
--(
--	id INT IDENTITY(1,1) NOT NULL,
--	icno VARCHAR(12) NULL,		--ҽ��Ӧ�ú�
--	rxno VARCHAR(22) NULL,		--���䴦����ˮ��:��RX��(2λ)+ҽ�ƻ������루8����룩����֧������(2�Ҷ���)��6λϵͳ���ڣ���070308��+6λ���
--	rxitemno VARCHAR(40) NULL,	--���䴦����ϸ��ˮ��
--	itemcode VARCHAR(40) NULL,	--ҽ����Ŀ����
--	hisname NVARCHAR(200) NULL,	--ҩ��ϵͳ��Ŀ����
--	itemtype VARCHAR(3) NULL,	--��Ŀ���
--	dose CHAR(6) NULL,			--����
--	specification NVARCHAR(80) NULL,		--���
--	unit NVARCHAR(40) NULL,		--��λ
--	unitprice DECIMAL(10,4) NULL DEFAULT 0,	--����
--	qty DECIMAL(10,2) NULL DEFAULT 0,		--����
--	howtouse VARCHAR(3) NULL,	--�÷�
--	dosage NVARCHAR(40) NULL,	--��������
--	packaging NVARCHAR(20) NULL,--��װ��λ
--	minpackage NVARCHAR(20) NULL,	--��С��װ
--	conversion NVARCHAR(20) NULL,	--������
--	daynum	INT NULL,	--����
--	fee	DECIMAL(10,4) NULL DEFAULT 0,	--�����ܽ��
--	drugapprovalnumber NVARCHAR(40) NULL,	--ҩƷ��׼�ĺ�
--	yjm VARCHAR(32) NULL, --ҩ����
--	flag TINYINT NULL DEFAULT 0,	--��־ 0 δ�ɽ� 1 �ѳɽ�
--	PRIMARY KEY(id)
--)

--DROP TABLE t_yb_personinfo
--GO
------ҽ���û���Ϣ
--CREATE TABLE t_yb_personinfo
--(
--	ic_no	VARCHAR(12) not NULL,				--ҽ��Ӧ�ú�
--	card_no VARCHAR(12) NOT NULL,				--�籣������
--	id_no	VARCHAR(18) NULL,					--�������֤��
--	personname NVARCHAR(20) NULL,				--����
--	sex TINYINT NULL,							--�Ա� �μ���׼AAC004
--	birthday CHAR(8) NULL,						--��������
--	fromhosp VARCHAR(8) NULL,					--ת��ҽԺ����
--	fromhospdate CHAR(8) NULL,					--ת��ʱ��	��ʽ��YYYYMMDD
--	persontype VARCHAR(3) NULL,					--�α���Ա��� �μ�AKC021 
--	isinredlist VARCHAR(5) NULL,				--�Ƿ��ں�����	true���ں����� false�����ں�����
--	isspecifiedhosp CHAR(1) NULL,				--�Ƿ��˶���ҽԺ 0�����غ�������Ĭ��Ϊ���˶���ҽԺ�� 1���Ǳ��˶���ҽԺ��A��ҽԺ��ר��ҽԺ����ҽҽԺ��2�����Ǳ��˶���ҽԺ 3��ת��ҽԺ
--	ischronichosp VARCHAR(5) NULL,				--�Ƿ�����������ҽԺ true��������������ҽԺ false���Ǳ�����������ҽԺ
--	personcount DECIMAL(10,2) NULL DEFAULT 0,	--�����ʻ����
--	chroniccode VARCHAR(50) NULL,				--��������
--	fundtype VARCHAR(4) NULL,					--�������� �μ���׼BAE059
--	isyt TINYINT NULL,							--Ԥ����Ա��ʶ 0����ͨ��Ա��1��Ԥ����Ա
--	jclevel TINYINT NULL,						--���еȼ� 0���������˲д��� 1������һ���˲д��� 2�����ܶ����˲д��� 3�����������˲д��� 4�������ļ��˲д��� 5�������弶�˲д��� 6�����������˲д���
--	hospflag TINYINT NULL,						--��Ժ��ʶ 0��δסԺ״̬ 1��סԺ״̬ 2���������� 3����ͥ����; 4: סԺ�ƻ��������� 41�����˱���סԺ״̬ 51����������סԺ״̬
--	updatedate DATETIME NOT NULL DEFAULT GETDATE(),
--	PRIMARY KEY(ic_no)					
--)

--DROP TABLE T_yb_divide
--GO 
------ҽ��������Ϣ
--CREATE TABLE T_yb_divide
--(
--	tradeno varCHAR(24)	NOT NULL,					--ҽ��ҩ�꽻����ˮ��	
--	ic_no	VARCHAR(12) not NULL,					--ҽ��Ӧ�ú�
--	feeno VARCHAR(20) NULL,							--ҩ��ϵͳ�շѵ��ݺ�
--	curetype CHAR(2) NULL,							--ҽ����� 11�����19�����
--	tradedate CHAR(14) NULL,						--��������ʱ�� ��ʽΪ��YYYYMMDDHHMMSS
--	feeall DECIMAL(10,2) NULL DEFAULT 0,			--�����ܽ��
--	fund DECIMAL(10,2) NULL DEFAULT 0,				--����֧�����
--	cash DECIMAL(10,2) NULL DEFAULT 0,				--�ֽ�֧�����
--	personcountpay DECIMAL(10,2) NULL DEFAULT 0,	--�����˻�֧�����
--	fee DECIMAL(10,2) NULL DEFAULT 0,				--�����ܽ��
--	feein DECIMAL(10,2) NULL DEFAULT 0,				--ҽ�����ܽ��
--	feeout DECIMAL(10,2) NULL DEFAULT 0,			--ҽ�����ܽ��
--	payfirst DECIMAL(10,2) NULL DEFAULT 0,			--���θ����߽��
--	selfpay2 DECIMAL(10,2) NULL DEFAULT 0,			--�����Ը�2	
--	bigpay DECIMAL(10,2) NULL DEFAULT 0,			--ҩ����֧�����
--	bigselfpay DECIMAL(10,2) NULL DEFAULT 0,		--ҩ�����Ը����
--	outofbig DECIMAL(10,2) NULL DEFAULT 0,			--������Ը����
--	bcpay DECIMAL(10,2) NULL DEFAULT 0,				--���䱣��֧�����
--	jcbz DECIMAL(10,2) NULL DEFAULT 0,				--���в������ս��
--	medicine DECIMAL(10,2) NULL DEFAULT 0,			--��ҩ���	
--	tmedicine DECIMAL(10,2) NULL DEFAULT 0,			--�г�ҩ���
--	therb DECIMAL(10,2) NULL DEFAULT 0,				--�в�ҩ���
--	flag TINYINT NULL DEFAULT 0,		--��־ 0 δ�ɽ� 1 �ѳɽ� 2 ���˷�	
--	recordtype TINYINT DEFAULT 0,		--��¼���� 0 �շѷֽ� 1 �˷ѷֽ�                            	
--	PRIMARY KEY(tradeno)
--)

--DROP TABLE T_yb_divide_items
--GO
------ҽ��������ϸ
--CREATE TABLE T_yb_divide_items
--(
--	id INT IDENTITY(1,1) NOT NULL,
--	tradeno varCHAR(24)	NOT NULL,					--ҽ��ҩ�꽻����ˮ��	
--	itemno INT NULL,								--��Ŀ���
--	recipeno VARCHAR(20) NULL,						--�������
--	hiscode VARCHAR(40) NULL,						--ҩ��ϵͳ��Ŀ����
--	itemcode VARCHAR(40) NULL,						--ҽ����Ŀ����
--	itemname VARCHAR(100) NULL,						--ҽ����Ŀ����
--	itemtype TINYINT NULL,							--��Ŀ��� 0ҩƷ 1������Ŀ 2������ʩ
--	unitprice DECIMAL(10,4) NULL DEFAULT 0,			--����
--	qty DECIMAL(8,2) NULL DEFAULT 0,				--����
--	fee DECIMAL(10,4) NULL DEFAULT 0,				--�����ܽ��
--	feein DECIMAL(10,4) NULL DEFAULT 0,				--ҽ�����ܽ�� �磺ҽ���ڽ��=0��Ϊȫ�Ը� ҽ������=0��Ϊ���Ը� ����Ϊ���Ը�
--	feeout DECIMAL(10,4) NULL DEFAULT 0,			--ҽ�����ܽ��
--	selfpay2 DECIMAL(10,4) NULL DEFAULT 0,			--�����Ը�2	
--	STATE TINYINT NULL,								--�ֽ�״̬ 0������1�����������ʶ��2ҽ��Ŀ¼�ڲ����ڣ�3���մ���4���������ⶨ�����Ҫ��5δ���գ�6ҽ���⴦��
--	fee_type VARCHAR(4) NULL,						--�շ���� �μ���׼AKA063
--	preferentialfee DECIMAL(10,4) NULL DEFAULT 0,	--�����Żݽ��
--	preferentialscale TINYINT NULL,					--�����Żݱ��� ���������Ż�10%�����ʾΪ��10��
--	approval_number	NVARCHAR(40) NULL,				--��׼�ĺ�
--	EX_RECIPE_DETAIL_N VARCHAR(26) NULL,			--���䴦����ϸ��ˮ��
--	PRIMARY KEY(id)                   	         					
--)

-------��¼�����ҽ�����ۼ�¼
--DROP TABLE t_yb_lsdzb
--GO
--CREATE TABLE T_YB_LSDZB(
--	[tradeno] [varchar](24) NOT NULL,
--	[RQ] [datetime] NULL,
--	[JS] [int] NULL DEFAULT 1,
--	[DJHJ] [decimal](10, 2) NULL DEFAULT 0,
--	[HJJE] [decimal](10, 2) NULL DEFAULT 0,
--	[ZDZK] [tinyint] NULL DEFAULT 100,
--	[YSJE] [decimal](10, 2) NULL DEFAULT 0,
--	[BZ] [varchar](60) NULL,
--	[member_code] [varchar](10) NULL DEFAULT '',
--	[IDNumber] [varchar](32) NULL,
--	[CustomerName] [varchar](16) NULL,
--	[SWBZ] [tinyint] NULL DEFAULT 0,
--	[cash] [decimal](10, 2) NULL,
--	[fund] [decimal](10, 2) NULL,
--	[personcountpay] [decimal](10, 2) NULL,
--	PRIMARY KEY(tradeno)
--)
--DROP TABLE t_yb_lsdmxb
--GO
--CREATE TABLE [T_YB_LSDMXB](
--	id INT IDENTITY(1,1) NOT NULL,
--	[SPBH] [varchar](15) NOT NULL,
--	[SL] [decimal](10, 4) NULL DEFAULT 0,
--	[LSJ] [decimal](10, 4) NULL DEFAULT 0,
--	[YYYBH] [varchar](12) NULL,
--	[YSBH] [varchar](12) NULL,
--	[ZK] [tinyint] NULL DEFAULT 100,
--	[pcbh] [varchar](20) NULL,
--	[jhj] [decimal](10, 4) NULL DEFAULT 0,
--	[bz] [nvarchar](128) NULL,
--	[jhjhs] [decimal](15, 4) NULL DEFAULT 0,
--	[jylb] [nvarchar](2) NULL,
--	[feein] [decimal](10, 4) NULL,
--	[feeout] [decimal](10, 4) NULL,
--	[selfpay2] [decimal](10, 4) NULL,
--	rxno VARCHAR(22) NULL,		--���䴦����ˮ��:��RX��(2λ)+ҽ�ƻ������루8����룩����֧������(2�Ҷ���)��6λϵͳ���ڣ���070308��+6λ���
--	rxitemno VARCHAR(40) NULL,	--���䴦����ϸ��ˮ��
--	tradeno VARCHAR(24) NULL,
--	PRIMARY KEY (id)
--)

-------ҽ����Ʒ��Ϣ
--DROP TABLE t_yb_spxx
--GO
--CREATE TABLE t_yb_spxx
--(
--	id int IDENTITY(1,1) NOT NULL, 
--	spbh VARCHAR(16) NOT NULL,
--	pm VARCHAR(100) NULL DEFAULT '',
--	ybbm VARCHAR(50) NULL DEFAULT '',
--	ybpm VARCHAR(100) NULL DEFAULT '',
--	jx VARCHAR(20) NULL DEFAULT '',
--	gg VARCHAR(40) NULL DEFAULT '',
--	jldw VARCHAR(20) NULL DEFAULT '',
--	jiag DECIMAL(12,4) NULL DEFAULT 0,
--	sfdj VARCHAR(4) NULL DEFAULT '',
--	sflb VARCHAR(8) NULL DEFAULT '',
--	bz VARCHAR(250) NULL DEFAULT '',
--	pzwh VARCHAR(50) NULL DEFAULT '',
--	yblx TINYINT DEFAULT 1,     ----1 ҽ���� 2 ҽ���� 0 δ����
--	PRIMARY KEY (spbh)
--)


------ҩƷ������Ϣ����		2016��12��23�� 16:37:14
------����-ȡҽ���ֵ䣬�÷���howtouse��������������dosage������װ��λ��packaging������С��װ��minpackage���������ʣ�conversion����������days��
--ALTER TABLE T_SPXX
--ADD howtouse VARCHAR(3) NULL,dosage DECIMAL(10,2) NULL,packaging NVARCHAR(32) NULL,
--minpackage NVARCHAR(32) NULL,conversion DECIMAL(10,2) NULL,days INT NULL




































	
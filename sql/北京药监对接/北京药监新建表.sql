DROP TABLE t_bjyj_rck;
CREATE TABLE t_bjyj_rck(
    bill_code VARCHAR(100) NOT NULL,
    bill_time DATETIME,
    bill_type VARCHAR(8),
    org_code VARCHAR(32),
    from_org_code VARCHAR(32),
    from_org_name VARCHAR(90),
    to_org_code VARCHAR(32),
    to_org_name VARCHAR(90),
    scbz smallint,
    scsbyy VARCHAR(1000),
    djhm VARCHAR(60),
    PRIMARY KEY (bill_code)
)

EXEC sp_addextendedproperty 'MS_Description', '����ⵥ��ͷ��Ϣ', 'user', dbo, 'table', t_bjyj_rck, null, null;
EXEC sp_addextendedproperty 'MS_Description', '�ϱ����ݺ�', 'user', dbo, 'table', t_bjyj_rck, 'column', bill_code;
EXEC sp_addextendedproperty 'MS_Description', '����ʱ��', 'user', dbo, 'table', t_bjyj_rck, 'column', bill_time;
EXEC sp_addextendedproperty 'MS_Description', '��������;�������͡����� 102, ���ɹ���⡱��103, ���˻���⡱��104, ��������⡱��107, ����Ӧ��⡱��108, ���ٻ���⡱��110,����Ʒ��⡱��111,����ӯ��⡱��112,��������⡱��113,��������⡱ 201, �����۳��⡱��202,���˻����⡱��203, ���������⡱��204, ���������⡱��205, �����ٳ��⡱��206, �������⡱��207, ��ֱ�����⡱��209, ����Ӧ���⡱��211, ���ٻس��⡱��212,����Ʒ���⡱��214,���̿����⡱��215,���𻵳��⡱��216,������ 
���⡱��217,���������⡱��237, ��ֱ���˻���', 'user', dbo, 'table', t_bjyj_rck, 'column', bill_type;
EXEC sp_addextendedproperty 'MS_Description', '��ҵͳһ������ô���', 'user', dbo, 'table', t_bjyj_rck, 'column', org_code;
EXEC sp_addextendedproperty 'MS_Description', '������ҵ��ҵͳһ������ô���;��ҵͳһ������ô��룬�����ܲ�Ϊ�������ŵ��ϱ�ʱ��ʹ���ŵ�ͳһ������ô���', 'user', dbo, 'table', t_bjyj_rck, 'column', from_org_code;
EXEC sp_addextendedproperty 'MS_Description', '������ҵ����;������ҵ', 'user', dbo, 'table', t_bjyj_rck, 'column', from_org_name;
EXEC sp_addextendedproperty 'MS_Description', '�ջ���ҵ��ҵͳһ������ô���', 'user', dbo, 'table', t_bjyj_rck, 'column', to_org_code;
EXEC sp_addextendedproperty 'MS_Description', '�ջ���ҵ����;�ջ���ҵ', 'user', dbo, 'table', t_bjyj_rck, 'column', to_org_name;
EXEC sp_addextendedproperty 'MS_Description', '�ϱ���ʶ;�ϴ���ʶ��0 δ�ϴ���1�ϴ��ɹ���-1 �ϴ�ʧ��', 'user', dbo, 'table', t_bjyj_rck, 'column', scbz;
EXEC sp_addextendedproperty 'MS_Description', '�ϱ�ʧ��ԭ��', 'user', dbo, 'table', t_bjyj_rck, 'column', scsbyy;
EXEC sp_addextendedproperty 'MS_Description', '���ݺ���', 'user', dbo, 'table', t_bjyj_rck, 'column', djhm;

DROP TABLE t_bjyj_rckmx;
CREATE TABLE t_bjyj_rckmx(
    bill_code VARCHAR(32) NOT NULL,
    ordr SMALLINT NOT NULL,
    spbh VARCHAR(30),
    code_count SMALLINT,
    code_type tinyint,
    code VARCHAR(32),
    exprie_date datetime,
    pm VARCHAR(100),
    gg VARCHAR(64),
    prepn_count SMALLINT,
    jldw VARCHAR(20),
    pzwh VARCHAR(60),
    pcbh VARCHAR(30),
    scrq datetime,
    PRIMARY KEY (bill_code,ordr)
)

EXEC sp_addextendedproperty 'MS_Description', '����ⵥ����ϸ��Ϣ', 'user', dbo, 'table', t_bjyj_rckmx, null, null;
EXEC sp_addextendedproperty 'MS_Description', '�ϱ����ݺ�', 'user', dbo, 'table', t_bjyj_rckmx, 'column', bill_code;
EXEC sp_addextendedproperty 'MS_Description', '���', 'user', dbo, 'table', t_bjyj_rckmx, 'column', ordr;
EXEC sp_addextendedproperty 'MS_Description', '����', 'user', dbo, 'table', t_bjyj_rckmx, 'column', spbh;
EXEC sp_addextendedproperty 'MS_Description', '����', 'user', dbo, 'table', t_bjyj_rckmx, 'column', code_count;
EXEC sp_addextendedproperty 'MS_Description', '������;1: ҩƷ��ʶ��(׷�� ��ǰ 7 λ) 2: ��Ʒ���� (69 ��) 3: ҩƷ��λ��', 'user', dbo, 'table', t_bjyj_rckmx, 'column', code_type;
EXEC sp_addextendedproperty 'MS_Description', 'ҩƷ��ʶ��/�� Ʒ����/ҩƷ��λ��', 'user', dbo, 'table', t_bjyj_rckmx, 'column', code;
EXEC sp_addextendedproperty 'MS_Description', '��Ч����;������ҵ', 'user', dbo, 'table', t_bjyj_rckmx, 'column', exprie_date;
EXEC sp_addextendedproperty 'MS_Description', 'ҩƷͨ������', 'user', dbo, 'table', t_bjyj_rckmx, 'column', pm;
EXEC sp_addextendedproperty 'MS_Description', '���;�ջ���ҵ', 'user', dbo, 'table', t_bjyj_rckmx, 'column', gg;
EXEC sp_addextendedproperty 'MS_Description', '�Ƽ�����', 'user', dbo, 'table', t_bjyj_rckmx, 'column', prepn_count;
EXEC sp_addextendedproperty 'MS_Description', '��λ', 'user', dbo, 'table', t_bjyj_rckmx, 'column', jldw;
EXEC sp_addextendedproperty 'MS_Description', '��׼�ĺ�', 'user', dbo, 'table', t_bjyj_rckmx, 'column', pzwh;
EXEC sp_addextendedproperty 'MS_Description', '����', 'user', dbo, 'table', t_bjyj_rckmx, 'column', pcbh;
EXEC sp_addextendedproperty 'MS_Description', '��������', 'user', dbo, 'table', t_bjyj_rckmx, 'column', scrq;

DROP TABLE t_bjyj_drkc;
CREATE TABLE t_bjyj_drkc(
    ID VARCHAR(20) NOT NULL,
    AppKey VARCHAR(60),
    dwbh VARCHAR(10),
    org_code VARCHAR(30),
    org_name VARCHAR(80),
    jcsb_rq VARCHAR(20),
    scbz smallint,
    scsbyy VARCHAR(1000),
    PRIMARY KEY (ID)
)

EXEC sp_addextendedproperty 'MS_Description', '���տ��ͷ��Ϣ', 'user', dbo, 'table', t_bjyj_drkc, null, null;
EXEC sp_addextendedproperty 'MS_Description', 'ID;����8λ 20241101', 'user', dbo, 'table', t_bjyj_drkc, 'column', ID;
EXEC sp_addextendedproperty 'MS_Description', 'AppKey', 'user', dbo, 'table', t_bjyj_drkc, 'column', AppKey;
EXEC sp_addextendedproperty 'MS_Description', '��λ���', 'user', dbo, 'table', t_bjyj_drkc, 'column', dwbh;
EXEC sp_addextendedproperty 'MS_Description', 'ͳһ������ô���', 'user', dbo, 'table', t_bjyj_drkc, 'column', org_code;
EXEC sp_addextendedproperty 'MS_Description', '��ҵ����', 'user', dbo, 'table', t_bjyj_drkc, 'column', org_name;
EXEC sp_addextendedproperty 'MS_Description', '���ʱ��;2023-03-10 10:23', 'user', dbo, 'table', t_bjyj_drkc, 'column', jcsb_rq;
EXEC sp_addextendedproperty 'MS_Description', '�ϴ���־', 'user', dbo, 'table', t_bjyj_drkc, 'column', scbz;
EXEC sp_addextendedproperty 'MS_Description', '�ϴ�ʧ��ԭ��', 'user', dbo, 'table', t_bjyj_drkc, 'column', scsbyy;

DROP TABLE t_bjyj_drkcmx;
CREATE TABLE t_bjyj_drkcmx(
    ID VARCHAR(32) NOT NULL,
    spbh varchar(30) NOT NULL,
    code_type tinyint,
    code VARCHAR(32),
    pm VARCHAR(100),
    kcsl SMALLINT,
    cjmc VARCHAR(100),
    gg VARCHAR(64),
    prepn_count SMALLINT,
    jx VARCHAR(20),
    jldw VARCHAR(20),
    pzwh VARCHAR(50),
    PRIMARY KEY (ID,spbh)
)

EXEC sp_addextendedproperty 'MS_Description', '���տ����ϸ��Ϣ', 'user', dbo, 'table', t_bjyj_drkcmx, null, null;
EXEC sp_addextendedproperty 'MS_Description', 'ID', 'user', dbo, 'table', t_bjyj_drkcmx, 'column', ID;
EXEC sp_addextendedproperty 'MS_Description', '����', 'user', dbo, 'table', t_bjyj_drkcmx, 'column', spbh;
EXEC sp_addextendedproperty 'MS_Description', '������;1: ҩƷ��ʶ��(׷�� ��ǰ 7 λ) 2: ��Ʒ���� (69 ��) 3: ҩƷ��λ��', 'user', dbo, 'table', t_bjyj_drkcmx, 'column', code_type;
EXEC sp_addextendedproperty 'MS_Description', 'ҩƷ��ʶ��/�� Ʒ����/ҩƷ��λ��', 'user', dbo, 'table', t_bjyj_drkcmx, 'column', code;
EXEC sp_addextendedproperty 'MS_Description', 'ҩƷͨ������', 'user', dbo, 'table', t_bjyj_drkcmx, 'column', pm;
EXEC sp_addextendedproperty 'MS_Description', '�������', 'user', dbo, 'table', t_bjyj_drkcmx, 'column', kcsl;
EXEC sp_addextendedproperty 'MS_Description', '������������', 'user', dbo, 'table', t_bjyj_drkcmx, 'column', cjmc;
EXEC sp_addextendedproperty 'MS_Description', '���;�ջ���ҵ', 'user', dbo, 'table', t_bjyj_drkcmx, 'column', gg;
EXEC sp_addextendedproperty 'MS_Description', '�Ƽ�����', 'user', dbo, 'table', t_bjyj_drkcmx, 'column', prepn_count;
EXEC sp_addextendedproperty 'MS_Description', '����', 'user', dbo, 'table', t_bjyj_drkcmx, 'column', jx;
EXEC sp_addextendedproperty 'MS_Description', '��λ', 'user', dbo, 'table', t_bjyj_drkcmx, 'column', jldw;
EXEC sp_addextendedproperty 'MS_Description', '��׼�ĺ�', 'user', dbo, 'table', t_bjyj_drkcmx, 'column', pzwh;

DROP TABLE t_bjyj_pzxx;
CREATE TABLE t_bjyj_pzxx(
    dwbh VARCHAR(10) NOT NULL,
    AppKey VARCHAR(100) DEFAULT  '609ec043b99442d5986475b5a7bb2661',
    AppSecret VARCHAR(100) DEFAULT  '68a640d0e927453eaa0ebeca9ebd992ac2e99eb2667f4401814ebb6fe579fa71',
    org_code VARCHAR(30),
    org_name VARCHAR(80),
    PRIMARY KEY (dwbh)
)

EXEC sp_addextendedproperty 'MS_Description', '����ҩ��������Ϣ��', 'user', dbo, 'table', t_bjyj_pzxx, null, null;
EXEC sp_addextendedproperty 'MS_Description', '��λ����', 'user', dbo, 'table', t_bjyj_pzxx, 'column', dwbh;
EXEC sp_addextendedproperty 'MS_Description', 'AppKey', 'user', dbo, 'table', t_bjyj_pzxx, 'column', AppKey;
EXEC sp_addextendedproperty 'MS_Description', 'AppSecret', 'user', dbo, 'table', t_bjyj_pzxx, 'column', AppSecret;
EXEC sp_addextendedproperty 'MS_Description', '��˾/�ŵ�ͳһ������ô���', 'user', dbo, 'table', t_bjyj_pzxx, 'column', org_code;
EXEC sp_addextendedproperty 'MS_Description', '��˾/�ŵ�ȫ��', 'user', dbo, 'table', t_bjyj_pzxx, 'column', org_name;

----�ֵ굥��ִ��
DROP TABLE t_bjyj_lsd;
CREATE TABLE t_bjyj_lsd(
    bill_code VARCHAR(100) NOT NULL,
    bill_time varchar(32),
    bill_type VARCHAR(8),
    oper_ic_code VARCHAR(100),
    org_code VARCHAR(32),
    data_type tinyint DEFAULT  1,
    network_bill_flag smallint,
    scbz smallint DEFAULT  0,
    scsbyy VARCHAR(1000),
    lsdbh VARCHAR(100),
    PRIMARY KEY (bill_code)
)

EXEC sp_addextendedproperty 'MS_Description', '���۵���ͷ��Ϣ', 'user', dbo, 'table', t_bjyj_lsd, null, null;
EXEC sp_addextendedproperty 'MS_Description', '�ϱ����ݺ�', 'user', dbo, 'table', t_bjyj_lsd, 'column', bill_code;
EXEC sp_addextendedproperty 'MS_Description', '����ʱ��;��ʽ 2023-03-10 10:23', 'user', dbo, 'table', t_bjyj_lsd, 'column', bill_time;
EXEC sp_addextendedproperty 'MS_Description', '��������;��������[321,���۳���][322,�������][116,�������˻����]', 'user', dbo, 'table', t_bjyj_lsd, 'column', bill_type;
EXEC sp_addextendedproperty 'MS_Description', '�����ύ��;����Ϊappkey', 'user', dbo, 'table', t_bjyj_lsd, 'column', oper_ic_code;
EXEC sp_addextendedproperty 'MS_Description', '��ҵͳһ������ô���;������ҵͳһ������ô���', 'user', dbo, 'table', t_bjyj_lsd, 'column', org_code;
EXEC sp_addextendedproperty 'MS_Description', '��������;��������,1 �������ݣ�2 ���ݻ�������', 'user', dbo, 'table', t_bjyj_lsd, 'column', data_type;
EXEC sp_addextendedproperty 'MS_Description', '������������ʶ 0 �ǻ����� 1 ������', 'user', dbo, 'table', t_bjyj_lsd, 'column', network_bill_flag;
EXEC sp_addextendedproperty 'MS_Description', '�ϴ���־;�ϴ���ʶ��0 δ�ϴ���1�ϴ��ɹ���-1 �ϴ�ʧ��', 'user', dbo, 'table', t_bjyj_lsd, 'column', scbz;
EXEC sp_addextendedproperty 'MS_Description', '�ϴ�ʧ��ԭ��', 'user', dbo, 'table', t_bjyj_lsd, 'column', scsbyy;
EXEC sp_addextendedproperty 'MS_Description', '���۵����', 'user', dbo, 'table', t_bjyj_lsd, 'column', lsdbh;

DROP TABLE t_bjyj_lsdmx;
CREATE TABLE t_bjyj_lsdmx(
    bill_code VARCHAR(100) NOT NULL,
    ordr INT NOT NULL,
    code_count SMALLINT,
    code_type tinyint,
    code VARCHAR(32),
    pm VARCHAR(100),
    gg VARCHAR(100),
    prepn_count SMALLINT,
    jldw VARCHAR(20),
    pzwh VARCHAR(100),
    pcbh VARCHAR(30),
    spbh VARCHAR(30),
    PRIMARY KEY (bill_code,ordr)
)

EXEC sp_addextendedproperty 'MS_Description', '���۵�����ϸ��Ϣ', 'user', dbo, 'table', t_bjyj_lsdmx, null, null;
EXEC sp_addextendedproperty 'MS_Description', '�ϱ����ݺ�', 'user', dbo, 'table', t_bjyj_lsdmx, 'column', bill_code;
EXEC sp_addextendedproperty 'MS_Description', '���', 'user', dbo, 'table', t_bjyj_lsdmx, 'column', ordr;
EXEC sp_addextendedproperty 'MS_Description', '����', 'user', dbo, 'table', t_bjyj_lsdmx, 'column', code_count;
EXEC sp_addextendedproperty 'MS_Description', '������;1: ҩƷ��ʶ��(׷�� ��ǰ 7 λ) 2: ��Ʒ���� (69 ��) 3: ҩƷ��λ��', 'user', dbo, 'table', t_bjyj_lsdmx, 'column', code_type;
EXEC sp_addextendedproperty 'MS_Description', 'ҩƷ��ʶ��/�� Ʒ����/ҩƷ��λ��', 'user', dbo, 'table', t_bjyj_lsdmx, 'column', code;
EXEC sp_addextendedproperty 'MS_Description', 'ҩƷͨ������', 'user', dbo, 'table', t_bjyj_lsdmx, 'column', pm;
EXEC sp_addextendedproperty 'MS_Description', '���;�ջ���ҵ', 'user', dbo, 'table', t_bjyj_lsdmx, 'column', gg;
EXEC sp_addextendedproperty 'MS_Description', '�Ƽ�����', 'user', dbo, 'table', t_bjyj_lsdmx, 'column', prepn_count;
EXEC sp_addextendedproperty 'MS_Description', '��λ', 'user', dbo, 'table', t_bjyj_lsdmx, 'column', jldw;
EXEC sp_addextendedproperty 'MS_Description', '��׼�ĺ�', 'user', dbo, 'table', t_bjyj_lsdmx, 'column', pzwh;
EXEC sp_addextendedproperty 'MS_Description', '����', 'user', dbo, 'table', t_bjyj_lsdmx, 'column', pcbh;
EXEC sp_addextendedproperty 'MS_Description', '����', 'user', dbo, 'table', t_bjyj_lsdmx, 'column', spbh;

--TRUNCATE TABLE t_bjyj_pzxx
INSERT INTO t_bjyj_pzxx(dwbh, org_code, org_name)
SELECT dwbh,sh,dwmc FROM t_dwxx WHERE dwbh = '000'

SELECT * FROM t_bjyj_pzxx tbp


--ALTER TABLE t_lshzb 
--ADD code VARCHAR(100)

--ALTER TABLE T_LSDZB_W 
--ADD code VARCHAR(100)

--ALTER TABLE T_LSDMXB_W
--ALTER COLUMN lsdbh VARCHAR(30) not null

ALTER TABLE T_LSDZB_W
ALTER COLUMN lsdbh VARCHAR(30) NOT NULL

ALTER TABLE T_LSDZB_W
ADD CONSTRAINT PK_T_LSDZB_W PRIMARY KEY (fgsbh,lsdbh);

SELECT *
FROM T_LSDzB_W tlw
WHERE tlw.LSDBH LIKE '241001%'

CREATE INDEX IX_jhdzb_jhrq ON t_jhdzb (jhrq,jsbz);
CREATE INDEX IX_ckdzb_jhrq ON t_ckdzb (ckrq,yxbz);
CREATE INDEX IX_tkdzb_jhrq ON t_tkdzb (tkrq,flag);
CREATE INDEX IX_thdzb_jhrq ON t_thdzb (thrq,yxbz);
CREATE INDEX IX_jhdmxb_spbh ON t_jhdmxb (spbh,pcbh);
CREATE INDEX IX_ckdmxb_spbh ON t_ckdmxb (spbh,pcbh);
CREATE INDEX IX_thdmxb_spbh ON t_thdmxb (spbh,pcbh);
CREATE INDEX IX_tkdmxb_jhrq ON t_tkdmxb (spbh,pcbh);
CREATE INDEX IX_jhdmxb_jhrq ON t_lshzb(lsrq);





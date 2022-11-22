---- ҽ��������ؽ��� 2022��8��24�� 14:55:20
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_yb_personinfo]') AND type in (N'U'))
DROP TABLE [dbo].[t_yb_personinfo];
CREATE TABLE [dbo].[t_yb_personinfo](
    ic_no varchar(12),
    card_no varchar(32),
    id_no varchar(18) NOT NULL,
    personname nvarchar(20),
    sex tinyint,
    birthday char(8),
    fromhosp varchar(8),
    fromhospdate char(8),
    persontype varchar(3),
    isinredlist varchar(5),
    isspecifiedhosp char(1),
    ischronichosp varchar(5),
    personcount decimal(10,2) DEFAULT  (0),
    chroniccode varchar(50),
    fundtype varchar(4),
    isyt tinyint,
    jclevel tinyint,
    hospflag tinyint,
    personmanage VARCHAR(64),
    servantflag VARCHAR(8),
    PoorFlag VARCHAR(64),
    InHospitalNumber INT,
    AreaCode VARCHAR(16),
    updatedate DATETIME NOT NULL DEFAULT  (getdate()),
    PRIMARY KEY (id_no)
)

EXEC sp_addextendedproperty 'MS_Description', '', 'SCHEMA', dbo, 'table', t_yb_personinfo, null, null;
EXEC sp_addextendedproperty 'MS_Description', 'ҽ��Ӧ�ú�', 'SCHEMA', dbo, 'table', t_yb_personinfo, 'column', ic_no;
EXEC sp_addextendedproperty 'MS_Description', '�籣������', 'SCHEMA', dbo, 'table', t_yb_personinfo, 'column', card_no;
EXEC sp_addextendedproperty 'MS_Description', '�������֤��', 'SCHEMA', dbo, 'table', t_yb_personinfo, 'column', id_no;
EXEC sp_addextendedproperty 'MS_Description', '����', 'SCHEMA', dbo, 'table', t_yb_personinfo, 'column', personname;
EXEC sp_addextendedproperty 'MS_Description', '�Ա�', 'SCHEMA', dbo, 'table', t_yb_personinfo, 'column', sex;
EXEC sp_addextendedproperty 'MS_Description', '��������', 'SCHEMA', dbo, 'table', t_yb_personinfo, 'column', birthday;
EXEC sp_addextendedproperty 'MS_Description', 'ת��ҽԺ����', 'SCHEMA', dbo, 'table', t_yb_personinfo, 'column', fromhosp;
EXEC sp_addextendedproperty 'MS_Description', 'ת��ʱ��', 'SCHEMA', dbo, 'table', t_yb_personinfo, 'column', fromhospdate;
EXEC sp_addextendedproperty 'MS_Description', '�α���Ա���', 'SCHEMA', dbo, 'table', t_yb_personinfo, 'column', persontype;
EXEC sp_addextendedproperty 'MS_Description', '�Ƿ��ں�����', 'SCHEMA', dbo, 'table', t_yb_personinfo, 'column', isinredlist;
EXEC sp_addextendedproperty 'MS_Description', '�Ƿ��˶���ҽԺ', 'SCHEMA', dbo, 'table', t_yb_personinfo, 'column', isspecifiedhosp;
EXEC sp_addextendedproperty 'MS_Description', '�Ƿ�����������ҽԺ', 'SCHEMA', dbo, 'table', t_yb_personinfo, 'column', ischronichosp;
EXEC sp_addextendedproperty 'MS_Description', '�����˻����', 'SCHEMA', dbo, 'table', t_yb_personinfo, 'column', personcount;
EXEC sp_addextendedproperty 'MS_Description', '��������', 'SCHEMA', dbo, 'table', t_yb_personinfo, 'column', chroniccode;
EXEC sp_addextendedproperty 'MS_Description', '��������', 'SCHEMA', dbo, 'table', t_yb_personinfo, 'column', fundtype;
EXEC sp_addextendedproperty 'MS_Description', 'Ԥ����Ա��ʶ', 'SCHEMA', dbo, 'table', t_yb_personinfo, 'column', isyt;
EXEC sp_addextendedproperty 'MS_Description', '���еȼ�', 'SCHEMA', dbo, 'table', t_yb_personinfo, 'column', jclevel;
EXEC sp_addextendedproperty 'MS_Description', '��Ժ��ʶ', 'SCHEMA', dbo, 'table', t_yb_personinfo, 'column', hospflag;
EXEC sp_addextendedproperty 'MS_Description', '���˹�����', 'SCHEMA', dbo, 'table', t_yb_personinfo, 'column', personmanage;
EXEC sp_addextendedproperty 'MS_Description', '�μӹ���Աҽ�Ʋ�����ʶ', 'SCHEMA', dbo, 'table', t_yb_personinfo, 'column', servantflag;
EXEC sp_addextendedproperty 'MS_Description', '�ͱ������ʶ', 'SCHEMA', dbo, 'table', t_yb_personinfo, 'column', PoorFlag;
EXEC sp_addextendedproperty 'MS_Description', '�����סԺ����', 'SCHEMA', dbo, 'table', t_yb_personinfo, 'column', InHospitalNumber;
EXEC sp_addextendedproperty 'MS_Description', '�α���������������', 'SCHEMA', dbo, 'table', t_yb_personinfo, 'column', AreaCode;
EXEC sp_addextendedproperty 'MS_Description', '', 'SCHEMA', dbo, 'table', t_yb_personinfo, 'column', updatedate;

-------------���÷ֽ������ֶ� --------------------
alter TABLE [dbo].[T_yb_divide]
ADD  depatradeno VARCHAR(32),
mzpayfirst decimal(10,2),
    mzfee decimal(10,2),
    BasePay decimal(10,2),
    GwybzPay decimal(10,2),
    mzbigpay decimal(10,2),
    MzbzPay decimal(10,2),
    OtherPay decimal(10,2),
    PersonCountBalance decimal(10,2),
    PromptMessage VARCHAR(500),
    SelfPayFlag VARCHAR(8),
    FundCode VARCHAR(16),
    FundName VARCHAR(64),
    FundPay decimal(10,2),
    diagnosis decimal(10,2),
    examine decimal(10,2),
    labexam decimal(10,2),
    treatment decimal(10,2),
    operation decimal(10,2),
    material decimal(10,2),
    medicalservice decimal(10,2),
    commonservice decimal(10,2),
    registfee decimal(10,2),
    otheropfee decimal(10,2)
;
GO

EXEC sp_addextendedproperty 'MS_Description', '��ҩ��', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', medicine;
EXEC sp_addextendedproperty 'MS_Description', '�г�ҩ��', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', tmedicine;
EXEC sp_addextendedproperty 'MS_Description', '�в�ҩ��', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', therb;
EXEC sp_addextendedproperty 'MS_Description', '����ҽ�Ʊ���ͳ�����֧�����', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', BasePay;
EXEC sp_addextendedproperty 'MS_Description', '����Աҽ�Ʋ�������', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', GwybzPay;
EXEC sp_addextendedproperty 'MS_Description', '������֧�����', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', mzbigpay;
EXEC sp_addextendedproperty 'MS_Description', '������������', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', MzbzPay;
EXEC sp_addextendedproperty 'MS_Description', '��������֧��', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', OtherPay;
EXEC sp_addextendedproperty 'MS_Description', '�����˻����', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', PersonCountBalance;
EXEC sp_addextendedproperty 'MS_Description', '��ʾ��Ϣ', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', PromptMessage;
EXEC sp_addextendedproperty 'MS_Description', 'ȫ��渶��־', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', SelfPayFlag;
EXEC sp_addextendedproperty 'MS_Description', '����������', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', FundCode;
EXEC sp_addextendedproperty 'MS_Description', '�����������', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', FundName;
EXEC sp_addextendedproperty 'MS_Description', '�������֧�����', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', FundPay;
EXEC sp_addextendedproperty 'MS_Description', '����', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', diagnosis;
EXEC sp_addextendedproperty 'MS_Description', '����', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', examine;
EXEC sp_addextendedproperty 'MS_Description', '�����', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', labexam;
EXEC sp_addextendedproperty 'MS_Description', '���Ʒ�', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', treatment;
EXEC sp_addextendedproperty 'MS_Description', '������', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', operation;
EXEC sp_addextendedproperty 'MS_Description', '�������Ϸ�', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', material;
EXEC sp_addextendedproperty 'MS_Description', 'ҽ�·����', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', medicalservice;
EXEC sp_addextendedproperty 'MS_Description', 'һ�����Ʒ�', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', commonservice;
EXEC sp_addextendedproperty 'MS_Description', '�Һŷ�', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', registfee;
EXEC sp_addextendedproperty 'MS_Description', '���������շ�', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', otheropfee;
EXEC sp_addextendedproperty 'MS_Description', '���θ����߽��', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', mzpayfirst;
EXEC sp_addextendedproperty 'MS_Description', '�����ܽ��', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', mzfee;
EXEC sp_addextendedproperty 'MS_Description', '�α��ؽ�����ˮ��', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', depatradeno;

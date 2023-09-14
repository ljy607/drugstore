------ ҽ��������ؽ��� 2022��8��24�� 14:55:20
-- �α�����Ϣ�����ֶ� 2023��2��24�� 11:37:08
alter TABLE [dbo].[t_yb_personinfo]
add
    personmanage VARCHAR(64),
    servantflag VARCHAR(8),
    PoorFlag VARCHAR(64),
    InHospitalNumber INT,
    AreaCode VARCHAR(16),
    cbdbz tinyint DEFAULT  1;

EXEC sp_addextendedproperty 'MS_Description', 'ҽ��������Ϣ', 'SCHEMA', dbo, 'table', t_yb_personinfo, null, null;
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
EXEC sp_addextendedproperty 'MS_Description', '�α��ر�־;1 ���أ�2 ���', 'SCHEMA', dbo, 'table', t_yb_personinfo, 'column', cbdbz;

ALTER TABLE T_yb_divide
ALTER COLUMN ic_no VARCHAR(32) null ;

ALTER TABLE t_yb_rxdiagnosisinfo
ALTER COLUMN icno VARCHAR(32) null;

ALTER TABLE t_yb_personinfo
ALTER COLUMN ic_no VARCHAR(12) null;


alter  table   t_yb_personinfo   alter  column   id_No  varchar(18) NOT NULL;
GO

alter  table   t_yb_personinfo   add constraint  PK_t_yb_personinfo primary key(id_no);
GO

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
    PersonCountPay decimal(10,2),
    PersonCountBalance decimal(10,2),    
    PromptMessage VARCHAR(500),
    SelfPayFlag VARCHAR(8),
    diagnosis decimal(10,2),
    examine decimal(10,2),
    labexam decimal(10,2),
    treatment decimal(10,2),
    operation decimal(10,2),
    material decimal(10,2),
    medicalservice decimal(10,2),
    commonservice decimal(10,2),
    registfee decimal(10,2),
    otheropfee decimal(10,2),
    dzbz tinyint(3) DEFAULT  0,
    dzxx VARCHAR(200),
    selfPayFirst decimal(10,2),
    selFeeAll decimal(10,2),
    nationtradedate VARCHAR(14),
    mzfeein decimal(10,2),
    mzfeeout decimal(10,2),
    cbdbz tinyint DEFAULT  1
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
EXEC sp_addextendedproperty 'MS_Description', '���˱�־;0 δ���ˣ�1 ���˳ɹ���2 ����ʧ��', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', dzbz;
EXEC sp_addextendedproperty 'MS_Description', '���˷��ص���Ϣ', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', dzxx;
EXEC sp_addextendedproperty 'MS_Description', '�����Ը�������;��ؽ���ר��', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', selfPayFirst;
EXEC sp_addextendedproperty 'MS_Description', 'ȫ�Էѽ��;��ؽ���ר��', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', selFeeAll;
EXEC sp_addextendedproperty 'MS_Description', '���ƽ̨����ʱ��;��ؽ���ר��', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', nationtradedate;
EXEC sp_addextendedproperty 'MS_Description', 'ҽ���ڽ��', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', mzfeein;
EXEC sp_addextendedproperty 'MS_Description', 'ҽ������', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', mzfeeout;
EXEC sp_addextendedproperty 'MS_Description', '�α��ر�־;1 ���أ�2 ���', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', cbdbz;

CREATE TABLE [dbo].[t_yb_divide_fundpay](
    id int NOT NULL IDENTITY(1,1),
    tradeno VARCHAR(24),
    fundcode VARCHAR(8),
    fundname varchar(64),
    fundpay decimal(10,2),
    PRIMARY KEY (id)
)

EXEC sp_addextendedproperty 'MS_Description', '���÷ֽ����֧���б�', 'SCHEMA', dbo, 'table', t_yb_divide_fundpay, null, null;
EXEC sp_addextendedproperty 'MS_Description', 'ID', 'SCHEMA', dbo, 'table', t_yb_divide_fundpay, 'column', id;
EXEC sp_addextendedproperty 'MS_Description', 'ҽ��������ˮ��', 'SCHEMA', dbo, 'table', t_yb_divide_fundpay, 'column', tradeno;
EXEC sp_addextendedproperty 'MS_Description', '�������', 'SCHEMA', dbo, 'table', t_yb_divide_fundpay, 'column', fundcode;
EXEC sp_addextendedproperty 'MS_Description', '��������', 'SCHEMA', dbo, 'table', t_yb_divide_fundpay, 'column', fundname;
EXEC sp_addextendedproperty 'MS_Description', '֧�����', 'SCHEMA', dbo, 'table', t_yb_divide_fundpay, 'column', fundpay;

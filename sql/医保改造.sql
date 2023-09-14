------ 医保增加异地结算 2022年8月24日 14:55:20
-- 参保人信息增加字段 2023年2月24日 11:37:08
alter TABLE [dbo].[t_yb_personinfo]
add
    personmanage VARCHAR(64),
    servantflag VARCHAR(8),
    PoorFlag VARCHAR(64),
    InHospitalNumber INT,
    AreaCode VARCHAR(16),
    cbdbz tinyint DEFAULT  1;

EXEC sp_addextendedproperty 'MS_Description', '医保个人信息', 'SCHEMA', dbo, 'table', t_yb_personinfo, null, null;
EXEC sp_addextendedproperty 'MS_Description', '医保应用号', 'SCHEMA', dbo, 'table', t_yb_personinfo, 'column', ic_no;
EXEC sp_addextendedproperty 'MS_Description', '社保卡卡号', 'SCHEMA', dbo, 'table', t_yb_personinfo, 'column', card_no;
EXEC sp_addextendedproperty 'MS_Description', '公民身份证号', 'SCHEMA', dbo, 'table', t_yb_personinfo, 'column', id_no;
EXEC sp_addextendedproperty 'MS_Description', '姓名', 'SCHEMA', dbo, 'table', t_yb_personinfo, 'column', personname;
EXEC sp_addextendedproperty 'MS_Description', '性别', 'SCHEMA', dbo, 'table', t_yb_personinfo, 'column', sex;
EXEC sp_addextendedproperty 'MS_Description', '出生日期', 'SCHEMA', dbo, 'table', t_yb_personinfo, 'column', birthday;
EXEC sp_addextendedproperty 'MS_Description', '转诊医院编码', 'SCHEMA', dbo, 'table', t_yb_personinfo, 'column', fromhosp;
EXEC sp_addextendedproperty 'MS_Description', '转诊时限', 'SCHEMA', dbo, 'table', t_yb_personinfo, 'column', fromhospdate;
EXEC sp_addextendedproperty 'MS_Description', '参保人员类别', 'SCHEMA', dbo, 'table', t_yb_personinfo, 'column', persontype;
EXEC sp_addextendedproperty 'MS_Description', '是否在红名单', 'SCHEMA', dbo, 'table', t_yb_personinfo, 'column', isinredlist;
EXEC sp_addextendedproperty 'MS_Description', '是否本人定点医院', 'SCHEMA', dbo, 'table', t_yb_personinfo, 'column', isspecifiedhosp;
EXEC sp_addextendedproperty 'MS_Description', '是否本人慢病定点医院', 'SCHEMA', dbo, 'table', t_yb_personinfo, 'column', ischronichosp;
EXEC sp_addextendedproperty 'MS_Description', '个人账户余额', 'SCHEMA', dbo, 'table', t_yb_personinfo, 'column', personcount;
EXEC sp_addextendedproperty 'MS_Description', '慢病编码', 'SCHEMA', dbo, 'table', t_yb_personinfo, 'column', chroniccode;
EXEC sp_addextendedproperty 'MS_Description', '险种类型', 'SCHEMA', dbo, 'table', t_yb_personinfo, 'column', fundtype;
EXEC sp_addextendedproperty 'MS_Description', '预提人员标识', 'SCHEMA', dbo, 'table', t_yb_personinfo, 'column', isyt;
EXEC sp_addextendedproperty 'MS_Description', '军残等级', 'SCHEMA', dbo, 'table', t_yb_personinfo, 'column', jclevel;
EXEC sp_addextendedproperty 'MS_Description', '在院标识', 'SCHEMA', dbo, 'table', t_yb_personinfo, 'column', hospflag;
EXEC sp_addextendedproperty 'MS_Description', '个人管理码', 'SCHEMA', dbo, 'table', t_yb_personinfo, 'column', personmanage;
EXEC sp_addextendedproperty 'MS_Description', '参加公务员医疗补助标识', 'SCHEMA', dbo, 'table', t_yb_personinfo, 'column', servantflag;
EXEC sp_addextendedproperty 'MS_Description', '低保对象标识', 'SCHEMA', dbo, 'table', t_yb_personinfo, 'column', PoorFlag;
EXEC sp_addextendedproperty 'MS_Description', '本年度住院次数', 'SCHEMA', dbo, 'table', t_yb_personinfo, 'column', InHospitalNumber;
EXEC sp_addextendedproperty 'MS_Description', '参保地行政区划代码', 'SCHEMA', dbo, 'table', t_yb_personinfo, 'column', AreaCode;
EXEC sp_addextendedproperty 'MS_Description', '', 'SCHEMA', dbo, 'table', t_yb_personinfo, 'column', updatedate;
EXEC sp_addextendedproperty 'MS_Description', '参保地标志;1 本地，2 异地', 'SCHEMA', dbo, 'table', t_yb_personinfo, 'column', cbdbz;

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

-------------费用分解增加字段 --------------------
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

EXEC sp_addextendedproperty 'MS_Description', '西药费', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', medicine;
EXEC sp_addextendedproperty 'MS_Description', '中成药费', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', tmedicine;
EXEC sp_addextendedproperty 'MS_Description', '中草药费', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', therb;
EXEC sp_addextendedproperty 'MS_Description', '基本医疗保险统筹基金支付金额', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', BasePay;
EXEC sp_addextendedproperty 'MS_Description', '公务员医疗补助基金', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', GwybzPay;
EXEC sp_addextendedproperty 'MS_Description', '门诊大额支付金额', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', mzbigpay;
EXEC sp_addextendedproperty 'MS_Description', '民政补助基金', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', MzbzPay;
EXEC sp_addextendedproperty 'MS_Description', '其他基金支付', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', OtherPay;
EXEC sp_addextendedproperty 'MS_Description', '个人账户余额', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', PersonCountBalance;
EXEC sp_addextendedproperty 'MS_Description', '提示信息', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', PromptMessage;
EXEC sp_addextendedproperty 'MS_Description', '全额垫付标志', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', SelfPayFlag;
EXEC sp_addextendedproperty 'MS_Description', '基金分项编码', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', FundCode;
EXEC sp_addextendedproperty 'MS_Description', '基金分项名称', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', FundName;
EXEC sp_addextendedproperty 'MS_Description', '基金分项支付金额', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', FundPay;
EXEC sp_addextendedproperty 'MS_Description', '诊察费', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', diagnosis;
EXEC sp_addextendedproperty 'MS_Description', '检查费', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', examine;
EXEC sp_addextendedproperty 'MS_Description', '化验费', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', labexam;
EXEC sp_addextendedproperty 'MS_Description', '治疗费', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', treatment;
EXEC sp_addextendedproperty 'MS_Description', '手术费', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', operation;
EXEC sp_addextendedproperty 'MS_Description', '卫生材料费', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', material;
EXEC sp_addextendedproperty 'MS_Description', '医事服务费', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', medicalservice;
EXEC sp_addextendedproperty 'MS_Description', '一般诊疗费', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', commonservice;
EXEC sp_addextendedproperty 'MS_Description', '挂号费', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', registfee;
EXEC sp_addextendedproperty 'MS_Description', '其他门诊收费', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', otheropfee;
EXEC sp_addextendedproperty 'MS_Description', '本次付起付线金额', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', mzpayfirst;
EXEC sp_addextendedproperty 'MS_Description', '费用总金额', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', mzfee;
EXEC sp_addextendedproperty 'MS_Description', '参保地结算流水号', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', depatradeno;
EXEC sp_addextendedproperty 'MS_Description', '对账标志;0 未对账，1 对账成功，2 对账失败', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', dzbz;
EXEC sp_addextendedproperty 'MS_Description', '对账返回的消息', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', dzxx;
EXEC sp_addextendedproperty 'MS_Description', '先行自付金额汇总;异地结算专用', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', selfPayFirst;
EXEC sp_addextendedproperty 'MS_Description', '全自费金额;异地结算专用', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', selFeeAll;
EXEC sp_addextendedproperty 'MS_Description', '异地平台交易时间;异地结算专用', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', nationtradedate;
EXEC sp_addextendedproperty 'MS_Description', '医保内金额', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', mzfeein;
EXEC sp_addextendedproperty 'MS_Description', '医保外金额', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', mzfeeout;
EXEC sp_addextendedproperty 'MS_Description', '参保地标志;1 本地，2 异地', 'SCHEMA', dbo, 'table', T_yb_divide, 'column', cbdbz;

CREATE TABLE [dbo].[t_yb_divide_fundpay](
    id int NOT NULL IDENTITY(1,1),
    tradeno VARCHAR(24),
    fundcode VARCHAR(8),
    fundname varchar(64),
    fundpay decimal(10,2),
    PRIMARY KEY (id)
)

EXEC sp_addextendedproperty 'MS_Description', '费用分解基金支付列表', 'SCHEMA', dbo, 'table', t_yb_divide_fundpay, null, null;
EXEC sp_addextendedproperty 'MS_Description', 'ID', 'SCHEMA', dbo, 'table', t_yb_divide_fundpay, 'column', id;
EXEC sp_addextendedproperty 'MS_Description', '医保交易流水号', 'SCHEMA', dbo, 'table', t_yb_divide_fundpay, 'column', tradeno;
EXEC sp_addextendedproperty 'MS_Description', '基金代码', 'SCHEMA', dbo, 'table', t_yb_divide_fundpay, 'column', fundcode;
EXEC sp_addextendedproperty 'MS_Description', '基金名称', 'SCHEMA', dbo, 'table', t_yb_divide_fundpay, 'column', fundname;
EXEC sp_addextendedproperty 'MS_Description', '支付金额', 'SCHEMA', dbo, 'table', t_yb_divide_fundpay, 'column', fundpay;

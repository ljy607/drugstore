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

EXEC sp_addextendedproperty 'MS_Description', '入出库单据头信息', 'user', dbo, 'table', t_bjyj_rck, null, null;
EXEC sp_addextendedproperty 'MS_Description', '上报单据号', 'user', dbo, 'table', t_bjyj_rck, 'column', bill_code;
EXEC sp_addextendedproperty 'MS_Description', '单据时间', 'user', dbo, 'table', t_bjyj_rck, 'column', bill_time;
EXEC sp_addextendedproperty 'MS_Description', '单据类型;单据类型【包括 102, “采购入库”；103, “退货入库”；104, “调拨入库”；107, “供应入库”；108, “召回入库”；110,”赠品入库”；111,”盘盈入库”；112,”报废入库”；113,”其他入库” 201, “销售出库”；202,“退货出库”；203, “调拨出库”；204, “返工出库”；205, “销毁出库”；206, “抽检出库”；207, “直调出库”；209, “供应出库”；211, “召回出库”；212,”赠品出库”；214,”盘亏出库”；215,”损坏出库”；216,”报废 
出库”；217,”其他出库”；237, “直调退货”', 'user', dbo, 'table', t_bjyj_rck, 'column', bill_type;
EXEC sp_addextendedproperty 'MS_Description', '企业统一社会信用代码', 'user', dbo, 'table', t_bjyj_rck, 'column', org_code;
EXEC sp_addextendedproperty 'MS_Description', '发货企业企业统一社会信用代码;企业统一社会信用代码，连锁总部为本机构门店上报时，使用门店统一社会信用代码', 'user', dbo, 'table', t_bjyj_rck, 'column', from_org_code;
EXEC sp_addextendedproperty 'MS_Description', '发货企业名称;出货企业', 'user', dbo, 'table', t_bjyj_rck, 'column', from_org_name;
EXEC sp_addextendedproperty 'MS_Description', '收货企业企业统一社会信用代码', 'user', dbo, 'table', t_bjyj_rck, 'column', to_org_code;
EXEC sp_addextendedproperty 'MS_Description', '收货企业名称;收货企业', 'user', dbo, 'table', t_bjyj_rck, 'column', to_org_name;
EXEC sp_addextendedproperty 'MS_Description', '上报标识;上传标识，0 未上传，1上传成功，-1 上传失败', 'user', dbo, 'table', t_bjyj_rck, 'column', scbz;
EXEC sp_addextendedproperty 'MS_Description', '上报失败原因', 'user', dbo, 'table', t_bjyj_rck, 'column', scsbyy;
EXEC sp_addextendedproperty 'MS_Description', '单据号码', 'user', dbo, 'table', t_bjyj_rck, 'column', djhm;

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

EXEC sp_addextendedproperty 'MS_Description', '入出库单据明细信息', 'user', dbo, 'table', t_bjyj_rckmx, null, null;
EXEC sp_addextendedproperty 'MS_Description', '上报单据号', 'user', dbo, 'table', t_bjyj_rckmx, 'column', bill_code;
EXEC sp_addextendedproperty 'MS_Description', '序号', 'user', dbo, 'table', t_bjyj_rckmx, 'column', ordr;
EXEC sp_addextendedproperty 'MS_Description', '货号', 'user', dbo, 'table', t_bjyj_rckmx, 'column', spbh;
EXEC sp_addextendedproperty 'MS_Description', '数量', 'user', dbo, 'table', t_bjyj_rckmx, 'column', code_count;
EXEC sp_addextendedproperty 'MS_Description', '码类型;1: 药品标识码(追溯 码前 7 位) 2: 商品条码 (69 码) 3: 药品本位码', 'user', dbo, 'table', t_bjyj_rckmx, 'column', code_type;
EXEC sp_addextendedproperty 'MS_Description', '药品标识码/商 品条码/药品本位码', 'user', dbo, 'table', t_bjyj_rckmx, 'column', code;
EXEC sp_addextendedproperty 'MS_Description', '有效期至;出货企业', 'user', dbo, 'table', t_bjyj_rckmx, 'column', exprie_date;
EXEC sp_addextendedproperty 'MS_Description', '药品通用名称', 'user', dbo, 'table', t_bjyj_rckmx, 'column', pm;
EXEC sp_addextendedproperty 'MS_Description', '规格;收货企业', 'user', dbo, 'table', t_bjyj_rckmx, 'column', gg;
EXEC sp_addextendedproperty 'MS_Description', '制剂数量', 'user', dbo, 'table', t_bjyj_rckmx, 'column', prepn_count;
EXEC sp_addextendedproperty 'MS_Description', '单位', 'user', dbo, 'table', t_bjyj_rckmx, 'column', jldw;
EXEC sp_addextendedproperty 'MS_Description', '批准文号', 'user', dbo, 'table', t_bjyj_rckmx, 'column', pzwh;
EXEC sp_addextendedproperty 'MS_Description', '批号', 'user', dbo, 'table', t_bjyj_rckmx, 'column', pcbh;
EXEC sp_addextendedproperty 'MS_Description', '生产日期', 'user', dbo, 'table', t_bjyj_rckmx, 'column', scrq;

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

EXEC sp_addextendedproperty 'MS_Description', '当日库存头信息', 'user', dbo, 'table', t_bjyj_drkc, null, null;
EXEC sp_addextendedproperty 'MS_Description', 'ID;日期8位 20241101', 'user', dbo, 'table', t_bjyj_drkc, 'column', ID;
EXEC sp_addextendedproperty 'MS_Description', 'AppKey', 'user', dbo, 'table', t_bjyj_drkc, 'column', AppKey;
EXEC sp_addextendedproperty 'MS_Description', '单位编号', 'user', dbo, 'table', t_bjyj_drkc, 'column', dwbh;
EXEC sp_addextendedproperty 'MS_Description', '统一社会信用代码', 'user', dbo, 'table', t_bjyj_drkc, 'column', org_code;
EXEC sp_addextendedproperty 'MS_Description', '企业名称', 'user', dbo, 'table', t_bjyj_drkc, 'column', org_name;
EXEC sp_addextendedproperty 'MS_Description', '库存时间;2023-03-10 10:23', 'user', dbo, 'table', t_bjyj_drkc, 'column', jcsb_rq;
EXEC sp_addextendedproperty 'MS_Description', '上传标志', 'user', dbo, 'table', t_bjyj_drkc, 'column', scbz;
EXEC sp_addextendedproperty 'MS_Description', '上传失败原因', 'user', dbo, 'table', t_bjyj_drkc, 'column', scsbyy;

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

EXEC sp_addextendedproperty 'MS_Description', '当日库存明细信息', 'user', dbo, 'table', t_bjyj_drkcmx, null, null;
EXEC sp_addextendedproperty 'MS_Description', 'ID', 'user', dbo, 'table', t_bjyj_drkcmx, 'column', ID;
EXEC sp_addextendedproperty 'MS_Description', '货号', 'user', dbo, 'table', t_bjyj_drkcmx, 'column', spbh;
EXEC sp_addextendedproperty 'MS_Description', '码类型;1: 药品标识码(追溯 码前 7 位) 2: 商品条码 (69 码) 3: 药品本位码', 'user', dbo, 'table', t_bjyj_drkcmx, 'column', code_type;
EXEC sp_addextendedproperty 'MS_Description', '药品标识码/商 品条码/药品本位码', 'user', dbo, 'table', t_bjyj_drkcmx, 'column', code;
EXEC sp_addextendedproperty 'MS_Description', '药品通用名称', 'user', dbo, 'table', t_bjyj_drkcmx, 'column', pm;
EXEC sp_addextendedproperty 'MS_Description', '库存数量', 'user', dbo, 'table', t_bjyj_drkcmx, 'column', kcsl;
EXEC sp_addextendedproperty 'MS_Description', '生产厂家名称', 'user', dbo, 'table', t_bjyj_drkcmx, 'column', cjmc;
EXEC sp_addextendedproperty 'MS_Description', '规格;收货企业', 'user', dbo, 'table', t_bjyj_drkcmx, 'column', gg;
EXEC sp_addextendedproperty 'MS_Description', '制剂数量', 'user', dbo, 'table', t_bjyj_drkcmx, 'column', prepn_count;
EXEC sp_addextendedproperty 'MS_Description', '剂型', 'user', dbo, 'table', t_bjyj_drkcmx, 'column', jx;
EXEC sp_addextendedproperty 'MS_Description', '单位', 'user', dbo, 'table', t_bjyj_drkcmx, 'column', jldw;
EXEC sp_addextendedproperty 'MS_Description', '批准文号', 'user', dbo, 'table', t_bjyj_drkcmx, 'column', pzwh;

DROP TABLE t_bjyj_pzxx;
CREATE TABLE t_bjyj_pzxx(
    dwbh VARCHAR(10) NOT NULL,
    AppKey VARCHAR(100) DEFAULT  '609ec043b99442d5986475b5a7bb2661',
    AppSecret VARCHAR(100) DEFAULT  '68a640d0e927453eaa0ebeca9ebd992ac2e99eb2667f4401814ebb6fe579fa71',
    org_code VARCHAR(30),
    org_name VARCHAR(80),
    PRIMARY KEY (dwbh)
)

EXEC sp_addextendedproperty 'MS_Description', '北京药监配置信息表', 'user', dbo, 'table', t_bjyj_pzxx, null, null;
EXEC sp_addextendedproperty 'MS_Description', '单位编码', 'user', dbo, 'table', t_bjyj_pzxx, 'column', dwbh;
EXEC sp_addextendedproperty 'MS_Description', 'AppKey', 'user', dbo, 'table', t_bjyj_pzxx, 'column', AppKey;
EXEC sp_addextendedproperty 'MS_Description', 'AppSecret', 'user', dbo, 'table', t_bjyj_pzxx, 'column', AppSecret;
EXEC sp_addextendedproperty 'MS_Description', '公司/门店统一社会信用代码', 'user', dbo, 'table', t_bjyj_pzxx, 'column', org_code;
EXEC sp_addextendedproperty 'MS_Description', '公司/门店全称', 'user', dbo, 'table', t_bjyj_pzxx, 'column', org_name;

----分店单独执行
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

EXEC sp_addextendedproperty 'MS_Description', '零售单据头信息', 'user', dbo, 'table', t_bjyj_lsd, null, null;
EXEC sp_addextendedproperty 'MS_Description', '上报单据号', 'user', dbo, 'table', t_bjyj_lsd, 'column', bill_code;
EXEC sp_addextendedproperty 'MS_Description', '单据时间;格式 2023-03-10 10:23', 'user', dbo, 'table', t_bjyj_lsd, 'column', bill_time;
EXEC sp_addextendedproperty 'MS_Description', '单据类型;单据类型[321,零售出库][322,疫苗接种][116,消费者退货入库]', 'user', dbo, 'table', t_bjyj_lsd, 'column', bill_type;
EXEC sp_addextendedproperty 'MS_Description', '单据提交者;必须为appkey', 'user', dbo, 'table', t_bjyj_lsd, 'column', oper_ic_code;
EXEC sp_addextendedproperty 'MS_Description', '企业统一社会信用代码;销售企业统一社会信用代码', 'user', dbo, 'table', t_bjyj_lsd, 'column', org_code;
EXEC sp_addextendedproperty 'MS_Description', '数据类型;数据类型,1 单据数据，2 单据汇总数据', 'user', dbo, 'table', t_bjyj_lsd, 'column', data_type;
EXEC sp_addextendedproperty 'MS_Description', '互联网订单标识 0 非互联网 1 互联网', 'user', dbo, 'table', t_bjyj_lsd, 'column', network_bill_flag;
EXEC sp_addextendedproperty 'MS_Description', '上传标志;上传标识，0 未上传，1上传成功，-1 上传失败', 'user', dbo, 'table', t_bjyj_lsd, 'column', scbz;
EXEC sp_addextendedproperty 'MS_Description', '上传失败原因', 'user', dbo, 'table', t_bjyj_lsd, 'column', scsbyy;
EXEC sp_addextendedproperty 'MS_Description', '零售单编号', 'user', dbo, 'table', t_bjyj_lsd, 'column', lsdbh;

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

EXEC sp_addextendedproperty 'MS_Description', '零售单据明细信息', 'user', dbo, 'table', t_bjyj_lsdmx, null, null;
EXEC sp_addextendedproperty 'MS_Description', '上报单据号', 'user', dbo, 'table', t_bjyj_lsdmx, 'column', bill_code;
EXEC sp_addextendedproperty 'MS_Description', '序号', 'user', dbo, 'table', t_bjyj_lsdmx, 'column', ordr;
EXEC sp_addextendedproperty 'MS_Description', '数量', 'user', dbo, 'table', t_bjyj_lsdmx, 'column', code_count;
EXEC sp_addextendedproperty 'MS_Description', '码类型;1: 药品标识码(追溯 码前 7 位) 2: 商品条码 (69 码) 3: 药品本位码', 'user', dbo, 'table', t_bjyj_lsdmx, 'column', code_type;
EXEC sp_addextendedproperty 'MS_Description', '药品标识码/商 品条码/药品本位码', 'user', dbo, 'table', t_bjyj_lsdmx, 'column', code;
EXEC sp_addextendedproperty 'MS_Description', '药品通用名称', 'user', dbo, 'table', t_bjyj_lsdmx, 'column', pm;
EXEC sp_addextendedproperty 'MS_Description', '规格;收货企业', 'user', dbo, 'table', t_bjyj_lsdmx, 'column', gg;
EXEC sp_addextendedproperty 'MS_Description', '制剂数量', 'user', dbo, 'table', t_bjyj_lsdmx, 'column', prepn_count;
EXEC sp_addextendedproperty 'MS_Description', '单位', 'user', dbo, 'table', t_bjyj_lsdmx, 'column', jldw;
EXEC sp_addextendedproperty 'MS_Description', '批准文号', 'user', dbo, 'table', t_bjyj_lsdmx, 'column', pzwh;
EXEC sp_addextendedproperty 'MS_Description', '批号', 'user', dbo, 'table', t_bjyj_lsdmx, 'column', pcbh;
EXEC sp_addextendedproperty 'MS_Description', '货号', 'user', dbo, 'table', t_bjyj_lsdmx, 'column', spbh;

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





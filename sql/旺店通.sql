---- 旺店通订单
CREATE TABLE w_wdtdd(
    wdtddbh VARCHAR(64) NOT NULL    ,
    ptlx NVARCHAR(32)     ,
    dpmc NVARCHAR(32)     ,
    ddbh VARCHAR(256)     ,
    ddzt NVARCHAR(32)     ,
    ddlx NVARCHAR(32)     ,
    tkzt NVARCHAR(32)     ,
    xdsj DATE     ,
    wlgs NVARCHAR(32)     ,
    wldh VARCHAR(64)     ,
    kfbz VARCHAR(64)     ,
    hpsl INT,
    hpje DECIMAL(10,2) DEFAULT 0,
    yhje DECIMAL(10,2) DEFAULT 0,
    ysje DECIMAL(10,2) DEFAULT 0,
    hpygcb DECIMAL(10,2) DEFAULT 0,
    ygyzcb DECIMAL(10,2) DEFAULT 0,
    yfje DECIMAL(10,2) DEFAULT 0,
    ygml DECIMAL(10,2) DEFAULT 0,
    ywy NVARCHAR(32),
    sfzd TINYINT DEFAULT 1,
    CONSTRAINT PK_w_wdtdd PRIMARY KEY CLUSTERED (wdtddbh ASC ) ON [PRIMARY] 
) ;
create nonclustered index idx_ddbh on w_wdtdd(ddbh) ;

EXECUTE sp_addextendedproperty N'MS_Description', '旺店通订单', N'user', N'dbo', N'table', N'w_wdtdd', NULL, NULL;
EXECUTE sp_addextendedproperty N'MS_Description', '订单编号', N'user', N'dbo', N'table', N'w_wdtdd', N'column', N'wdtddbh';
EXECUTE sp_addextendedproperty N'MS_Description', '平台类型', N'user', N'dbo', N'table', N'w_wdtdd', N'column', N'ptlx';
EXECUTE sp_addextendedproperty N'MS_Description', '店铺名称', N'user', N'dbo', N'table', N'w_wdtdd', N'column', N'dpmc';
EXECUTE sp_addextendedproperty N'MS_Description', '原始单号', N'user', N'dbo', N'table', N'w_wdtdd', N'column', N'ddbh';
EXECUTE sp_addextendedproperty N'MS_Description', '订单状态', N'user', N'dbo', N'table', N'w_wdtdd', N'column', N'ddzt';
EXECUTE sp_addextendedproperty N'MS_Description', '订单类型', N'user', N'dbo', N'table', N'w_wdtdd', N'column', N'ddlx';
EXECUTE sp_addextendedproperty N'MS_Description', '退库状态', N'user', N'dbo', N'table', N'w_wdtdd', N'column', N'tkzt';
EXECUTE sp_addextendedproperty N'MS_Description', '下单时间', N'user', N'dbo', N'table', N'w_wdtdd', N'column', N'xdsj';
EXECUTE sp_addextendedproperty N'MS_Description', '物流公司', N'user', N'dbo', N'table', N'w_wdtdd', N'column', N'wlgs';
EXECUTE sp_addextendedproperty N'MS_Description', '物流单号', N'user', N'dbo', N'table', N'w_wdtdd', N'column', N'wldh';
EXECUTE sp_addextendedproperty N'MS_Description', '客服备注', N'user', N'dbo', N'table', N'w_wdtdd', N'column', N'kfbz';
EXECUTE sp_addextendedproperty N'MS_Description', '货品总数', N'user', N'dbo', N'table', N'w_wdtdd', N'column', N'hpsl';
EXECUTE sp_addextendedproperty N'MS_Description', '货品总额', N'user', N'dbo', N'table', N'w_wdtdd', N'column', N'hpje';
EXECUTE sp_addextendedproperty N'MS_Description', '优惠', N'user', N'dbo', N'table', N'w_wdtdd', N'column', N'yhje';
EXECUTE sp_addextendedproperty N'MS_Description', '应收金额', N'user', N'dbo', N'table', N'w_wdtdd', N'column', N'ysje';
EXECUTE sp_addextendedproperty N'MS_Description', '货品预估成本', N'user', N'dbo', N'table', N'w_wdtdd', N'column', N'hpygcb';
EXECUTE sp_addextendedproperty N'MS_Description', '预估邮资成本', N'user', N'dbo', N'table', N'w_wdtdd', N'column', N'ygyzcb';
EXECUTE sp_addextendedproperty N'MS_Description', '已付金额', N'user', N'dbo', N'table', N'w_wdtdd', N'column', N'yfje';
EXECUTE sp_addextendedproperty N'MS_Description', '预估毛利', N'user', N'dbo', N'table', N'w_wdtdd', N'column', N'ygml';
EXECUTE sp_addextendedproperty N'MS_Description', '业务员', N'user', N'dbo', N'table', N'w_wdtdd', N'column', N'ywy';
EXECUTE sp_addextendedproperty N'MS_Description', '是否真单', N'user', N'dbo', N'table', N'w_wdtdd', N'column', N'sfzd';

------小额打款记录
CREATE TABLE w_xedkjl(
    id BIGINT NOT NULL IDENTITY(1,1)   ,
    ptlx VARCHAR(32)     ,
    ddbh VARCHAR(64)     ,
    ddsj DATE     ,
    lx NVARCHAR(32)     ,
    je DECIMAL(10,2) ,
    CONSTRAINT PK_w_xedkjl PRIMARY KEY CLUSTERED (id ASC ) ON [PRIMARY] 
) ;
create nonclustered index idx_ddbh on w_xedkjl(ddbh) ;

EXECUTE sp_addextendedproperty N'MS_Description', 'w_xedkjl', N'user', N'dbo', N'table', N'w_xedkjl', NULL, NULL;
EXECUTE sp_addextendedproperty N'MS_Description', '主键', N'user', N'dbo', N'table', N'w_xedkjl', N'column', N'id';
EXECUTE sp_addextendedproperty N'MS_Description', '平台类型', N'user', N'dbo', N'table', N'w_xedkjl', N'column', N'ptlx';
EXECUTE sp_addextendedproperty N'MS_Description', '订单编号', N'user', N'dbo', N'table', N'w_xedkjl', N'column', N'ddbh';
EXECUTE sp_addextendedproperty N'MS_Description', '时间', N'user', N'dbo', N'table', N'w_xedkjl', N'column', N'ddsj';
EXECUTE sp_addextendedproperty N'MS_Description', '类型', N'user', N'dbo', N'table', N'w_xedkjl', N'column', N'lx';
EXECUTE sp_addextendedproperty N'MS_Description', '金额', N'user', N'dbo', N'table', N'w_xedkjl', N'column', N'je';

-------退货单表
CREATE TABLE w_thd(
    id BIGINT NOT NULL IDENTITY(1,1)   ,
    ptlx NVARCHAR(32)     ,
    dpmc VARCHAR(64)     ,
    dkdh VARCHAR(64)     ,
    ddbh VARCHAR(64)     ,
    lx NVARCHAR(32)     ,
    ptzt NVARCHAR(32)     ,
    xtzt NVARCHAR(32)     ,
    djsbyy NVARCHAR(32)     ,
    tkhczt NVARCHAR(32)     ,
    tkjd NVARCHAR(32)     ,
    sqtkje DECIMAL(10,2)  ,
    sjtkje DECIMAL(10,2)  ,
    tkyy VARCHAR(64)     ,
    bz NVARCHAR(128)     ,
    wlgs VARCHAR(64)     ,
    wldh VARCHAR(64)     ,
    tksj DATE     ,
    xgsj DATE     ,
    cjsj DATE     ,
    CONSTRAINT PK_w_thd PRIMARY KEY CLUSTERED (id ASC ) ON [PRIMARY] 
) ;
create nonclustered index idx_ddbh on w_thd(ddbh);

EXECUTE sp_addextendedproperty N'MS_Description', '退货单', N'user', N'dbo', N'table', N'w_thd', NULL, NULL;
EXECUTE sp_addextendedproperty N'MS_Description', '主键', N'user', N'dbo', N'table', N'w_thd', N'column', N'id';
EXECUTE sp_addextendedproperty N'MS_Description', '平台类型', N'user', N'dbo', N'table', N'w_thd', N'column', N'ptlx';
EXECUTE sp_addextendedproperty N'MS_Description', '店铺名称', N'user', N'dbo', N'table', N'w_thd', N'column', N'dpmc';
EXECUTE sp_addextendedproperty N'MS_Description', '退款单号', N'user', N'dbo', N'table', N'w_thd', N'column', N'dkdh';
EXECUTE sp_addextendedproperty N'MS_Description', '原始单号', N'user', N'dbo', N'table', N'w_thd', N'column', N'ddbh';
EXECUTE sp_addextendedproperty N'MS_Description', '类型', N'user', N'dbo', N'table', N'w_thd', N'column', N'lx';
EXECUTE sp_addextendedproperty N'MS_Description', '平台状态', N'user', N'dbo', N'table', N'w_thd', N'column', N'ptzt';
EXECUTE sp_addextendedproperty N'MS_Description', '系统状态', N'user', N'dbo', N'table', N'w_thd', N'column', N'xtzt';
EXECUTE sp_addextendedproperty N'MS_Description', '递交失败原因', N'user', N'dbo', N'table', N'w_thd', N'column', N'djsbyy';
EXECUTE sp_addextendedproperty N'MS_Description', '退款回传状态', N'user', N'dbo', N'table', N'w_thd', N'column', N'tkhczt';
EXECUTE sp_addextendedproperty N'MS_Description', '退款阶段', N'user', N'dbo', N'table', N'w_thd', N'column', N'tkjd';
EXECUTE sp_addextendedproperty N'MS_Description', '申请退款金额', N'user', N'dbo', N'table', N'w_thd', N'column', N'sqtkje';
EXECUTE sp_addextendedproperty N'MS_Description', '实际退款金额', N'user', N'dbo', N'table', N'w_thd', N'column', N'sjtkje';
EXECUTE sp_addextendedproperty N'MS_Description', '退款原因', N'user', N'dbo', N'table', N'w_thd', N'column', N'tkyy';
EXECUTE sp_addextendedproperty N'MS_Description', '备注', N'user', N'dbo', N'table', N'w_thd', N'column', N'bz';
EXECUTE sp_addextendedproperty N'MS_Description', '物流公司', N'user', N'dbo', N'table', N'w_thd', N'column', N'wlgs';
EXECUTE sp_addextendedproperty N'MS_Description', '物流单号', N'user', N'dbo', N'table', N'w_thd', N'column', N'wldh';
EXECUTE sp_addextendedproperty N'MS_Description', '退款时间', N'user', N'dbo', N'table', N'w_thd', N'column', N'tksj';
EXECUTE sp_addextendedproperty N'MS_Description', '修改时间', N'user', N'dbo', N'table', N'w_thd', N'column', N'xgsj';
EXECUTE sp_addextendedproperty N'MS_Description', '创建时间', N'user', N'dbo', N'table', N'w_thd', N'column', N'cjsj';




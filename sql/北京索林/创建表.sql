DROP TABLE t_bjsl_yhjlmx;
CREATE TABLE t_bjsl_yhjlmx(
    wlzx INT NOT NULL,
    dh nvarchar(50) NOT NULL,
    hpbh NVARCHAR(50) NOT NULL,
    kqbh NVARCHAR(50) NOT NULL,
    hwbh NVARCHAR(50) NOT NULL,
    pcbh NVARCHAR(50) NOT NULL,
    date DATETIME NOT NULL,
    id INT NOT NULL,
    wlzxmc NVARCHAR(200),
    hzbh Nvarchar(50),
    hzmc NVARCHAR(200),
    yhrq DATETIME,
    yhlx NVARCHAR(50),
    yhy NVARCHAR(200),
    spbh NVARCHAR(50),
    pm NVARCHAR(200),
    gg NVARCHAR(100),
    cd NVARCHAR(256),
    sccj NVARCHAR(256),
    jldw VARCHAR(60),
    bz DECIMAL(18,4),
    cctj NVARCHAR(50),
    zczh NVARCHAR(100),
    xkzh NVARCHAR(100),
    hpdl NVARCHAR(200),
    hpsx NVARCHAR(200),
    kqmc NVARCHAR(200),
    hwmc NVARCHAR(200),
    yxrq DATETIME,
    scrq DATETIME,
    yhsl DECIMAL(18,4),
    zlzk NVARCHAR(200),
    clyj NVARCHAR(200),
    yhjl NVARCHAR(200),
    sm VARCHAR(500),
    dyph NVARCHAR(50),
    dyxq NVARCHAR(20),
    dyscrq NVARCHAR(20),
    PRIMARY KEY (wlzx,dh,hpbh,kqbh,hwbh,pcbh,date,id)
)

EXEC sp_addextendedproperty 'MS_Description', '北京索林养护记录', 'user', dbo, 'table', t_bjsl_yhjlmx, null, null;
EXEC sp_addextendedproperty 'MS_Description', '物流中心', 'user', dbo, 'table', t_bjsl_yhjlmx, 'column', wlzx;
EXEC sp_addextendedproperty 'MS_Description', '养护单号', 'user', dbo, 'table', t_bjsl_yhjlmx, 'column', dh;
EXEC sp_addextendedproperty 'MS_Description', '货品编号(索林)', 'user', dbo, 'table', t_bjsl_yhjlmx, 'column', hpbh;
EXEC sp_addextendedproperty 'MS_Description', '库区编号', 'user', dbo, 'table', t_bjsl_yhjlmx, 'column', kqbh;
EXEC sp_addextendedproperty 'MS_Description', '货位编号', 'user', dbo, 'table', t_bjsl_yhjlmx, 'column', hwbh;
EXEC sp_addextendedproperty 'MS_Description', '批号', 'user', dbo, 'table', t_bjsl_yhjlmx, 'column', pcbh;
EXEC sp_addextendedproperty 'MS_Description', 'date', 'user', dbo, 'table', t_bjsl_yhjlmx, 'column', date;
EXEC sp_addextendedproperty 'MS_Description', 'id', 'user', dbo, 'table', t_bjsl_yhjlmx, 'column', id;
EXEC sp_addextendedproperty 'MS_Description', '物流中心名称', 'user', dbo, 'table', t_bjsl_yhjlmx, 'column', wlzxmc;
EXEC sp_addextendedproperty 'MS_Description', '货主编号', 'user', dbo, 'table', t_bjsl_yhjlmx, 'column', hzbh;
EXEC sp_addextendedproperty 'MS_Description', '货主名称', 'user', dbo, 'table', t_bjsl_yhjlmx, 'column', hzmc;
EXEC sp_addextendedproperty 'MS_Description', '养护日期;分店编号', 'user', dbo, 'table', t_bjsl_yhjlmx, 'column', yhrq;
EXEC sp_addextendedproperty 'MS_Description', '养护类型', 'user', dbo, 'table', t_bjsl_yhjlmx, 'column', yhlx;
EXEC sp_addextendedproperty 'MS_Description', '养护员', 'user', dbo, 'table', t_bjsl_yhjlmx, 'column', yhy;
EXEC sp_addextendedproperty 'MS_Description', '货号', 'user', dbo, 'table', t_bjsl_yhjlmx, 'column', spbh;
EXEC sp_addextendedproperty 'MS_Description', '货品名称', 'user', dbo, 'table', t_bjsl_yhjlmx, 'column', pm;
EXEC sp_addextendedproperty 'MS_Description', '规格', 'user', dbo, 'table', t_bjsl_yhjlmx, 'column', gg;
EXEC sp_addextendedproperty 'MS_Description', '产地', 'user', dbo, 'table', t_bjsl_yhjlmx, 'column', cd;
EXEC sp_addextendedproperty 'MS_Description', '生产厂商', 'user', dbo, 'table', t_bjsl_yhjlmx, 'column', sccj;
EXEC sp_addextendedproperty 'MS_Description', '单位', 'user', dbo, 'table', t_bjsl_yhjlmx, 'column', jldw;
EXEC sp_addextendedproperty 'MS_Description', '包装', 'user', dbo, 'table', t_bjsl_yhjlmx, 'column', bz;
EXEC sp_addextendedproperty 'MS_Description', '储存条件', 'user', dbo, 'table', t_bjsl_yhjlmx, 'column', cctj;
EXEC sp_addextendedproperty 'MS_Description', '注册证号', 'user', dbo, 'table', t_bjsl_yhjlmx, 'column', zczh;
EXEC sp_addextendedproperty 'MS_Description', '生产企业许可证号或备案凭证号', 'user', dbo, 'table', t_bjsl_yhjlmx, 'column', xkzh;
EXEC sp_addextendedproperty 'MS_Description', '货品大类', 'user', dbo, 'table', t_bjsl_yhjlmx, 'column', hpdl;
EXEC sp_addextendedproperty 'MS_Description', '货品属性', 'user', dbo, 'table', t_bjsl_yhjlmx, 'column', hpsx;
EXEC sp_addextendedproperty 'MS_Description', '库区名称', 'user', dbo, 'table', t_bjsl_yhjlmx, 'column', kqmc;
EXEC sp_addextendedproperty 'MS_Description', '货位名称', 'user', dbo, 'table', t_bjsl_yhjlmx, 'column', hwmc;
EXEC sp_addextendedproperty 'MS_Description', '有效期至', 'user', dbo, 'table', t_bjsl_yhjlmx, 'column', yxrq;
EXEC sp_addextendedproperty 'MS_Description', '生产日期', 'user', dbo, 'table', t_bjsl_yhjlmx, 'column', scrq;
EXEC sp_addextendedproperty 'MS_Description', '养护数量;收货时间', 'user', dbo, 'table', t_bjsl_yhjlmx, 'column', yhsl;
EXEC sp_addextendedproperty 'MS_Description', '质量状态', 'user', dbo, 'table', t_bjsl_yhjlmx, 'column', zlzk;
EXEC sp_addextendedproperty 'MS_Description', '处理意见', 'user', dbo, 'table', t_bjsl_yhjlmx, 'column', clyj;
EXEC sp_addextendedproperty 'MS_Description', '养护结论', 'user', dbo, 'table', t_bjsl_yhjlmx, 'column', yhjl;
EXEC sp_addextendedproperty 'MS_Description', '说明', 'user', dbo, 'table', t_bjsl_yhjlmx, 'column', sm;
EXEC sp_addextendedproperty 'MS_Description', '打印批号', 'user', dbo, 'table', t_bjsl_yhjlmx, 'column', dyph;
EXEC sp_addextendedproperty 'MS_Description', '打印效期', 'user', dbo, 'table', t_bjsl_yhjlmx, 'column', dyxq;
EXEC sp_addextendedproperty 'MS_Description', '打印生产日期', 'user', dbo, 'table', t_bjsl_yhjlmx, 'column', dyscrq;


DROP TABLE t_bjsl_yunsjlmx;
CREATE TABLE t_bjsl_yunsjlmx(
    wlzx INT NOT NULL,
    hz NVARCHAR(50) NOT NULL,
    psdh nvarchar(50) NOT NULL,
    hdh NVARCHAR(50) NOT NULL,
    tzdh nvarchar(50) NOT NULL,
    ordr INT NOT NULL,
    slkhbh NVARCHAR(50) NOT NULL,
    hpbh NVARCHAR(50) NOT NULL,
    pcbh NVARCHAR(50) NOT NULL,
    id INT NOT NULL,
    date DATETIME NOT NULL,
    wlzxmc NVARCHAR(200),
    hzmc NVARCHAR(200),
    spbh NVARCHAR(50),
    pm NVARCHAR(200),
    khbh NVARCHAR(50),
    khmc NVARCHAR(200),
    fysj DATETIME,
    dhsj DATETIME,
    cphm NVARCHAR(20),
    wydh NVARCHAR(50),
    siji NVARCHAR(100),
    shdw NVARCHAR(200),
    shdz NVARCHAR(200),
    shr NVARCHAR(100),
    gg NVARCHAR(100),
    cd NVARCHAR(256),
    jldw VARCHAR(60),
    yxrq DATETIME,
    scrq DATETIME,
    hwsl DECIMAL(18,4),
    ysgj NVARCHAR(50),
    psy NVARCHAR(50),
    fyr NVARCHAR(50),
    fhsj NVARCHAR(50),
    wtjbr NVARCHAR(50),
    cydw NVARCHAR(50),
    fhdz NVARCHAR(100),
    jx NVARCHAR(50),
    bz DECIMAL(18,4),
    zjsl DECIMAL(18,4),
    sjsl DECIMAL(18,4),    
    ysfs NVARCHAR(50),
    dyph NVARCHAR(50),
    dyxq NVARCHAR(20),
    dyscrq NVARCHAR(20),
    PRIMARY KEY (wlzx,hz,psdh,hdh,tzdh,ordr,slkhbh,hpbh,pcbh,id,date)
)

EXEC sp_addextendedproperty 'MS_Description', '北京索林运输记录', 'user', dbo, 'table', t_bjsl_yunsjlmx, null, null;
EXEC sp_addextendedproperty 'MS_Description', '物流中心', 'user', dbo, 'table', t_bjsl_yunsjlmx, 'column', wlzx;
EXEC sp_addextendedproperty 'MS_Description', '货主编号', 'user', dbo, 'table', t_bjsl_yunsjlmx, 'column', hz;
EXEC sp_addextendedproperty 'MS_Description', '配送单号', 'user', dbo, 'table', t_bjsl_yunsjlmx, 'column', psdh;
EXEC sp_addextendedproperty 'MS_Description', '货单号', 'user', dbo, 'table', t_bjsl_yunsjlmx, 'column', hdh;
EXEC sp_addextendedproperty 'MS_Description', '通知单号;对应要货单号', 'user', dbo, 'table', t_bjsl_yunsjlmx, 'column', tzdh;
EXEC sp_addextendedproperty 'MS_Description', '通知单行号;对应要货单行号', 'user', dbo, 'table', t_bjsl_yunsjlmx, 'column', ordr;
EXEC sp_addextendedproperty 'MS_Description', '索林客户编号', 'user', dbo, 'table', t_bjsl_yunsjlmx, 'column', slkhbh;
EXEC sp_addextendedproperty 'MS_Description', '货品编号（索林）', 'user', dbo, 'table', t_bjsl_yunsjlmx, 'column', hpbh;
EXEC sp_addextendedproperty 'MS_Description', '批号', 'user', dbo, 'table', t_bjsl_yunsjlmx, 'column', pcbh;
EXEC sp_addextendedproperty 'MS_Description', 'id', 'user', dbo, 'table', t_bjsl_yunsjlmx, 'column', id;
EXEC sp_addextendedproperty 'MS_Description', 'date', 'user', dbo, 'table', t_bjsl_yunsjlmx, 'column', date;
EXEC sp_addextendedproperty 'MS_Description', '物流中心名称', 'user', dbo, 'table', t_bjsl_yunsjlmx, 'column', wlzxmc;
EXEC sp_addextendedproperty 'MS_Description', '货主名称', 'user', dbo, 'table', t_bjsl_yunsjlmx, 'column', hzmc;
EXEC sp_addextendedproperty 'MS_Description', '货号', 'user', dbo, 'table', t_bjsl_yunsjlmx, 'column', spbh;
EXEC sp_addextendedproperty 'MS_Description', '货品名称', 'user', dbo, 'table', t_bjsl_yunsjlmx, 'column', pm;
EXEC sp_addextendedproperty 'MS_Description', '货主方客户编号;分店编号', 'user', dbo, 'table', t_bjsl_yunsjlmx, 'column', khbh;
EXEC sp_addextendedproperty 'MS_Description', '货主方客户名称;分店名称', 'user', dbo, 'table', t_bjsl_yunsjlmx, 'column', khmc;
EXEC sp_addextendedproperty 'MS_Description', '发运时间', 'user', dbo, 'table', t_bjsl_yunsjlmx, 'column', fysj;
EXEC sp_addextendedproperty 'MS_Description', '到货时间', 'user', dbo, 'table', t_bjsl_yunsjlmx, 'column', dhsj;
EXEC sp_addextendedproperty 'MS_Description', '车牌号码', 'user', dbo, 'table', t_bjsl_yunsjlmx, 'column', cphm;
EXEC sp_addextendedproperty 'MS_Description', '外运单号', 'user', dbo, 'table', t_bjsl_yunsjlmx, 'column', wydh;
EXEC sp_addextendedproperty 'MS_Description', '司机', 'user', dbo, 'table', t_bjsl_yunsjlmx, 'column', siji;
EXEC sp_addextendedproperty 'MS_Description', '收货单位', 'user', dbo, 'table', t_bjsl_yunsjlmx, 'column', shdw;
EXEC sp_addextendedproperty 'MS_Description', '收货地址', 'user', dbo, 'table', t_bjsl_yunsjlmx, 'column', shdz;
EXEC sp_addextendedproperty 'MS_Description', '收货人', 'user', dbo, 'table', t_bjsl_yunsjlmx, 'column', shr;
EXEC sp_addextendedproperty 'MS_Description', '规格', 'user', dbo, 'table', t_bjsl_yunsjlmx, 'column', gg;
EXEC sp_addextendedproperty 'MS_Description', '产地', 'user', dbo, 'table', t_bjsl_yunsjlmx, 'column', cd;
EXEC sp_addextendedproperty 'MS_Description', '单位', 'user', dbo, 'table', t_bjsl_yunsjlmx, 'column', jldw;
EXEC sp_addextendedproperty 'MS_Description', '有效期至', 'user', dbo, 'table', t_bjsl_yunsjlmx, 'column', yxrq;
EXEC sp_addextendedproperty 'MS_Description', '生产日期', 'user', dbo, 'table', t_bjsl_yunsjlmx, 'column', scrq;
EXEC sp_addextendedproperty 'MS_Description', '货物数量', 'user', dbo, 'table', t_bjsl_yunsjlmx, 'column', hwsl;
EXEC sp_addextendedproperty 'MS_Description', '运输工具', 'user', dbo, 'table', t_bjsl_yunsjlmx, 'column', ysgj;
EXEC sp_addextendedproperty 'MS_Description', '配送员', 'user', dbo, 'table', t_bjsl_yunsjlmx, 'column', psy;
EXEC sp_addextendedproperty 'MS_Description', '发运人', 'user', dbo, 'table', t_bjsl_yunsjlmx, 'column', fyr;
EXEC sp_addextendedproperty 'MS_Description', '返回时间', 'user', dbo, 'table', t_bjsl_yunsjlmx, 'column', fhsj;
EXEC sp_addextendedproperty 'MS_Description', '委托经办人', 'user', dbo, 'table', t_bjsl_yunsjlmx, 'column', wtjbr;
EXEC sp_addextendedproperty 'MS_Description', '承运单位', 'user', dbo, 'table', t_bjsl_yunsjlmx, 'column', cydw;
EXEC sp_addextendedproperty 'MS_Description', '发货地址', 'user', dbo, 'table', t_bjsl_yunsjlmx, 'column', fhdz;
EXEC sp_addextendedproperty 'MS_Description', '剂型', 'user', dbo, 'table', t_bjsl_yunsjlmx, 'column', jx;
EXEC sp_addextendedproperty 'MS_Description', '包装', 'user', dbo, 'table', t_bjsl_yunsjlmx, 'column', bz;
EXEC sp_addextendedproperty 'MS_Description', '整件数量', 'user', dbo, 'table', t_bjsl_yunsjlmx, 'column', zjsl;
EXEC sp_addextendedproperty 'MS_Description', '散件数量', 'user', dbo, 'table', t_bjsl_yunsjlmx, 'column', sjsl;
EXEC sp_addextendedproperty 'MS_Description', '运输方式', 'user', dbo, 'table', t_bjsl_yunsjlmx, 'column', ysfs;
EXEC sp_addextendedproperty 'MS_Description', '打印批号', 'user', dbo, 'table', t_bjsl_yunsjlmx, 'column', dyph;
EXEC sp_addextendedproperty 'MS_Description', '打印效期', 'user', dbo, 'table', t_bjsl_yunsjlmx, 'column', dyxq;
EXEC sp_addextendedproperty 'MS_Description', '打印生产日期', 'user', dbo, 'table', t_bjsl_yunsjlmx, 'column', dyscrq;

DROP TABLE t_bjsl_shjlmx;
CREATE TABLE t_bjsl_shjlmx(
    wlzx INT NOT NULL,
    shdh nvarchar(50) NOT NULL,
    tzdh nvarchar(50) NOT NULL,
    ordr INT NOT NULL,
    hpbh NVARCHAR(50) NOT NULL,
    pcbh NVARCHAR(50) NOT NULL,
    id INT NOT NULL,
    date DATETIME NOT NULL,
    wlzxmc NVARCHAR(200),
    hz Nvarchar(50),
    hzmc NVARCHAR(200),
    khbh NVARCHAR(50),
    khmc NVARCHAR(200),
    shrq DATETIME,
    rklx NVARCHAR(50),
    ywy NVARCHAR(50),
    shy NVARCHAR(200),
    shy2 NVARCHAR(200),
    spbh NVARCHAR(50),
    pm NVARCHAR(200),
    gg NVARCHAR(100),
    cd NVARCHAR(256),
    sccj NVARCHAR(256),
    jldw VARCHAR(60),
    bz DECIMAL(18,4),
    cctj NVARCHAR(50),
    zczh NVARCHAR(100),
    xkzh NVARCHAR(100),
    hpdl NVARCHAR(200),
    hpsx NVARCHAR(200),
    yxrq DATETIME,
    scrq DATETIME,
    shtxph NVARCHAR(50),
    cyfs NVARCHAR(50),
    wtysdh NVARCHAR(50),
    fydd NVARCHAR(50),
    ysdw NVARCHAR(50),
    ysfs VARCHAR(50),
    ysgj NVARCHAR(50),
    yscph NVARCHAR(50),
    qysj NVARCHAR(50),
    dhsj DATETIME,
    shjl NVARCHAR(50),
    sm NVARCHAR(250),
    jhsl DECIMAL(18,4),
    sssl DECIMAL(18,4),
    jssl DECIMAL(18,4),
    bzsl DECIMAL(18,4),
    zhl DECIMAL(18,6),
    tiji DECIMAL(18,9),
    dyph NVARCHAR(50),
    dyxq NVARCHAR(20),
    dyscrq NVARCHAR(20),
    jx NVARCHAR(50),
    PRIMARY KEY (wlzx,shdh,tzdh,ordr,hpbh,pcbh,id,date)
)

EXEC sp_addextendedproperty 'MS_Description', '北京索林收货记录', 'user', dbo, 'table', t_bjsl_shjlmx, null, null;
EXEC sp_addextendedproperty 'MS_Description', '物流中心', 'user', dbo, 'table', t_bjsl_shjlmx, 'column', wlzx;
EXEC sp_addextendedproperty 'MS_Description', '收货单号', 'user', dbo, 'table', t_bjsl_shjlmx, 'column', shdh;
EXEC sp_addextendedproperty 'MS_Description', '通知单号;对应要货单号', 'user', dbo, 'table', t_bjsl_shjlmx, 'column', tzdh;
EXEC sp_addextendedproperty 'MS_Description', '通知单行号;对应要货单行号', 'user', dbo, 'table', t_bjsl_shjlmx, 'column', ordr;
EXEC sp_addextendedproperty 'MS_Description', '货品编号（索林）', 'user', dbo, 'table', t_bjsl_shjlmx, 'column', hpbh;
EXEC sp_addextendedproperty 'MS_Description', '批号', 'user', dbo, 'table', t_bjsl_shjlmx, 'column', pcbh;
EXEC sp_addextendedproperty 'MS_Description', 'id', 'user', dbo, 'table', t_bjsl_shjlmx, 'column', id;
EXEC sp_addextendedproperty 'MS_Description', 'date', 'user', dbo, 'table', t_bjsl_shjlmx, 'column', date;
EXEC sp_addextendedproperty 'MS_Description', '物流中心名称', 'user', dbo, 'table', t_bjsl_shjlmx, 'column', wlzxmc;
EXEC sp_addextendedproperty 'MS_Description', '货主', 'user', dbo, 'table', t_bjsl_shjlmx, 'column', hz;
EXEC sp_addextendedproperty 'MS_Description', '货主名称', 'user', dbo, 'table', t_bjsl_shjlmx, 'column', hzmc;
EXEC sp_addextendedproperty 'MS_Description', '货主方客户编号;分店编号', 'user', dbo, 'table', t_bjsl_shjlmx, 'column', khbh;
EXEC sp_addextendedproperty 'MS_Description', '货主方客户名称;分店名称', 'user', dbo, 'table', t_bjsl_shjlmx, 'column', khmc;
EXEC sp_addextendedproperty 'MS_Description', '收货日期', 'user', dbo, 'table', t_bjsl_shjlmx, 'column', shrq;
EXEC sp_addextendedproperty 'MS_Description', '入库类型', 'user', dbo, 'table', t_bjsl_shjlmx, 'column', rklx;
EXEC sp_addextendedproperty 'MS_Description', '业务员', 'user', dbo, 'table', t_bjsl_shjlmx, 'column', ywy;
EXEC sp_addextendedproperty 'MS_Description', '收货员', 'user', dbo, 'table', t_bjsl_shjlmx, 'column', shy;
EXEC sp_addextendedproperty 'MS_Description', '收货员2', 'user', dbo, 'table', t_bjsl_shjlmx, 'column', shy2;
EXEC sp_addextendedproperty 'MS_Description', '货号', 'user', dbo, 'table', t_bjsl_shjlmx, 'column', spbh;
EXEC sp_addextendedproperty 'MS_Description', '货品名称', 'user', dbo, 'table', t_bjsl_shjlmx, 'column', pm;
EXEC sp_addextendedproperty 'MS_Description', '规格', 'user', dbo, 'table', t_bjsl_shjlmx, 'column', gg;
EXEC sp_addextendedproperty 'MS_Description', '产地', 'user', dbo, 'table', t_bjsl_shjlmx, 'column', cd;
EXEC sp_addextendedproperty 'MS_Description', '生产厂商', 'user', dbo, 'table', t_bjsl_shjlmx, 'column', sccj;
EXEC sp_addextendedproperty 'MS_Description', '单位', 'user', dbo, 'table', t_bjsl_shjlmx, 'column', jldw;
EXEC sp_addextendedproperty 'MS_Description', '包装', 'user', dbo, 'table', t_bjsl_shjlmx, 'column', bz;
EXEC sp_addextendedproperty 'MS_Description', '储存条件', 'user', dbo, 'table', t_bjsl_shjlmx, 'column', cctj;
EXEC sp_addextendedproperty 'MS_Description', '注册证号', 'user', dbo, 'table', t_bjsl_shjlmx, 'column', zczh;
EXEC sp_addextendedproperty 'MS_Description', '生产企业许可证号或备案凭证号', 'user', dbo, 'table', t_bjsl_shjlmx, 'column', xkzh;
EXEC sp_addextendedproperty 'MS_Description', '货品大类', 'user', dbo, 'table', t_bjsl_shjlmx, 'column', hpdl;
EXEC sp_addextendedproperty 'MS_Description', '货品属性', 'user', dbo, 'table', t_bjsl_shjlmx, 'column', hpsx;
EXEC sp_addextendedproperty 'MS_Description', '有效期至', 'user', dbo, 'table', t_bjsl_shjlmx, 'column', yxrq;
EXEC sp_addextendedproperty 'MS_Description', '生产日期', 'user', dbo, 'table', t_bjsl_shjlmx, 'column', scrq;
EXEC sp_addextendedproperty 'MS_Description', '随货同行票号', 'user', dbo, 'table', t_bjsl_shjlmx, 'column', shtxph;
EXEC sp_addextendedproperty 'MS_Description', '承运方式', 'user', dbo, 'table', t_bjsl_shjlmx, 'column', cyfs;
EXEC sp_addextendedproperty 'MS_Description', '委托运输单号;收货时间', 'user', dbo, 'table', t_bjsl_shjlmx, 'column', wtysdh;
EXEC sp_addextendedproperty 'MS_Description', '发运地点', 'user', dbo, 'table', t_bjsl_shjlmx, 'column', fydd;
EXEC sp_addextendedproperty 'MS_Description', '运输单位', 'user', dbo, 'table', t_bjsl_shjlmx, 'column', ysdw;
EXEC sp_addextendedproperty 'MS_Description', '运输方式', 'user', dbo, 'table', t_bjsl_shjlmx, 'column', ysfs;
EXEC sp_addextendedproperty 'MS_Description', '运输工具', 'user', dbo, 'table', t_bjsl_shjlmx, 'column', ysgj;
EXEC sp_addextendedproperty 'MS_Description', '运输车牌号', 'user', dbo, 'table', t_bjsl_shjlmx, 'column', yscph;
EXEC sp_addextendedproperty 'MS_Description', '启运时间', 'user', dbo, 'table', t_bjsl_shjlmx, 'column', qysj;
EXEC sp_addextendedproperty 'MS_Description', '到货时间', 'user', dbo, 'table', t_bjsl_shjlmx, 'column', dhsj;
EXEC sp_addextendedproperty 'MS_Description', '收货结论', 'user', dbo, 'table', t_bjsl_shjlmx, 'column', shjl;
EXEC sp_addextendedproperty 'MS_Description', '说明', 'user', dbo, 'table', t_bjsl_shjlmx, 'column', sm;
EXEC sp_addextendedproperty 'MS_Description', '计划数量', 'user', dbo, 'table', t_bjsl_shjlmx, 'column', jhsl;
EXEC sp_addextendedproperty 'MS_Description', '实收数量', 'user', dbo, 'table', t_bjsl_shjlmx, 'column', sssl;
EXEC sp_addextendedproperty 'MS_Description', '拒收数量', 'user', dbo, 'table', t_bjsl_shjlmx, 'column', jssl;
EXEC sp_addextendedproperty 'MS_Description', '包装数量', 'user', dbo, 'table', t_bjsl_shjlmx, 'column', bzsl;
EXEC sp_addextendedproperty 'MS_Description', '重量', 'user', dbo, 'table', t_bjsl_shjlmx, 'column', zhl;
EXEC sp_addextendedproperty 'MS_Description', '体积', 'user', dbo, 'table', t_bjsl_shjlmx, 'column', tiji;
EXEC sp_addextendedproperty 'MS_Description', '打印批号', 'user', dbo, 'table', t_bjsl_shjlmx, 'column', dyph;
EXEC sp_addextendedproperty 'MS_Description', '打印效期', 'user', dbo, 'table', t_bjsl_shjlmx, 'column', dyxq;
EXEC sp_addextendedproperty 'MS_Description', '打印生产日期', 'user', dbo, 'table', t_bjsl_shjlmx, 'column', dyscrq;
EXEC sp_addextendedproperty 'MS_Description', '剂型', 'user', dbo, 'table', t_bjsl_shjlmx, 'column', jx;

DROP TABLE t_bjsl_pdjlmx;
CREATE TABLE t_bjsl_pdjlmx(
    wlzx INT NOT NULL,
    pddh nvarchar(50) NOT NULL,
    tzdh nvarchar(50) NOT NULL,
    ordr INT NOT NULL,
    hpbh NVARCHAR(50) NOT NULL,
    pcbh NVARCHAR(50) NOT NULL,
    kqbh NVARCHAR(50) NOT NULL,
    hwbh NVARCHAR(50) NOT NULL,
    pdrq DATETIME,
    id INT,
    wlzxmc NVARCHAR(200),
    hz Nvarchar(50),
    hzmc NVARCHAR(200),
    khbh NVARCHAR(50),
    khmc NVARCHAR(200),
    pdlx NVARCHAR(50),
    czy NVARCHAR(200),
    zybm NVARCHAR(200),
    spbh NVARCHAR(50),
    pm NVARCHAR(200),
    gg NVARCHAR(100),
    cd NVARCHAR(256),
    sccj NVARCHAR(256),
    jldw VARCHAR(60),
    bzsl DECIMAL(18,4),
    cctj NVARCHAR(50),
    zczh NVARCHAR(100),
    xkzh NVARCHAR(100),
    hpdl NVARCHAR(200),
    hpsx NVARCHAR(200),
    kqmc NVARCHAR(200),
    hwmc NVARCHAR(200),
    yxrq DATETIME,
    scrq DATETIME,
    pdsl DECIMAL(18,4),
    zhaiyao NVARCHAR(200),
    bz NVARCHAR(200),
    dyph NVARCHAR(50),
    dyxq NVARCHAR(20),
    dyscrq NVARCHAR(20),
    PRIMARY KEY (wlzx,pddh,tzdh,ordr,hpbh,pcbh,kqbh,hwbh)
)

EXEC sp_addextendedproperty 'MS_Description', '北京索林盘点记录明细', 'user', dbo, 'table', t_bjsl_pdjlmx, null, null;
EXEC sp_addextendedproperty 'MS_Description', '物流中心', 'user', dbo, 'table', t_bjsl_pdjlmx, 'column', wlzx;
EXEC sp_addextendedproperty 'MS_Description', '盘点单号', 'user', dbo, 'table', t_bjsl_pdjlmx, 'column', pddh;
EXEC sp_addextendedproperty 'MS_Description', '通知单号;对应要货单号', 'user', dbo, 'table', t_bjsl_pdjlmx, 'column', tzdh;
EXEC sp_addextendedproperty 'MS_Description', '通知单行号;对应要货单行号', 'user', dbo, 'table', t_bjsl_pdjlmx, 'column', ordr;
EXEC sp_addextendedproperty 'MS_Description', '货品编号(索林)', 'user', dbo, 'table', t_bjsl_pdjlmx, 'column', hpbh;
EXEC sp_addextendedproperty 'MS_Description', '批号', 'user', dbo, 'table', t_bjsl_pdjlmx, 'column', pcbh;
EXEC sp_addextendedproperty 'MS_Description', '库区编号', 'user', dbo, 'table', t_bjsl_pdjlmx, 'column', kqbh;
EXEC sp_addextendedproperty 'MS_Description', '货位编号', 'user', dbo, 'table', t_bjsl_pdjlmx, 'column', hwbh;
EXEC sp_addextendedproperty 'MS_Description', '盘点日期', 'user', dbo, 'table', t_bjsl_pdjlmx, 'column', pdrq;
EXEC sp_addextendedproperty 'MS_Description', 'id', 'user', dbo, 'table', t_bjsl_pdjlmx, 'column', id;
EXEC sp_addextendedproperty 'MS_Description', '物流中心名称', 'user', dbo, 'table', t_bjsl_pdjlmx, 'column', wlzxmc;
EXEC sp_addextendedproperty 'MS_Description', '货主', 'user', dbo, 'table', t_bjsl_pdjlmx, 'column', hz;
EXEC sp_addextendedproperty 'MS_Description', '货主名称', 'user', dbo, 'table', t_bjsl_pdjlmx, 'column', hzmc;
EXEC sp_addextendedproperty 'MS_Description', '货主方客户编号;分店编号', 'user', dbo, 'table', t_bjsl_pdjlmx, 'column', khbh;
EXEC sp_addextendedproperty 'MS_Description', '货主方客户名称;分店名称', 'user', dbo, 'table', t_bjsl_pdjlmx, 'column', khmc;
EXEC sp_addextendedproperty 'MS_Description', '盘点类型', 'user', dbo, 'table', t_bjsl_pdjlmx, 'column', pdlx;
EXEC sp_addextendedproperty 'MS_Description', '操作员', 'user', dbo, 'table', t_bjsl_pdjlmx, 'column', czy;
EXEC sp_addextendedproperty 'MS_Description', '职员部门', 'user', dbo, 'table', t_bjsl_pdjlmx, 'column', zybm;
EXEC sp_addextendedproperty 'MS_Description', '货号', 'user', dbo, 'table', t_bjsl_pdjlmx, 'column', spbh;
EXEC sp_addextendedproperty 'MS_Description', '货品名称', 'user', dbo, 'table', t_bjsl_pdjlmx, 'column', pm;
EXEC sp_addextendedproperty 'MS_Description', '规格', 'user', dbo, 'table', t_bjsl_pdjlmx, 'column', gg;
EXEC sp_addextendedproperty 'MS_Description', '产地', 'user', dbo, 'table', t_bjsl_pdjlmx, 'column', cd;
EXEC sp_addextendedproperty 'MS_Description', '生产厂商', 'user', dbo, 'table', t_bjsl_pdjlmx, 'column', sccj;
EXEC sp_addextendedproperty 'MS_Description', '单位', 'user', dbo, 'table', t_bjsl_pdjlmx, 'column', jldw;
EXEC sp_addextendedproperty 'MS_Description', '包装', 'user', dbo, 'table', t_bjsl_pdjlmx, 'column', bzsl;
EXEC sp_addextendedproperty 'MS_Description', '储存条件', 'user', dbo, 'table', t_bjsl_pdjlmx, 'column', cctj;
EXEC sp_addextendedproperty 'MS_Description', '注册证号', 'user', dbo, 'table', t_bjsl_pdjlmx, 'column', zczh;
EXEC sp_addextendedproperty 'MS_Description', '生产企业许可证号或备案凭证号', 'user', dbo, 'table', t_bjsl_pdjlmx, 'column', xkzh;
EXEC sp_addextendedproperty 'MS_Description', '货品大类', 'user', dbo, 'table', t_bjsl_pdjlmx, 'column', hpdl;
EXEC sp_addextendedproperty 'MS_Description', '货品属性', 'user', dbo, 'table', t_bjsl_pdjlmx, 'column', hpsx;
EXEC sp_addextendedproperty 'MS_Description', '库区名称', 'user', dbo, 'table', t_bjsl_pdjlmx, 'column', kqmc;
EXEC sp_addextendedproperty 'MS_Description', '货位名称', 'user', dbo, 'table', t_bjsl_pdjlmx, 'column', hwmc;
EXEC sp_addextendedproperty 'MS_Description', '有效期至', 'user', dbo, 'table', t_bjsl_pdjlmx, 'column', yxrq;
EXEC sp_addextendedproperty 'MS_Description', '生产日期', 'user', dbo, 'table', t_bjsl_pdjlmx, 'column', scrq;
EXEC sp_addextendedproperty 'MS_Description', '盘点数量;收货时间', 'user', dbo, 'table', t_bjsl_pdjlmx, 'column', pdsl;
EXEC sp_addextendedproperty 'MS_Description', '摘要', 'user', dbo, 'table', t_bjsl_pdjlmx, 'column', zhaiyao;
EXEC sp_addextendedproperty 'MS_Description', '备注', 'user', dbo, 'table', t_bjsl_pdjlmx, 'column', bz;
EXEC sp_addextendedproperty 'MS_Description', '打印批号', 'user', dbo, 'table', t_bjsl_pdjlmx, 'column', dyph;
EXEC sp_addextendedproperty 'MS_Description', '打印效期', 'user', dbo, 'table', t_bjsl_pdjlmx, 'column', dyxq;
EXEC sp_addextendedproperty 'MS_Description', '打印生产日期', 'user', dbo, 'table', t_bjsl_pdjlmx, 'column', dyscrq;



--DROP TABLE t_bjsl_fhjlmx;
--CREATE TABLE t_bjsl_fhjlmx(
--    wlzx int NOT NULL,
--    fhdh nvarchar(50) NOT NULL,
--    tzdh nvarchar(50) NOT NULL,
--    ordr int NOT NULL,
--    spbh NVARCHAR(50) NOT NULL,
--    pcbh NVARCHAR(50) NOT NULL,
--    kqbh NVARCHAR(50) NOT NULL,
--    hwbh NVARCHAR(50) NOT NULL,
--    ckrq DATETIME,
--    id INT,
--    wlzxmc NVARCHAR(200),
--    hz Nvarchar(50),
--    hzmc NVARCHAR(200),
--    khbh NVARCHAR(50),
--    khmc NVARCHAR(200),
--    cklx NVARCHAR(50),
--    fhrq DATETIME NOT NULL,
--    jhy NVARCHAR(50),
--    fhy NVARCHAR(200),
--    pm NVARCHAR(200),
--    gg NVARCHAR(100),
--    cd NVARCHAR(256),
--    sccj NVARCHAR(256),
--    jldw VARCHAR(60),
--    bzsl DECIMAL(18,4),
--    cctj NVARCHAR(50),
--    zczh NVARCHAR(100),
--    xkzh NVARCHAR(100),
--    hpdl NVARCHAR(200),
--    hpsx NVARCHAR(200),
--    cpx NVARCHAR(50),
--    kqmc NVARCHAR(200),
--    hwmc VARCHAR(60),
--    yxrq DATETIME,
--    scrq DATETIME,
--    jhsl decimal(18,4),
--    fhsl DECIMAL(18,4),
--    jx NVARCHAR(50),
--    zlzk NVARCHAR(256),
--    pzwh NVARCHAR(100),
--    PRIMARY KEY (wlzx,fhdh,tzdh,ordr,spbh,pcbh,kqbh,hwbh,fhrq)
--)

--EXEC sp_addextendedproperty 'MS_Description', '北京索林出库复核记录', 'user', dbo, 'table', t_bjsl_fhjlmx, null, null;
--EXEC sp_addextendedproperty 'MS_Description', '物流中心', 'user', dbo, 'table', t_bjsl_fhjlmx, 'column', wlzx;
--EXEC sp_addextendedproperty 'MS_Description', '复核单号', 'user', dbo, 'table', t_bjsl_fhjlmx, 'column', fhdh;
--EXEC sp_addextendedproperty 'MS_Description', '通知单号;对应要货单号', 'user', dbo, 'table', t_bjsl_fhjlmx, 'column', tzdh;
--EXEC sp_addextendedproperty 'MS_Description', '通知单行号;对应要货单行号', 'user', dbo, 'table', t_bjsl_fhjlmx, 'column', ordr;
--EXEC sp_addextendedproperty 'MS_Description', '货品编号', 'user', dbo, 'table', t_bjsl_fhjlmx, 'column', spbh;
--EXEC sp_addextendedproperty 'MS_Description', '批号', 'user', dbo, 'table', t_bjsl_fhjlmx, 'column', pcbh;
--EXEC sp_addextendedproperty 'MS_Description', '库区编号', 'user', dbo, 'table', t_bjsl_fhjlmx, 'column', kqbh;
--EXEC sp_addextendedproperty 'MS_Description', '货位编号', 'user', dbo, 'table', t_bjsl_fhjlmx, 'column', hwbh;
--EXEC sp_addextendedproperty 'MS_Description', '出库日期', 'user', dbo, 'table', t_bjsl_fhjlmx, 'column', ckrq;
--EXEC sp_addextendedproperty 'MS_Description', 'id', 'user', dbo, 'table', t_bjsl_fhjlmx, 'column', id;
--EXEC sp_addextendedproperty 'MS_Description', '物流中心名称', 'user', dbo, 'table', t_bjsl_fhjlmx, 'column', wlzxmc;
--EXEC sp_addextendedproperty 'MS_Description', '货主', 'user', dbo, 'table', t_bjsl_fhjlmx, 'column', hz;
--EXEC sp_addextendedproperty 'MS_Description', '货主名称', 'user', dbo, 'table', t_bjsl_fhjlmx, 'column', hzmc;
--EXEC sp_addextendedproperty 'MS_Description', '货主方客户编号;分店编号', 'user', dbo, 'table', t_bjsl_fhjlmx, 'column', khbh;
--EXEC sp_addextendedproperty 'MS_Description', '货主方客户名称;分店名称', 'user', dbo, 'table', t_bjsl_fhjlmx, 'column', khmc;
--EXEC sp_addextendedproperty 'MS_Description', '出库类型', 'user', dbo, 'table', t_bjsl_fhjlmx, 'column', cklx;
--EXEC sp_addextendedproperty 'MS_Description', '复核日期', 'user', dbo, 'table', t_bjsl_fhjlmx, 'column', fhrq;
--EXEC sp_addextendedproperty 'MS_Description', '拣货员', 'user', dbo, 'table', t_bjsl_fhjlmx, 'column', jhy;
--EXEC sp_addextendedproperty 'MS_Description', '复核员', 'user', dbo, 'table', t_bjsl_fhjlmx, 'column', fhy;
--EXEC sp_addextendedproperty 'MS_Description', '货品名称', 'user', dbo, 'table', t_bjsl_fhjlmx, 'column', pm;
--EXEC sp_addextendedproperty 'MS_Description', '规格', 'user', dbo, 'table', t_bjsl_fhjlmx, 'column', gg;
--EXEC sp_addextendedproperty 'MS_Description', '产地', 'user', dbo, 'table', t_bjsl_fhjlmx, 'column', cd;
--EXEC sp_addextendedproperty 'MS_Description', '生产厂商', 'user', dbo, 'table', t_bjsl_fhjlmx, 'column', sccj;
--EXEC sp_addextendedproperty 'MS_Description', '单位', 'user', dbo, 'table', t_bjsl_fhjlmx, 'column', jldw;
--EXEC sp_addextendedproperty 'MS_Description', '包装', 'user', dbo, 'table', t_bjsl_fhjlmx, 'column', bzsl;
--EXEC sp_addextendedproperty 'MS_Description', '储存条件', 'user', dbo, 'table', t_bjsl_fhjlmx, 'column', cctj;
--EXEC sp_addextendedproperty 'MS_Description', '注册证号', 'user', dbo, 'table', t_bjsl_fhjlmx, 'column', zczh;
--EXEC sp_addextendedproperty 'MS_Description', '生产企业许可证号或备案凭证号', 'user', dbo, 'table', t_bjsl_fhjlmx, 'column', xkzh;
--EXEC sp_addextendedproperty 'MS_Description', '货品大类', 'user', dbo, 'table', t_bjsl_fhjlmx, 'column', hpdl;
--EXEC sp_addextendedproperty 'MS_Description', '货品属性', 'user', dbo, 'table', t_bjsl_fhjlmx, 'column', hpsx;
--EXEC sp_addextendedproperty 'MS_Description', '产品线', 'user', dbo, 'table', t_bjsl_fhjlmx, 'column', cpx;
--EXEC sp_addextendedproperty 'MS_Description', '库区名称', 'user', dbo, 'table', t_bjsl_fhjlmx, 'column', kqmc;
--EXEC sp_addextendedproperty 'MS_Description', '', 'user', dbo, 'table', t_bjsl_fhjlmx, 'column', hwmc;
--EXEC sp_addextendedproperty 'MS_Description', '有效期至', 'user', dbo, 'table', t_bjsl_fhjlmx, 'column', yxrq;
--EXEC sp_addextendedproperty 'MS_Description', '生产日期', 'user', dbo, 'table', t_bjsl_fhjlmx, 'column', scrq;
--EXEC sp_addextendedproperty 'MS_Description', '计划数量', 'user', dbo, 'table', t_bjsl_fhjlmx, 'column', jhsl;
--EXEC sp_addextendedproperty 'MS_Description', '复核数量;收货时间', 'user', dbo, 'table', t_bjsl_fhjlmx, 'column', fhsl;
--EXEC sp_addextendedproperty 'MS_Description', '剂型', 'user', dbo, 'table', t_bjsl_fhjlmx, 'column', jx;
--EXEC sp_addextendedproperty 'MS_Description', '质量状况', 'user', dbo, 'table', t_bjsl_fhjlmx, 'column', zlzk;
--EXEC sp_addextendedproperty 'MS_Description', '批准文号', 'user', dbo, 'table', t_bjsl_fhjlmx, 'column', pzwh;


--DROP TABLE t_bjsl_tkmx;
--CREATE TABLE t_bjsl_tkmx(
--    wlzx int NOT NULL,
--    rklx int NOT NULL,
--    hz Nvarchar(50) NOT NULL,
--    tzdh nvarchar(50) NOT NULL,
--    ordr int NOT NULL,
--    spbh NVARCHAR(50) NOT NULL,
--    pcbh NVARCHAR(50) NOT NULL,
--    klx int NOT NULL,
--    shsl decimal(18,4),
--    jssl decimal(18,4),
--    qxsl DECIMAL(18,4),
--    shrq DATETIME,
--    pm NVARCHAR(200),
--    yxrq DATETIME,
--    scrq DATETIME,
--    jsyy NVARCHAR(50),
--    wczt INT,
--    rwhs INT,
--    dhrq DATETIME,
--    bzsl DECIMAL(18,4),
--    shm NVARCHAR(250),
--    ysy NVARCHAR(50),
--    pzwh NVARCHAR(100),
--    pzwhxq DATETIME,
--    xkzh NVARCHAR(100),
--    xkzxq DATETIME,
--    zczh NVARCHAR(100),
--    zczxq DATETIME,
--    lphm VARCHAR(60),
--    PRIMARY KEY (wlzx,rklx,hz,tzdh,ordr,spbh,pcbh,klx)
--)

--EXEC sp_addextendedproperty 'MS_Description', '北京索林退库入库记录;退库相关单据，退库单等', 'user', dbo, 'table', t_bjsl_tkmx, null, null;
--EXEC sp_addextendedproperty 'MS_Description', '物流中心', 'user', dbo, 'table', t_bjsl_tkmx, 'column', wlzx;
--EXEC sp_addextendedproperty 'MS_Description', '入库类型;1采购入库 2销退入库 3报溢入库 5盘盈入库 6批号调整入库', 'user', dbo, 'table', t_bjsl_tkmx, 'column', rklx;
--EXEC sp_addextendedproperty 'MS_Description', '货主', 'user', dbo, 'table', t_bjsl_tkmx, 'column', hz;
--EXEC sp_addextendedproperty 'MS_Description', '通知单号;对应要货单号', 'user', dbo, 'table', t_bjsl_tkmx, 'column', tzdh;
--EXEC sp_addextendedproperty 'MS_Description', '通知单行号;对应要货单行号', 'user', dbo, 'table', t_bjsl_tkmx, 'column', ordr;
--EXEC sp_addextendedproperty 'MS_Description', '货品编号', 'user', dbo, 'table', t_bjsl_tkmx, 'column', spbh;
--EXEC sp_addextendedproperty 'MS_Description', '批号', 'user', dbo, 'table', t_bjsl_tkmx, 'column', pcbh;
--EXEC sp_addextendedproperty 'MS_Description', '库类型', 'user', dbo, 'table', t_bjsl_tkmx, 'column', klx;
--EXEC sp_addextendedproperty 'MS_Description', '收货数量', 'user', dbo, 'table', t_bjsl_tkmx, 'column', shsl;
--EXEC sp_addextendedproperty 'MS_Description', '拒收数量', 'user', dbo, 'table', t_bjsl_tkmx, 'column', jssl;
--EXEC sp_addextendedproperty 'MS_Description', '取消数量', 'user', dbo, 'table', t_bjsl_tkmx, 'column', qxsl;
--EXEC sp_addextendedproperty 'MS_Description', '入库日期;收货时间', 'user', dbo, 'table', t_bjsl_tkmx, 'column', shrq;
--EXEC sp_addextendedproperty 'MS_Description', '货品名称', 'user', dbo, 'table', t_bjsl_tkmx, 'column', pm;
--EXEC sp_addextendedproperty 'MS_Description', '有效期至', 'user', dbo, 'table', t_bjsl_tkmx, 'column', yxrq;
--EXEC sp_addextendedproperty 'MS_Description', '生产日期', 'user', dbo, 'table', t_bjsl_tkmx, 'column', scrq;
--EXEC sp_addextendedproperty 'MS_Description', '拒收原因', 'user', dbo, 'table', t_bjsl_tkmx, 'column', jsyy;
--EXEC sp_addextendedproperty 'MS_Description', '完成状态', 'user', dbo, 'table', t_bjsl_tkmx, 'column', wczt;
--EXEC sp_addextendedproperty 'MS_Description', '任务行数', 'user', dbo, 'table', t_bjsl_tkmx, 'column', rwhs;
--EXEC sp_addextendedproperty 'MS_Description', '到货日期', 'user', dbo, 'table', t_bjsl_tkmx, 'column', dhrq;
--EXEC sp_addextendedproperty 'MS_Description', '包装', 'user', dbo, 'table', t_bjsl_tkmx, 'column', bzsl;
--EXEC sp_addextendedproperty 'MS_Description', '说明', 'user', dbo, 'table', t_bjsl_tkmx, 'column', shm;
--EXEC sp_addextendedproperty 'MS_Description', '验收员', 'user', dbo, 'table', t_bjsl_tkmx, 'column', ysy;
--EXEC sp_addextendedproperty 'MS_Description', '批准文号', 'user', dbo, 'table', t_bjsl_tkmx, 'column', pzwh;
--EXEC sp_addextendedproperty 'MS_Description', '批准文号效期', 'user', dbo, 'table', t_bjsl_tkmx, 'column', pzwhxq;
--EXEC sp_addextendedproperty 'MS_Description', '生产企业许可证号或备案凭证号', 'user', dbo, 'table', t_bjsl_tkmx, 'column', xkzh;
--EXEC sp_addextendedproperty 'MS_Description', '生产企业许可证号或备案凭证号效期', 'user', dbo, 'table', t_bjsl_tkmx, 'column', xkzxq;
--EXEC sp_addextendedproperty 'MS_Description', '注册证号', 'user', dbo, 'table', t_bjsl_tkmx, 'column', zczh;
--EXEC sp_addextendedproperty 'MS_Description', '注册证效期', 'user', dbo, 'table', t_bjsl_tkmx, 'column', zczxq;
--EXEC sp_addextendedproperty 'MS_Description', '随货同行票号', 'user', dbo, 'table', t_bjsl_tkmx, 'column', lphm;



--DROP TABLE t_bjsl_ckmx;
--CREATE TABLE t_bjsl_ckmx(
--    wlzx int NOT NULL,
--    cklx int NOT NULL,
--    hz Nvarchar(50) NOT NULL,
--    tzdh nvarchar(50) NOT NULL,
--    ordr int NOT NULL,
--    spbh NVARCHAR(50) NOT NULL,
--    pcbh NVARCHAR(50) NOT NULL,
--    klx int NOT NULL,
--    cksl decimal(18,4),
--    cysl decimal(18,4),
--    kpsl DECIMAL(18,4),
--    ckrq DATETIME,
--    pm NVARCHAR(200),
--    yxrq DATETIME,
--    scrq DATETIME,
--    wczt INT,
--    rwhs INT,
--    shm NVARCHAR(250),
--    bzsl DECIMAL(18,4),
--    ckjs DECIMAL(18,2),
--    PRIMARY KEY (wlzx,cklx,hz,tzdh,ordr,spbh,pcbh,klx)
--)

--EXEC sp_addextendedproperty 'MS_Description', '北京索林出库返回记录;包括分店出库、退货出库等
--', 'user', dbo, 'table', t_bjsl_ckmx, null, null;
--EXEC sp_addextendedproperty 'MS_Description', '物流中心', 'user', dbo, 'table', t_bjsl_ckmx, 'column', wlzx;
--EXEC sp_addextendedproperty 'MS_Description', '出库类型;11销售出库 12采退出库 13报损出库 15盘亏出库', 'user', dbo, 'table', t_bjsl_ckmx, 'column', cklx;
--EXEC sp_addextendedproperty 'MS_Description', '货主', 'user', dbo, 'table', t_bjsl_ckmx, 'column', hz;
--EXEC sp_addextendedproperty 'MS_Description', '通知单号;对应药店系统相关单号', 'user', dbo, 'table', t_bjsl_ckmx, 'column', tzdh;
--EXEC sp_addextendedproperty 'MS_Description', '通知单行号;对应药店系统相关单行号', 'user', dbo, 'table', t_bjsl_ckmx, 'column', ordr;
--EXEC sp_addextendedproperty 'MS_Description', '货品编号', 'user', dbo, 'table', t_bjsl_ckmx, 'column', spbh;
--EXEC sp_addextendedproperty 'MS_Description', '批号', 'user', dbo, 'table', t_bjsl_ckmx, 'column', pcbh;
--EXEC sp_addextendedproperty 'MS_Description', '库类型', 'user', dbo, 'table', t_bjsl_ckmx, 'column', klx;
--EXEC sp_addextendedproperty 'MS_Description', '出库数量', 'user', dbo, 'table', t_bjsl_ckmx, 'column', cksl;
--EXEC sp_addextendedproperty 'MS_Description', '差异数量', 'user', dbo, 'table', t_bjsl_ckmx, 'column', cysl;
--EXEC sp_addextendedproperty 'MS_Description', '开票数量', 'user', dbo, 'table', t_bjsl_ckmx, 'column', kpsl;
--EXEC sp_addextendedproperty 'MS_Description', '出库日期;收货时间', 'user', dbo, 'table', t_bjsl_ckmx, 'column', ckrq;
--EXEC sp_addextendedproperty 'MS_Description', '货品名称', 'user', dbo, 'table', t_bjsl_ckmx, 'column', pm;
--EXEC sp_addextendedproperty 'MS_Description', '有效期至', 'user', dbo, 'table', t_bjsl_ckmx, 'column', yxrq;
--EXEC sp_addextendedproperty 'MS_Description', '生产日期', 'user', dbo, 'table', t_bjsl_ckmx, 'column', scrq;
--EXEC sp_addextendedproperty 'MS_Description', '完成状态', 'user', dbo, 'table', t_bjsl_ckmx, 'column', wczt;
--EXEC sp_addextendedproperty 'MS_Description', '任务行数', 'user', dbo, 'table', t_bjsl_ckmx, 'column', rwhs;
--EXEC sp_addextendedproperty 'MS_Description', '说明', 'user', dbo, 'table', t_bjsl_ckmx, 'column', shm;
--EXEC sp_addextendedproperty 'MS_Description', '包装', 'user', dbo, 'table', t_bjsl_ckmx, 'column', bzsl;
--EXEC sp_addextendedproperty 'MS_Description', '出库件数', 'user', dbo, 'table', t_bjsl_ckmx, 'column', ckjs;


--DROP TABLE t_bjsl_jhrkmx;
--CREATE TABLE t_bjsl_jhrkmx(
--    wlzx int NOT NULL,
--    rklx int NOT NULL,
--    hz Nvarchar(50) NOT NULL,
--    wmsdh nvarchar(50) NOT NULL,
--    tzdh nvarchar(50) NOT NULL,
--    ordr int NOT NULL,
--    spbh NVARCHAR(50) NOT NULL,
--    pcbh NVARCHAR(50) NOT NULL,
--    klx int NOT NULL,
--    shsl decimal(18,4),
--    jssl decimal(18,4),
--    qxsl DECIMAL(18,4),
--    shrq DATETIME,
--    pm NVARCHAR(200),
--    yxrq DATETIME,
--    scrq DATETIME,
--    jsyy NVARCHAR(50),
--    wczt INT,
--    rwhs INT,
--    dhrq DATETIME,
--    bzsl DECIMAL(18,4),
--    shm NVARCHAR(250),
--    ysy NVARCHAR(50),
--    pzwh NVARCHAR(100),
--    pzwhxq DATETIME,
--    xkzh NVARCHAR(100),
--    xkzxq DATETIME,
--    zczh NVARCHAR(100),
--    zczxq DATETIME,
--    lphm VARCHAR(60),
--    PRIMARY KEY (wlzx,rklx,hz,wmsdh,tzdh,ordr,spbh,pcbh,klx)
--)

--EXEC sp_addextendedproperty 'MS_Description', '北京索林进货入库记录', 'user', dbo, 'table', t_bjsl_jhrkmx, null, null;
--EXEC sp_addextendedproperty 'MS_Description', '物流中心', 'user', dbo, 'table', t_bjsl_jhrkmx, 'column', wlzx;
--EXEC sp_addextendedproperty 'MS_Description', '入库类型', 'user', dbo, 'table', t_bjsl_jhrkmx, 'column', rklx;
--EXEC sp_addextendedproperty 'MS_Description', '货主', 'user', dbo, 'table', t_bjsl_jhrkmx, 'column', hz;
--EXEC sp_addextendedproperty 'MS_Description', 'WMS收货单号', 'user', dbo, 'table', t_bjsl_jhrkmx, 'column', wmsdh;
--EXEC sp_addextendedproperty 'MS_Description', '通知单号;对应要货单号', 'user', dbo, 'table', t_bjsl_jhrkmx, 'column', tzdh;
--EXEC sp_addextendedproperty 'MS_Description', '通知单行号;对应要货单行号', 'user', dbo, 'table', t_bjsl_jhrkmx, 'column', ordr;
--EXEC sp_addextendedproperty 'MS_Description', '货品编号', 'user', dbo, 'table', t_bjsl_jhrkmx, 'column', spbh;
--EXEC sp_addextendedproperty 'MS_Description', '批号', 'user', dbo, 'table', t_bjsl_jhrkmx, 'column', pcbh;
--EXEC sp_addextendedproperty 'MS_Description', '库类型', 'user', dbo, 'table', t_bjsl_jhrkmx, 'column', klx;
--EXEC sp_addextendedproperty 'MS_Description', '收货数量', 'user', dbo, 'table', t_bjsl_jhrkmx, 'column', shsl;
--EXEC sp_addextendedproperty 'MS_Description', '拒收数量', 'user', dbo, 'table', t_bjsl_jhrkmx, 'column', jssl;
--EXEC sp_addextendedproperty 'MS_Description', '取消数量', 'user', dbo, 'table', t_bjsl_jhrkmx, 'column', qxsl;
--EXEC sp_addextendedproperty 'MS_Description', '入库日期;收货时间', 'user', dbo, 'table', t_bjsl_jhrkmx, 'column', shrq;
--EXEC sp_addextendedproperty 'MS_Description', '货品名称', 'user', dbo, 'table', t_bjsl_jhrkmx, 'column', pm;
--EXEC sp_addextendedproperty 'MS_Description', '有效期至', 'user', dbo, 'table', t_bjsl_jhrkmx, 'column', yxrq;
--EXEC sp_addextendedproperty 'MS_Description', '生产日期', 'user', dbo, 'table', t_bjsl_jhrkmx, 'column', scrq;
--EXEC sp_addextendedproperty 'MS_Description', '拒收原因', 'user', dbo, 'table', t_bjsl_jhrkmx, 'column', jsyy;
--EXEC sp_addextendedproperty 'MS_Description', '完成状态', 'user', dbo, 'table', t_bjsl_jhrkmx, 'column', wczt;
--EXEC sp_addextendedproperty 'MS_Description', '任务行数', 'user', dbo, 'table', t_bjsl_jhrkmx, 'column', rwhs;
--EXEC sp_addextendedproperty 'MS_Description', '到货日期', 'user', dbo, 'table', t_bjsl_jhrkmx, 'column', dhrq;
--EXEC sp_addextendedproperty 'MS_Description', '包装', 'user', dbo, 'table', t_bjsl_jhrkmx, 'column', bzsl;
--EXEC sp_addextendedproperty 'MS_Description', '说明', 'user', dbo, 'table', t_bjsl_jhrkmx, 'column', shm;
--EXEC sp_addextendedproperty 'MS_Description', '验收员', 'user', dbo, 'table', t_bjsl_jhrkmx, 'column', ysy;
--EXEC sp_addextendedproperty 'MS_Description', '批准文号', 'user', dbo, 'table', t_bjsl_jhrkmx, 'column', pzwh;
--EXEC sp_addextendedproperty 'MS_Description', '批准文号效期', 'user', dbo, 'table', t_bjsl_jhrkmx, 'column', pzwhxq;
--EXEC sp_addextendedproperty 'MS_Description', '生产企业许可证号或备案凭证号', 'user', dbo, 'table', t_bjsl_jhrkmx, 'column', xkzh;
--EXEC sp_addextendedproperty 'MS_Description', '生产企业许可证号或备案凭证号效期', 'user', dbo, 'table', t_bjsl_jhrkmx, 'column', xkzxq;
--EXEC sp_addextendedproperty 'MS_Description', '注册证号', 'user', dbo, 'table', t_bjsl_jhrkmx, 'column', zczh;
--EXEC sp_addextendedproperty 'MS_Description', '注册证效期', 'user', dbo, 'table', t_bjsl_jhrkmx, 'column', zczxq;
--EXEC sp_addextendedproperty 'MS_Description', '随货同行票号', 'user', dbo, 'table', t_bjsl_jhrkmx, 'column', lphm;


--DROP TABLE t_bjsl_ysjlmx;
--CREATE TABLE t_bjsl_ysjlmx(
--    wlzx int NOT NULL,
--    cydh Nvarchar(50) NOT NULL,
--    tzdh nvarchar(50) NOT NULL,
--    ordr int NOT NULL,
--    cyjg NVARCHAR(50) NOT NULL,
--    cyclcs NVARCHAR(50) NOT NULL,
--    spbh NVARCHAR(50) NOT NULL,
--    pcbh NVARCHAR(50) NOT NULL,
--    ysrq DATETIME NOT NULL,
--    id int NOT NULL,
--    wlzxmc NVARCHAR(200),
--    gysbh NVARCHAR(60),
--    gysmc NVARCHAR(200),
--    dhrq DATETIME,
--    rklx NVARCHAR(50),
--    ywy NVARCHAR(50),
--    ysy NVARCHAR(50),
--    pm NVARCHAR(200),
--    gg NVARCHAR(100),
--    cd NVARCHAR(256),
--    sccj NVARCHAR(256),
--    jldw NVARCHAR(50),
--    bzsl DECIMAL(18,4),
--    cctj NVARCHAR(50),
--    zczh NVARCHAR(100),
--    xkzh NVARCHAR(100),
--    hpdl NVARCHAR(200),
--    hpsx NVARCHAR(200),
--    yxrq DATETIME,
--    scrq DATETIME,
--    hgzm NVARCHAR(50),
--    jsyy NVARCHAR(200),
--    jhsl decimal(18,4),
--    yssl decimal(18,4),
--    hgsl DECIMAL(18,4),
--    sjjs DECIMAL(18,4),
--    bhgsy NVARCHAR(4000),
--    clcs NVARCHAR(4000),
--    jx NVARCHAR(50),
--    pzwh NVARCHAR(100),
--    hz NVARCHAR(50),
--    hzmc NVARCHAR(200),
--    PRIMARY KEY (wlzx,cydh,tzdh,ordr,cyjg,cyclcs,spbh,pcbh,ysrq,id)
--)

--EXEC sp_addextendedproperty 'MS_Description', '北京索林验收记录', 'user', dbo, 'table', t_bjsl_ysjlmx, null, null;
--EXEC sp_addextendedproperty 'MS_Description', '物流中心', 'user', dbo, 'table', t_bjsl_ysjlmx, 'column', wlzx;
--EXEC sp_addextendedproperty 'MS_Description', '查验单号', 'user', dbo, 'table', t_bjsl_ysjlmx, 'column', cydh;
--EXEC sp_addextendedproperty 'MS_Description', '通知单号;对应要货单号', 'user', dbo, 'table', t_bjsl_ysjlmx, 'column', tzdh;
--EXEC sp_addextendedproperty 'MS_Description', '通知单行号;对应要货单行号', 'user', dbo, 'table', t_bjsl_ysjlmx, 'column', ordr;
--EXEC sp_addextendedproperty 'MS_Description', '查验结果', 'user', dbo, 'table', t_bjsl_ysjlmx, 'column', cyjg;
--EXEC sp_addextendedproperty 'MS_Description', '查验处理措施', 'user', dbo, 'table', t_bjsl_ysjlmx, 'column', cyclcs;
--EXEC sp_addextendedproperty 'MS_Description', '货品编号', 'user', dbo, 'table', t_bjsl_ysjlmx, 'column', spbh;
--EXEC sp_addextendedproperty 'MS_Description', '批号', 'user', dbo, 'table', t_bjsl_ysjlmx, 'column', pcbh;
--EXEC sp_addextendedproperty 'MS_Description', '验收日期;查验日期', 'user', dbo, 'table', t_bjsl_ysjlmx, 'column', ysrq;
--EXEC sp_addextendedproperty 'MS_Description', 'id', 'user', dbo, 'table', t_bjsl_ysjlmx, 'column', id;
--EXEC sp_addextendedproperty 'MS_Description', '物流中心名称', 'user', dbo, 'table', t_bjsl_ysjlmx, 'column', wlzxmc;
--EXEC sp_addextendedproperty 'MS_Description', '供应商编号', 'user', dbo, 'table', t_bjsl_ysjlmx, 'column', gysbh;
--EXEC sp_addextendedproperty 'MS_Description', '供应商名称', 'user', dbo, 'table', t_bjsl_ysjlmx, 'column', gysmc;
--EXEC sp_addextendedproperty 'MS_Description', '到货日期;收货时间', 'user', dbo, 'table', t_bjsl_ysjlmx, 'column', dhrq;
--EXEC sp_addextendedproperty 'MS_Description', '入库类型', 'user', dbo, 'table', t_bjsl_ysjlmx, 'column', rklx;
--EXEC sp_addextendedproperty 'MS_Description', '业务员', 'user', dbo, 'table', t_bjsl_ysjlmx, 'column', ywy;
--EXEC sp_addextendedproperty 'MS_Description', '验收员', 'user', dbo, 'table', t_bjsl_ysjlmx, 'column', ysy;
--EXEC sp_addextendedproperty 'MS_Description', '货品名称', 'user', dbo, 'table', t_bjsl_ysjlmx, 'column', pm;
--EXEC sp_addextendedproperty 'MS_Description', '规格', 'user', dbo, 'table', t_bjsl_ysjlmx, 'column', gg;
--EXEC sp_addextendedproperty 'MS_Description', '产地', 'user', dbo, 'table', t_bjsl_ysjlmx, 'column', cd;
--EXEC sp_addextendedproperty 'MS_Description', '生产厂家', 'user', dbo, 'table', t_bjsl_ysjlmx, 'column', sccj;
--EXEC sp_addextendedproperty 'MS_Description', '单位', 'user', dbo, 'table', t_bjsl_ysjlmx, 'column', jldw;
--EXEC sp_addextendedproperty 'MS_Description', '包装', 'user', dbo, 'table', t_bjsl_ysjlmx, 'column', bzsl;
--EXEC sp_addextendedproperty 'MS_Description', '储存条件', 'user', dbo, 'table', t_bjsl_ysjlmx, 'column', cctj;
--EXEC sp_addextendedproperty 'MS_Description', '注册证号', 'user', dbo, 'table', t_bjsl_ysjlmx, 'column', zczh;
--EXEC sp_addextendedproperty 'MS_Description', '生产企业许可证号或备案凭证号', 'user', dbo, 'table', t_bjsl_ysjlmx, 'column', xkzh;
--EXEC sp_addextendedproperty 'MS_Description', '货品大类', 'user', dbo, 'table', t_bjsl_ysjlmx, 'column', hpdl;
--EXEC sp_addextendedproperty 'MS_Description', '货品属性', 'user', dbo, 'table', t_bjsl_ysjlmx, 'column', hpsx;
--EXEC sp_addextendedproperty 'MS_Description', '有效期至', 'user', dbo, 'table', t_bjsl_ysjlmx, 'column', yxrq;
--EXEC sp_addextendedproperty 'MS_Description', '生产日期', 'user', dbo, 'table', t_bjsl_ysjlmx, 'column', scrq;
--EXEC sp_addextendedproperty 'MS_Description', '合格证明', 'user', dbo, 'table', t_bjsl_ysjlmx, 'column', hgzm;
--EXEC sp_addextendedproperty 'MS_Description', '拒收原因', 'user', dbo, 'table', t_bjsl_ysjlmx, 'column', jsyy;
--EXEC sp_addextendedproperty 'MS_Description', '计划数量;要货单数量', 'user', dbo, 'table', t_bjsl_ysjlmx, 'column', jhsl;
--EXEC sp_addextendedproperty 'MS_Description', '验收数量', 'user', dbo, 'table', t_bjsl_ysjlmx, 'column', yssl;
--EXEC sp_addextendedproperty 'MS_Description', '合格数量', 'user', dbo, 'table', t_bjsl_ysjlmx, 'column', hgsl;
--EXEC sp_addextendedproperty 'MS_Description', '实际件数', 'user', dbo, 'table', t_bjsl_ysjlmx, 'column', sjjs;
--EXEC sp_addextendedproperty 'MS_Description', '不合格事宜', 'user', dbo, 'table', t_bjsl_ysjlmx, 'column', bhgsy;
--EXEC sp_addextendedproperty 'MS_Description', '处理措施', 'user', dbo, 'table', t_bjsl_ysjlmx, 'column', clcs;
--EXEC sp_addextendedproperty 'MS_Description', '剂型', 'user', dbo, 'table', t_bjsl_ysjlmx, 'column', jx;
--EXEC sp_addextendedproperty 'MS_Description', '批准文号', 'user', dbo, 'table', t_bjsl_ysjlmx, 'column', pzwh;
--EXEC sp_addextendedproperty 'MS_Description', '货主', 'user', dbo, 'table', t_bjsl_ysjlmx, 'column', hz;
--EXEC sp_addextendedproperty 'MS_Description', '货主名称', 'user', dbo, 'table', t_bjsl_ysjlmx, 'column', hzmc;















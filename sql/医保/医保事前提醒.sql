IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_yb_fsi_encounter_dtos]') AND type in (N'U'))
DROP TABLE [dbo].[t_yb_fsi_encounter_dtos];
CREATE TABLE [dbo].[t_yb_fsi_encounter_dtos](
    mdtrt_id NVARCHAR(15) NOT NULL,
    icno NVARCHAR(30),
    idNo NVARCHAR(18),
    patn_name NVARCHAR(50),
    gend NVARCHAR(3),
    brdy NVARCHAR(10),
    AreaCode NVARCHAR(6),
    recipedate NVARCHAR(20),
    dscg_main_dise_codg NVARCHAR(20),
    dscg_main_dise_name NVARCHAR(50),
    drord_dr_codg NVARCHAR(30),
    drord_dr_name NVARCHAR(30),
    drord_dr_profttl NVARCHAR(3),
    sectioncode NVARCHAR(4),
    sectionname NVARCHAR(20),
    med_mdtrt_type NVARCHAR(3),
    med_type NVARCHAR(3),
    matn_stas NVARCHAR(3),
    medfee_sumamt DECIMAL(16,2),
    insutype NVARCHAR(3),
    out_setl_flag NVARCHAR(3),
    SCBZ smallint DEFAULT  0,
    FHXX NVARCHAR(4000),
    PRIMARY KEY (mdtrt_id)
)

EXEC sp_addextendedproperty 'MS_Description', '医保事前提醒就诊信息（fsi_encounter_dtos）', 'SCHEMA', dbo, 'table', t_yb_fsi_encounter_dtos, null, null;
EXEC sp_addextendedproperty 'MS_Description', '业务流程号;药店就诊业务流水号，该流水号需在药店业务系统内部保持唯一不可重复；必填；零售单编号LSDBH', 'SCHEMA', dbo, 'table', t_yb_fsi_encounter_dtos, 'column', mdtrt_id;
EXEC sp_addextendedproperty 'MS_Description', '社保号;本地参保人传入“医保应用号”，异地参保人传入“个人管理码Person_manage”。', 'SCHEMA', dbo, 'table', t_yb_fsi_encounter_dtos, 'column', icno;
EXEC sp_addextendedproperty 'MS_Description', '身份证号', 'SCHEMA', dbo, 'table', t_yb_fsi_encounter_dtos, 'column', idNo;
EXEC sp_addextendedproperty 'MS_Description', '姓名', 'SCHEMA', dbo, 'table', t_yb_fsi_encounter_dtos, 'column', patn_name;
EXEC sp_addextendedproperty 'MS_Description', '性别;1：男，2：女，9：未说明性别', 'SCHEMA', dbo, 'table', t_yb_fsi_encounter_dtos, 'column', gend;
EXEC sp_addextendedproperty 'MS_Description', '出生日期;格式：yyyy-MM-dd', 'SCHEMA', dbo, 'table', t_yb_fsi_encounter_dtos, 'column', brdy;
EXEC sp_addextendedproperty 'MS_Description', '参保地行政区划代码;本地参保人，此字段固定传入“110000” 异地参保人传入“参保地行政区划代码”', 'SCHEMA', dbo, 'table', t_yb_fsi_encounter_dtos, 'column', AreaCode;
EXEC sp_addextendedproperty 'MS_Description', '处方日期;格式：yyyy-MM-dd HH:mm:ss', 'SCHEMA', dbo, 'table', t_yb_fsi_encounter_dtos, 'column', recipedate;
EXEC sp_addextendedproperty 'MS_Description', '主诊断编码;市医保中心发布的《医疗保障疾病诊断分类与代码》、《医疗保障中医诊断分类与代码》', 'SCHEMA', dbo, 'table', t_yb_fsi_encounter_dtos, 'column', dscg_main_dise_codg;
EXEC sp_addextendedproperty 'MS_Description', '主诊断名称', 'SCHEMA', dbo, 'table', t_yb_fsi_encounter_dtos, 'column', dscg_main_dise_name;
EXEC sp_addextendedproperty 'MS_Description', '开处方医生编码;国家医保医师代码，必填', 'SCHEMA', dbo, 'table', t_yb_fsi_encounter_dtos, 'column', drord_dr_codg;
EXEC sp_addextendedproperty 'MS_Description', '开处方医生姓名', 'SCHEMA', dbo, 'table', t_yb_fsi_encounter_dtos, 'column', drord_dr_name;
EXEC sp_addextendedproperty 'MS_Description', '开处方医职称;231：主任医师，	232：副主任医师，233：主治医师，234：医师，235：医士		', 'SCHEMA', dbo, 'table', t_yb_fsi_encounter_dtos, 'column', drord_dr_profttl;
EXEC sp_addextendedproperty 'MS_Description', '就诊科别代码;按照处方上实际科室信息传入； 如获取不到科室信息可传“LD-99”；', 'SCHEMA', dbo, 'table', t_yb_fsi_encounter_dtos, 'column', sectioncode;
EXEC sp_addextendedproperty 'MS_Description', '就诊科别名称;按照处方上实际科室信息传入； 如获取不到科室信息可传“LD-99”；', 'SCHEMA', dbo, 'table', t_yb_fsi_encounter_dtos, 'column', sectionname;
EXEC sp_addextendedproperty 'MS_Description', '就诊类别;3：购药 固定传入“3”', 'SCHEMA', dbo, 'table', t_yb_fsi_encounter_dtos, 'column', med_mdtrt_type;
EXEC sp_addextendedproperty 'MS_Description', '医疗类别;11：药店/门诊，19：急诊', 'SCHEMA', dbo, 'table', t_yb_fsi_encounter_dtos, 'column', med_type;
EXEC sp_addextendedproperty 'MS_Description', '生育状态;0：未知，1：非妊娠期或哺乳期，2：近期有生育计划，3：妊娠期，4：哺乳期', 'SCHEMA', dbo, 'table', t_yb_fsi_encounter_dtos, 'column', matn_stas;
EXEC sp_addextendedproperty 'MS_Description', '总费用', 'SCHEMA', dbo, 'table', t_yb_fsi_encounter_dtos, 'column', medfee_sumamt;
EXEC sp_addextendedproperty 'MS_Description', '险种;4：工伤保险，31：离休，5：生育保险，32：医照，91：城乡居民保险-学生儿童，93：城乡居民保险-无业人员，92：城乡居民保险-无保障老年人，33：超转人员医疗保险，42：职伤保险，3：城镇职工，80：军休		', 'SCHEMA', dbo, 'table', t_yb_fsi_encounter_dtos, 'column', insutype;
EXEC sp_addextendedproperty 'MS_Description', '异地结算标识;必填；0：否，1：是', 'SCHEMA', dbo, 'table', t_yb_fsi_encounter_dtos, 'column', out_setl_flag;
EXEC sp_addextendedproperty 'MS_Description', '上报标志;0，待上传，1 成功，2 触发预警规则，需调用1703接口，-1 失败', 'user', dbo, 'table', t_yb_fsi_encounter_dtos, 'column', SCBZ;
EXEC sp_addextendedproperty 'MS_Description', '上传返回信息', 'user', dbo, 'table', t_yb_fsi_encounter_dtos, 'column', FHXX;


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_yb_fsi_diagnose_dtos]') AND type in (N'U'))
DROP TABLE [dbo].[t_yb_fsi_diagnose_dtos];
CREATE TABLE [dbo].[t_yb_fsi_diagnose_dtos](
    id INT NOT NULL IDENTITY(1,1),
    mdtrt_id NVARCHAR(15),
    diagnoseno NVARCHAR(9),
    maindise_flag NVARCHAR(3),
    dise_codg NVARCHAR(30),
    dise_name NVARCHAR(200),
    dise_date NVARCHAR(19),
    PRIMARY KEY (id)
)

EXEC sp_addextendedproperty 'MS_Description', '医保事前提醒诊断信息（fsi_diagnose_dtos）', 'SCHEMA', dbo, 'table', t_yb_fsi_diagnose_dtos, null, null;
EXEC sp_addextendedproperty 'MS_Description', 'id', 'SCHEMA', dbo, 'table', t_yb_fsi_diagnose_dtos, 'column', id;
EXEC sp_addextendedproperty 'MS_Description', '业务流程号', 'SCHEMA', dbo, 'table', t_yb_fsi_diagnose_dtos, 'column', mdtrt_id;
EXEC sp_addextendedproperty 'MS_Description', '诊断序号', 'SCHEMA', dbo, 'table', t_yb_fsi_diagnose_dtos, 'column', diagnoseno;
EXEC sp_addextendedproperty 'MS_Description', '主诊断标志;必填；0：否，1：是', 'SCHEMA', dbo, 'table', t_yb_fsi_diagnose_dtos, 'column', maindise_flag;
EXEC sp_addextendedproperty 'MS_Description', '诊断编码;市医保中心发布的《医疗保障疾病诊断分类与代码》、《医疗保障中医诊断分类与代码》,必填', 'SCHEMA', dbo, 'table', t_yb_fsi_diagnose_dtos, 'column', dise_codg;
EXEC sp_addextendedproperty 'MS_Description', '诊断名称;诊断编码对应的名称，必填', 'SCHEMA', dbo, 'table', t_yb_fsi_diagnose_dtos, 'column', dise_name;
EXEC sp_addextendedproperty 'MS_Description', '诊断日期;格式：yyyy-MM-dd HH:mm:ss，必填', 'SCHEMA', dbo, 'table', t_yb_fsi_diagnose_dtos, 'column', dise_date;


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_yb_fsi_order_dtos]') AND type in (N'U'))
DROP TABLE [dbo].[t_yb_fsi_order_dtos];
CREATE TABLE [dbo].[t_yb_fsi_order_dtos](
    id INT NOT NULL IDENTITY(1,1),
    mdtrt_id NVARCHAR(15),
    rxno NVARCHAR(20),
    item_type NVARCHAR(3),
    fee_type NVARCHAR(4),
    nation_sub_code NVARCHAR(40),
    hilist_name NVARCHAR(50),
    hiscode NVARCHAR(20),
    itemname NVARCHAR(50),
    dose NVARCHAR(6),
    count DECIMAL(6,2),
    unitprice DECIMAL(16,2),
    fee DECIMAL(16,2),
    specification NVARCHAR(100),
    unit NVARCHAR(20),
    PRIMARY KEY (id)
)

EXEC sp_addextendedproperty 'MS_Description', '医保事前提醒处方信息（fsi_order_dtos）', 'SCHEMA', dbo, 'table', t_yb_fsi_order_dtos, null, null;
EXEC sp_addextendedproperty 'MS_Description', 'id', 'SCHEMA', dbo, 'table', t_yb_fsi_order_dtos, 'column', id;
EXEC sp_addextendedproperty 'MS_Description', '业务流程号', 'SCHEMA', dbo, 'table', t_yb_fsi_order_dtos, 'column', mdtrt_id;
EXEC sp_addextendedproperty 'MS_Description', '处方号', 'SCHEMA', dbo, 'table', t_yb_fsi_order_dtos, 'column', rxno;
EXEC sp_addextendedproperty 'MS_Description', '项目类别;必填；0：药品，3：医用器械/耗材', 'SCHEMA', dbo, 'table', t_yb_fsi_order_dtos, 'column', item_type;
EXEC sp_addextendedproperty 'MS_Description', '收费类别;0100：西药类，0101：甲类西药，0102：乙类西药，0103：其它类西药，0200：	中成药类，0201：甲类中成药，0202：乙类中成药，0203：其它类中成药，0204：民族药，0300：中草药类，0301：复方可报，0302：单方可报，0303：其它类草药', 'SCHEMA', dbo, 'table', t_yb_fsi_order_dtos, 'column', fee_type;
EXEC sp_addextendedproperty 'MS_Description', '医保目录代码;贯标的医保项目编码，必填 当项目类别为“医用器械/耗材”时，传入27位国家贯标耗材编码；', 'SCHEMA', dbo, 'table', t_yb_fsi_order_dtos, 'column', nation_sub_code;
EXEC sp_addextendedproperty 'MS_Description', '医保目录名称;贯标的医保项目名称，必填', 'SCHEMA', dbo, 'table', t_yb_fsi_order_dtos, 'column', hilist_name;
EXEC sp_addextendedproperty 'MS_Description', '药店系统项目代码', 'SCHEMA', dbo, 'table', t_yb_fsi_order_dtos, 'column', hiscode;
EXEC sp_addextendedproperty 'MS_Description', '药店系统项目名称', 'SCHEMA', dbo, 'table', t_yb_fsi_order_dtos, 'column', itemname;
EXEC sp_addextendedproperty 'MS_Description', '剂型;数据字典', 'SCHEMA', dbo, 'table', t_yb_fsi_order_dtos, 'column', dose;
EXEC sp_addextendedproperty 'MS_Description', '数量', 'SCHEMA', dbo, 'table', t_yb_fsi_order_dtos, 'column', count;
EXEC sp_addextendedproperty 'MS_Description', '单价', 'SCHEMA', dbo, 'table', t_yb_fsi_order_dtos, 'column', unitprice;
EXEC sp_addextendedproperty 'MS_Description', '总费用', 'SCHEMA', dbo, 'table', t_yb_fsi_order_dtos, 'column', fee;
EXEC sp_addextendedproperty 'MS_Description', '规格', 'SCHEMA', dbo, 'table', t_yb_fsi_order_dtos, 'column', specification;
EXEC sp_addextendedproperty 'MS_Description', '单位', 'SCHEMA', dbo, 'table', t_yb_fsi_order_dtos, 'column', unit;

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_yb_sqtx_fh]') AND type in (N'U'))
DROP TABLE [dbo].[t_yb_sqtx_fh];
CREATE TABLE [dbo].[t_yb_sqtx_fh](
    jrid VARCHAR(50) NOT NULL,
    ruleid VARCHAR(50),
    rulename VARCHAR(200),
    volacont VARCHAR(500),
    mdtrtid VARCHAR(50),
    volaamt DECIMAL(16,2),
    volaamtstas VARCHAR(3),
    sevdeg VARCHAR(3),
    volaevid VARCHAR(500),
    volabhvrtype VARCHAR(3),
    taskid VARCHAR(40),
    PRIMARY KEY (jrid)
)

EXEC sp_addextendedproperty 'MS_Description', '医保事前提醒返回违规信息', 'SCHEMA', dbo, 'table', t_yb_sqtx_fh, null, null;
EXEC sp_addextendedproperty 'MS_Description', '违规标识', 'SCHEMA', dbo, 'table', t_yb_sqtx_fh, 'column', jrid;
EXEC sp_addextendedproperty 'MS_Description', '规则id', 'SCHEMA', dbo, 'table', t_yb_sqtx_fh, 'column', ruleid;
EXEC sp_addextendedproperty 'MS_Description', '规则名称', 'SCHEMA', dbo, 'table', t_yb_sqtx_fh, 'column', rulename;
EXEC sp_addextendedproperty 'MS_Description', '违规内容', 'SCHEMA', dbo, 'table', t_yb_sqtx_fh, 'column', volacont;
EXEC sp_addextendedproperty 'MS_Description', '就诊id', 'SCHEMA', dbo, 'table', t_yb_sqtx_fh, 'column', mdtrtid;
EXEC sp_addextendedproperty 'MS_Description', '违规金额', 'SCHEMA', dbo, 'table', t_yb_sqtx_fh, 'column', volaamt;
EXEC sp_addextendedproperty 'MS_Description', '违规金额计算状态;0：异常，1：正常', 'SCHEMA', dbo, 'table', t_yb_sqtx_fh, 'column', volaamtstas;
EXEC sp_addextendedproperty 'MS_Description', '严重程度', 'SCHEMA', dbo, 'table', t_yb_sqtx_fh, 'column', sevdeg;
EXEC sp_addextendedproperty 'MS_Description', '违规依据', 'SCHEMA', dbo, 'table', t_yb_sqtx_fh, 'column', volaevid;
EXEC sp_addextendedproperty 'MS_Description', '违规行为分类;参见字典：违规行为分类', 'SCHEMA', dbo, 'table', t_yb_sqtx_fh, 'column', volabhvrtype;
EXEC sp_addextendedproperty 'MS_Description', '任务id', 'SCHEMA', dbo, 'table', t_yb_sqtx_fh, 'column', taskid;


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_yb_sqtx_fhmx]') AND type in (N'U'))
DROP TABLE [dbo].[t_yb_sqtx_fhmx];
CREATE TABLE [dbo].[t_yb_sqtx_fhmx](
    jrid VARCHAR(50) NOT NULL,
    mdtrtid VARCHAR(50),
    rxid VARCHAR(50),
    volaitemtype VARCHAR(3),
    volaamt DECIMAL(16,2),
    PRIMARY KEY (jrid)
)

EXEC sp_addextendedproperty 'MS_Description', '医保事前提醒返回违规明细', 'SCHEMA', dbo, 'table', t_yb_sqtx_fhmx, null, null;
EXEC sp_addextendedproperty 'MS_Description', '违规标识', 'SCHEMA', dbo, 'table', t_yb_sqtx_fhmx, 'column', jrid;
EXEC sp_addextendedproperty 'MS_Description', '就诊标识', 'SCHEMA', dbo, 'table', t_yb_sqtx_fhmx, 'column', mdtrtid;
EXEC sp_addextendedproperty 'MS_Description', '处方（医嘱）标识', 'SCHEMA', dbo, 'table', t_yb_sqtx_fhmx, 'column', rxid;
EXEC sp_addextendedproperty 'MS_Description', '违规明细类型;参见字典：违规项目类型', 'SCHEMA', dbo, 'table', t_yb_sqtx_fhmx, 'column', volaitemtype;
EXEC sp_addextendedproperty 'MS_Description', '违规金额', 'SCHEMA', dbo, 'table', t_yb_sqtx_fhmx, 'column', volaamt;


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[T_YB_JBZDFL]') AND type in (N'U'))
DROP TABLE [dbo].[T_YB_JBZDFL];
CREATE TABLE [dbo].[T_YB_JBZDFL](
    id int NOT NULL IDENTITY(1,1),
    zdbm NVARCHAR(100),
    zdmc NVARCHAR(300),
    jc NVARCHAR(50),
    PRIMARY KEY (id)
)

EXEC sp_addextendedproperty 'MS_Description', '医保疾病诊断与分类代码', 'SCHEMA', dbo, 'table', T_YB_JBZDFL, null, null;
EXEC sp_addextendedproperty 'MS_Description', '', 'SCHEMA', dbo, 'table', T_YB_JBZDFL, 'column', id;
EXEC sp_addextendedproperty 'MS_Description', '诊断编码', 'SCHEMA', dbo, 'table', T_YB_JBZDFL, 'column', zdbm;
EXEC sp_addextendedproperty 'MS_Description', '诊断名称', 'SCHEMA', dbo, 'table', T_YB_JBZDFL, 'column', zdmc;
EXEC sp_addextendedproperty 'MS_Description', '拼音简称', 'SCHEMA', dbo, 'table', T_YB_JBZDFL, 'column', jc;


-----医保改造 2026年7月18日 ----------
-- 费用分解增加 事前提醒标识preverifyflag,0：否，不需要事前提醒；1：是，需要事前提醒; 
ALTER TABLE T_yb_divide
ADD preverifyflag NVARCHAR(4) DEFAULT '0';


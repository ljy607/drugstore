---- 2024年3月15日 16:59:30
ALTER TABLE t_gysxx 
ALTER COLUMN gysmc VARCHAR(100)

INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
VALUES('13','经营类别管理',7,1,'经营类别管理','image\tom_wap.gif','w_spjylb',1,1,0);

--ALTER TABLE t_fdyhzb 
--ALTER COLUMN bz VARCHAR(200)

--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('12','北京药监对接表',7,3,'北京药监对接表','image\tom_wap.gif','w_bjyjdj',1,1,0);


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

-------单位信息 增加仓库地址 2024年3月4日 17:25:09
--ALTER table t_dwxx 
--ADD ckdz VARCHAR(500) NULL

--update a set a.yjtx=1,gsprq=null,lb=RIGHT(lb,4)
--FROM T_gysxx a

-------- 供应商增加仓库地址信息 2024年3月4日 15:17:00
--ALTER TABLE t_gysxx 
--ADD ckdz VARCHAR(1000) NULL

--ALTER TABLE t_gysxx 
--DROP CONSTRAINT PK__T_GYSXX__30F848ED

--ALTER TABLE t_gysxx 
--ADD CONSTRAINT pk_gysbh PRIMARY KEY(gysbh)

--ALTER TABLE t_ckdzb 
--ADD srcbillcode VARCHAR(60) NULL DEFAULT ''  -- 外部单号 凯宏鑫出库单号 

--/* 凯宏鑫委外库，修改相关表，生产厂家名称增加长度 */
--ALTER TABLE t_jhdzb 
--add [srcbillcode] VARCHAR(60);	-- 外部单号 
                              
--ALTER TABLE t_jhdzb
--ALTER COLUMN ysr VARCHAR(16);                          

---- 总店要货计划 增加是否上传凯宏鑫标志                             	
--ALTER TABLE t_yhjhzb 
--ADD isdone CHAR(1) DEFAULT 'N' NULL;        

---- 分店要货计划 增加是否上传凯宏鑫标志                             	
--ALTER TABLE t_fdyhzb 
--ADD isdone CHAR(1) DEFAULT 'N' NULL;  

--ALTER TABLE t_sccj 
--ALTER column cjmc VARCHAR(100) NULL;

--ALTER TABLE t_tkdzb 
--ADD isdone CHAR(1) DEFAULT 'N' ;

--ALTER TABLE t_thdzb 
--ADD isdone CHAR(1) DEFAULT 'N' ;

-- --商品信息增加上市许可持有人字段 2023年12月14日 14:18:33
--ALTER TABLE T_SPXX
--ADD MarketBy VARCHAR(100) NULL

------增加外部销售订单 2022年10月9日 14:13:18  -------------------
--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('13','网销订单查询',3,1,'网销订单查询','image\tom_wap.gif','w_lsdcx_w',1,1,0);

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

--EXEC sp_addextendedproperty 'MS_Description', '外部销售订单主表', 'user', dbo, 'table', T_LSDZB_W, null, null;
--EXEC sp_addextendedproperty 'MS_Description', '分店编号', 'user', dbo, 'table', T_LSDZB_W, 'column', fgsbh;
--EXEC sp_addextendedproperty 'MS_Description', '零售单号', 'user', dbo, 'table', T_LSDZB_W, 'column', LSDBH;
--EXEC sp_addextendedproperty 'MS_Description', '销售日期', 'user', dbo, 'table', T_LSDZB_W, 'column', RQ;
--EXEC sp_addextendedproperty 'MS_Description', '应收金额', 'user', dbo, 'table', T_LSDZB_W, 'column', YSJE;
--EXEC sp_addextendedproperty 'MS_Description', '实收金额', 'user', dbo, 'table', T_LSDZB_W, 'column', SSJE;
--EXEC sp_addextendedproperty 'MS_Description', '打包袋', 'user', dbo, 'table', T_LSDZB_W, 'column', dbd;
--EXEC sp_addextendedproperty 'MS_Description', '包装费', 'user', dbo, 'table', T_LSDZB_W, 'column', bzf;
--EXEC sp_addextendedproperty 'MS_Description', '配送费', 'user', dbo, 'table', T_LSDZB_W, 'column', psf;
--EXEC sp_addextendedproperty 'MS_Description', '订单来源;美团、拼多多、京东等', 'user', dbo, 'table', T_LSDZB_W, 'column', DDLY;
--EXEC sp_addextendedproperty 'MS_Description', '外部订单编号', 'user', dbo, 'table', T_LSDZB_W, 'column', WBDDBH;
--EXEC sp_addextendedproperty 'MS_Description', '备注', 'user', dbo, 'table', T_LSDZB_W, 'column', BZ;
--EXEC sp_addextendedproperty 'MS_Description', '录入人', 'user', dbo, 'table', T_LSDZB_W, 'column', KPR;
--EXEC sp_addextendedproperty 'MS_Description', '状态', 'user', dbo, 'table', T_LSDZB_W, 'column', YXBZ;

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

--EXEC sp_addextendedproperty 'MS_Description', '外部销售订单明细表', 'user', dbo, 'table', T_LSDMXB_W, null, null;
--EXEC sp_addextendedproperty 'MS_Description', '键值', 'user', dbo, 'table', T_LSDMXB_W, 'column', ID;
--EXEC sp_addextendedproperty 'MS_Description', '零售单号', 'user', dbo, 'table', T_LSDMXB_W, 'column', LSDBH;
--EXEC sp_addextendedproperty 'MS_Description', '货号', 'user', dbo, 'table', T_LSDMXB_W, 'column', SPBH;
--EXEC sp_addextendedproperty 'MS_Description', '批号', 'user', dbo, 'table', T_LSDMXB_W, 'column', PCBH;
--EXEC sp_addextendedproperty 'MS_Description', '数量', 'user', dbo, 'table', T_LSDMXB_W, 'column', SL;
--EXEC sp_addextendedproperty 'MS_Description', '单价', 'user', dbo, 'table', T_LSDMXB_W, 'column', LSJ;
--EXEC sp_addextendedproperty 'MS_Description', '营业员编号', 'user', dbo, 'table', T_LSDMXB_W, 'column', YYYBH;
--EXEC sp_addextendedproperty 'MS_Description', '货位', 'user', dbo, 'table', T_LSDMXB_W, 'column', GUIT;
--EXEC sp_addextendedproperty 'MS_Description', '药师编号', 'user', dbo, 'table', T_LSDMXB_W, 'column', YSBH;
--EXEC sp_addextendedproperty 'MS_Description', '进货价', 'user', dbo, 'table', T_LSDMXB_W, 'column', JHJ;
--EXEC sp_addextendedproperty 'MS_Description', '核算价', 'user', dbo, 'table', T_LSDMXB_W, 'column', JHJHS;
--EXEC sp_addextendedproperty 'MS_Description', '经营类别', 'user', dbo, 'table', T_LSDMXB_W, 'column', JYLB;


--------------------付款记录增加返款金额字段 2022年9月19日 09:51:37 ---------------
--alter TABLE T_FKJLZB
--ADD ZKJE decimal(19,4) DEFAULT  0;
--GO

--EXEC sp_addextendedproperty 'MS_Description', '', 'user', dbo, 'table', T_FKJLZB, null, null;
--EXEC sp_addextendedproperty 'MS_Description', '付款记录编号', 'user', dbo, 'table', T_FKJLZB, 'column', FKJLBH;
--EXEC sp_addextendedproperty 'MS_Description', '供应商编号', 'user', dbo, 'table', T_FKJLZB, 'column', GYSBH;
--EXEC sp_addextendedproperty 'MS_Description', '付款日期', 'user', dbo, 'table', T_FKJLZB, 'column', FKRQ;
--EXEC sp_addextendedproperty 'MS_Description', '付款金额', 'user', dbo, 'table', T_FKJLZB, 'column', FKJE;
--EXEC sp_addextendedproperty 'MS_Description', '退货金额', 'user', dbo, 'table', T_FKJLZB, 'column', THJE;
--EXEC sp_addextendedproperty 'MS_Description', '付款人', 'user', dbo, 'table', T_FKJLZB, 'column', FKR;
--EXEC sp_addextendedproperty 'MS_Description', '备注', 'user', dbo, 'table', T_FKJLZB, 'column', BZ;
--EXEC sp_addextendedproperty 'MS_Description', '返款金额;返款金额作为扣除付款的一部分，同退回金额', 'user', dbo, 'table', T_FKJLZB, 'column', ZKJE;

--alter TABLE t_jhpfd
--add wrje decimal(18,2) DEFAULT 0;
--GO

--EXEC sp_addextendedproperty 'MS_Description', '进货票附单', 'user', dbo, 'table', t_jhpfd, null, null;
--EXEC sp_addextendedproperty 'MS_Description', '', 'user', dbo, 'table', t_jhpfd, 'column', id;
--EXEC sp_addextendedproperty 'MS_Description', '供应商编号', 'user', dbo, 'table', t_jhpfd, 'column', gysbh;
--EXEC sp_addextendedproperty 'MS_Description', '供应商名称', 'user', dbo, 'table', t_jhpfd, 'column', gysmc;
--EXEC sp_addextendedproperty 'MS_Description', '进货日期', 'user', dbo, 'table', t_jhpfd, 'column', jhrq;
--EXEC sp_addextendedproperty 'MS_Description', '来票张数', 'user', dbo, 'table', t_jhpfd, 'column', lpzs;
--EXEC sp_addextendedproperty 'MS_Description', '票面金额', 'user', dbo, 'table', t_jhpfd, 'column', pmje;
--EXEC sp_addextendedproperty 'MS_Description', '供货品种', 'user', dbo, 'table', t_jhpfd, 'column', ghpz;
--EXEC sp_addextendedproperty 'MS_Description', '冲账金额', 'user', dbo, 'table', t_jhpfd, 'column', cjje;
--EXEC sp_addextendedproperty 'MS_Description', '未收金额', 'user', dbo, 'table', t_jhpfd, 'column', wsje;
--EXEC sp_addextendedproperty 'MS_Description', '未收品种数;0 已保存， 1 待审核，2 已审核', 'user', dbo, 'table', t_jhpfd, 'column', wspzs;
--EXEC sp_addextendedproperty 'MS_Description', '标志', 'user', dbo, 'table', t_jhpfd, 'column', flag;
--EXEC sp_addextendedproperty 'MS_Description', '未入机金额', 'user', dbo, 'table', t_jhpfd, 'column', wrje;

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
--EXEC sp_addextendedproperty 'MS_Description', '涨价记录明细表', 'user', dbo, 'table', t_jhdmxb_jg, null, null;
--EXEC sp_addextendedproperty 'MS_Description', 'ID;t_jhdmxb.id', 'user', dbo, 'table', t_jhdmxb_jg, 'column', id;
--EXEC sp_addextendedproperty 'MS_Description', '进货单编号', 'user', dbo, 'table', t_jhdmxb_jg, 'column', jhdbh;
--EXEC sp_addextendedproperty 'MS_Description', '货号', 'user', dbo, 'table', t_jhdmxb_jg, 'column', spbh;
--EXEC sp_addextendedproperty 'MS_Description', '进货价', 'user', dbo, 'table', t_jhdmxb_jg, 'column', jhj;
--EXEC sp_addextendedproperty 'MS_Description', '上次进货价', 'user', dbo, 'table', t_jhdmxb_jg, 'column', qjhj;
--EXEC sp_addextendedproperty 'MS_Description', '涨价原因', 'user', dbo, 'table', t_jhdmxb_jg, 'column', bz;

--CREATE TABLE t_jhdzb_jg(
--    jhdbh VARCHAR(32) NOT NULL,
--    jhrq datetime,
--    gysbh VARCHAR(16),
--    flag tinyint DEFAULT  0,
--    PRIMARY KEY (jhdbh)
--);
--go

--EXEC sp_addextendedproperty 'MS_Description', '涨价记录主表', 'SCHEMA', dbo, 'table', t_jhdzb_jg, null, null;
--EXEC sp_addextendedproperty 'MS_Description', '进货单编号', 'SCHEMA', dbo, 'table', t_jhdzb_jg, 'column', jhdbh;
--EXEC sp_addextendedproperty 'MS_Description', '进货日期', 'SCHEMA', dbo, 'table', t_jhdzb_jg, 'column', jhrq;
--EXEC sp_addextendedproperty 'MS_Description', '供应商编号', 'SCHEMA', dbo, 'table', t_jhdzb_jg, 'column', gysbh;
--EXEC sp_addextendedproperty 'MS_Description', '状态', 'SCHEMA', dbo, 'table', t_jhdzb_jg, 'column', flag;

--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('15','进货涨价原因',2,1,'进货涨价原因','image\tom_wap.gif','w_jhd_jgsm',1,1,0);


------------------商品信息增加医疗器械/耗材的27位国家贯标耗材编码字段 2022年9月13日 16:44:51 ----------------
--alter TABLE T_SPXX
--add gjgbbm VARCHAR(60);
--GO
--EXEC sp_addextendedproperty 'MS_Description', '国家贯标耗材编码;27位国家贯标耗材编码，用于医保结算', 'user', dbo, 'table', T_SPXX, 'column', gjgbbm;

-----------零售汇总表增加核算进货价金额 2022年9月7日 14:17:52 -----------------
--alter TABLE T_LSHZB
--ADD HSJE decimal(10,2) ;
--GO

--EXEC sp_addextendedproperty 'MS_Description', '', 'user', dbo, 'table', T_LSHZB, null, null;
--EXEC sp_addextendedproperty 'MS_Description', '分公司编码', 'user', dbo, 'table', T_LSHZB, 'column', FGSBH;
--EXEC sp_addextendedproperty 'MS_Description', '销售日期', 'user', dbo, 'table', T_LSHZB, 'column', LSRQ;
--EXEC sp_addextendedproperty 'MS_Description', '序号', 'user', dbo, 'table', T_LSHZB, 'column', ORDR;
--EXEC sp_addextendedproperty 'MS_Description', '货号', 'user', dbo, 'table', T_LSHZB, 'column', SPBH;
--EXEC sp_addextendedproperty 'MS_Description', '批号', 'user', dbo, 'table', T_LSHZB, 'column', PCBH;
--EXEC sp_addextendedproperty 'MS_Description', '数量', 'user', dbo, 'table', T_LSHZB, 'column', SHUL;
--EXEC sp_addextendedproperty 'MS_Description', '销售金额', 'user', dbo, 'table', T_LSHZB, 'column', JINE;
--EXEC sp_addextendedproperty 'MS_Description', '进货价', 'user', dbo, 'table', T_LSHZB, 'column', JHJ;
--EXEC sp_addextendedproperty 'MS_Description', '开发票标志', 'user', dbo, 'table', T_LSHZB, 'column', KFP;
--EXEC sp_addextendedproperty 'MS_Description', '核算进货金额', 'user', dbo, 'table', T_LSHZB, 'column', HSJE;
--GO

--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('12','分店毛利核算',3,1,'分店毛利核算','image\tom_wap.gif','w_cw_fdmlhs',1,1,0);
--go

--/***********************************************
--* 零售记录上传
--***********************************************/
--ALTER PROCEDURE [dbo].[SP_LSUPLOAD] @sdwbh varchar(12), @dtywrq datetime, @spbh varchar(16), @spcbh varchar(20)
--, @decsl decimal(8,2), @decjine decimal(8,2),@decjhj decimal(10,4),@dechsje decimal(10,2)=null
--AS
--DECLARE @iordr int
--SELECT @iordr = ISNULL(MAX(ORDR),0) + 1 FROM T_LSHZB WHERE FGSBH = @sdwbh AND LSRQ = @dtywrq
--INSERT INTO T_LSHZB(fgsbh,lsrq,ordr,spbh,pcbh,shul,jine,jhj,HSJE)
-- VALUES ( @sdwbh, @dtywrq, @iordr, @spbh, @spcbh, @decsl, @decjine,@decjhj,@dechsje )

--GO

----------------- 运输记录增加车型 2022年8月14日 16:39:01 ----------------
--ALTER TABLE t_ysjl
--ADD chex VARCHAR(16) NULL;
--GO
--EXEC sp_addextendedproperty 'MS_Description', '车型', 'user', dbo, 'table', t_ysjl, 'column', chex;



----------------- 供应商增加预警提醒属性 2022年7月27日 10:29:35------------------
--ALTER TABLE T_GYSXX
--ADD yjtx TINYINT DEFAULT 1;
--GO
--EXEC sp_addextendedproperty 'MS_Description', '预警提醒', 'user', dbo, 'table', T_GYSXX, 'column', yjtx;
--UPDATE T_GYSXX SET yjtx = 1 ;

----------------- 增加返款财务记录 2022年7月11日 09:48:01  -------------------
--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('10','返款记账',3,0,'返款记账','image\tom_wap.gif','w_spxx_fk',1,1,0);

--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('11','返款记账查询',3,0,'返款记账','image\tom_wap.gif','w_spxx_fkcx',1,1,0);


--CREATE TABLE t_spxx_fkjl(
--    fkbh VARCHAR(32) NOT NULL,
--    fkrq DATETIME,
--    fkje DECIMAL(10,2),
--    zbr VARCHAR(10),
--    bz varchar(128),
--    PRIMARY KEY (fkbh)
--);
--EXEC sp_addextendedproperty 'MS_Description', '返款记录', 'user', dbo, 'table', t_spxx_fkjl, null, null;
--EXEC sp_addextendedproperty 'MS_Description', '键值', 'user', dbo, 'table', t_spxx_fkjl, 'column', fkbh;
--EXEC sp_addextendedproperty 'MS_Description', '返款日期', 'user', dbo, 'table', t_spxx_fkjl, 'column', fkrq;
--EXEC sp_addextendedproperty 'MS_Description', '返款金额', 'user', dbo, 'table', t_spxx_fkjl, 'column', fkje;
--EXEC sp_addextendedproperty 'MS_Description', '操作人', 'user', dbo, 'table', t_spxx_fkjl, 'column', zbr;
--EXEC sp_addextendedproperty 'MS_Description', '备注', 'user', dbo, 'table', t_spxx_fkjl, 'column', bz;

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
--EXEC sp_addextendedproperty 'MS_Description', '返款记录明细', 'user', dbo, 'table', t_spxx_fkjlmx, null, null;
--EXEC sp_addextendedproperty 'MS_Description', '键值', 'user', dbo, 'table', t_spxx_fkjlmx, 'column', id;
--EXEC sp_addextendedproperty 'MS_Description', '返款编号', 'user', dbo, 'table', t_spxx_fkjlmx, 'column', fkbh;
--EXEC sp_addextendedproperty 'MS_Description', '返款商品', 'user', dbo, 'table', t_spxx_fkjlmx, 'column', spxx_fk_id;
--EXEC sp_addextendedproperty 'MS_Description', '返款金额', 'user', dbo, 'table', t_spxx_fkjlmx, 'column', fkje;
--EXEC sp_addextendedproperty 'MS_Description', '进货单明细ID', 'user', dbo, 'table', t_spxx_fkjlmx, 'column', jhdmxid;
--EXEC sp_addextendedproperty 'MS_Description', '进货数量', 'user', dbo, 'table', t_spxx_fkjlmx, 'column', jhsl;


-----增加返款商品记录表，记录商品的返款金额、联系人信息，用于查询统计返款金额 2022年3月4日 08:59:10------------
--CREATE TABLE t_spxx_fk(
--    id INT NOT NULL IDENTITY(1,1),
--    spbh VARCHAR(32),
--    gysbh VARCHAR(10),
--    fkje DECIMAL(10,2),
--    lxr VARCHAR(16),
--    lxdh VARCHAR(16),
--    PRIMARY KEY (id)
--)
--EXEC sp_addextendedproperty 'MS_Description', '返款商品记录信息', 'user', dbo, 'table', t_spxx_fk, null, null;
--EXEC sp_addextendedproperty 'MS_Description', '键值', 'user', dbo, 'table', t_spxx_fk, 'column', id;
--EXEC sp_addextendedproperty 'MS_Description', '货号', 'user', dbo, 'table', t_spxx_fk, 'column', spbh;
--EXEC sp_addextendedproperty 'MS_Description', '供应商编号', 'user', dbo, 'table', t_spxx_fk, 'column', gysbh;
--EXEC sp_addextendedproperty 'MS_Description', '返款金额;每个数量的返款金额', 'user', dbo, 'table', t_spxx_fk, 'column', fkje;
--EXEC sp_addextendedproperty 'MS_Description', '联系人', 'user', dbo, 'table', t_spxx_fk, 'column', lxr;
--EXEC sp_addextendedproperty 'MS_Description', '联系电话', 'user', dbo, 'table', t_spxx_fk, 'column', lxdh;

--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('28','返款药品',6,0,'返款药品','image\tom_wap.gif','w_fkyp',1,1,0)
--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('09','返款金额查询',3,0,'返款金额查询','image\tom_wap.gif','w_fkcx',1,1,0)


--------   商品信息增加是否退换货标识 2022年2月25日 14:57:19 ------------------
--ALTER TABLE t_spxx 
--ADD sfth TINYINT DEFAULT 0 ;
--execute sp_addextendedproperty 'MS_Description','是否支持退换货','user','dbo','table','t_spxx','column','sfth';


-- 商品信息增加四类药品标识 2022年1月28日 17:26:32 ---------------------
--ALTER TABLE t_spxx 
--ADD slyp TINYINT DEFAULT 0 ;
--execute sp_addextendedproperty 'MS_Description','四类药品','user','dbo','table','t_spxx','column','slyp';

-----------------2021年9月10日 13:26:24 增加首营企业数据调整 -----------------
--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('11','首营企业调整',7,0,'首营企业调整','image\tom_wap.gif','w_syqyspb_tz',1,1,0)


----------------2021年6月30日 18:16:46 增加调整货位到退货区的功能  --------------
--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('27','退货货位（退货）',6,1,'退货货位（退货）','image\tom_wap.gif','w_tzhw_th',0,1,0)


------------2021年4月13日 14:55:09 商品信息增加OTC标志 ----------------
--ALTER TABLE t_spxx 
--ADD otc TINYINT DEFAULT 0

---------2021年4月6日 13:21:30 增加网店出库单导出功能 ------------------
--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('10','网售出库单导出',7,0,'网售出库单导出','image\tom_wap.gif','w_wdck',1,1,0)
------ 初始化分店信息
--INSERT INTO t_dwxx(dwbh,dwmc,jc,dwdz,fzr,dyhw,gxrq,sffd)
--VALUES('201','网店','网店','网店','001','201',getdate(),0)


---------2021年2月3日 09:48:10 增加采购状态的系统选项维护 --------
--UPDATE t_options SET flag = 0 WHERE id not IN(3,4,99) AND id < 101

--SET IDENTITY_INSERT t_options ON
--INSERT INTO t_options(id,pid, code, name, note, sort, flag)
--VALUES(7,0,'gnzz',N'功能主治',N'功能主治',200,1)
--SET IDENTITY_INSERT t_options OFF

--SET IDENTITY_INSERT t_options ON
--INSERT INTO t_options(id,pid, code, name, note, sort, flag)
--VALUES(8,0,'gnzz',N'采购状态',N'采购状态',200,1)
--SET IDENTITY_INSERT t_options OFF



------增加网售商品信息表 2021年2月2日 09:48:54
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
--VALUES('09','网售商品维护',7,0,'网售商品维护','image\tom_wap.gif','w_spxx_wangshou',1,1,0)



------- 总店系统分公司库存增加更新日期  2020年12月29日 16:24:01
--alter table t_fgskc
--add gxrq datetime default getdate()
--execute sp_addextendedproperty 'MS_Description','更新时间','user','dbo','table','t_fgskc','column','gxrq';

----------分店结账增加 预存款、预存款消费 2020年11月10日 17:53:33  -------
--ALTER TABLE t_jz 
--ADD yczhifubao MONEY NULL,ycweixin money,yczhifubaosj money null,ycweixinsj money null,ycxianjin money null,jeyucun money null
--execute sp_addextendedproperty 'MS_Description','预存支付宝','user','dbo','table','t_jz','column','yczhifubao';
--execute sp_addextendedproperty 'MS_Description','预存支付宝手机','user','dbo','table','t_jz','column','yczhifubaosj';
--execute sp_addextendedproperty 'MS_Description','预存微信','user','dbo','table','t_jz','column','ycweixin';
--execute sp_addextendedproperty 'MS_Description','预存微信手机','user','dbo','table','t_jz','column','ycweixinsj';
--execute sp_addextendedproperty 'MS_Description','预存金额消费','user','dbo','table','t_jz','column','jeyucun';
--execute sp_addextendedproperty 'MS_Description','预存现金','user','dbo','table','t_jz','column','ycxianjin';

---------2020年4月10日 12:59:24 结账增加追票金额 -----
--ALTER TABLE t_jz
--ADD jezhui MONEY NULL DEFAULT 0

---------2020年4月3日 16:20:48 增加大客户的系统选项维护 --------
--SET IDENTITY_INSERT t_options ON
--INSERT INTO t_options(id,pid, code, name, note, sort, flag)
--VALUES(99,0,'dkh',N'大客户',N'大客户',200,1)
--SET IDENTITY_INSERT t_options OFF

---------2020年2月12日 15:56:29  增加数据隐藏功能  --------------
--alter table t_ckdzb
--add flag tinyint null default 1

--alter table t_ckdmxb
--add flag tinyint null default 1

--alter table t_jhdzb
--add flag tinyint null default 1

--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('07','数据隐藏',5,0,'数据隐藏','image\tom_wap.gif','w_djcx_edit',1,1,0)

---------------2020年2月8日 11:49:27-------------
-------增加临时功能 单品进货记录查询 --------
--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('30','商品进货记录',4,1,'商品进货记录','image\tom_wap.gif','w_jhjlcx',1,1,0)

--create nonclustered index Index_jhdmxb_spbh on t_jhdmxb(spbh)
--with(drop_existing=on)

-------------2019年10月30日 10:54:51---------------------
-------价格信息增加电商价格信息------------
--ALTER TABLE t_jgxx
--ADD dslsj DECIMAL(10,4) NULL  ----电商零售价
--ALTER TABLE t_bjdmxb 
--ADD jdslsj DECIMAL(10,4) NULL, dslsj DECIMAL(10,4) null                           
 

-------------2019年10月28日 11:05:40-------------
---------增加会员信息查询导出-------
--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('26','会员信息',6,0,'会员信息','image\tom_wap.gif','w_member',1,1,0)


-------------2019年9月16日 15:20:10--------------
--------------结账数据-------------
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
--VALUES('08','零售结账记录',3,2,'零售结账记录','image\tom_wap.gif','w_jz',1,1,0)


--------------2019年5月6日 19:36:47 ------------------
-------退库单增加复核后再入库
--ALTER TABLE T_TKDZB
--ADD fhr NVARCHAR(8) NULL
--GO
--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('34','复核分店退库申请',1,0,'复核分店退库申请','image\tom_wap.gif','w_tkdrk',1,1,0)


---------------2019年5月3日 12:19:01---------------
-------退库单增加生产厂家和产地,解决饮片产地和生产厂家问题
--ALTER TABLE T_TKDMXB 
--ADD cd NVARCHAR(16) NULL,sccj NVARCHAR(32) null
--ALTER TABLE T_chxx
--ADD cd NVARCHAR(16) NULL
--ALTER TABLE T_THDMXB 
--ADD cd NVARCHAR(16) NULL,sccj NVARCHAR(32) null
--ALTER TABLE t_thdzb
--ADD gysbh NVARCHAR(10) NULL

-----------2019年5月1日 13:32:51---------------------
----------运输记录增加出库单列-----
--ALTER TABLE t_ysjl
--ADD ckdbh NVARCHAR(128) NULL
--ADD zxsl INT DEFAULT 0 NULL

-----------2019年4月19日 20:55:36-------------
-----------增加出库红冲功能-----
--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('33','出库红冲',1,0,'出库红冲','image\tom_wap.gif','w_ckdlr_hc',1,1,0)

--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('24','供应商信息维护',6,0,'供应商信息维护','image\tom_wap.gif','w_gysxxlr',1,1,0)

--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('25','供应商信息审核',6,0,'供应商信息审核','image\tom_wap.gif','w_gysxxsh',1,1,0)


---------------2019年4月18日 13:40:47---------------
--------出库单增加sccj，饮片与生产厂家对应关系是动态的----------------
--ALTER TABLE t_chxx 
--ADD sccj NVARCHAR(32) NULL

--ALTER TABLE t_ckdmxb 
--ADD sccj NVARCHAR(32) NULL



----------2019年4月14日 15:38:15
----------运输记录--------------
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
--VALUES('32','运输记录',1,0,'运输记录','image\tom_wap.gif','w_ysjllr',1,1,0)

--INSERT INTO t_options(pid, code, name, note, sort,flag)
--VALUES(3,19,'运输记录','运输记录',200,1)


------------2019年4月8日 11:33:46 -----------
-----------增加检验报告记录表-------------
--ALTER TABLE T_spxx_jybg
--ADD filePath NVARCHAR(128) NULL
--GO
--ALTER TABLE t_spxx_jybg
--alter column fileNM NVARCHAR(32) NULL
--GO
--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('29','养护计划',4,3,'养护计划','image\tom_wap.gif','w_yhjl_jh',1,1,0)

--SET IDENTITY_INSERT t_options ON
--INSERT INTO t_options(id,pid, code, name, note, sort, flag)
--VALUES(6,0,'wmslb',N'仓储类别',N'仓储类别',200,1)
--SET IDENTITY_INSERT t_options OFF

--INSERT INTO t_options(pid, code, name, note, sort, flag)
--VALUES(6,'NFY',N'内服药',N'内服药',200,1)
--INSERT INTO t_options(pid, code, name, note, sort, flag)
--VALUES(6,'HMHJ',N'麻黄碱复方制剂',N'麻黄碱复方制剂',200,1)
--INSERT INTO t_options(pid, code, name, note, sort, flag)
--VALUES(6,'WYY',N'外用药',N'外用药',200,1)
--INSERT INTO t_options(pid, code, name, note, sort, flag)
--VALUES(6,'QX',N'医疗器械',N'医疗器械',200,1)
--INSERT INTO t_options(pid, code, name, note, sort, flag)
--VALUES(6,'SLQX',N'三类医疗器械',N'三类医疗器械',200,1)
--INSERT INTO t_options(pid, code, name, note, sort, flag)
--VALUES(6,'RYXD',N'日用品、消毒用品',N'日用品、消毒用品',200,1)
--INSERT INTO t_options(pid, code, name, note, sort, flag)
--VALUES(6,'BJSP',N'保健食品',N'保健食品',200,1)
--INSERT INTO t_options(pid, code, name, note, sort, flag)
--VALUES(6,'SP',N'食品',N'食品',200,1)
--INSERT INTO t_options(pid, code, name, note, sort, flag)
--VALUES(6,'ZYYP',N'中药饮片',N'中药饮片',200,1)
--INSERT INTO t_options(pid, code, name, note, sort, flag)
--VALUES(6,'DXZYYP',N'毒性中药饮片',N'毒性中药饮片',200,1)


-------------2019年4月6日 19:16:57 ------------------
-------gsp报表增加 不合格药品记录 -----------
--INSERT INTO t_options(pid, code, name, note, sort,flag)
--VALUES(3,18,'不合格药品记录','不合格药品记录',190,1)

--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('31','待办统计',1,0,'待办统计','image\tom_wap.gif','w_timer',1,1,0)


------------2019年4月2日 13:56:55-----------------
----------进货单增加要货单长度，允许选择多个要货单
--ALTER TABLE T_JHDZB
--ALTER COLUMN yhdbh NVARCHAR(128) NULL


------------2019年2月28日 09:44:15-----------------
------要货标识、要货单供应商同步功能------
--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--            fdbz, parameter)
--VALUES('05','要货计划同步要货标志',5,1,'要货计划同步要货标志','image\tom_wap.gif','w_yhd_tbyhbz',1,1,1,0)

--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--            fdbz, parameter)
--VALUES('06','要货计划同步供应商',5,1,'要货计划同步供应商','image\tom_wap.gif','w_yhd_tbgys',1,1,1,0)


-------------2019年2月25日 10:34:52-----------------
------公司创建会员分店表，用于记录同步历史和积分情况
--CREATE TABLE t_member_fd
--(
--	dwbh NVARCHAR(8) NOT NULL,
--	code NVARCHAR(10) NOT NULL,
--	jine DECIMAL(10,2) NULL,
--	flag TINYINT NULL DEFAULT 1,
--	PRIMARY KEY (dwbh,code)
--)

----------2019年2月22日 17:52:58------------------
------增加检验报告核验功能--------
--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--            fdbz, parameter)
--VALUES(14,'进货要货对比',2,0,'检验报告核对','image\tom_wap.gif','w_jybghd',1,1,1,0)


-----------2019年2月21日 17:27:42----------------
------进货单增加检验报告存放路径--------------
--ALTER TABLE t_jhdmxb 
--ADD jybgpath NVARCHAR(128) NULL
--GO

-----------2019年2月20日 17:00:47------------
------单位信息增加 营业执照，药品经营许可证，发证日期和有效期
--ALTER TABLE t_dwxx 
--add yyzzfzrq DATETIME NULL,yyzzyxrq DATETIME NULL,ypjyxkzfzrq DATETIME NULL,ypjyxkzyxrq DATETIME NULL
--GO


-----------2019年2月19日 16:02:49-----------
------进货单增加要货单号、出库单号字段，用于根据要货单自动拆分出库单
--ALTER TABLE t_jhdzb 
--ADD fdyhd NVARCHAR(255) NULL,fdckd NVARCHAR(255) NULL,zdfh tinyint null default 0
--GO

-----------2019年2月12日 09:41:20---------------
------人员信息增加合同有效期、身份证有效期
--ALTER TABLE T_ZGXX
--ADD SFZYXQ DATETIME NULL,HTYXQ DATETIME NULL
--GO


----------2019年1月19日 17:11:26------------------
------增加进货单与要货单比对功能--------
--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--            fdbz, parameter)
--VALUES(30,'进货要货对比',1,0,'进货要货对比','image\tom_wap.gif','w_jh4yh',1,1,1,0)



----------2018年12月20日 15:38:02------------------
------增加商品信息修改功能--------
--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--            fdbz, parameter)
--VALUES(23,'商品信息修改',6,0,'商品信息修改','image\tom_wap.gif','w_spxx_bg',0,1,1,0)


----------   2018年11月25日 18:24:13 ---------------------------
------变价单增加变价单位记录表
--CREATE TABLE t_bjddw
--(
--	id INT IDENTITY(1,1) NOT NULL,
--	bjdbh NvarCHAR(10) NOT NULL,
--	dwbh NVARCHAR(10) NOT NULL,
--	flag TINYINT DEFAULT 0,
--	PRIMARY KEY(id)
--)


-----------2018年9月1日 10:29:36 ---------
-------要货计划增加一列 是否调拨
--ALTER TABLE T_YHJHMX
--ADD isdb TINYINT NULL		----是否调拨

-----------2018年7月26日 17:29:11------------
-------增加商品信息审批功能
--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--            fdbz, parameter)
--VALUES(22,'商品信息审核',6,0,'商品信息审核','image\tom_wap.gif','w_spxxwh_main_sh',1,1,1,0)

-------商品增加 生产企业许可证号
--ALTER TABLE t_spxx 
--ADD scqyxkzh NVARCHAR(32) NULL		----生产企业许可证号

--ALTER TABLE t_jhdmxb 
--ADD scqyxkzh NVARCHAR(32) NULL		----生产企业许可证号
 

------------2018年5月12日 11:45:32-----------
--------商品信息增加经验范围，用于控制某些商品不能出库到某个分店------------
--SET IDENTITY_INSERT t_options ON
--INSERT INTO t_options(id,pid, code, name, note, sort, flag)
--VALUES(5,0,'jyfw',N'经营范围',N'经营范围',200,1)
--SET IDENTITY_INSERT t_options OFF

------分店经营范围
--CREATE TABLE t_dwxx_jyfw
--(
--	id INT IDENTITY(1,1) NOT NULL,
--	dwbh VARCHAR(3) NOT NULL,
--	jyfwid INT NOT NULL,
--  flag TINYINT NULL,
--	PRIMARY KEY(id)
--)

--INSERT INTO t_options(pid, code, name, note, sort, flag)
--VALUES(5,'1',N'药品',N'药品',200,1)
--INSERT INTO t_options(pid, code, name, note, sort, flag)
--VALUES(5,'2',N'饮片',N'饮片',200,1)
--INSERT INTO t_options(pid, code, name, note, sort, flag)
--VALUES(5,'3',N'一类医疗器械',N'一类医疗器械',200,1)
--INSERT INTO t_options(pid, code, name, note, sort, flag)
--VALUES(5,'4',N'二类医疗器械',N'二类医疗器械',200,1)
--INSERT INTO t_options(pid, code, name, note, sort, flag)
--VALUES(5,'5',N'三类医疗器械',N'三类医疗器械',200,1)
--INSERT INTO t_options(pid, code, name, note, sort, flag)
--VALUES(5,'6',N'百货',N'百货',200,1)
--INSERT INTO t_options(pid, code, name, note, sort, flag)
--VALUES(5,'7',N'其他',N'其他',200,1)

------商品增加经营范围属性
--ALTER TABLE T_SPXX
--ADD jyfwid INT NULL


-----------2018年4月2日 10:34:51---------------
--------商品信息增加试销有效期，批准文号有效期
--ALTER TABLE t_spxx 
--ADD sxyxq DATETIME NULL,   ----试销有效期
--pzwhyxq DATETIME NULL  ----批准文号有效期

------------2018年1月24日 17:04:38--------------------
-------增加供应商供货统计导出功能
--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--            fdbz, parameter)
--VALUES(28,'供货品种统计',4,0,'供货品种统计','image\tom_wap.gif','w_jhpztj',1,1,1,0)



--------------2017年12月2日 16:16:04---------------
----商品类别增加超市类
--INSERT INTO t_options(pid, code, name, note, sort, flag)
--VALUES(2,'09','超市','超市类商品',200,1)

----初始化超市进货录入专用帐号
--INSERT INTO t_zgxx(BH, XM, XB, SYSID, XL, ZC, ZW, SFZH, BM, QX, MM, JG, LXDZ, YZBM,
--            CSRQ, DH1, DH2, JBGZ, RZSJ, LZSJ, MEMO, GXRQ, GXZ, FLAG, tjyxrq)
--SELECT '999', '超市进货', XB, SYSID, XL, ZC, ZW, SFZH, BM, QX, '999', JG, LXDZ, YZBM, CSRQ, DH1,
--       DH2, JBGZ, RZSJ, LZSJ, MEMO, GXRQ, GXZ, FLAG, tjyxrq
--FROM t_zgxx
--WHERE bh = '001'


----------------2017年4月30日 17:48:29--------------
----退款单增加生产日期
--ALTER TABLE t_tkdmxb 
--ADD scrq DATETIME NULL

----进货单转出库单增加生产日期、产地
--ALTER TABLE t_ckdmxb_temp
--ADD  scrq DATETIME NULL,cd NVARCHAR(16) NULL

----------------2017年3月30日 18:32:14-----------------------------------------
----进货单增加产地字段，记录饮片的产地
--ALTER TABLE t_jhdmxb 
--ADD cd NVARCHAR(16) NULL

----要货计划增加产地
--ALTER TABLE t_yhjhmx 
--ADD cd NVARCHAR(16) NULL


----供应商增加业务员、财务人员信息
--ALTER TABLE T_GYSXX
--ADD ywyxm NVARCHAR(16) NULL,	--业务员姓名
--	ywydh VARCHAR(16) NULL,		--业务员电话
--	ywysfzh VARCHAR(18) NULL,	--业务员身份证
--	ywyyxq	DATETIME NULL,		--业务员有效期
--	cwxm NVARCHAR(16) NULL,		--财务姓名
--	cwdh VARCHAR(16) NULL,		--财务电话
--	cwsfzh VARCHAR(18) NULL,	--财务身份证
--	cwyxq DATETIME null   		--财务有效期

----------------2017年3月7日 18:33:44-----------------------------------------
----增加付款记录查询
--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--            fdbz, parameter)
--VALUES('07','付款记录查询',3,1,'付款记录查询','image\tom_wap.gif','w_fkjl_cx',1,1,1,0)

----首营品种增加生产标准、生产地址
--ALTER TABLE T_SYPZSPB 
--ADD scbz NVARCHAR(64) NULL, --生产标准
--    scdz NVARCHAR(64) NULL  --生产地址

----首营企业增加业务员、财务人员信息
--ALTER TABLE T_SYQYSPB
--ADD ywyxm NVARCHAR(16) NULL,	--业务员姓名
--	ywydh VARCHAR(16) NULL,		--业务员电话
--	ywysfzh VARCHAR(18) NULL,	--业务员身份证
--	ywyyxq	DATETIME NULL,		--业务员有效期
--	cwxm NVARCHAR(16) NULL,		--财务姓名
--	cwdh VARCHAR(16) NULL,		--财务电话
--	cwsfzh VARCHAR(18) NULL,	--财务身份证
--	cwyxq DATETIME null   		--财务有效期

----出库单增加产地，饮片需要增加产地录入字段
--ALTER TABLE t_ckdmxb 
--ADD cd NVARCHAR(16) NULL		--饮片产地

----商品信息增加功能主治
--ALTER TABLE T_SPXX
--ADD gnzz NVARCHAR(64) NULL



---------------2016年11月19日 16:25:07----------------------
-----增加医保药品目录
--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--            fdbz, parameter)
--VALUES(21,'医保药品目录',6,0,'医保药品目录','image\tom_wap.gif','w_yb_spxx_main',1,1,1,0)


--------2016.10.15-----------------
-----修改库存增加药品生产日期,到货日期
--ALTER TABLE t_chxx 
--ADD scrq DATETIME NULL,dhrq DATETIME

-----修改出库单增加药品生产日期
--ALTER TABLE t_ckdmxb
--ADD scrq DATETIME NULL

------反药商品增加数量，用来记录超剂量限制
--ALTER TABLE T_FYSP
--ADD sl INT NULL,	--单剂限制数量		
--lx TINYINT NULL		--类型 1-反药记录 2-饮片单剂限制数量记录
--GO
--UPDATE T_FYSP
--SET lx = 1



--------2016.9.29-----------------
-----修改全部单据审批三步走
--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--            fdbz, parameter)
--VALUES(28,'保管员确认出库',1,0,'保管员确认出库','image\tom_wap.gif','w_ckdrk',1,1,1,0)

--ALTER TABLE t_thdzb
--ADD shr NVARCHAR(3) NULL
--GO

--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--            fdbz, parameter)
--VALUES(29,'保管员确认退货',1,0,'保管员确认退货','image\tom_wap.gif','w_thdrk',1,1,1,0)




--------2016.8.27----------------------------------
-----1、所有单据三步审批 2、所有单据增加生产日期 3、人员岗位

-------取消总店饮片装斗记录
--ALTER table t_options
--ADD flag TINYINT NULL DEFAULT 1
--GO
--UPDATE t_options SET flag = 1
--GO
--UPDATE t_options SET flag = 0 WHERE id = 115
--GO

--INSERT INTO t_options(pid,code, name, note, sort,flag)
--VALUES(3,16,N'销后退回记录','',0,1)
--GO


-------  2016.7.31 start   ---------------------
-------  增加销量排名 
--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--            fdbz, parameter)
--VALUES(27,'综合查询',4,0,'综合查询','image\tom_wap.gif','w_zh_report',1,1,0,0)

----询价单维护
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
--VALUES(23,'询价单录入',1,0,'询价单录入','image\tom_wap.gif','w_xjdlr',1,1,0,0)





----2016.7.3 start------------------------------------
----增加商品供应商限制，主要用于麻黄碱类药品控制，要货计划中需要验证受供应商限制的商品，进货单也要验证
--CREATE TABLE T_R_SP_GYS
--(
--	id INT IDENTITY(1,1) NOT NULL,
--	spbh NVARCHAR(16) NOT NULL,
--	gysbh NVARCHAR(16) NOT NULL,
--	PRIMARY KEY(id)
--)

--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--            fdbz, parameter)
--VALUES(20,'药品限定供应商维护',6,0,'药品限定供应商维护','image\tom_wap.gif','w_sp_gys',1,1,0,0)

-----选择供应商脚本
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
------增加进货明细表复核标志，1复核通过 0复核未通过 null 未复核
----ALTER TABLE t_jhdmxb 
----ADD fhflag TINYINT

-------增加进货单入库功能，单独列出
----INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
----            fdbz, parameter)
----VALUES('03','保管员确认入库',1,0,'保管员确认入库','image\tom_wap.gif','w_jhdrk',1,1,1,0)

--------2016.06.27----------------------
------总店进货单增加到货时间，默认当天
----ALTER TABLE t_jhdzb 
----ADD dhrq DATETIME NULL





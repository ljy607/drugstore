----------外部销售单增加打包袋、包装费、配送费三个字段属性 2022年9月26日 09:35:11 --------------------
--alter TABLE [dbo].[T_LSDZB_W]
--add dbd decimal(10,2) DEFAULT 0,
--    bzf decimal(10,2) DEFAULT 0,
--    psf decimal(10,2) DEFAULT 0;
--GO

--EXEC sp_addextendedproperty 'MS_Description', '打包袋', 'SCHEMA', dbo, 'table', T_LSDZB_W, 'column', dbd;
--EXEC sp_addextendedproperty 'MS_Description', '包装费', 'SCHEMA', dbo, 'table', T_LSDZB_W, 'column', bzf;
--EXEC sp_addextendedproperty 'MS_Description', '配送费', 'SCHEMA', dbo, 'table', T_LSDZB_W, 'column', psf;

---------------- 结账增加美团销售额 2022年9月21日 14:16:57  ------------
--ALTER TABLE t_jz
--ADD jemeituan DECIMAL(18,2) DEFAULT 0;
--GO

--EXEC sp_updateextendedproperty 'MS_Description', '结账记录', 'user', dbo, 'table', t_jz, null, null;
--EXEC sp_addextendedproperty 'MS_Description', '美团销售额', 'user', dbo, 'table', t_jz, 'column', jemeituan;

--------商品信息增加27位国家编码，用于医疗器械/耗材的医保结算 2022年9月13日 17:12:16 ------------------
--alter TABLE T_SPXX
--add gjgbbm VARCHAR(60);
--GO
--EXEC sp_addextendedproperty 'MS_Description', '国家贯标耗材编码;27位国家贯标耗材编码，用于医保结算', 'user', dbo, 'table', T_SPXX, 'column', gjgbbm;


----------增加外部订单录入功能 2022年6月2日 11:07:13 ------------------------

--IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[T_LSDZB_W]') AND type in (N'U'))
--DROP TABLE [dbo].[T_LSDZB_W];
--CREATE TABLE [dbo].[T_LSDZB_W](
--    LSDBH varchar(15) NOT NULL,
--    RQ DATETIME,
--    YSJE decimal(10,2) NOT NULL DEFAULT  (0),
--    SSJE decimal(10,2) NOT NULL DEFAULT  0,
--    DDLY varchar(10) NOT NULL,
--    WBDDBH varchar(60),
--    BZ varchar(50),
--    KPR varchar(10),
--    YXBZ tinyint,
--    PRIMARY KEY (LSDBH)
--)

--EXEC sp_addextendedproperty 'MS_Description', '外部销售订单主表', 'SCHEMA', dbo, 'table', T_LSDZB_W, null, null;
--EXEC sp_addextendedproperty 'MS_Description', '零售单号', 'SCHEMA', dbo, 'table', T_LSDZB_W, 'column', LSDBH;
--EXEC sp_addextendedproperty 'MS_Description', '销售日期', 'SCHEMA', dbo, 'table', T_LSDZB_W, 'column', RQ;
--EXEC sp_addextendedproperty 'MS_Description', '应收金额', 'SCHEMA', dbo, 'table', T_LSDZB_W, 'column', YSJE;
--EXEC sp_addextendedproperty 'MS_Description', '实收金额', 'SCHEMA', dbo, 'table', T_LSDZB_W, 'column', SSJE;
--EXEC sp_addextendedproperty 'MS_Description', '订单来源;美团、拼多多、京东等', 'SCHEMA', dbo, 'table', T_LSDZB_W, 'column', DDLY;
--EXEC sp_addextendedproperty 'MS_Description', '外部订单编号', 'SCHEMA', dbo, 'table', T_LSDZB_W, 'column', WBDDBH;
--EXEC sp_addextendedproperty 'MS_Description', '备注', 'SCHEMA', dbo, 'table', T_LSDZB_W, 'column', BZ;
--EXEC sp_addextendedproperty 'MS_Description', '录入人', 'SCHEMA', dbo, 'table', T_LSDZB_W, 'column', KPR;
--EXEC sp_addextendedproperty 'MS_Description', '状态', 'SCHEMA', dbo, 'table', T_LSDZB_W, 'column', YXBZ;

--IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[T_LSDMXB_W]') AND type in (N'U'))
--DROP TABLE [dbo].[T_LSDMXB_W];
--CREATE TABLE [dbo].[T_LSDMXB_W](
--    ID INT NOT NULL IDENTITY(1,1),
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

--EXEC sp_addextendedproperty 'MS_Description', '外部销售订单明细表', 'SCHEMA', dbo, 'table', T_LSDMXB_W, null, null;
--EXEC sp_addextendedproperty 'MS_Description', '键值', 'SCHEMA', dbo, 'table', T_LSDMXB_W, 'column', ID;
--EXEC sp_addextendedproperty 'MS_Description', '零售单号', 'SCHEMA', dbo, 'table', T_LSDMXB_W, 'column', LSDBH;
--EXEC sp_addextendedproperty 'MS_Description', '货号', 'SCHEMA', dbo, 'table', T_LSDMXB_W, 'column', SPBH;
--EXEC sp_addextendedproperty 'MS_Description', '批号', 'SCHEMA', dbo, 'table', T_LSDMXB_W, 'column', PCBH;
--EXEC sp_addextendedproperty 'MS_Description', '数量', 'SCHEMA', dbo, 'table', T_LSDMXB_W, 'column', SL;
--EXEC sp_addextendedproperty 'MS_Description', '单价', 'SCHEMA', dbo, 'table', T_LSDMXB_W, 'column', LSJ;
--EXEC sp_addextendedproperty 'MS_Description', '营业员编号', 'SCHEMA', dbo, 'table', T_LSDMXB_W, 'column', YYYBH;
--EXEC sp_addextendedproperty 'MS_Description', '货位', 'SCHEMA', dbo, 'table', T_LSDMXB_W, 'column', GUIT;
--EXEC sp_addextendedproperty 'MS_Description', '药师编号', 'SCHEMA', dbo, 'table', T_LSDMXB_W, 'column', YSBH;
--EXEC sp_addextendedproperty 'MS_Description', '进货价', 'SCHEMA', dbo, 'table', T_LSDMXB_W, 'column', JHJ;
--EXEC sp_addextendedproperty 'MS_Description', '核算价', 'SCHEMA', dbo, 'table', T_LSDMXB_W, 'column', JHJHS;
--EXEC sp_addextendedproperty 'MS_Description', '经营类别', 'SCHEMA', dbo, 'table', T_LSDMXB_W, 'column', JYLB;


------   商品信息增加是否退换货标识 2022年2月25日 14:57:19 ------------------
--ALTER TABLE t_spxx 
--ADD sfth TINYINT DEFAULT 0 ;
--execute sp_addextendedproperty 'MS_Description','是否支持退换货','user','dbo','table','t_spxx','column','sfth';


---------------增加内部销售 2021年7月5日 18:07:22 三店 25店 未更新-----------------
--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('17','内部销售',3,2,'内部销售','image\tom_wap.gif','w_kfls',0,1,0)

------修改价格状态区间 2021年2月19日 16:24:56
--UPDATE t_lslrl SET sx = -100,xx = 0.2 WHERE id = 1
--UPDATE t_lslrl SET sx =0.21 ,xx = 0.4 WHERE id = 2
--UPDATE t_lslrl SET sx =0.41 ,xx = 0.6 WHERE id = 3
--UPDATE t_lslrl SET sx =0.61 ,xx = 10 WHERE id = 4

--------库存表增加更新时间字段，记录最后更新时间 2020年12月29日 14:22:44
--ALTER TABLE t_chxx 
--ADD gxrq DATETIME DEFAULT GETDATE()
--execute sp_addextendedproperty 'MS_Description','更新时间','user','dbo','table','t_chxx','column','gxrq';

--UPDATE t_chxx SET gxrq = GETDATE()

--alter TRIGGER [dbo].[tri_del_chxx] ON [dbo].[T_CHXX] 
--FOR UPDATE
--AS
--UPDATE a SET a.gxrq = GETDATE()
--FROM t_chxx a
--JOIN INSERTED b ON a.spbh=b.spbh AND a.pcbh=b.pcbh AND a.hwbh=b.hwbh
--GO

--CREATE TABLE t_chxx_tbjl
--(
--	[id] [int] IDENTITY(1,1) NOT NULL,
--	tbsj DATETIME NOT NULL,		--同步时间
--	tbjls INT,					--同步记录数
--	PRIMARY KEY(id) 
--)
--EXECUTE sp_addextendedproperty 'MS_Description', '同步库存日志记录表', 'user', 'dbo', 'table', 't_chxx_tbjl', NULL;
--execute sp_addextendedproperty 'MS_Description','库存同步时间','user','dbo','table','t_chxx_tbjl','column','tbsj';
--execute sp_addextendedproperty 'MS_Description','库存记录数量','user','dbo','table','t_chxx_tbjl','column','tbjls';
------初始化一条同步记录
--insert into t_chxx_tbjl(tbsj) values('2020.12.28')


----------分店结账增加 预存款、预存款消费 2020年11月10日 17:53:33  -------
--ALTER TABLE t_jz 
--ADD yczhifubao MONEY NULL,ycweixin money,yczhifubaosj money null,ycweixinsj money null,ycxianjin money null,jeyucun money null
--execute sp_addextendedproperty 'MS_Description','预存支付宝','user','dbo','table','t_jz','column','yczhifubao';
--execute sp_addextendedproperty 'MS_Description','预存支付宝手机','user','dbo','table','t_jz','column','yczhifubaosj';
--execute sp_addextendedproperty 'MS_Description','预存微信','user','dbo','table','t_jz','column','ycweixin';
--execute sp_addextendedproperty 'MS_Description','预存微信手机','user','dbo','table','t_jz','column','ycweixinsj';
--execute sp_addextendedproperty 'MS_Description','预存金额消费','user','dbo','table','t_jz','column','jeyucun';
--execute sp_addextendedproperty 'MS_Description','预存现金','user','dbo','table','t_jz','column','ycxianjin';

--------分店结账增加 待付金额记录 2020年4月3日 11:33:17  --------
--ALTER TABLE t_jz 
--ADD jedaifu MONEY NULL,bz NVARCHAR(128) null,jexj money null

--SET IDENTITY_INSERT t_options ON
--INSERT INTO t_options(id,pid, code, name, note, sort, flag)
--VALUES(99,0,'dkh',N'大客户',N'大客户',200,1)
--SET IDENTITY_INSERT t_options OFF

--SELECT * FROM t_jz WHERE isnull(jexj,0) = 0

--UPDATE t_jz
--SET jexj =  isnull(je,0) + isnull(jewr,0) - isnull(jefxj,0)  -  isnull(jeyq,0)
--  -  isnull(jezp,0)  -  isnull(jeweixin,0)  -  isnull(jezhifubao,0)
--    -  isnull(jeyibao,0)  +  isnull(jeqita,0) - isnull(jeweixinsj,0) - isnull(jezhifubaosj,0)
--    -isnull(jedaifu,0)
--WHERE isnull(jexj,0) = 0    
    

--------分店修改 2020年2月12日 15:36:17 隐藏数据-------
--alter table t_ckdzb
--add flag tinyint null default 1

--alter table t_ckdmxb
--add flag tinyint null default 1

--alter table t_lsdmxb
--add flag tinyint null default 1

--alter table t_tkdzb
--add delflag tinyint null default 1

--alter table t_tkdmxb
--add delflag tinyint null default 1

--alter table t_bsdzb
--add delflag tinyint null default 1

--alter table t_bsdmxb
--add delflag tinyint null default 1

--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('140','数据隐藏',4,0,'数据隐藏','image\tom_wap.gif','w_djcx_edit',1,1,0)

-------------2019年10月30日 10:54:51---------------------
-------价格信息增加电商价格信息------------
--ALTER TABLE t_jgxx
--ADD dslsj DECIMAL(10,4) NULL  ----电商零售价
--ALTER TABLE t_bjdmxb 
--ADD jdslsj DECIMAL(10,4) NULL, dslsj DECIMAL(10,4) null                           


-----结账增加 微信手机、支付宝手机两项金额
--ALTER TABLE t_jz
--ADD jeweixinsj MONEY NULL, jezhifubaosj MONEY NULL


-------------2019年8月10日 16:31:02-----------
-------------修改会员表会员号字段长度---------
---- 删除索引 
--ALTER TABLE t_member DROP CONSTRAINT pk_t_member_key;
---- 修改字段长度
--Alter table t_member alter column code  varchar(32) not null;
---- 添加主键
--Alter table t_member add constraint pk_t_member_key primary key (code);

---- 修改字段长度
--Alter table t_member_jfdh alter column code  varchar(32) not null;
--Alter table t_lsdzb alter column member_code  varchar(32) null;
--Alter table t_lsdzb_ls alter column member_code  varchar(32) null;


-------------2019年7月24日 11:31:30--------------
--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('13','修改零售数据',4,0,'修改零售数据','image\tom_wap.gif','w_temp_lsd',1,1,0)

--------------2019年7月7日 12:34:44-----------
------ 17.100未执行
--ALTER TABLE t_member
--ADD wxcode NVARCHAR(32) NULL

--------------2019年5月19日 19:46:50-----------
--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('12','单据修改',4,0,'单据修改','image\tom_wap.gif','w_djxg',1,1,0)

---------------2019年5月3日 12:19:01---------------
-------退库单增加生产厂家和产地,解决饮片产地和生产厂家问题
--ALTER TABLE T_TKDMXB 
--ADD cd NVARCHAR(16) NULL,sccj NVARCHAR(32) null
--ALTER TABLE T_chxx
--ADD cd NVARCHAR(16) null


---------------2019年4月18日 17:20:14-----------
---------出库单增加生产厂家，解决饮片的厂家不固定问题
--ALTER TABLE t_ckdmxb 
--ADD sccj NVARCHAR(32) NULL

--ALTER TABLE t_chxx 
--ADD sccj NVARCHAR(32) NULL

--------------2019年4月16日 13:28:34------------
---------修改系统选项，增加状态字段
--ALTER TABLE t_options
--ADD flag TINYINT null DEFAULT 1

--UPDATE t_options
--SET	flag = 1

--UPDATE t_options
--SET	flag = 0
--WHERE pid = 3 AND code = '13'


------------2019年4月14日 12:47:05-----------
---------增加陈列检查计划功能--------
--INSERT INTO t_options(pid, code, name, note, sort)
--VALUES(3,14,'不合格药品记录','不合格药品记录',0)

--CREATE TABLE [dbo].[t_bhgmxb](
--	[id] [int] IDENTITY(1,1) NOT NULL,
--	[bhgbh] [nvarchar](16) NOT NULL,
--	[spbh] [nvarchar](16) NOT NULL,
--	[pcbh] [nvarchar](16) NOT NULL,
--	[yxrq] [datetime] NOT NULL,
--	[sl] [decimal](16, 2) NOT NULL,
--	[dqcl] [decimal](16, 2) NOT NULL,
--	[jg] [decimal](16, 4) NOT NULL,
--	[hwbh] [nvarchar](8) NOT NULL,
--	[bz] [nvarchar](64) NULL,
--	[clbf] [nvarchar](16) NULL,
--PRIMARY KEY(ID)
--)
--CREATE TABLE [dbo].[t_bhgzb](
--	[bhgbh] [nvarchar](16) NOT NULL,
--	[dwbh] [char](3) NOT NULL,
--	[rq] [datetime] NOT NULL,
--	[zbr] [char](3) NOT NULL,
--	[shr] [char](3) NULL,
--	[zxr] [char](3) NULL,
--	[bz] [nvarchar](32) NULL,
--	[yxbz] [tinyint] NOT NULL,
--	PRIMARY KEY([bhgbh] )
--)
--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('29','不合格药品记录',1,0,'不合格药品记录','image\tom_wap.gif','w_bhglr',1,1,0)


--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('28','陈列药品检查计划',1,0,'陈列药品检查计划','image\tom_wap.gif','w_yhjl_jh',1,1,0)


-------------2019年4月3日 15:44:23---------------
--------增加陈列药品检查记录功能---------
--INSERT INTO t_options(pid, code, name, note, sort)
--VALUES(3,13,'陈列药品检查记录','陈列药品检查记录',0)

----陈列药品检查主表
--CREATE TABLE T_JCDZB
--(
--	[JCDBH] [varchar](15) NOT NULL,
--	[RQ] [datetime] NOT NULL,
--	[BZ] [nvarchar](64) NULL,
--	[ZBR] [varchar](12) NULL,
--	[FLAG] [tinyint] NULL default 0,
--	PRIMARY KEY(JCDBH)
--)
--EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'陈列药品检查主表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_JCDZB'
------陈列药品检查明细表
--CREATE TABLE T_JCDMXB(
--	[ID] [int] IDENTITY(1,1) NOT NULL,
--	[JCDBH] [varchar](16) NOT NULL,
--	[HWBH] [varchar](8) NOT NULL,
--	[SPBH] [nvarchar](32) NULL,
--	[PCBH] [varchar](32) NULL,
--	[YXRQ] [datetime] NULL,
--	[SL] [int] NOT NULL,
--	[JCSL] [int] NOT NULL,
--	[JL] [nvarchar](128) NULL,
--	[BZ] [nvarchar](128) NULL,
--	[CCTJ] [nvarchar](32) NULL,
--	[BHGSL] [int] NULL,
--	[lx] TINYINT NULL,
--	PRIMARY KEY(ID)
--)
--EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'陈列药品检查明细表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_JCDMXB'

------增加待办事项菜单-------
--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('27','待办统计',1,0,'待办统计','image\tom_wap.gif','w_timer',0,1,0)
--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('28','陈列药品检查',4,0,'陈列药品检查','image\tom_wap.gif','w_jcdlr',1,1,0)


--------2019年3月19日 09:57:10----------
------修改连接信息 地址信息长度  addr
--ALTER TABLE T_HOSTS
--ALTER COLUMN addr NVARCHAR(64) NULL
--GO

------------2019年3月1日 09:48:06---------------
------增加特价商品维护功能
--CREATE TABLE t_spxx_tj
--(
--	spbh NVARCHAR(10) NOT NULL,
--	PRIMARY KEY(spbh)
--)

-------------2019年2月25日 10:34:52-----------------
------公司创建会员分店表，用于记录同步历史和积分情况
--ALTER TABLE t_member
--ADD tbflag TINYINT NULL DEFAULT 0 ;

--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES('02','同步会员信息',5,0,'同步会员信息','image\tom_wap.gif','w_member_tbsj',1,1,0)


------------2019年2月22日 14:25:26-----------
--------商品信息增加经验范围，用于控制某些商品不能出库到某个分店------------
--SET IDENTITY_INSERT t_options ON
--INSERT INTO t_options(id,pid, code, name, note, sort)
--VALUES(7,0,'jyfw',N'经营范围',N'经营范围',200)
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

--INSERT INTO t_options(pid, code, name, note, sort)
--VALUES(7,'1',N'药品',N'药品',200)
--INSERT INTO t_options(pid, code, name, note, sort)
--VALUES(7,'2',N'饮片',N'饮片',200)
--INSERT INTO t_options(pid, code, name, note, sort)
--VALUES(7,'3',N'一类医疗器械',N'一类医疗器械',200)
--INSERT INTO t_options(pid, code, name, note, sort)
--VALUES(7,'4',N'二类医疗器械',N'二类医疗器械',200)
--INSERT INTO t_options(pid, code, name, note, sort)
--VALUES(7,'5',N'三类医疗器械',N'三类医疗器械',200)
--INSERT INTO t_options(pid, code, name, note, sort)
--VALUES(7,'6',N'百货',N'百货',200)
--INSERT INTO t_options(pid, code, name, note, sort)
--VALUES(7,'7',N'其他',N'其他',200)

------商品增加经营范围属性
--ALTER TABLE T_SPXX
--ADD jyfwid INT NULL
--GO

--UPDATE s SET s.jyfwid = 2
--FROM t_spxx s
--WHERE s.SPBH LIKE '7%'

-----------2018年9月25日 14:27:31----------------------
----增加按营业员区间统计零售毛利-----
--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES(21,'零售数据分析',2,2,'零售数据分析','image\tom_wap.gif','w_tjfx_ls',1,1,0)


----------2018年8月31日 18:00:45 --------------
-------商品增加 生产企业许可证号
--ALTER TABLE t_spxx 
--ADD scqyxkzh NVARCHAR(32) NULL		----生产企业许可证号

--ALTER TABLE t_jz
--ADD jeyibao	DECIMAL(18,2) NULL			----医保支付金额


-----------2018年4月2日 10:34:51---------------
--------商品信息增加试销有效期，批准文号有效期
--ALTER TABLE t_spxx 
--ADD sxyxq DATETIME NULL,   ----试销有效期
--pzwhyxq DATETIME NULL  ----批准文号有效期


------------2017年5月19日 18:18:11---------------
----修改要货计划表的yhsl的精度
--ALTER TABLE t_yhjhmx
--ALTER COLUMN yhsl DECIMAL(10,2) NOT NULL

------------2017年4月30日 17:29:36--------------------
----退库单增加生产日期
--ALTER TABLE t_tkdmxb 
--ADD scrq DATETIME NULL

-----结账增加 微信、支付宝、其他三项金额
--ALTER TABLE t_jz
--ADD jeweixin MONEY NULL, jezhifubao MONEY NULL, jeqita MONEY NULL

--CREATE FUNCTION [dbo].[fn_cfmxConcat](@district nvarchar(255)) 
--RETURNS varchar(8000) 
--AS 
--BEGIN -----处方明细药品列转行
--    DECLARE @str varchar(8000) 
--    SET @str = '' 
  
--    SELECT @str = @str + ' ' + left(e3.pm + '   ',5) + RIGHT('    ' + cast(e1.sl AS VARCHAR(4)),4) + ' g'
--	FROM t_ys_cfmx e1
--	JOIN t_spxx e3 ON e3.spbh=e1.spbh
--	WHERE e1.cfid = @district
    
--    RETURN STUFF( @str, 1, 1, '') 
--END 
--GO 

------------2017年3月31日 18:36:31-----------------
----要货计划增加产地
--ALTER TABLE t_yhjhmx 
--ADD cd NVARCHAR(16) NULL

---------2017年3月8日 15:52:45-----------
----分店出库单增加产地字段，记录饮片的产地
--ALTER TABLE t_ckdmxb 
--ADD cd NVARCHAR(16) NULL

----商品信息增加功能主治
--ALTER TABLE T_SPXX
--ADD gnzz NVARCHAR(64) NULL	--功能主治

---------2017年1月8日 17:53:25-----------
------分店增加经理查询功能-------------------
--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES(11,'经理查询',4,2,'经理查询','image\tom_wap.gif','w_jlcx',1,1,0)


---------2016年10月15日-------------------
----出库单增加生产日期、复核标志
--ALTER TABLE T_CKDMXB
--ADD scrq DATETIME NULL,fhflag TINYINT NULL

----库存信息增加生产日期、到货时间
--ALTER TABLE T_CHXX
--ADD scrq DATETIME NULL, dhrq DATETIME NULL

--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES(26,'验收员确认收货',1,2,'验收员确认收货','image\tom_wap.gif','w_ckdrk',1,1,0)

------反药商品增加数量，用来记录超剂量限制
--ALTER TABLE T_FYSP
--ADD sl INT NULL,	--单剂限制数量		
--lx TINYINT NULL		--类型 1-反药记录 2-饮片单剂限制数量记录
--GO
--UPDATE T_FYSP
--SET lx = 1


------------------------------------------------------------------
--2016年8月24日 08:46:39----------------------------------
---零售明细表记录经营类别，便于调整经营类别不影响历史提奖数据-----
--

--ALTER TABLE t_lsdmxb 
--ADD jylb NVARCHAR(2) NULL ----对应t_spxx表的lbbh
--GO

--UPDATE m SET jylb = s.LBBH
--FROM t_lsdmxb m
--JOIN t_spxx s ON m.spbh = s.SPBH
--JOIN t_lsdzb z ON z.LSDBH = m.LSDBH
--WHERE z.rq > '2016-8-23' AND m.jylb IS NULL



                          
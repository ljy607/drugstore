/* 上传数据表  2023年12月11日 14:20:42 */
--1、门店资料，需要把总部也做为一个门店资料上传过来 --总部的IsMast=Y，其它的门店ismast=N
CREATE TABLE [dbo].[ifClientDoc](
	orgId varchar(20) NULL,					-- 组织机构编码	Y	系统后台默认
	ownerId varchar(20) NULL,				-- 货主编码	Y	系统后台默认
	[ClientId] [varchar](50) NOT NULL,		-- 客户ID	N	
	[ClientCode] [varchar](100) not NULL,	-- 和开系统编码	N	系统后台默认
	[BusinessName] [nvarchar](500) NULL,	-- 客户名称
	[LevelName] [nvarchar](50) NULL,		-- 等级
	[Address] [nvarchar](512) NULL,			-- 地址
	[Contact] [nvarchar](30) NULL,			-- 联系人
	[Logogram] [varchar](500) NULL,			
	[PayType] [nvarchar](64) NULL,
	[deliverAddr] [varchar](200) NULL,		-- 送货地址
	[Remark] [nvarchar](256) NULL,
	[entSeqNo] [varchar](100) NULL,
	[CountyCode] [varchar](20) NULL,
	[cityCode] [varchar](10) NULL,
	[CantonCode] [varchar](20) NULL,
	[tenderType] [varchar](20) NULL,
	[Telephone] [varchar](64) NULL,			-- 联系人电话
	[Beactive] [char](1) NULL,				-- 是否删除	N	N:未删除，Y:删除
	[piaoyPic] [varchar](200) NULL,
	[yingyzzPic] [varchar](200) NULL,
	[DocLevId] [int] NULL,
	[CreaterId] [varchar](11) NULL,
	[CreaterInfo] [varchar](56) NULL,
	[CreateTime] [varchar](19) NULL,
	[LastModifyTime] [varchar](19) NULL,
	[DelTime] [varchar](19) NULL,
	[ExpAutOrg] [varchar](256) NULL,
	[ResAutOrg] [varchar](256) NULL,
	[EntId] [varchar](11) NULL,
	[IsWithPic] [char](1) NULL DEFAULT 'N',
	[isMast] [char](1) NULL DEFAULT 'N',			--是否总部	Y	N:门店，Y:总部，不传默认为N
	Isdone	char(1) DEFAULT 'N',						--已完成	N	Y:已同步到ksoa
	PRIMARY KEY (ClientCode)
) 
GO

-- 2、供应商资料：
CREATE TABLE [dbo].[ifSupplyDoc](
	[SuppliersId] [varchar](50) not NULL,		-- 供应商系统编号	N	唯一标识
	[gysbh] [varchar](40) NOt NULL,			-- 供应商编号	N
	[BusinessName] [nvarchar](100) NULL,	-- 供应商名称
	[Address] [nvarchar](512) NULL,			-- 地址
	[Logogram] [varchar](128) NULL,
	[Remark] [nvarchar](256) NULL,
	[entSeqNo] [varchar](100) NULL,
	[CantonCode] [varchar](40) NULL,
	[cityCode] [varchar](10) NULL,
	[CountyCode] [varchar](20) NULL,
	[supplierMain] [varchar](20) NULL,
	[yzymPic] [varchar](200) NULL,
	[yingyzzPic] [varchar](200) NULL,
	[DocLevId] [int] NULL,
	[CreaterId] [varchar](11) NULL,
	[CreaterInfo] [varchar](56) NULL,
	[CreateTime] [varchar](19) NULL,
	[Beactive] [varchar](1) NULL,
	[LastModifyTime] [varchar](19) NULL,
	[DelTime] [varchar](19) NULL,
	[ExpAutOrg] [varchar](256) NULL,
	[ResAutOrg] [varchar](256) NULL,
	[EntId] [varchar](11) NULL,
	[contact] [varchar](40) NULL,			-- 联系人
	[Telephone] [varchar](200) NULL,		-- 联系电话
	[deliverAddr] [varchar](200) NULL,
	Isdone	char(1) DEFAULT 'N',						--已完成	N	Y:已同步到ksoa
	PRIMARY KEY ([SuppliersId])
)
GO
-- 3、商品信息
CREATE TABLE [dbo].[ifGoodsDoc](
	[GoodsId] [varchar](50) NOT NULL,		-- 商品ID	Y	唯一标识
	[GoodsCode] [varchar](30) NULL,			-- 商品编码	Y	用于打印单据
	[GoodsName] [nvarchar](120) NULL,		-- 商品名称【打在票上的名称】
	[GeneralName] [nvarchar](120) NULL,		-- 通用名称	N	不传输，后台默认为商品名称
	[unit] [nvarchar](20) NULL,				-- 记录单位
	[GoodsSpec] [nvarchar](800) NULL,		-- 规格
	[Manufacturer] [nvarchar](256) NULL,	-- 厂家名称
	[OutTaxRate] [decimal](12, 2) NULL,
	[InTaxRate] [decimal](12, 2) NULL,
	[GMPNo] [nvarchar](80) NULL,
	[GCategory] [nvarchar](80) NULL,		-- 品种类型	Y	化学药制剂/中成药/中药饮片/抗生素制剂//生化药品/等
	[Logogram] [varchar](128) NULL,			-- 助记码
	[IsPres] [char](1) NULL,				-- 处方药标识(Y/N)	N
	[ApprovalNo] [nvarchar](240) NULL,		-- 批准文号
	[ApprovalTo] [varchar](10) NULL,		-- 批准文号有效期	2023-01-01
	[StorageTerm] [nvarchar](256) NULL,		-- 存储条件
	[WmsMeas] [int] NULL,					-- 计量规格(件包装数量)
	[MidMeas] [int] NULL,					-- 中包量
	[Buyer] [nvarchar](64) NULL,			-- 采购员
	[Beactive] [char](1) NULL,				-- 是否删除
	[Remark] [nvarchar](256) NULL,			-- 备注
	[Formula] [nvarchar](30) NULL,			-- 剂型
	[Place] [nvarchar](100) NULL,			-- 产地	N	饮片必填
	[BarCode] [varchar](30) NULL,			-- 商品条码
	[QualStand] [nvarchar](256) NULL,		-- 质量标准
	[InEffectDay] [int] NULL,				-- 有效期天数
	[goodsPackPic] [varchar](200) NULL,	
	[watermarkSealPic] [varchar](200) NULL,
	[spzzPic] [varchar](200) NULL,
	[DocLevId] [int] NULL,
	[CreaterId] [varchar](11) NULL,
	[CreaterInfo] [varchar](56) NULL,
	[CreateTime] [varchar](19) NULL,
	[LastModifyTime] [varchar](19) NULL,
	[DelTime] [varchar](19) NULL,
	[ExpAutOrg] [varchar](256) NULL,
	[ResAutOrg] [varchar](256) NULL,
	[EntId] [varchar](11) NULL,
	[IsWithPic] [char](1) NULL DEFAULT 'N',				-- 是否附药检报告	N	N:不附，Y:附，不传默认为N
	[Is_zdyh] [char](1) NULL DEFAULT 'N',				-- 是否重点养护	Y	N：不是，Y：重点，不传默认为N
	[MarketBy] [varchar](200) NULL,			-- 上市许可持有人
	[RetailP] [decimal](12, 4) NULL DEFAULT 0,		-- 零售价
	[IsElec] [char](1) NULL DEFAULT 'N',				-- 是否电子监管	Y	Y电子监管扫码 N不扫码不传默认为N
	[IsRefrig] [char](1) NULL DEFAULT 'N',				-- 是否冷藏	Y	Y冷藏         N不冷藏不传默认为N
	Isdone	char(1) DEFAULT 'N',						-- 已完成	N	Y:已同步到ksoa
	PRIMARY KEY (GoodsId)
) 
GO

-- 4、入库业务：包括采购订单（总店要货计划）和配送退回订单（分店退库）taskType：110采购 214销退 orderFlag：101采购入库 102销售退货入库
CREATE TABLE [dbo].[ifPurin](
	[BillCode] [varchar](50) NOT NULL,			-- 订单号
	[BillSn] [varchar](20) NOT NULL,			-- 订单行号
	[GoodsId] [varchar](50) NULL,					-- 商品编号
	[BatchCode] [nvarchar](20) NULL,			-- 批号  退回单必填
	[ValDate] [varchar](10) NULL,					-- 效期 退回单必填
	[ProduceDate] [varchar](10) NULL,				-- 生产日期 退回单必填
	[SterilCode] [nvarchar](20) NULL,			
	[Taxprice] [decimal](14, 4) NULL,			-- 采购价	N	最多保留4位小数
	[Num] [decimal](14, 2) NULL,				-- 数量	Y	最多保留4位小数
	[piece] [decimal](14, 2) NULL,				-- 件数	N	最多保留2位小数
	[TaxAmount] [decimal](14, 2) NULL,			-- 含税金额	N	最多保留2位小数
	[confirmMan] [varchar](20) NULL,				-- 审核人
	[confirmDate] [varchar](20) NULL,				-- 审核时间
	[caozyName] [nvarchar](64) NULL,			-- 制单人	N	=username后台赋值
	[Dates] [varchar](10) NULL,					-- 制单日期	N	=当前时间
	[OnTime] [varchar](8) NULL,					-- 制单时间
	[GCategory] [nvarchar](80) NULL,			-- 品种类型	N	化学药制剂/中成药/中药饮片/抗生素制剂//生化药品/等
	[Remark] [nvarchar](256) NULL,				-- 主单备注
	[orderFlag] [varchar](10) NULL,				-- 订单类型	Y	101采购入库	102销售退货入库
	[WHId] [varchar](11) NULL,
	[CreateTime] [varchar](19) NULL,
	[remark1] [nvarchar](256) NULL,				-- 明细备注	N	行明细备注
	[Carrier] [nvarchar](256) NULL,				-- 承运单位
	[TransMode] [nvarchar](256) NULL,
	[songhts] [int] NULL,
	[ShipFrom] [varchar](19) NULL,
	[sendaddress] [varchar](200) NULL,
	[billFlag] [int] NULL,
	Isdone	char(1) DEFAULT 'N',						-- 已完成	N	Y:已同步到ksoa			--
	[BusinessId] [varchar](50) NULL,	-- 供应商名门店单位ID
	[taskType] [varchar](20) NULL,		-- 数据类型	Y	110采购 214销退；114采退 210销售 
	[BusinessCode] [varchar](50) NULL,	-- 单位编码	
	[rebillcode] [varchar](50) NULL,
	[rebillsn] [varchar](20) NULL,
	[clientcode] [varchar](50) NULL, -- 门店ID	Y	当tasktype=110（采购）：必填 如果直接配送门店就写门店ID，如果入到总部仓储（小库）就写总部的ID
	[ismdth] [varchar](1) NULL DEFAULT 'N', -- 是否门店退货
	[khx_spid] [varchar](11) NULL,
	[curcode] [varchar](60) NULL,	-- 流通监管码
	[Place] [nvarchar](100) NULL DEFAULT '',	
	PRIMARY KEY(BillCode,BillSn)
)
GO

-- 5、出库单上传 包括配送出库（分店要货）和采购退出（退货到供应商） 两种订单 -- taskType 114采退 210销售
CREATE TABLE [dbo].[ifSaleOut](
	[BillCode] [varchar](50) NOT NULL,	-- 订单号 
	[BillSn] [varchar](20) NOT NULL,	-- 订单行号
	[Dates] [varchar](10) NULL,			-- 开票日期
	[OnTime] [varchar](8) NULL,			-- 开票时间
	[GoodsId] [varchar](50) NULL,			-- 商品编号
	[BatchCode] [nvarchar](20) NULL,	-- 批号
	[ValDate] [varchar](10) NULL,			-- 效期
	[ProduceDate] [varchar](10) NULL,		-- 生产日期
	[Num] [decimal](14, 2) NULL,		-- 数量
	[Taxprice] [decimal](14, 4) NULL,	-- 销售单价
	[TaxAmount] [decimal](14, 2) NULL,	-- 销售金额
	[SaleTaxP] [decimal](14, 4) NULL,	-- 批发单价
	[RetailP] [decimal](12, 4) NULL,	-- 零售单价
	[DedRate] [decimal](14, 2) NULL,	-- 销售扣率
	[WHId] [varchar](11) NULL,
	[PayType] [nvarchar](64) NULL,
	[caozyName] [nvarchar](64) NULL,	-- 开票人
	[doMan] [varchar](20) NULL,			-- 经办人
	[chkMan] [varchar](20) NULL,			-- 复核人
	[Tax] [decimal](14, 2) NULL,		-- 税额
	[Rate] [decimal](14, 2) NULL,		-- 税率
	[Amount] [decimal](14, 2) NULL,		-- 不含税金额
	[InvoiceType] [nvarchar](20) NULL,	
	[ClientType] [char](1) NULL,
	[Remark] [nvarchar](256) NULL,		-- 主单备注
	[Priority] [int] NULL,
	[sendTime] [varchar](50) NULL,
	[ElecCode] [varchar](60) NULL,
	[PurTaxP] [decimal](14, 4) NULL,
	[RouteName] [nvarchar](256) NULL,
	[yaojianFlag] [varchar](20) NULL,
	[SterilCode] [nvarchar](20) NULL,
	[zengpFlag] [varchar](1) NULL,
	[goodsFlag] [varchar](1) NULL,
	[transType] [varchar](5) NULL,
	[RfBillCode] [varchar](20) NULL,
	[RfBillSn] [int] NULL,
	[IsDone] [char](1) DEFAULT 'N' NULL,	-- 已完成	N	Y:已同步到ksoa
	[CreateTime] [varchar](19) NULL,
	[BusinessId] [varchar](50) NULL,
	[taskType] [varchar](20) NULL,
	[BusinessCode] [varchar](50) NULL,
	[Address] [nvarchar](512) NULL,
	[rebillcode] [varchar](50) NULL,
	[rebillsn] [varchar](20) NULL,
	[carrier] [varchar](50) NULL,
	[remark1] [varchar](200) NULL, -- 备注	N	明细备注
	[IsMdTh] [char](1) NULL DEFAULT 'N', -- 是否门店退货,总部采购退货为N，门店采购退货为Y，默认为N，耀得堂特殊处理，其他连锁传N
	[curcode] [varchar](60) NULL,
	PRIMARY KEY(BillCode,BillSn)    	                    						
) 
GO

/* 回传数据表 2023年12月11日 14:21:15*/
-- 1、验收记录反馈
CREATE TABLE [dbo].[ifCheckAcctptFb](
	[OrgId] [char](11) NOT NULL,
	[OwnerId] [char](11) NOT NULL,
	[BillCode] [varchar](20) NOT NULL,
	[BillSn] [int] NOT NULL,
	[taskType] [varchar](20) NULL,  --'118' 购进验收记录；'218' 配送退回验收记录
	[WHId] [char](11) NULL,
	[orderNum] [decimal](14, 2) NULL,
	[BatchCode] [nvarchar](20) NULL,
	[GoodsId] [varchar](20) NULL,
	[SterilCode] [nvarchar](20) NULL,
	[ValDate] [varchar](10) NULL,
	[ProduceDate] [char](10) NULL,
	[Num] [decimal](14, 2) NULL,
	[businessid] [varchar](20) NULL,
	[operateDate] [varchar](20) NULL,
	[operateMan] [varchar](64) NULL,
	[completeDate] [varchar](20) NULL,
	[CreateTime] [varchar](19) NULL,
	[PlatName] [nvarchar](128) NULL,
	[Remark] [nvarchar](256) NULL,
	[isdone] [char](1) NULL,
	[id] [varchar](50) NULL,
	[goodsname] [varchar](128) NULL,
	[unit] [varchar](10) NULL,
	[place] [varchar](128) NULL,
	[manufacturer] [varchar](128) NULL,
	[goodsspec] [varchar](128) NULL,
	[taxprice] [decimal](14, 4) NULL,
	[gzid] [varchar](128) NULL,
	[wldeptid] [varchar](11) NULL,
	[srcbillcode] [varchar](128) NULL,	-- 药店系统单号
	[srcbillsn] [int] NULL,				-- 药店系统行号
	[Formula] [varchar](30) NULL,
	[GCategory] [varchar](80) NULL,
	[GSPResults] [int] NULL,
	[Appearance] [varchar](80) NULL,
	[PackDesc] [varchar](80) NULL,
	[AcceptDate] [datetime] NULL,
	[CheckNum] [decimal](14, 2) NULL,
	[Standard] [varchar](256) NULL,
	[Situation] [varchar](256) NULL,
	[Opinion] [varchar](256) NULL,
	[GroupOp] [varchar](256) NULL,
	[DeptOp] [varchar](256) NULL,
	[Factory] [varchar](256) NULL,
	[ImportRegNo] [varchar](40) NULL,
	[InstRegNo] [varchar](50) NULL,
	[GeneralName] [varchar](120) NULL,
	[goodscode] [varchar](32) NULL,
	[shpdQty] [decimal](14, 4) NULL,
	[rcvdQty] [decimal](14, 4) NULL,
	[ArrivalDate] [varchar](20) NULL,
	[oprtQty] [decimal](14, 4) NULL,
	[oprtSuccQty] [decimal](14, 4) NULL,
	[oprtResult] [varchar](256) NULL,
	[oprtPerson] [varchar](20) NULL,
	[pkgQty] [decimal](14, 4) NULL,
	[pcsQty] [decimal](14, 4) NULL,
	[businessname] [nvarchar](100) NULL DEFAULT '',
	[MarketBy] [varchar](256) NULL DEFAULT '',
	[ApprovalNo] [varchar](256) NULL DEFAULT '',
	PRIMARY KEY (BillCode,BillSn)
) ON [PRIMARY]
GO

-- 2、收货记录
CREATE TABLE [dbo].[ifReceivingFb](
	[OrgId] [varchar](11) NOT NULL,
	[OwnerId] [varchar](11) NOT NULL,
	[BillCode] [varchar](20) NOT NULL,
	[BillSn] [int] NOT NULL,
	[taskType] [varchar](20) NULL,	-- 116  采购收货记录；216  配送退回收货记录
	[WHId] [varchar](11) NULL,
	[orderNum] [decimal](14, 2) NULL,
	[BatchCode] [nvarchar](20) NULL,
	[GoodsId] [varchar](20) NULL,
	[SterilCode] [nvarchar](20) NULL,
	[ValDate] [varchar](10) NULL,
	[ProduceDate] [char](10) NULL,
	[Num] [decimal](14, 2) NULL,
	[businessid] [varchar](20) NULL,
	[operateDate] [varchar](20) NULL,
	[operateMan] [varchar](64) NULL,
	[completeDate] [varchar](20) NULL,
	[CreateTime] [varchar](19) NULL,
	[PlatName] [nvarchar](128) NULL,
	[Remark] [nvarchar](256) NULL,
	[isdone] [char](1) NULL DEFAULT 'N',
	[id] [varchar](50) NULL,
	[goodsname] [varchar](128) NULL,
	[unit] [varchar](10) NULL,
	[refusednum] [decimal](14, 2) NULL,
	[shipfrom] [datetime] NULL,
	[temprMode] [varchar](50) NULL,
	[shipTo] [datetime] NULL,
	[TemprCon] [varchar](128) NULL,
	[FromTemp] [decimal](14, 2) NULL,
	[ToTemp] [decimal](14, 2) NULL,
	[place] [varchar](128) NULL,
	[manufacturer] [varchar](128) NULL,
	[goodsspec] [varchar](128) NULL,
	[taxprice] [decimal](14, 4) NULL,
	[gzid] [varchar](128) NULL,
	[wldeptid] [varchar](11) NULL,
	[srcbillcode] [varchar](128) NULL,		-- 药店系统单号
	[srcbillsn] [int] NULL,				-- 药店系统行号
	[Formula] [varchar](30) NULL,
	[GCategory] [varchar](80) NULL,
	[Dates] [varchar](10) NULL,
	[Businesscode] [varchar](20) NULL,
	[Businessname] [varchar](200) NULL,
	[PurMan] [varchar](200) NULL,
	[TaxAmount] [decimal](14, 4) NULL,
	[MarketBy] [varchar](256) NULL,
	[ApprovalNo] [varchar](100) NULL,
	[ReceMan] [varchar](10) NULL,
	[sendaddress] [varchar](200) NULL,
	[transMode] [varchar](20) NULL,
	[Telephone] [varchar](20) NULL,
	[Address] [varchar](200) NULL,
	[Contact] [varchar](10) NULL,
	[RejectRsn] [varchar](200) NULL,
	[SReason] [varchar](200) NULL,
	[Reamrk] [varchar](256) NULL,
	PRIMARY KEY (BillCode,BillSn)
) 
GO
-- 3、复核记录
CREATE TABLE [dbo].[ifCheckFb](
	[OrgId] [varchar](11) NOT NULL,
	[OwnerId] [varchar](11) NOT NULL,
	[BillCode] [varchar](20) NOT NULL,
	[BillSn] [int] NOT NULL,
	[taskType] [varchar](20) NULL, -- '217' 配送出库复核记录；'117' 购退出库复核记录 
	[WHId] [varchar](11) NULL,
	[orderNum] [decimal](14, 2) NULL,
	[BatchCode] [nvarchar](20) NULL,
	[GoodsId] [varchar](20) NULL,
	[SterilCode] [nvarchar](20) NULL,
	[ValDate] [varchar](10) NULL,
	[ProduceDate] [varchar](10) NULL,
	[Num] [decimal](14, 2) NULL,
	[businessid] [varchar](20) NULL,
	[operateDate] [varchar](20) NULL,
	[operateMan] [varchar](64) NULL,
	[completeDate] [varchar](20) NULL,
	[CreateTime] [varchar](19) NULL,
	[PlatName] [nvarchar](128) NULL,
	[Remark] [nvarchar](256) NULL,
	[isdone] [varchar](1) NULL,
	[id] [varchar](50) NULL,
	[goodsname] [varchar](128) NULL,
	[unit] [varchar](10) NULL,
	[place] [varchar](128) NULL,
	[manufacturer] [varchar](128) NULL,
	[goodsspec] [varchar](128) NULL,
	[taxprice] [decimal](14, 4) NULL,
	[gzid] [varchar](128) NULL,
	[wldeptid] [varchar](11) NULL,
	[srcbillcode] [varchar](128) NULL,	-- 药店系统单号
	[srcbillsn] [int] NULL,				-- 药店系统行号
	[Formula] [varchar](30) NULL,
	[GCategory] [varchar](80) NULL,
	[GSPResults] [int] NULL,
	[Appearance] [varchar](80) NULL,
	[PackDesc] [varchar](80) NULL,
	[AcceptDate] [datetime] NULL,
	[CheckNum] [decimal](14, 2) NULL,
	[Standard] [varchar](256) NULL,
	[Situation] [varchar](256) NULL,
	[Opinion] [varchar](256) NULL,
	[GroupOp] [varchar](256) NULL,
	[DeptOp] [varchar](256) NULL,
	[Factory] [varchar](256) NULL,
	[ImportRegNo] [varchar](40) NULL,
	[InstRegNo] [varchar](50) NULL,
	[GeneralName] [varchar](120) NULL,
	[goodscode] [varchar](32) NULL,
	[shpdQty] [decimal](14, 4) NULL,
	[rcvdQty] [decimal](14, 4) NULL,
	[ArrivalDate] [varchar](20) NULL,
	[oprtQty] [decimal](14, 4) NULL,
	[oprtSuccQty] [decimal](14, 4) NULL,
	[oprtResult] [varchar](256) NULL,
	[oprtPerson] [varchar](20) NULL,
	[pkgQty] [decimal](14, 4) NULL,
	[pcsQty] [decimal](14, 4) NULL,
	[businessname] [nvarchar](100) NULL DEFAULT '',
	PRIMARY KEY (BillCode,BillSn)
)
GO
-- 4、养护记录
CREATE TABLE [dbo].[ifinventoryCheckFb](
	[orgId] [varchar](20) NOT NULL,
	[ownerId] [varchar](20) NOT NULL,
	[goodsId] [varchar](20) NOT NULL,
	[batchCode] [varchar](50) NULL,
	[produceDate] [varchar](10) NULL,
	[valDate] [varchar](10) NULL,
	[num] [decimal](14, 2) NULL,
	[createTime] [varchar](19) NULL,
	[caozyname] [varchar](20) NULL,
	[ConsDate] [varchar](10) NULL,
	[confirmMan] [varchar](20) NULL,
	[confirmDate] [varchar](19) NULL,
	[ConsDesc] [varchar](400) NULL,
	[CompAdv] [varchar](256) NULL,
	[whid] [varchar](11) NULL,
	[locatName] [varchar](20) NULL,
	[ConsMeans] [varchar](30) NULL,
	[SterilCode] [varchar](255) NULL,
	[Situation] [varchar](50) NULL,
	[goodsname] [nvarchar](100) NULL,
	[goodsspec] [varchar](128) NULL,
	[formula] [varchar](128) NULL,
	[manufacturer] [varchar](128) NULL,
	[marketby] [varchar](128) NULL,
	[OrderType] [varchar](128) NULL,
	[BillCode] [varchar](64) not NULL,
	[BillSn] [int] not NULL,
	[id] [int] NULL,
	[gzid] [varchar](128) NULL,
	[isdone] [char](1) NULL DEFAULT 'N',
	PRIMARY KEY (BillCode,BillSn)
) 
GO
-- 5、运输记录 
CREATE TABLE [dbo].[ifTransStatusFb](
	[OrgId] [varchar](11) NOT NULL,
	[OwnerId] [varchar](11) NOT NULL,
	[BillCode] [varchar](20) NOT NULL,
	[BillSn] [int] NOT NULL,
	[rfbillcode] [varchar](20) NULL,	-- 药店系统单号
	[rfbillsn] [varchar](20) NULL,		-- 药店系统行号
	[goodsId] [varchar](20) NULL,
	[batchCode] [varchar](50) NULL,
	[valDate] [varchar](19) NULL,
	[num] [decimal](14, 2) NULL,
	[caozyname] [varchar](20) NULL,
	[createTime] [char](19) NULL,
	[updState] [varchar](20) NULL,
	[updDate] [varchar](19) NULL,
	[updMode] [varchar](10) NULL,
	[produceDate] [varchar](10) NULL,
	[whid] [varchar](20) NULL,
	[FromTemp] [varchar](20) NULL,
	[ToTemp] [varchar](20) NULL,
	[ShipFrom] [varchar](19) NULL,
	[TransMode] [varchar](20) NULL,
	[ShipTo] [varchar](19) NULL,
	[AcceptName] [varchar](20) NULL,
	[SecAccName] [varchar](20) NULL,
	[chkResult] [varchar](200) NULL,
	[address] [varchar](128) NULL,
	[partyCsgnName] [varchar](128) NULL,
	[partyCsgnAddr] [varchar](128) NULL,
	[zjnum] [int] NULL DEFAULT 0,
	[lsnum] [int] NULL DEFAULT 0,
	[attnname] [varchar](128) NULL,
	[carrier] [varchar](128) NULL,
	[carno] [varchar](128) NULL,
	[DriverName] [varchar](128) NULL,
	[rdline] [varchar](128) NULL,
	[delivername] [varchar](128) NULL,
	[delivreit] [varchar](128) NULL,
	[delivrelt] [varchar](128) NULL,
	[id] [int] NULL,
	[gzid] [varchar](128) NULL,
	[isdone] [char](1) NULL DEFAULT 'N',
	PRIMARY KEY (BillCode,BillSn)
)
GO

-- 6、盘点单  ALNum 正数盘损，负数盘溢
CREATE TABLE [dbo].[ifStockChkFb](
	[orgid] [varchar](11) NULL,
	[OwnerId] [varchar](11) NULL,
	[BillCode] [varchar](20) not NULL,
	[billno] [int] NOT NULL,	--
	[billsn] [int] NOT NULL,
	[Dates] [varchar](10) NULL,
	[goodsid] [varchar](20) NULL,
	[BatchCode] [nvarchar](20) NULL,
	[ProduceDate] [varchar](10) NULL,
	[ValDate] [varchar](10) NULL,
	[ALNum] [decimal](14, 2) NULL,   -- 数量，正数盘益，负数盘损
	[remark] [nvarchar](256) NULL,
	[id] [int] NOT NULL,
	[gzid] [varchar](128) NULL,
	[WHId] [varchar](11) NULL,
	[SterilCode] [nvarchar](20) NULL DEFAULT '',
	PRIMARY KEY (BillCode,BillSn)
)
GO

-- 7、入库单反馈  采购入库 和采购退出
CREATE TABLE [dbo].[ifPurinfb](
	[OrgId] [varchar](11) NOT NULL DEFAULT '',
	[OwnerId] [varchar](11) NOT NULL DEFAULT '',
	[BillCode] [varchar](20) NOT NULL DEFAULT '',
	[BillSn] [int] NOT NULL DEFAULT 0,
	[taskType] [varchar](20) NULL DEFAULT '',
	[WHId] [varchar](11) NULL DEFAULT '',
	[orderNum] [decimal](14, 2) NULL DEFAULT 0,
	[BatchCode] [nvarchar](20) NULL DEFAULT '',
	[GoodsId] [varchar](20) NULL DEFAULT '',
	[SterilCode] [nvarchar](20) NULL DEFAULT '',
	[ValDate] [varchar](10) NULL DEFAULT '',
	[ProduceDate] [varchar](10) NULL DEFAULT '',
	[Num] [decimal](14, 2) NULL DEFAULT 0,
	[businessid] [varchar](20) NULL DEFAULT '',
	[operateDate] [varchar](20) NULL DEFAULT '',
	[operateMan] [varchar](64) NULL DEFAULT '',
	[completeDate] [varchar](20) NULL DEFAULT '',
	[CreateTime] [varchar](19) NULL DEFAULT '',
	[PlatName] [nvarchar](128) NULL DEFAULT '',
	[Remark] [nvarchar](256) NULL DEFAULT '',
	[isdone] [char](1) NULL DEFAULT 'N',
	[id] [varchar](50) NULL,
	[srcbillcode] [varchar](64) NULL,  -- 药店系统单号
	[srcbillsn] [int] NULL,				-- 药店系统行号
	[manufacturer] [varchar](256) NULL,
	[goodsname] [varchar](256) NULL,
	[goodsspec] [varchar](256) NULL,
	[marketby] [varchar](256) NULL,
	[place] [varchar](256) NULL,
	[approvalno] [varchar](256) NULL,
	[instregno] [varchar](50) NULL,
	[formula] [varchar](30) NULL,
	[generalname] [varchar](120) NULL,
	[gcategory] [varchar](80) NULL,
	[gzid] [varchar](128) NULL,
	[sfgoodsid] [varchar](20) NOT NULL DEFAULT '',
	[sfbusinessid] [varchar](20) NULL DEFAULT '',
	[fdbh] [varchar](20) NULL,
	[Taxprice] [decimal](14, 4) NULL,
	[Taxamount] [decimal](14, 2) NULL,
	[curcode] [varchar](60) NULL,
	PRIMARY KEY(BillCode,BillSn)
)
GO
-- 8、配送出库和配送退回
CREATE TABLE [dbo].[ifSaleOutFb](
	[OrgId] [varchar](11) NOT NULL,
	[OwnerId] [varchar](11) NOT NULL,
	[BillCode] [varchar](20) NOT NULL,
	[BillSn] [int] NOT NULL,
	[taskType] [varchar](20) NULL,
	[WHId] [varchar](11) NULL,
	[orderNum] [decimal](14, 2) NULL,
	[BatchCode] [nvarchar](20) NULL,
	[GoodsId] [varchar](20) NULL,
	[SterilCode] [nvarchar](20) NULL,
	[ValDate] [varchar](10) NULL,
	[ProduceDate] [varchar](10) NULL,
	[Num] [decimal](14, 2) NULL,
	[businessid] [varchar](20) NULL,
	[operateDate] [varchar](20) NULL,
	[operateMan] [varchar](64) NULL,
	[completeDate] [varchar](20) NULL,
	[CreateTime] [varchar](19) NULL,
	[PlatName] [nvarchar](128) NULL,
	[Remark] [nvarchar](256) NULL,
	[isdone] [char](1) NULL DEFAULT 'N',
	[id] [varchar](50) NULL,
	[srcbillcode] [varchar](64) NULL,
	[srcbillsn] [int] NULL,
	[manufacturer] [varchar](256) NULL,
	[goodsname] [varchar](256) NULL,
	[goodsspec] [varchar](256) NULL,
	[marketby] [varchar](256) NULL,
	[place] [varchar](256) NULL,
	[approvalno] [varchar](256) NULL,
	[instregno] [varchar](50) NULL,
	[formula] [varchar](30) NULL,
	[generalname] [varchar](120) NULL,
	[gcategory] [varchar](80) NULL,
	[gzid] [varchar](128) NULL,
	[sfgoodsid] [varchar](20) NULL,
	[sfbusinessid] [varchar](20) NULL,
	[taxprice] [decimal](12, 4) NULL,
	[taxamount] [decimal](12, 2) NULL,
	[curcode] [varchar](60) NULL,
	PRIMARY KEY(BillCode,BillSn)
)
GO

ALTER TABLE t_jhdzb 
add [srcbillcode] VARCHAR(60);	-- 外部单号 
                              
ALTER TABLE t_jhdzb
ALTER COLUMN ysr VARCHAR(16);  

ALTER TABLE t_ckdzb 
add [srcbillcode] VARCHAR(60);	-- 外部单号                         

-- 总店要货计划 增加是否上传凯宏鑫标志                             	
ALTER TABLE t_yhjhzb 
ADD isdone CHAR(1) DEFAULT 'N' NULL;        

-- 分店要货计划 增加是否上传凯宏鑫标志                             	
ALTER TABLE t_fdyhzb 
ADD isdone CHAR(1) DEFAULT 'N' NULL;  

IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TR_JHDMXB_IN]'))
DROP TRIGGER [dbo].[TR_JHDMXB_IN]
GO

INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
VALUES('08','凯宏鑫数据上传',5,2,'凯宏鑫数据上传','image\tom_wap.gif','w_khx_djsc',1,1,0);
                     
INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
VALUES('09','凯宏鑫数据获取',5,2,'凯宏鑫数据获取','image\tom_wap.gif','w_khx_djlq',1,1,0);
 
INSERT INTO t_hwxx(hwbh,LSHW, HWMC, HWTP, SXKW, CKSX,FLAG)
VALUES('KHX00','***','凯宏鑫货位',1,0,0,1) 

/* 授权脚本 */
USE [master]
GO

CREATE LOGIN [khx] WITH PASSWORD = N'Khx2023#' MUST_CHANGE,DEFAULT_DATABASE=[zddb_khx],CHECK_EXPIRATION=OFF,CHECK_POLICY=OFF
GO

USE zddb_khx
GO
CREATE USER khx FOR LOGIN khx
GO

GRANT SELECT,UPDATE,INSERT,DELETE ON ifCheckAcctptFb TO khx;
GRANT SELECT,UPDATE,INSERT,DELETE ON ifReceivingFb TO khx;
GRANT SELECT,UPDATE,INSERT,DELETE ON ifCheckFb TO khx;
GRANT SELECT,UPDATE,INSERT,DELETE ON ifinventoryCheckFb TO khx;
GRANT SELECT,UPDATE,INSERT,DELETE ON ifTransStatusFb TO khx;
GRANT SELECT,UPDATE,INSERT,DELETE ON ifStockChkFb TO khx;
GRANT SELECT,UPDATE,INSERT,DELETE ON ifPurinfb TO khx;
GRANT SELECT,UPDATE,INSERT,DELETE ON ifSaleOutFb TO khx;

GRANT SELECT,UPDATE ON ifClientDoc TO khx;
GRANT SELECT,UPDATE ON ifSupplyDoc TO khx;
GRANT SELECT,UPDATE ON ifGoodsDoc TO khx;
GRANT SELECT,UPDATE ON ifPurin TO khx;
GRANT SELECT,UPDATE ON ifSaleOut TO khx;

GO

/*初始化基础数据*/
-- 初始化门店信息
INSERT INTO ifClientDoc(ClientId,ClientCode,BusinessName,[Address],Contact,Telephone,isMast)
SELECT dwbh,dwbh,dwmc,dwdz,'',dh,CASE when dwbh='000' then 'Y' ELSE 'N' END  
FROM t_dwxx 
WHERE flag = 1

-- 初始化供应商信息
INSERT INTO ifSupplyDoc(SuppliersId,gysbh,BusinessName,[Address],contact,Telephone)
SELECT gysbh,gysbh,gysmc,lxdz,lxr,dh2
FROM T_GYSXX tg
WHERE flag = 1

-- 初始化商品信息
INSERT INTO ifgoodsDoc(GoodsId, GoodsCode, GoodsName,Logogram, unit, GoodsSpec,
            Manufacturer, GCategory, BarCode,IsPres,ApprovalNo,InEffectDay,Place,StorageTerm,Is_zdyh,Formula,MarketBy)
SELECT spbh,SPBH,PM,JC,JLDW,GG,CJMC,ypflmc,spbm,GMP,PZWH,YXQX,CD, cctj,YHBZ,jxmc,MarketBy
FROM v_spxx 
WHERE flag = 1
ORDER BY spbh

-- 入库单（要货计划）
INSERT INTO ifpurin(BillCode, BillSn, GoodsId, Num, GCategory, Place,
            taskType, orderFlag,clientcode,BusinessId,BusinessCode,OnTime, Dates,
            caozyName)
SELECT m.yhdbh,m.ORDR,m.SPBH, m.YHSL,s.ypflmc,m.cd,'110','101',isnull(z.yhdw,'000'),m.GYSBH,m.GYSBH
,CONVERT(CHAR(8),getdate(),114),CONVERT(CHAR(10),z.yhrq,120),g.xm
FROM t_yhjhzb z
join T_YHJHMX m ON m.YHDBH = z.YHDBH 
JOIN v_spxx s ON s.SPBH = m.SPBH
LEFT JOIN t_zgxx g ON z.zbr = g.BH
WHERE m.YHDBH = 'YH22000009'
-- 退库
INSERT INTO ifpurin(BillCode, BillSn, GoodsId, Num, GCategory, Place,
            taskType, orderFlag,clientcode,BusinessId,BusinessCode,OnTime, Dates,
            caozyName)
SELECT m.tkdbh,m.ORDR,m.SPBH, m.ShuL,s.ypflmc,m.cd,'214','102','000','000','000'
,CONVERT(CHAR(8),getdate(),114),CONVERT(CHAR(10),z.tkrq,120),g.xm
FROM t_tkdzb z
join t_tkdmxb m ON m.tkDBH = z.tkDBH 
JOIN v_spxx s ON s.SPBH = m.SPBH
LEFT JOIN t_zgxx g ON z.sqr = g.BH
WHERE m.tkDBH = 'TK10621000359'

-- 退货
INSERT INTO ifpurin(BillCode, BillSn, GoodsId, Num, GCategory, Place,
            taskType, orderFlag,clientcode,BusinessId,BusinessCode,OnTime, Dates,
            caozyName)
SELECT m.thdbh,m.ORDR,m.SPBH, m.tHSL,s.ypflmc,m.cd,'214','102','000',m.GYSBH,m.GYSBH
,CONVERT(CHAR(8),getdate(),114),CONVERT(CHAR(10),z.thrq,120),g.xm
FROM t_thdzb z
join t_thdmxb m ON m.tHDBH = z.tHDBH 
JOIN v_spxx s ON s.SPBH = m.SPBH
LEFT JOIN t_zgxx g ON z.kpr = g.BH
WHERE m.tHDBH = 'TH21000483'

/* 存储过程 中间库数据处理 */

/******************* 过程说明 ******************
  生成入库单
  参数  @billcode   凯宏鑫验收单号 
        @jhdbh    进货单号
       
  结果  
************************************************/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_khx_rk]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_khx_rk]
GO
CREATE PROCEDURE sp_khx_rk @billcode varchar(32), @jhdbh CHAR(10) AS
begin

--DECLARE @billcode varchar(32)	-- 凯宏鑫单号
--SET @billcode = 'PRK23121872798'

--DECLARE @jhdbh	CHAR(10)	-- 进货单编号
--SET @jhdbh = 'JH23000001'       

INSERT INTO t_jhdzb(JHDBH, JHRQ, GYSBH, PJKL, LRR, ysr, yhdbh, dhrq, JSBZ,srcbillcode)
SELECT distinct @jhdbh jhdbh,ip.operateDate jhrq,ip.businessid,1,ip.operateMan lrr,ip.PlatName ysr
,SUBSTRING(srcbillcode,1,10),ip.completeDate dhrq,10 jsbz,ip.BillCode
FROM ifPurinfb ip
WHERE ip.BillCode = @billcode;

INSERT INTO t_jhdmxb(JHDBH, ORDR, SPBH, YXQ, SCRQ, PCBH, SL,SCCJ,PZWH,cd,HGSL,jhj,LSJ,qjhj,HWBH)
SELECT @jhdbh jhdbh,ip.BillSn,ip.GoodsId,ip.ValDate, ip.ProduceDate, ip.BatchCode,
       ip.Num,ip.manufacturer,ip.approvalno,ip.place cd,num hgsl,ip.Taxprice,ISNULL(jg.lsj,0),ISNULL(jg.ZDJJ,0),hw.jhhw
FROM ifPurinfb ip
LEFT JOIN t_jgxx jg ON ip.GoodsId=jg.SPBH
LEFT JOIN t_sphw hw ON ip.GoodsId=hw.spbh
WHERE ip.BillCode = @billcode;

-- 更新中间表的ERP完成状态
UPDATE ifpurinfb SET isdone = 'Y' WHERE BillCode = @billcode;

-- 更新价格信息 
UPDATE j SET j.zdjj = m.jhj,j.zhgys=z.GYSBH,j.zhjhrq=z.jhrq
FROM t_jhdmxb m 
JOIN t_jhdzb z ON z.JHDBH = m.JHDBH
JOIN t_Jgxx j ON j.SPBH = m.SPBH
WHERE m.JHDBH = @jhdbh AND m.WLHBS = 0

INSERT INTO T_JGXX (SPBH, ZDJJ,zhgys,zhjhrq)
SELECT distinct m.spbh,m.jhj,z.GYSBH,z.JHRQ
FROM t_jhdmxb m 
JOIN t_jhdzb z ON z.JHDBH = m.JHDBH
left JOIN t_Jgxx j ON j.SPBH = m.SPBH
WHERE m.JHDBH = @jhdbh AND m.WLHBS = 0 AND j.spbh IS NULL


END

/******************* 过程说明 ******************
  生成出库单
  参数  @billcode   凯宏鑫验收单号 
        @ckdbh    出库单号
       
  结果  
************************************************/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_khx_ck]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_khx_ck]
GO
CREATE PROCEDURE sp_khx_ck @billcode varchar(32), @ckdbh CHAR(10) AS
begin

INSERT INTO t_ckdzb(ckDBH, ckRQ, jsdw,ZBR, CKR, SHR, YXBZ, BZ, wmsflag,flag,srcbillcode)
SELECT distinct @ckdbh,ip.operateDate,ip.businessid,ip.operateMan,ip.operateMan,ip.PlatName
,10,ip.Remark,1,1,ip.BillCode
FROM ifSaleOutFb ip
WHERE ip.BillCode = @billcode;

INSERT INTO t_ckdmxb(CKDBH, ORDR, SPBH, PCBH, YXRQ, scrq, JHJ, LSJ, SHUL, FLAG, cd, sccj) 
SELECT @ckdbh,ip.BillSn,ip.GoodsId, ip.BatchCode,ip.ValDate, ip.ProduceDate,0,0,
       ip.Num,1,ip.place,ip.manufacturer
FROM ifSaleOutFb ip
WHERE ip.BillCode = @billcode;

-- 更新价格信息
UPDATE e SET e.jhj = b.jhj,e.lsj = b.lsj 
FROM t_ckdmxb e
JOIN (
SELECT a.spbh,a.pcbh,MAX(m.jhj) jhj,MAX(j.lsj) lsj
FROM t_ckdmxb a
JOIN t_jhdmxb m ON a.spbh=m.SPBH AND a.pcbh=m.PCBH
LEFT JOIN t_jgxx j ON j.SPBH = m.SPBH
WHERE a.ckdbh = @ckdbh
GROUP BY a.spbh,a.pcbh
) b ON b.pcbh = e.pcbh AND b.spbh = e.spbh;


-- 更新中间表的ERP完成状态
UPDATE ifSaleOutFb SET isdone = 'Y' WHERE BillCode = @billcode;


END

/******************* 过程说明 ******************
  凯宏鑫库存同步
  参数         
  结果  
************************************************/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_khx_tbkc]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_khx_tbkc]
GO
CREATE PROCEDURE sp_khx_tbkc AS
begin

-- 删除凯宏鑫库存
DELETE t_chxx WHERE hwbh = 'KHX00' ;

-- 同步凯宏鑫库存
INSERT INTO t_chxx(HWBH, SPBH, PCBH, CHSL, yxrq, jiag, FLAG,  scrq,sccj)
select 'KHX00',goodsid,batchcode,placenum,valdate,0,1,producedate,manufacturer
from khx.khx_wtps.dbo.v_hjyf_xkphkc ;

-- 更新进货价格
UPDATE a SET a.jiag = b.jhj,a.dhrq=b.jhrq
FROM t_Chxx a
JOIN (
SELECT tc.spbh,tc.pcbh,max(jm.JHJ) jhj,MAX(jhrq) jhrq
FROM T_CHXX tc
JOIN t_jhdmxb jm ON jm.SPBH = tc.SPBH AND jm.PCBH = tc.PCBH
JOIN t_Jhdzb jz ON jz.JHDBH = jm.JHDBH
WHERE tc.hwbh = 'KHX00'  
GROUP BY tc.spbh,tc.PCBH ) b ON b.SPBH = a.SPBH AND b.PCBH = a.PCBH;

END





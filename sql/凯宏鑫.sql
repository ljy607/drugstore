/* �ϴ����ݱ�  2023��12��11�� 14:20:42 */
--1���ŵ����ϣ���Ҫ���ܲ�Ҳ��Ϊһ���ŵ������ϴ����� --�ܲ���IsMast=Y���������ŵ�ismast=N
CREATE TABLE [dbo].[ifClientDoc](
	orgId varchar(20) NULL,					-- ��֯��������	Y	ϵͳ��̨Ĭ��
	ownerId varchar(20) NULL,				-- ��������	Y	ϵͳ��̨Ĭ��
	[ClientId] [varchar](50) NOT NULL,		-- �ͻ�ID	N	
	[ClientCode] [varchar](100) not NULL,	-- �Ϳ�ϵͳ����	N	ϵͳ��̨Ĭ��
	[BusinessName] [nvarchar](500) NULL,	-- �ͻ�����
	[LevelName] [nvarchar](50) NULL,		-- �ȼ�
	[Address] [nvarchar](512) NULL,			-- ��ַ
	[Contact] [nvarchar](30) NULL,			-- ��ϵ��
	[Logogram] [varchar](500) NULL,			
	[PayType] [nvarchar](64) NULL,
	[deliverAddr] [varchar](200) NULL,		-- �ͻ���ַ
	[Remark] [nvarchar](256) NULL,
	[entSeqNo] [varchar](100) NULL,
	[CountyCode] [varchar](20) NULL,
	[cityCode] [varchar](10) NULL,
	[CantonCode] [varchar](20) NULL,
	[tenderType] [varchar](20) NULL,
	[Telephone] [varchar](64) NULL,			-- ��ϵ�˵绰
	[Beactive] [char](1) NULL,				-- �Ƿ�ɾ��	N	N:δɾ����Y:ɾ��
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
	[isMast] [char](1) NULL DEFAULT 'N',			--�Ƿ��ܲ�	Y	N:�ŵ꣬Y:�ܲ�������Ĭ��ΪN
	Isdone	char(1) DEFAULT 'N',						--�����	N	Y:��ͬ����ksoa
	PRIMARY KEY (ClientCode)
) 
GO

-- 2����Ӧ�����ϣ�
CREATE TABLE [dbo].[ifSupplyDoc](
	[SuppliersId] [varchar](50) not NULL,		-- ��Ӧ��ϵͳ���	N	Ψһ��ʶ
	[gysbh] [varchar](40) NOt NULL,			-- ��Ӧ�̱��	N
	[BusinessName] [nvarchar](100) NULL,	-- ��Ӧ������
	[Address] [nvarchar](512) NULL,			-- ��ַ
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
	[contact] [varchar](40) NULL,			-- ��ϵ��
	[Telephone] [varchar](200) NULL,		-- ��ϵ�绰
	[deliverAddr] [varchar](200) NULL,
	Isdone	char(1) DEFAULT 'N',						--�����	N	Y:��ͬ����ksoa
	PRIMARY KEY ([SuppliersId])
)
GO
-- 3����Ʒ��Ϣ
CREATE TABLE [dbo].[ifGoodsDoc](
	[GoodsId] [varchar](50) NOT NULL,		-- ��ƷID	Y	Ψһ��ʶ
	[GoodsCode] [varchar](30) NULL,			-- ��Ʒ����	Y	���ڴ�ӡ����
	[GoodsName] [nvarchar](120) NULL,		-- ��Ʒ���ơ�����Ʊ�ϵ����ơ�
	[GeneralName] [nvarchar](120) NULL,		-- ͨ������	N	�����䣬��̨Ĭ��Ϊ��Ʒ����
	[unit] [nvarchar](20) NULL,				-- ��¼��λ
	[GoodsSpec] [nvarchar](800) NULL,		-- ���
	[Manufacturer] [nvarchar](256) NULL,	-- ��������
	[OutTaxRate] [decimal](12, 2) NULL,
	[InTaxRate] [decimal](12, 2) NULL,
	[GMPNo] [nvarchar](80) NULL,
	[GCategory] [nvarchar](80) NULL,		-- Ʒ������	Y	��ѧҩ�Ƽ�/�г�ҩ/��ҩ��Ƭ/�������Ƽ�//����ҩƷ/��
	[Logogram] [varchar](128) NULL,			-- ������
	[IsPres] [char](1) NULL,				-- ����ҩ��ʶ(Y/N)	N
	[ApprovalNo] [nvarchar](240) NULL,		-- ��׼�ĺ�
	[ApprovalTo] [varchar](10) NULL,		-- ��׼�ĺ���Ч��	2023-01-01
	[StorageTerm] [nvarchar](256) NULL,		-- �洢����
	[WmsMeas] [int] NULL,					-- �������(����װ����)
	[MidMeas] [int] NULL,					-- �а���
	[Buyer] [nvarchar](64) NULL,			-- �ɹ�Ա
	[Beactive] [char](1) NULL,				-- �Ƿ�ɾ��
	[Remark] [nvarchar](256) NULL,			-- ��ע
	[Formula] [nvarchar](30) NULL,			-- ����
	[Place] [nvarchar](100) NULL,			-- ����	N	��Ƭ����
	[BarCode] [varchar](30) NULL,			-- ��Ʒ����
	[QualStand] [nvarchar](256) NULL,		-- ������׼
	[InEffectDay] [int] NULL,				-- ��Ч������
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
	[IsWithPic] [char](1) NULL DEFAULT 'N',				-- �Ƿ�ҩ�챨��	N	N:������Y:��������Ĭ��ΪN
	[Is_zdyh] [char](1) NULL DEFAULT 'N',				-- �Ƿ��ص�����	Y	N�����ǣ�Y���ص㣬����Ĭ��ΪN
	[MarketBy] [varchar](200) NULL,			-- ������ɳ�����
	[RetailP] [decimal](12, 4) NULL DEFAULT 0,		-- ���ۼ�
	[IsElec] [char](1) NULL DEFAULT 'N',				-- �Ƿ���Ӽ��	Y	Y���Ӽ��ɨ�� N��ɨ�벻��Ĭ��ΪN
	[IsRefrig] [char](1) NULL DEFAULT 'N',				-- �Ƿ����	Y	Y���         N����ز���Ĭ��ΪN
	Isdone	char(1) DEFAULT 'N',						-- �����	N	Y:��ͬ����ksoa
	PRIMARY KEY (GoodsId)
) 
GO

-- 4�����ҵ�񣺰����ɹ��������ܵ�Ҫ���ƻ����������˻ض������ֵ��˿⣩taskType��110�ɹ� 214���� orderFlag��101�ɹ���� 102�����˻����
CREATE TABLE [dbo].[ifPurin](
	[BillCode] [varchar](50) NOT NULL,			-- ������
	[BillSn] [varchar](20) NOT NULL,			-- �����к�
	[GoodsId] [varchar](50) NULL,					-- ��Ʒ���
	[BatchCode] [nvarchar](20) NULL,			-- ����  �˻ص�����
	[ValDate] [varchar](10) NULL,					-- Ч�� �˻ص�����
	[ProduceDate] [varchar](10) NULL,				-- �������� �˻ص�����
	[SterilCode] [nvarchar](20) NULL,			
	[Taxprice] [decimal](14, 4) NULL,			-- �ɹ���	N	��ౣ��4λС��
	[Num] [decimal](14, 2) NULL,				-- ����	Y	��ౣ��4λС��
	[piece] [decimal](14, 2) NULL,				-- ����	N	��ౣ��2λС��
	[TaxAmount] [decimal](14, 2) NULL,			-- ��˰���	N	��ౣ��2λС��
	[confirmMan] [varchar](20) NULL,				-- �����
	[confirmDate] [varchar](20) NULL,				-- ���ʱ��
	[caozyName] [nvarchar](64) NULL,			-- �Ƶ���	N	=username��̨��ֵ
	[Dates] [varchar](10) NULL,					-- �Ƶ�����	N	=��ǰʱ��
	[OnTime] [varchar](8) NULL,					-- �Ƶ�ʱ��
	[GCategory] [nvarchar](80) NULL,			-- Ʒ������	N	��ѧҩ�Ƽ�/�г�ҩ/��ҩ��Ƭ/�������Ƽ�//����ҩƷ/��
	[Remark] [nvarchar](256) NULL,				-- ������ע
	[orderFlag] [varchar](10) NULL,				-- ��������	Y	101�ɹ����	102�����˻����
	[WHId] [varchar](11) NULL,
	[CreateTime] [varchar](19) NULL,
	[remark1] [nvarchar](256) NULL,				-- ��ϸ��ע	N	����ϸ��ע
	[Carrier] [nvarchar](256) NULL,				-- ���˵�λ
	[TransMode] [nvarchar](256) NULL,
	[songhts] [int] NULL,
	[ShipFrom] [varchar](19) NULL,
	[sendaddress] [varchar](200) NULL,
	[billFlag] [int] NULL,
	Isdone	char(1) DEFAULT 'N',						-- �����	N	Y:��ͬ����ksoa			--
	[BusinessId] [varchar](50) NULL,	-- ��Ӧ�����ŵ굥λID
	[taskType] [varchar](20) NULL,		-- ��������	Y	110�ɹ� 214���ˣ�114���� 210���� 
	[BusinessCode] [varchar](50) NULL,	-- ��λ����	
	[rebillcode] [varchar](50) NULL,
	[rebillsn] [varchar](20) NULL,
	[clientcode] [varchar](50) NULL, -- �ŵ�ID	Y	��tasktype=110���ɹ��������� ���ֱ�������ŵ��д�ŵ�ID������뵽�ܲ��ִ���С�⣩��д�ܲ���ID
	[ismdth] [varchar](1) NULL DEFAULT 'N', -- �Ƿ��ŵ��˻�
	[khx_spid] [varchar](11) NULL,
	[curcode] [varchar](60) NULL,	-- ��ͨ�����
	[Place] [nvarchar](100) NULL DEFAULT '',	
	PRIMARY KEY(BillCode,BillSn)
)
GO

-- 5�����ⵥ�ϴ� �������ͳ��⣨�ֵ�Ҫ�����Ͳɹ��˳����˻�����Ӧ�̣� ���ֶ��� -- taskType 114���� 210����
CREATE TABLE [dbo].[ifSaleOut](
	[BillCode] [varchar](50) NOT NULL,	-- ������ 
	[BillSn] [varchar](20) NOT NULL,	-- �����к�
	[Dates] [varchar](10) NULL,			-- ��Ʊ����
	[OnTime] [varchar](8) NULL,			-- ��Ʊʱ��
	[GoodsId] [varchar](50) NULL,			-- ��Ʒ���
	[BatchCode] [nvarchar](20) NULL,	-- ����
	[ValDate] [varchar](10) NULL,			-- Ч��
	[ProduceDate] [varchar](10) NULL,		-- ��������
	[Num] [decimal](14, 2) NULL,		-- ����
	[Taxprice] [decimal](14, 4) NULL,	-- ���۵���
	[TaxAmount] [decimal](14, 2) NULL,	-- ���۽��
	[SaleTaxP] [decimal](14, 4) NULL,	-- ��������
	[RetailP] [decimal](12, 4) NULL,	-- ���۵���
	[DedRate] [decimal](14, 2) NULL,	-- ���ۿ���
	[WHId] [varchar](11) NULL,
	[PayType] [nvarchar](64) NULL,
	[caozyName] [nvarchar](64) NULL,	-- ��Ʊ��
	[doMan] [varchar](20) NULL,			-- ������
	[chkMan] [varchar](20) NULL,			-- ������
	[Tax] [decimal](14, 2) NULL,		-- ˰��
	[Rate] [decimal](14, 2) NULL,		-- ˰��
	[Amount] [decimal](14, 2) NULL,		-- ����˰���
	[InvoiceType] [nvarchar](20) NULL,	
	[ClientType] [char](1) NULL,
	[Remark] [nvarchar](256) NULL,		-- ������ע
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
	[IsDone] [char](1) DEFAULT 'N' NULL,	-- �����	N	Y:��ͬ����ksoa
	[CreateTime] [varchar](19) NULL,
	[BusinessId] [varchar](50) NULL,
	[taskType] [varchar](20) NULL,
	[BusinessCode] [varchar](50) NULL,
	[Address] [nvarchar](512) NULL,
	[rebillcode] [varchar](50) NULL,
	[rebillsn] [varchar](20) NULL,
	[carrier] [varchar](50) NULL,
	[remark1] [varchar](200) NULL, -- ��ע	N	��ϸ��ע
	[IsMdTh] [char](1) NULL DEFAULT 'N', -- �Ƿ��ŵ��˻�,�ܲ��ɹ��˻�ΪN���ŵ�ɹ��˻�ΪY��Ĭ��ΪN��ҫ�������⴦������������N
	[curcode] [varchar](60) NULL,
	PRIMARY KEY(BillCode,BillSn)    	                    						
) 
GO

/* �ش����ݱ� 2023��12��11�� 14:21:15*/
-- 1�����ռ�¼����
CREATE TABLE [dbo].[ifCheckAcctptFb](
	[OrgId] [char](11) NOT NULL,
	[OwnerId] [char](11) NOT NULL,
	[BillCode] [varchar](20) NOT NULL,
	[BillSn] [int] NOT NULL,
	[taskType] [varchar](20) NULL,  --'118' �������ռ�¼��'218' �����˻����ռ�¼
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
	[srcbillcode] [varchar](128) NULL,	-- ҩ��ϵͳ����
	[srcbillsn] [int] NULL,				-- ҩ��ϵͳ�к�
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

-- 2���ջ���¼
CREATE TABLE [dbo].[ifReceivingFb](
	[OrgId] [varchar](11) NOT NULL,
	[OwnerId] [varchar](11) NOT NULL,
	[BillCode] [varchar](20) NOT NULL,
	[BillSn] [int] NOT NULL,
	[taskType] [varchar](20) NULL,	-- 116  �ɹ��ջ���¼��216  �����˻��ջ���¼
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
	[srcbillcode] [varchar](128) NULL,		-- ҩ��ϵͳ����
	[srcbillsn] [int] NULL,				-- ҩ��ϵͳ�к�
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
-- 3�����˼�¼
CREATE TABLE [dbo].[ifCheckFb](
	[OrgId] [varchar](11) NOT NULL,
	[OwnerId] [varchar](11) NOT NULL,
	[BillCode] [varchar](20) NOT NULL,
	[BillSn] [int] NOT NULL,
	[taskType] [varchar](20) NULL, -- '217' ���ͳ��⸴�˼�¼��'117' ���˳��⸴�˼�¼ 
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
	[srcbillcode] [varchar](128) NULL,	-- ҩ��ϵͳ����
	[srcbillsn] [int] NULL,				-- ҩ��ϵͳ�к�
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
-- 4��������¼
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
-- 5�������¼ 
CREATE TABLE [dbo].[ifTransStatusFb](
	[OrgId] [varchar](11) NOT NULL,
	[OwnerId] [varchar](11) NOT NULL,
	[BillCode] [varchar](20) NOT NULL,
	[BillSn] [int] NOT NULL,
	[rfbillcode] [varchar](20) NULL,	-- ҩ��ϵͳ����
	[rfbillsn] [varchar](20) NULL,		-- ҩ��ϵͳ�к�
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

-- 6���̵㵥  ALNum �������𣬸�������
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
	[ALNum] [decimal](14, 2) NULL,   -- �������������棬��������
	[remark] [nvarchar](256) NULL,
	[id] [int] NOT NULL,
	[gzid] [varchar](128) NULL,
	[WHId] [varchar](11) NULL,
	[SterilCode] [nvarchar](20) NULL DEFAULT '',
	PRIMARY KEY (BillCode,BillSn)
)
GO

-- 7����ⵥ����  �ɹ���� �Ͳɹ��˳�
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
	[srcbillcode] [varchar](64) NULL,  -- ҩ��ϵͳ����
	[srcbillsn] [int] NULL,				-- ҩ��ϵͳ�к�
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
-- 8�����ͳ���������˻�
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
add [srcbillcode] VARCHAR(60);	-- �ⲿ���� 
                              
ALTER TABLE t_jhdzb
ALTER COLUMN ysr VARCHAR(16);  

ALTER TABLE t_ckdzb 
add [srcbillcode] VARCHAR(60);	-- �ⲿ����                         

-- �ܵ�Ҫ���ƻ� �����Ƿ��ϴ������α�־                             	
ALTER TABLE t_yhjhzb 
ADD isdone CHAR(1) DEFAULT 'N' NULL;        

-- �ֵ�Ҫ���ƻ� �����Ƿ��ϴ������α�־                             	
ALTER TABLE t_fdyhzb 
ADD isdone CHAR(1) DEFAULT 'N' NULL;  

IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TR_JHDMXB_IN]'))
DROP TRIGGER [dbo].[TR_JHDMXB_IN]
GO

INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
VALUES('08','�����������ϴ�',5,2,'�����������ϴ�','image\tom_wap.gif','w_khx_djsc',1,1,0);
                     
INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
VALUES('09','���������ݻ�ȡ',5,2,'���������ݻ�ȡ','image\tom_wap.gif','w_khx_djlq',1,1,0);
 
INSERT INTO t_hwxx(hwbh,LSHW, HWMC, HWTP, SXKW, CKSX,FLAG)
VALUES('KHX00','***','�����λ�λ',1,0,0,1) 

/* ��Ȩ�ű� */
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

/*��ʼ����������*/
-- ��ʼ���ŵ���Ϣ
INSERT INTO ifClientDoc(ClientId,ClientCode,BusinessName,[Address],Contact,Telephone,isMast)
SELECT dwbh,dwbh,dwmc,dwdz,'',dh,CASE when dwbh='000' then 'Y' ELSE 'N' END  
FROM t_dwxx 
WHERE flag = 1

-- ��ʼ����Ӧ����Ϣ
INSERT INTO ifSupplyDoc(SuppliersId,gysbh,BusinessName,[Address],contact,Telephone)
SELECT gysbh,gysbh,gysmc,lxdz,lxr,dh2
FROM T_GYSXX tg
WHERE flag = 1

-- ��ʼ����Ʒ��Ϣ
INSERT INTO ifgoodsDoc(GoodsId, GoodsCode, GoodsName,Logogram, unit, GoodsSpec,
            Manufacturer, GCategory, BarCode,IsPres,ApprovalNo,InEffectDay,Place,StorageTerm,Is_zdyh,Formula,MarketBy)
SELECT spbh,SPBH,PM,JC,JLDW,GG,CJMC,ypflmc,spbm,GMP,PZWH,YXQX,CD, cctj,YHBZ,jxmc,MarketBy
FROM v_spxx 
WHERE flag = 1
ORDER BY spbh

-- ��ⵥ��Ҫ���ƻ���
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
-- �˿�
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

-- �˻�
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

/* �洢���� �м�����ݴ��� */

/******************* ����˵�� ******************
  ������ⵥ
  ����  @billcode   ���������յ��� 
        @jhdbh    ��������
       
  ���  
************************************************/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_khx_rk]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_khx_rk]
GO
CREATE PROCEDURE sp_khx_rk @billcode varchar(32), @jhdbh CHAR(10) AS
begin

--DECLARE @billcode varchar(32)	-- �����ε���
--SET @billcode = 'PRK23121872798'

--DECLARE @jhdbh	CHAR(10)	-- ���������
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

-- �����м���ERP���״̬
UPDATE ifpurinfb SET isdone = 'Y' WHERE BillCode = @billcode;

-- ���¼۸���Ϣ 
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

/******************* ����˵�� ******************
  ���ɳ��ⵥ
  ����  @billcode   ���������յ��� 
        @ckdbh    ���ⵥ��
       
  ���  
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

-- ���¼۸���Ϣ
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


-- �����м���ERP���״̬
UPDATE ifSaleOutFb SET isdone = 'Y' WHERE BillCode = @billcode;


END

/******************* ����˵�� ******************
  �����ο��ͬ��
  ����         
  ���  
************************************************/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_khx_tbkc]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_khx_tbkc]
GO
CREATE PROCEDURE sp_khx_tbkc AS
begin

-- ɾ�������ο��
DELETE t_chxx WHERE hwbh = 'KHX00' ;

-- ͬ�������ο��
INSERT INTO t_chxx(HWBH, SPBH, PCBH, CHSL, yxrq, jiag, FLAG,  scrq,sccj)
select 'KHX00',goodsid,batchcode,placenum,valdate,0,1,producedate,manufacturer
from khx.khx_wtps.dbo.v_hjyf_xkphkc ;

-- ���½����۸�
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





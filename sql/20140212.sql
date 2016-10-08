--日志表
DROP TABLE T_SYS_LOG 
GO
CREATE TABLE T_SYS_LOG
(
	ID INT IDENTITY(1,1) NOT NULL,
	UserID NVARCHAR(12) NOT NULL,
	OperationDatetime DATETIME NOT NULL DEFAULT GETDATE(),	
	DataNo NVARCHAR(32) NULL,
	OperationDesc NVARCHAR(128) NOT NULL,
	FuncID INT NULL,
	PRIMARY KEY (id)
)
GO

--总店、分店执行
ALTER TABLE T_FUNCS
ADD ID INT IDENTITY(1,1) NOT NULL
GO

--总店执行
INSERT INTO [T_FUNCS]([FUNCID], [FUNNM], [FUNTP], [GRPID], [FUNMS], [TPLJ], [FUNFM], [FLAG], [UFLAG])
VALUES('06', N'系统日志', 7, 1, N'系统日志', 'image\tom_wap.gif', 'w_log', 1, 1)
GO

INSERT INTO [T_FUNCS]([FUNCID], [FUNNM], [FUNTP], [GRPID], [FUNMS], [TPLJ], [FUNFM], [FLAG], [UFLAG],parameter)
VALUES('06', N'审核首营品种[质量管理员]', 2, 3, N'审核首营品种[质量管理员]', 'image\tom_wap.gif', 'w_sypzspb_sp', 1, 1,1)
GO

INSERT INTO [T_FUNCS]([FUNCID], [FUNNM], [FUNTP], [GRPID], [FUNMS], [TPLJ], [FUNFM], [FLAG], [UFLAG],parameter)
VALUES('10', N'审批首营品种[质量负责人]', 2, 3, N'审批首营品种[质量负责人]', 'image\tom_wap.gif', 'w_sypzspb_sp', 1, 1,2)
GO

INSERT INTO [T_FUNCS]([FUNCID], [FUNNM], [FUNTP], [GRPID], [FUNMS], [TPLJ], [FUNFM], [FLAG], [UFLAG],parameter)
VALUES('11', N'审核首营企业[质量管理员]', 2, 3, N'审核首营企业[质量管理员]', 'image\tom_wap.gif', 'w_syqyspb_sp', 1, 1,1)
GO

INSERT INTO [T_FUNCS]([FUNCID], [FUNNM], [FUNTP], [GRPID], [FUNMS], [TPLJ], [FUNFM], [FLAG], [UFLAG],parameter)
VALUES('12', N'审批首营企业[质量负责人]', 2, 3, N'审批首营企业[质量负责人]', 'image\tom_wap.gif', 'w_syqyspb_sp', 1, 1,2)
GO

INSERT INTO [T_FUNCS]([FUNCID], [FUNNM], [FUNTP], [GRPID], [FUNMS], [TPLJ], [FUNFM], [FLAG], [UFLAG],parameter)
VALUES('24', N'商品锁定', 1, 0, N'商品锁定', 'image\tom_wap.gif', 'w_splock', 1, 1,0)
GO

--分店执行
INSERT INTO [T_FUNCS]([FUNCID], [FUNNM], [FUNTP], [GRPID], [FUNMS], [TPLJ], [FUNFM], [FLAG], [UFLAG],parameter)
VALUES('23', N'商品锁定', 1, 0, N'商品锁定', 'image\tom_wap.gif', 'w_splock', 1, 1,0)
GO
INSERT INTO [T_FUNCS]([FUNCID], [FUNNM], [FUNTP], [GRPID], [FUNMS], [TPLJ], [FUNFM], [FLAG], [UFLAG])
VALUES('07', N'系统日志', 4, 1, N'系统日志', 'image\tom_wap.gif', 'w_log', 1, 1)
GO


--首营品种审批表
DROP TABLE T_SYPZSPB
GO

CREATE TABLE T_SYPZSPB
(
	id INT IDENTITY(1,1) NOT NULL,
	pm NVARCHAR(64) NOT NULL,	--品名
	gg NVARCHAR(32) NULL,		--规格
	pzwh NVARCHAR(64) NULL,		--批准文号
	sccj NVARCHAR(64) NULL,		--生产厂家
	cctj NVARCHAR(64) NULL,		--储存条件
	lb NVARCHAR(32) NULL,		--类别
	pjbh NVARCHAR(32) NULL,		--批件编号	
	pjyxrq DATETIME NULL,		--批件有效日期	
	cgyj NVARCHAR(64) NULL,	--采购员意见
	cgr NVARCHAR(16) NULL,	--采购员
	cgrq DATETIME NULL,		--采购员签字日期
	zlglyyj NVARCHAR(64) NULL,		--质量管理员意见
	zlgly NVARCHAR(16) NULL,	--质量管理员签字
	zlglyrq DATETIME NULL,		--质量管理员签字日期
	zlglybz TINYINT NOT NULL DEFAULT 0,	--质量管理员审批标志	9审批不通过 8审批通过
	zlfzryj NVARCHAR(64) NULL,		--质量负责人意见
	zlfzr NVARCHAR(16) NULL,	--质量负责人签字
	zlfzrrq DATETIME NULL,	--质量管理部门签字日期
	zlfzrbz TINYINT NOT NULL DEFAULT 0,	--质量负责人审批标志	9审批不通过 8审批通过                          	--
	flag TINYINT DEFAULT 0,   	--审核标志 0未提交 1质量管理员审批中 2质量负责人审批中 8审批通过 9审批不通过 255删除
	PRIMARY KEY(id)
)
GO

ALTER TABLE T_SYQYSPB
ADD gysmc NVARCHAR(64) NULL
GO

ALTER TABLE T_SYQYSPB
ALTER COLUMN gysbh NVARCHAR(10) NULL
GO

ALTER TABLE T_SYQYSPB
ADD sqrq DATETIME NULL
GO
ALTER TABLE T_SYQYSPB
DROP COLUMN shrq,sprq,kcrq
GO
ALTER TABLE T_SYQYSPB
ADD shrq DATETIME NULL
GO
ALTER TABLE T_SYQYSPB
ADD sprq DATETIME NULL
GO

--总店、分店都执行 锁定
ALTER TABLE T_CHXX
ADD islock TINYINT NULL
GO

UPDATE t_chxx 
SET islock = 0
GO


if object_id('SP_GETSPXX_CH') is not null
	drop procedure SP_GETSPXX_CH
go
CREATE PROCEDURE SP_GETSPXX_CH @spbh varchar(16) AS
SELECT  T_SPXX.SPBH, T_SPXX.PM,T_SPXX.GG, T_JLDW.JLDW, T_SPXX.JC, T_SCCJ.JC as SCCJ,T_JGXX.LSJ, T_JGXX.PFJ, T_JGXX.GBJ
FROM t_chxx JOIN 
T_SPXX ON t_chxx.spbh=t_spxx.spbh LEFT OUTER JOIN
T_JLDW ON T_SPXX.JLDWBH = T_JLDW.JLDWBH LEFT OUTER JOIN
T_SCCJ ON T_SPXX.CJBH = T_SCCJ.CJBH LEFT OUTER JOIN
T_JGXX ON T_SPXX.SPBH = T_JGXX.SPBH
WHERE t_chxx.CHSL >0 AND (T_SPXX.SPBH like '%' + @spbh + '%' OR T_SPXX.PM like '%' + @spbh + '%' OR T_SPXX.JC like '%' + @spbh + '%')
order by t_spxx.spbh
GO

--供应商修改日志
DROP TABLE t_gysxx_log
GO
CREATE TABLE t_gysxx_log
(
	id INT IDENTITY(1,1) NOT NULL,
	gysbh NVARCHAR(16) NOT NULL,
	xgnr NVARCHAR(32) NOT NULL,
	xgq NVARCHAR(128) NULL,
	xgh NVARCHAR(128) NULL,
	xgr NVARCHAR(3) not NULL,
	xgrq DATETIME NOT NULL DEFAULT GETDATE(),
	PRIMARY KEY(id)
)
GO

--记录供应商日志
if (object_id('tri_gysxx_update', 'TR') is not null)
    drop trigger tri_gysxx_update_column
go
create trigger tri_gysxx_update_column
on t_gysxx
    for update
AS
	if exists(select * from inserted a join deleted b on a.gysbh=b.gysbh
		where (a.jyxkzrq <> b.jyxkzrq OR a.gsprq <> b.gsprq OR 
		a.gsyzrq <> b.gsyzrq OR a.xyrq <> b.xyrq OR a.frrq <> b.frrq))
	BEGIN
		declare @oldjyxkzrq DATETIME , @newjyxkzrq DATETIME,@user CHAR(3),@gysbh NVARCHAR(16)
		DECLARE @oldgsprq DATETIME,@newgsprq DATETIME,@oldgsyzrq DATETIME,@newgsyzrq DATETIME
		DECLARE @oldxyrq DATETIME,@newxyrq DATETIME
		DECLARE @oldfrrq DATETIME,@newfrrq DATETIME
		
		--更新前的数据
		select @oldjyxkzrq = jyxkzrq,@oldgsprq=gsprq,@oldgsyzrq=gsyzrq,@oldxyrq=xyrq,@oldfrrq=frrq from deleted;
		
		--更新后的数据
		select @newjyxkzrq = jyxkzrq,@newgsprq=gsprq,@newgsyzrq=gsyzrq,@newxyrq=xyrq,@newfrrq=frrq,@user=gxz,@gysbh=gysbh from inserted;
			
		IF (@oldjyxkzrq <> @newjyxkzrq) --修改了许可证日期		
		begin
			
			INSERT INTO t_gysxx_log(xgq,xgh,xgr,gysbh,xgnr)
			VALUES(CONVERT(char(10),@oldjyxkzrq,120),CONVERT(char(10),@newjyxkzrq,120),@user,@gysbh,N'药品经营许可证有效期')
		END
		
		IF (@oldgsprq <> @newgsprq) --修改了GSP有效日期		
		begin
			
			INSERT INTO t_gysxx_log(xgq,xgh,xgr,gysbh,xgnr)
			VALUES(CONVERT(char(10),@oldgsprq,120),CONVERT(char(10),@newgsprq,120),@user,@gysbh,N'GSP有效期')
		END
		
		IF (@oldgsyzrq <> @newgsyzrq) --修改了工商营业执照有效期		
		begin
			
			INSERT INTO t_gysxx_log(xgq,xgh,xgr,gysbh,xgnr)
			VALUES(CONVERT(char(10),@oldgsyzrq,120),CONVERT(char(10),@newgsyzrq,120),@user,@gysbh,N'工商营业执照有效期')
		END
		
		IF (@oldxyrq <> @newxyrq) --修改了质保协议有效期		
		begin
			
			INSERT INTO t_gysxx_log(xgq,xgh,xgr,gysbh,xgnr)
			VALUES(CONVERT(char(10),@oldxyrq,120),CONVERT(char(10),@newxyrq,120),@user,@gysbh,N'质保协议有效期')
		END
		
		IF (@oldfrrq <> @newfrrq) --修改了法人委托书有效期		
		begin
			
			INSERT INTO t_gysxx_log(xgq,xgh,xgr,gysbh,xgnr)
			VALUES(CONVERT(char(10),@oldfrrq,120),CONVERT(char(10),@newfrrq,120),@user,@gysbh,N'法人委托书有效期')
		end
    END
go

ALTER TABLE T_FUNCS
ADD parameter TINYINT NULL DEFAULT 0
GO
UPDATE T_FUNCS
SET parameter = 0
GO

--总店执行
INSERT INTO T_Options(	ID,	OptionID,Name)
VALUES(	1,3,N'药品购进记录')
INSERT INTO T_Options(	ID,	OptionID,Name)
VALUES(	2,3,N'药品入库验收记录')
INSERT INTO T_Options(	ID,	OptionID,Name)
VALUES(	3,3,N'药品出库复核记录')
INSERT INTO T_Options(	ID,	OptionID,Name)
VALUES(	4,3,N'饮片装斗复核记录')
INSERT INTO T_Options(	ID,	OptionID,Name)
VALUES(	5,3,N'销售退回药品验收记录')
INSERT INTO T_Options(	ID,	OptionID,Name)
VALUES(	6,3,N'药品下架退库申请表')
INSERT INTO T_Options(	ID,	OptionID,Name)
VALUES(	7,3,N'购进药品退出通知单')
INSERT INTO T_Options(	ID,	OptionID,Name)
VALUES(	8,3,N'购进药品退出记录')
INSERT INTO T_Options(	ID,	OptionID,Name)
VALUES(	9,3,N'近效期药品催销表')
INSERT INTO T_Options(	ID,	OptionID,Name)
VALUES(	10,3,N'陈列药品质量检查记录')
INSERT INTO T_Options(	ID,	OptionID,Name)
VALUES(	14,3,N'采购记录')
INSERT INTO T_Options(	ID,	OptionID,Name)
VALUES(	11,3,N'进口药品登记表')
INSERT INTO T_Options(	ID,	OptionID,Name)
VALUES(	12,3,N'药品损益记录')
INSERT INTO T_Options(	ID,	OptionID,Name)
VALUES(	13,3,N'不合格药品销毁记录')
GO

--分店执行
INSERT INTO T_Options(	ID,	OptionID,Name)
VALUES(	1,3,N'来货质量验收记录')
INSERT INTO T_Options(	ID,	OptionID,Name)
VALUES(	2,3,N'饮片装斗复核记录')
INSERT INTO T_Options(	ID,	OptionID,Name)
VALUES(	3,3,N'药品下架退库申请表')
INSERT INTO T_Options(	ID,	OptionID,Name)
VALUES(	4,3,N'近效期药品催销表')
INSERT INTO T_Options(	ID,	OptionID,Name)
VALUES(	5,3,N'药品养护记录')
INSERT INTO T_Options(	ID,	OptionID,Name)
VALUES(	6,3,N'零售记录')
INSERT INTO T_Options(	ID,	OptionID,Name)
VALUES(	7,3,N'销售药品退回验收记录')
INSERT INTO T_Options(	ID,	OptionID,Name)
VALUES(	8,3,N'药品购进记录')
INSERT INTO T_Options(	ID,	OptionID,Name)
VALUES(	9,3,N'药品损益记录')
INSERT INTO T_Options(	ID,	OptionID,Name)
VALUES(	10,3,N'不合格药品销毁记录')
GO

--总店供应商经营类别
DROP TABLE T_GYSXX_JYLB
CREATE TABLE T_GYSXX_JYLB
(
	id INT IDENTITY(1,1) NOT NULL,
	gysbh NVARCHAR(10),NOT NULL,
	ypflbh NVARCHAR(8),NOT NULL,
	PRIMARY KEY(id)
)

--隐藏总店库存
----SELECT a.*,s.pm,s.gg,s.cjmc
--UPDATE a
--SET a.FLAG=0
--FROM T_CHXX a JOIN v_spxx s ON a.SPBH=s.spbh
--WHERE a.spbh NOT IN('106864','102774','11185','105642','105113','10564','102033','10067','101357',
--'40163','40098','41313','40996','102755','401755','401516','41449','11313','400812','407501','41424',
--'40490','11315','100851','112013')


--分店执行

/******************* 过程说明 *****************************************************************
  生成效期催销记录
  参数	@cxr	操作人
		@zgr   	质管员
        @yhr	养护人
        @day	近效期天数
  结果	生成效期催销记录信息
**********************************************************************************************/
ALTER PROCEDURE [dbo].[SP_JXQCX] @cxr char(3), @zgr char(3),@yhr char(3),@day int AS
begin

declare @dh char(6)

select @dh = convert(char(6),getdate(),112)

--一个月只能生成一个催销表
if not exists(
select *
from t_cxzb
where cxdbh = @dh
)
begin
	insert into t_cxzb(cxdbh,cxrq,cxr,zgr,yhr,bz)
	values(@dh,getdate(),@cxr,@zgr,@yhr,'')
	
	insert into t_cxmxb(cxdbh,spbh,pcbh,sl,yxrq,bz)
	select @dh, a.spbh,a.pcbh,a.chsl,a.yxrq,''
	from t_chxx a
	join v_spxx b on b.spbh = a.spbh
	where dateadd(day,@day,getdate()) >= yxrq and b.lbbh <> '07' and b.flag = 1
end

end 


GO



--分店出库单接收增加要货单选择
ALTER TABLE T_CKDZB
ADD yhdbh NVARCHAR(15) NULL
GO

--分店执行
--UPDATE T_FUNCS
--SET	FUNNM = '不合格商品退库'
--WHERE funnm = '不合格商品销毁'

--总店执行
UPDATE T_FUNCS
SET	FUNNM = '审核不合格商品'
WHERE funnm = '审核销毁单'


--商品锁定日志
DROP TABLE t_chxx_lock_log
GO
CREATE TABLE t_chxx_lock_log
(
	id INT IDENTITY(1,1) NOT NULL,
	spbh NVARCHAR(15) NOT NULL,
	pcbh NVARCHAR(32) NOT NULL,
	yxrq DATETIME NOT NULL,
	shul DECIMAL(18,2) NOT NULL,
	hwbh NVARCHAR(8) NULL,
	userid NVARCHAR(3) NOT NULL,
	islock TINYINT NOT NULL DEFAULT 0, -- 0解锁 1锁定
	czsj DATETIME NOT NULL DEFAULT GETDATE(),
	PRIMARY KEY(id)
)

--总店执行
INSERT INTO [T_FUNCS]([FUNCID], [FUNNM], [FUNTP], [GRPID], [FUNMS], [TPLJ], [FUNFM], [FLAG], [UFLAG],parameter)
VALUES('25', N'商品解锁', 1, 0, N'商品解锁', 'image\tom_wap.gif', 'w_sp_deblock', 1, 1,0)
GO
INSERT INTO [T_FUNCS]([FUNCID], [FUNNM], [FUNTP], [GRPID], [FUNMS], [TPLJ], [FUNFM], [FLAG], [UFLAG],parameter)
VALUES('07', N'系统功能维护', 7, 1, N'系统功能维护', 'image\tom_wap.gif', 'w_funcs_wh', 0, 1,0)
GO
INSERT INTO [T_FUNCS]([FUNCID], [FUNNM], [FUNTP], [GRPID], [FUNMS], [TPLJ], [FUNFM], [FLAG], [UFLAG],parameter)
VALUES('08', N'系统选项维护', 7, 1, N'系统选项维护', 'image\tom_wap.gif', 'w_gsp_rep_titleedit', 0, 1,0)
GO


--分店执行
INSERT INTO [T_FUNCS]([FUNCID], [FUNNM], [FUNTP], [GRPID], [FUNMS], [TPLJ], [FUNFM], [FLAG], [UFLAG],parameter)
VALUES('24', N'商品解锁', 1, 0, N'商品解锁', 'image\tom_wap.gif', 'w_sp_deblock', 1, 1,0)
GO
INSERT INTO [T_FUNCS]([FUNCID], [FUNNM], [FUNTP], [GRPID], [FUNMS], [TPLJ], [FUNFM], [FLAG], [UFLAG],parameter)
VALUES('08', N'系统功能维护', 4, 0, N'系统功能维护', 'image\tom_wap.gif', 'w_funcs_wh', 0, 1,0)
GO
UPDATE a
SET a.FUNNM='审核上传'
FROM T_funcs a
WHERE FUNNM='数据上传'
GO
UPDATE a
SET a.FUNNM='同步信息'
FROM T_funcs a
WHERE FUNNM='同步基础信息'
GO
ALTER TABLE T_CKDMXb
ADD ysjl NVARCHAR(32) NULL
GO



















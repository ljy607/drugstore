
--总店执行
alter table t_jhdmxb
add WLHBS tinyint null default 0
go


alter table t_tkdmxb
add yxrq datetime null
go



--分店执行
insert into t_funcs(funcid,funnm,funtp,grpid,funms,tplj,funfm,flag,uflag)
values('11','GSP报表',1,4,'GSP报表','image\tom_wap.gif','w_gsp_report',1,1)

insert into t_funcs(funcid,funnm,funtp,grpid,funms,tplj,funfm,flag,uflag)
values('12','养护记录',1,4,'养护记录','image\tom_wap.gif','w_yhjl_wh',1,1)

insert into t_funcs(funcid,funnm,funtp,grpid,funms,tplj,funfm,flag,uflag)
values('13','效期催销',1,4,'效期催销','image\tom_wap.gif','w_xqcx_wh',1,1)



alter table t_tkdmxb
add yxrq datetime null
go

drop table t_yhjlzb
drop table t_yhjlmx


create TABLE t_yhjlzb
(
YHJLBH NVARCHAR(16) NOT NULL,
YHRQ   datetime not null,
YHR	NVARCHAR(3) NOT NULL,
BZ	NVARCHAR(128) NULL,
PRIMARY KEY (YHJLBH)
)

CREATE TABLE [T_YHJLMX] (
	YHJLMXID INT IDENTITY(1,1) NOT NULL,
	[YHJLBH] [varchar] (16)NOT NULL ,
	[HWBH] [varchar] (8) NOT NULL ,
	[PCBH] [varchar] (32) NULL ,
	[SL] [INT] NOT NULL DEFAULT (0),
	[YHSL] INT NOT NULL DEFAULT(0),
	[JL] NVARCHAR(128) NULL ,
	[BZ] [Nvarchar] (128) NULL ,
PRIMARY KEY (YHJLMXID)
	)
GO


DROP TABLE [T_CXZB]
DROP TABLE [T_CXMXB]

CREATE TABLE [T_CXZB] (
	[CXDBH] [varchar] (15) NOT NULL ,
	[CXRQ] [datetime] NOT NULL ,
	[CXR] [varchar] (3) NULL ,
	[YXBZ] [int] NULL ,
	[BZ] [varchar] (64)  NULL ,
	[yhr] [varchar] (3)  NULL ,
	[zgr] [varchar] (3)  NULL ,
	PRIMARY KEY (CXDBH)
)
GO

CREATE TABLE [T_CXMXB] (
CXDMXBID INT IDENTITY(1,1) NOT NULL,
	[CXDBH] [varchar] (15) ,
	[SPBH] [varchar] (16)  ,
	[PCBH] [varchar] (32) ,
	[SL] [decimal](10, 2) NULL default 0 ,
	[YXRQ] [datetime] NULL ,
	[BZ] [varchar] (60) NULL ,
	PRIMARY KEY (CXDMXBID)
) 
GO






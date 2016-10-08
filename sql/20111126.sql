INSERT INTO T_FUNCS(	FUNCID,	FUNNM,	FUNTP,	GRPID,	FUNMS,	TPLJ,	FUNFM,	FLAG,	UFLAG)
VALUES(	'16',	N'近效期药品催销',	2,	0,	N'近效期药品催销',	'image\tom_wap.gif',	'w_xqcx_wh',	1,	1)
GO

INSERT INTO T_FUNCS(	FUNCID,	FUNNM,	FUNTP,	GRPID,	FUNMS,	TPLJ,	FUNFM,	FLAG,	UFLAG)
VALUES(	'17',	N'GSP报表查询',	2,	0,	N'GSP报表查询',	'image\tom_wap.gif',	'w_gsp_report',	1,	1)
GO

INSERT INTO T_FUNCS(	FUNCID,	FUNNM,	FUNTP,	GRPID,	FUNMS,	TPLJ,	FUNFM,	FLAG,	UFLAG)
VALUES(	'18',	N'养护记录维护',	2,	0,	N'养护记录维护',	'image\tom_wap.gif',	'w_yhjl_wh',	1,	1)
GO




select * from t_funcs where funtp = 2
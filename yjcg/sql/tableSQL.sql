
-------��ͬ�������󱨸�
--DROP TABLE t_htddps
--GO

--CREATE TABLE t_htddps
--(
--	id INT IDENTITY(1,1) NOT NULL,
--	htbh NVARCHAR(32) NULL,				--��ͬ���
--	ddbh NVARCHAR(32) NULL,				--������
--	gysbh NVARCHAR(32) NULL,			--��Ӧ��
--	cpxh NVARCHAR(64) NULL,				--��Ʒ�ͺ�
--	sl DECIMAL(18,4) DEFAULT 0 NULL,	--����
--	yqjhq DATETIME NULL,				--Ҫ�󽻻�����
--	qtyq NVARCHAR(64) NULL,				--����Ҫ��
--	jbr NVARCHAR(16) NULL,				--������
--	jbrq DATETIME NULL,					--��������
--	sfasjh TINYINT NULL,				--�Ƿ��ܰ�ʱ����
--	cjrq DATETIME DEFAULT GETDATE() NULL,	--����ʱ��
--	cjr NVARCHAR(16) NULL,					--������
--	gxrq DATETIME DEFAULT GETDATE() NULL,	--��������
--	gxr NVARCHAR(16) NULL,					--������
--	PRIMARY KEY (id)
--)
--GO

--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--            fdbz, parameter)
--VALUES('01','��ͬ�����������',1,0,'��ͬ�����������','image\tom_wap.gif','w_htddps',1,1,1,0)

--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--            fdbz, parameter)
--VALUES('02','��Ӧ����Ϣ',6,0,'��Ӧ����Ϣ','image\tom_wap.gif','w_gysxx',1,1,1,0)

--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--            fdbz, parameter)
--VALUES('01','��ͬ���������ѯ',4,0,'��ͬ���������ѯ','image\tom_wap.gif','w_rep_htddps',1,1,1,0)


--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--            fdbz, parameter)
--VALUES('02','ȱ����Ϣ����',1,0,'ȱ����Ϣ����','image\tom_wap.gif','w_qljh',1,1,1,0)

--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--            fdbz, parameter)
--VALUES('03','ȱ����Ϣά��',1,0,'ȱ����Ϣά��','image\tom_wap.gif','w_qljhwh',1,1,1,0)


DROP TABLE t_qlzb
GO
--ȱ�ϼƻ���ϸ
CREATE TABLE t_qlzb
(
	code NVARCHAR(8) not NULL,
	rq DATETIME NOT NULL
	PRIMARY KEY (code)
)
DROP TABLE t_qlmx
GO
--ȱ�ϼƻ���ϸ
CREATE TABLE t_qlmx
(
	id INT IDENTITY(1,1) NOT NULL,
	code NVARCHAR(8) NULL,
	xh NVARCHAR(8) NULL,
	cpmc NVARCHAR(32) NULL,
	wlbm NVARCHAR(18) NULL,
	wlms NVARCHAR(128) NULL,
	dw NVARCHAR(8) NULL,
	jhsl NVARCHAR(8) NULL,
	t0 NVARCHAR(8) NULL,
	t1 NVARCHAR(8) NULL,
	t2 NVARCHAR(8) NULL,
	t3 NVARCHAR(8) NULL, 
	t4 NVARCHAR(8) NULL,
	t5 NVARCHAR(8) NULL,
	t6 NVARCHAR(8) NULL,
	t7 NVARCHAR(8) NULL, 
	t8 NVARCHAR(8) NULL,
	cgz NVARCHAR(8) NULL,
	jd NVARCHAR(64) NULL,
	bz NVARCHAR(200) NULL,
	PRIMARY KEY(id)
)











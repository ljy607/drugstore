
-----��ͬ�������󱨸�
DROP TABLE t_htddps
GO

CREATE TABLE t_htddps
(
	id INT IDENTITY(1,1) NOT NULL,
	htbh NVARCHAR(32) NULL,				--��ͬ���
	ddbh NVARCHAR(32) NULL,				--������
	gysbh NVARCHAR(32) NULL,			--��Ӧ��
	cpxh NVARCHAR(64) NULL,				--��Ʒ�ͺ�
	sl DECIMAL(18,4) DEFAULT 0 NULL,	--����
	yqjhq DATETIME NULL,				--Ҫ�󽻻�����
	qtyq NVARCHAR(64) NULL,				--����Ҫ��
	jbr NVARCHAR(16) NULL,				--������
	jbrq DATETIME NULL,					--��������
	sfasjh TINYINT NULL,				--�Ƿ��ܰ�ʱ����
	cjrq DATETIME DEFAULT GETDATE() NULL,	--����ʱ��
	cjr NVARCHAR(16) NULL,					--������
	gxrq DATETIME DEFAULT GETDATE() NULL,	--��������
	gxr NVARCHAR(16) NULL,					--������
	PRIMARY KEY (id)
)
GO

INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
            fdbz, parameter)
VALUES('01','��ͬ�����������',1,0,'��ͬ�����������','image\tom_wap.gif','w_htddps',1,1,1,0)

INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
            fdbz, parameter)
VALUES('02','��Ӧ����Ϣ',6,0,'��Ӧ����Ϣ','image\tom_wap.gif','w_gysxx',1,1,1,0)

INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
            fdbz, parameter)
VALUES('01','��ͬ���������ѯ',4,0,'��ͬ���������ѯ','image\tom_wap.gif','w_rep_htddps',1,1,1,0)






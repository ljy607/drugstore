DECLARE @tkdbh NVARCHAR(16)

------�ֹ���ȡ�˿ⵥ��󵥺�
--SELECT MAX(tkdbh)
--FROM t_tkdzb 

SELECT @tkdbh = 'TK21000012'

CREATE TABLE #t
( 
	tkdbh NVARCHAR(16),
	ordr INT IDENTITY(1,1),
	spbh NVARCHAR(32),
	pcbh NVARCHAR(32),
	shul INT,
	guiw NVARCHAR(8),
	tkyy NVARCHAR(32),
	yxrq DATETIME NULL,
	scrq DATETIME NULL,
	jg DECIMAL(16,2)
)

INSERT INTO #t(spbh, pcbh, shul, guiw, yxrq, scrq,jg)
SELECT c.SPBH, c.PCBH, c.CHSL, c.HWBH, c.yxrq, c.scrq,c.jiag
FROM t_chxx c
WHERE chsl > 0

----�����˿ⵥ����
INSERT INTO t_tkdzb(tkdbh,tkrq,sqr,flag,bz)
SELECT @tkdbh,CONVERT(varchar(100), GETDATE(), 23),'001',1,N'�㰲�ţ�ϵͳ�����˿�'

----�����˿ⵥ��ϸ��
INSERT INTO t_tkdmxb(TKDBH, ORDR, SPBH, PCBH, JHJG, SHUL, GUIW, TKYY, yxrq, scrq)
SELECT @tkdbh,ordr,spbh, pcbh, jg, shul, guiw, '', yxrq, scrq
FROM #t

DROP TABLE #t


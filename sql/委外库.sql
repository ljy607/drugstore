SELECT *
FROM ifPurin ip
/*�ɹ� 
* taskType 110�ɹ�
--orderFlag  101�ɹ���� */
-- �ɹ���� 
DELETE FROM ifPurin WHERE BillCode like 'YH22000009%';
INSERT INTO ifpurin(BillCode, BillSn, GoodsId, Num, GCategory, Place,
            taskType, orderFlag,clientcode,BusinessId,BusinessCode,OnTime, Dates,
            caozyName,Taxprice)
SELECT m.yhdbh+'_'+m.GYSBH,m.ORDR,m.SPBH, m.YHSL,s.ypflmc,m.cd,'110','101',isnull(z.yhdw,'000'),m.GYSBH,m.GYSBH
,CONVERT(CHAR(8),getdate(),114),CONVERT(CHAR(10),z.yhrq,120),g.xm,m.jhj
FROM t_yhjhzb z
join T_YHJHMX m ON m.YHDBH = z.YHDBH 
JOIN v_spxx s ON s.SPBH = m.SPBH
LEFT JOIN t_zgxx g ON z.zbr = g.BH
JOIN ifGoodsDoc igd ON m.spbh = igd.GoodsId
WHERE m.YHDBH = 'YH22000009' AND m.GYSBh IS NOT NULL

SELECT *
FROM T_YHJHZB ty
WHERE yhrq > '2021.11.1'

-- �����������
UPDATE a SET a.Isdone = 'X'
FROM ifpurin a
JOIN (
SELECT TOP 500 BillCode, BillSn
FROM ifpurin
WHERE Isdone = 'N' 
ORDER BY BillCode,BillSn
) b ON a.BillCode=b.BillCode AND a.BillSn=b.BillSn ;
SELECT BillCode, BillSn, GoodsId, Num, GCategory, Place,
            taskType, orderFlag,clientcode,BusinessId,BusinessCode,BatchCode,
            ProduceDate, ValDate,Taxprice,Dates,ontime
FROM ifpurin
WHERE Isdone = 'X';
-- �ص��������״̬
UPDATE ifpurin SET Isdone = 'Y' WHERE Isdone='X'

--�˿�
SELECT * FROM t_tkdzb WHERE tkrq > '2021.11.1'

INSERT INTO ifpurin(BillCode, BillSn, GoodsId, Num, GCategory, Place,
            taskType, orderFlag,clientcode,BusinessId,BusinessCode,OnTime, Dates,
            caozyName,BatchCode, ValDate, ProduceDate,Taxprice)
SELECT m.tkdbh,m.ORDR,m.SPBH, m.ShuL,s.ypflmc,m.cd,'214','102',z.tkdw,z.tkdw,z.TKDW
,CONVERT(CHAR(8),getdate(),114),CONVERT(CHAR(10),z.tkrq,120),g.xm,m.PCBH, CONVERT(CHAR(10),m.yxrq,120),
	CONVERT(CHAR(10),m.scrq,120),m.JHJG
FROM t_tkdzb z
join t_tkdmxb m ON m.tkDBH = z.tkDBH 
JOIN v_spxx s ON s.SPBH = m.SPBH
LEFT JOIN t_zgxx g ON z.sqr = g.BH
WHERE m.tkDBH = 'TK10621000359'

/* ����
* taskType 114���� 210���� */

SELECT * FROM T_FDYHZB z WHERE yhrq > '2021.11.1'
SELECT * FROM t_fdyhmxb m WHERE yhdbh = 'YH11121000100'
-- �ֵ�Ҫ������ 
INSERT INTO ifsaleout(BillCode, BillSn, GoodsId,num, BatchCode, ValDate,
            ProduceDate,taskType,BusinessId,BusinessCode,OnTime,Dates,caozyName,Taxprice)
SELECT m.yhdbh,m.ORDR,m.SPBH, m.yHSL,'','','','','210',z.yhdw,z.yhdw
,CONVERT(CHAR(8),getdate(),114),CONVERT(CHAR(10),z.yhrq,120),g.xm,j.lsj
FROM t_fdyhzb z
join t_fdyhmxb m ON m.yHDBH = z.yHDBH 
JOIN v_spxx s ON s.SPBH = m.SPBH
left join t_jgxx j on j.spbh=m.spbh
LEFT JOIN t_zgxx g ON z.zbr = g.BH
WHERE m.yHDBH = 'YH11121000100'

SELECT *
FROM t_thdzb z
--JOIN t_thdmxb m ON m.THDBH = z.THDBH
WHERE z.THRQ > '2021.11.1'
SELECT * FROM t_thdmxb WHERE thdbh = 'TH21000483'

-- �˻�����  taskType 114���� 210����
INSERT INTO ifsaleout(BillCode, BillSn, GoodsId,num, BatchCode, ValDate,
            ProduceDate,taskType,BusinessId,BusinessCode,OnTime,Dates,caozyName,Taxprice)
SELECT m.thdbh,m.ORDR,m.SPBH, m.tHSL,m.PCBH,'','','114',m.GYSBH,m.GYSBH
,CONVERT(CHAR(8),getdate(),114),CONVERT(CHAR(10),z.thrq,120),g.xm,m.jhj
FROM t_thdzb z
join t_thdmxb m ON m.tHDBH = z.tHDBH 
JOIN v_spxx s ON s.SPBH = m.SPBH
LEFT JOIN t_zgxx g ON z.kpr = g.BH
WHERE m.tHDBH = 'TH21000483'

-- ���ͳ�������
UPDATE a SET a.Isdone = 'X'
FROM ifSaleOut a
JOIN (
SELECT TOP 500 BillCode, BillSn
FROM ifSaleOut
WHERE ISNULL(IsDone,'N') = 'N'
ORDER BY BillCode,BillSn
) b ON a.BillCode=b.BillCode AND a.BillSn=b.BillSn ;
SELECT BillCode, BillSn, Dates, OnTime, GoodsId, BatchCode,
       ValDate, ProduceDate, Num, caozyName, BusinessId,
       BusinessCode,taskType
FROM ifSaleOut
WHERE Isdone = 'X';
-- �ص��������״̬
UPDATE ifSaleOut SET Isdone = 'Y' WHERE Isdone='X'
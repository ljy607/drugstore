-- �޸ĵ�λ��Ϣ�����Ӿ�Ӫ��Χ�ֶ�
ALTER TABLE t_dwxx 
ADD jyfw VARCHAR(100)

UPDATE t_dwxx SET jyfw = '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15' WHERE dwbh = '102'
UPDATE t_dwxx SET jyfw = '1,3,4,6,7,8,9,10,11,12,13,14,15' WHERE dwbh <> '102' AND dwbh IN('105','106','107','108','109','111')

ALTER TABLE t_dwxx 
ADD yyzzfzjg VARCHAR(100),ypjyxkzh VARCHAR(32),xkzlb VARCHAR(100),xkzfzjg VARCHAR(100)

ALTER TABLE t_dwxx 
ADD guid VARCHAR(50)

ALTER TABLE t_gysxx 
ADD jyfw VARCHAR(100), xkzh VARCHAR(32),xkzfzjg VARCHAR(100),yyzzfzrq datetime,yyzzfzjg VARCHAR(100),xkzlb VARCHAR(20)

--���¹�Ӧ����Ϣ
update g 
set g.xkzh=ts.xkzh,g.xkzfzjg=ts.xkzfzjg,g.sh=ts.zczh,g.yyzzfzrq=ts.yyzzfzrq,g.yyzzfzjg=ts.yyzzfzjg
FROM T_SYQYSPB ts
JOIN t_gysxx g ON g.gysmc = ts.gysmc

-- ͬ����Ʒ��Ϣ  2024��8��31�� 19:33:32
INSERT INTO bjsl.�м��.dbo.Assign_��Ʒ�ӿڱ�( ����,���,ԭ���,guid,����,��ѯ��,���,����,��λ,��Ч��,��׼�ĺ�
,��׼�ĺ�Ч��,ͨ������
,������,�ص�����Ʒ��,�Ƿ�OTC
,�Ƿ���ҩ,���, ��������, ����, ��������,��ѧ��,������ɳ�����,ע���̱�,��Ʒ����,��Ʒ����
,��������,����������ҵ��Ӫ��Χ,״̬)
SELECT '010013',s.SPBH,s.spbh,NEWID(),s.PM, s.JC,S.gg,case isnull(cd,'') WHEN '' then '-' ELSE cd END cd,jldw,yxqx,pzwh
,case s.pzwhyxq WHEN '1900/01/01' THEN '' ELSE isnull(s.pzwhyxq,'2026/12/31') end pzwhyxq,pm
,s.spbm,CASE yhlx WHEN 1 THEN '��' ELSE '��' END yhlx,case gmp WHEN 'Y' THEN '��' ELSE '��' END AS OTC
,CASE LEFT(spbh,1) WHEN '7' THEN '��' ELSE '��' end,jc,cjmc,jxmc,'����' cctj,hxmc,marketby,sb,s.jyfwid,'����' as hpdl
,'�����к��ҩ�����޹�˾',s.jx,case flag when 1 then '����' else '����' end   
FROM V_SPXx s
WHERE s.flag = 1 AND GXRQ > '2024.10.1'

-- �ͻ��� 0��Ӧ��
INSERT INTO bjsl.�м��_cs.dbo.Assign_�ͻ��ӿڱ�
(����,���,�ͻ�����,guid,����,��ѯ��,ԭ���,��ַ,�ջ���ַ,��ϵ��,�绰,��������,��ҵ����,���֤���
,��֤����,ͳһ������ô���,��Ӫ���֤����Ч����,��Ӫ���֤��,Ӫҵִ�պ�,Ӫҵִ����Ч����,�䷢����,״̬,��Ӫ��Χ)
SELECT '010013',GYSBH,0,NEWID(),GYSMC,GYSJC,gysbh,LXDZ,'',lxr,dh1,'�����к��ҩ�����޹�˾',lb,xkzlb
,xkzfzjg,sh,jyxkzrq,xkzh,sh,gsyzrq,yyzzfzrq,CASE flag WHEN 1 THEN '����' ELSE '����' end,jyfw 
FROM t_gysxx 
WHERE flag = 1 AND xkzh IS NOT null

-- �ͻ��� 1�ŵ�
INSERT INTO bjsl.�м��.dbo.Assign_�ͻ��ӿڱ�
(����,���,�ͻ�����,guid,����,��ѯ��,ԭ���,��ַ,�ջ���ַ,��ϵ��,�绰,��������,��Ӫ��Χ,��ҵ����,���֤���
,��֤����,ͳһ������ô���,��Ӫ���֤����Ч����,��Ӫ���֤��,Ӫҵִ�պ�,Ӫҵִ����Ч����,�䷢����,״̬)
SELECT '010013',dwbh,1,guid,dwmc,jc,dwbh,dwdz,dwdz,'',DH,'�����к��ҩ�����޹�˾',jyfw,'��Ӫ��ҵ',xkzlb
,xkzfzjg,sh,ypjyxkzyxrq,ypjyxkzh,sh,yyzzyxrq,yyzzfzrq,CASE flag WHEN 1 THEN '����' ELSE '����' end
FROM t_dwxx 
WHERE dwbh LIKE '1%' AND FLAG = 1 AND dwbh = '100'

-- �ͻ��ջ���ַ�ӿڱ�
INSERT INTO bjsl.�м��.dbo.Assign_�ͻ��ջ���ַ�ӿڱ�
(����,�ͻ����,�ͻ�����,��ַ���,guid,�ջ���ַ,��������,�ͻ�����,��ϵ��,��ϵ�绰)
SELECT '010013',dwbh,1,dwbh,guid,dwdz,dwmc,dwmc,'',DH
FROM t_dwxx 
WHERE dwbh LIKE '1%' AND FLAG = 1

INSERT INTO bjsl.�м��.dbo.Assign_�ͻ��ջ���ַ�ӿڱ�_each
(����,�ͻ����,�ͻ�����,��ַ���,guid,�ջ���ַ,��������,�ͻ�����,��ϵ��,��ϵ�绰)
SELECT '010013',dwbh,1,dwbh,guid,dwdz,dwmc,dwmc,'',DH
FROM t_dwxx 
WHERE dwbh LIKE '1%' AND FLAG = 1

-- ��Ӫ��ɷ�Χ�ӿڱ�
INSERT INTO bjsl.�м��.dbo.Assign_��Ӫ��ɷ�Χ�ӿڱ�
(����,��������,��Ӫ��ɷ�ΧID,��Ӫ��ɷ�Χ����,��ע,��������)
SELECT '010013' hz,'1' wlzx,b.code,b.name,b.note,''
FROM t_dwxx_jyfw a
JOIN t_options b ON a.jyfwid=b.code
WHERE b.pid = 5 AND dwbh = '000'

-- ������ҵ��Ӫ��Χ�ӿڱ�
INSERT INTO bjsl.�м��.dbo.Assign_������ҵ��Ӫ��Χ�ӿڱ�
(����,��������,������ҵ��Ӫ��ΧID,������ҵ��Ӫ��Χ����)
SELECT '010013' hz,1 wlzx,id,mc
FROM T_JX tj


-- Ҫ���ƻ�ͬ�� 2024��9��6�� 14:08:18
-- DELETE FROM bjsl.�м��_cs.dbo.Pass_���ӿڱ�_wait where ֪ͨ����='YH23000391'
INSERT INTO bjsl.�м��_cs.dbo.Pass_���ӿڱ�_wait
(��������,�������,����,֪ͨ����,֪ͨ���к�,�ͻ����,��Ʒ���,����,�ͻ�����,��Ʒ����,ʱ��,˵��,����,���,�ͻ�����,ҵ��Ա)
SELECT 2,1,'010013',z.yhdbh,m.ordr,m.gysbh,m.spbh,m.yhsl,g.gysmc,s.pm,z.yhrq,z.bz,m.jhj,m.jhj*m.yhsl,0,a.xm
FROM t_yhjhzb z
JOIN t_yhjhmx m ON m.YHDBH = z.YHDBH
JOIN V_SPXX s ON s.SPBH = m.SPBH
LEFT JOIN t_gysxx g ON m.GYSBH=g.GYSBH
LEFT JOIN t_zgxx a ON a.bh = z.ZBR
WHERE z.yhdbh = 'YH23000391' AND m.gysbh <> ''

--�˿ⵥ 
INSERT INTO bjsl.�м��_cs.dbo.Pass_���ӿڱ�_wait
(��������,�������,����,֪ͨ����,֪ͨ���к�,�ͻ����,��Ʒ���,����,�ͻ�����,��Ʒ����,ʱ��,˵��,����,���,�ͻ�����)
SELECT 1,2,'010013',z.tkdbh,m.ordr,m.spbh,m.shul,s.pm,z.tkrq,z.bz,m.jhjg,m.jhjg*m.shul,1,pcbh,yxrq,scrq,z.tkdw,d.dwmc
FROM t_tkdzb z
JOIN t_tkdmxb m ON m.tkDBH = z.tkDBH
JOIN V_SPXX s ON s.SPBH = m.SPBH
JOIN t_dwxx d on z.tkdw = d.dwbh
WHERE z.tkdbh = 'TK10523000545'

--�˻���
INSERT INTO bjsl.�м��_cs.dbo.Pass_����ӿڱ�_wait
(��������,��������,����,֪ͨ����,֪ͨ���к�,�ͻ����,��Ʒ���,����,����,�ͻ�����,��Ʒ����,����,���,˵��,�ͻ�����,ʱ��,_date)
SELECT 1,12,'',z.thdbh,m.ordr,m.GYSBH,m.spbh,m.thsl,m.pcbh,g.gysmc,s.pm,m.jhj,m.jhj*m.thsl AS je,z.bz,0,z.thrq,z.thrq
FROM t_thdzb z
JOIN t_thdmxb m ON m.THDBH = z.THDBH
JOIN t_gysxx g ON m.GYSBH=g.GYSBH
JOIN v_spxx s ON m.spbh=s.spbh
WHERE z.thdbh = 'TH22000358'

--���ⵥ
INSERT INTO bjsl.�м��_cs.dbo.Pass_����ӿڱ�_wait
(��������,��������,����,֪ͨ����,֪ͨ���к�,�ͻ����,��Ʒ���,����,����,�ͻ�����,��Ʒ����,����,���,˵��,�ͻ�����,ʱ��,_date,ҵ��Ա)
SELECT 1,11,'',z.ckdbh,m.ordr,z.jsdw,m.spbh,m.shul,m.pcbh,g.dwmc,s.pm,m.lsj,m.lsj*m.shul AS je,z.bz,0,z.ckrq,z.ckrq,a.xm
FROM t_ckdzb z
JOIN t_ckdmxb m ON m.ckDBH = z.ckDBH
JOIN t_dwxx g ON z.jsdw=g.dwbh
JOIN v_spxx s ON m.spbh=s.spbh
JOIN t_zgxx a ON z.ckr = z.bh 
WHERE z.ckdbh = 'ck24000037'

-- ��ʼ���˵� 2024��9��11�� 09:45:09
INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
VALUES('10','���������ϴ�',5,2,'���������ϴ�','image\tom_wap.gif','w_bjsl_djsc',1,1,0);

INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
VALUES('11','�������ݻ�ȡ',5,2,'�������ݻ�ȡ','image\tom_wap.gif','w_bjsl_djlq',1,1,0);

INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
VALUES('12','�������ݲ�ѯ',5,2,'�������ݲ�ѯ','image\tom_wap.gif','w_bjsl_fhjl',1,1,0);


-- ��ⵥ���ؽӿڱ�
SELECT �������� as wlzx,������� as rklx,���� as hz,wms�ջ����� as wmsdh,֪ͨ���� as tzdh,֪ͨ���к� as ordr
,��Ʒ��� as spbh,���� as pcbh,�ջ����� as shsl,�������� as jssl,ȡ������ as qxsl,������� as rkrq
,��Ʒ���� as pm,��Ч���� as yxrq,�������� as scrq,����ԭ�� as jsyy,����Ա as ysy,��׼�ĺ� as pzwh
,��׼�ĺ�Ч�� as pzwhyxq
FROM Pass_����ⷵ�ؽӿڱ�_wait t

-- ������¼���ر�
SELECT ������¼���� as yhjldh,������� as kqbh,��λ��� as hwbh,�������Ż����к� as pcbh
,�������� as yhrq,�������� as yhlx,����Ա as yhy,��������Ʒ��� as spbh,��������Ʒ���� as pm,�����ͺ� as gg
,���� as cd,�������� as sccj,��λ as jldw,�������� as cctj,�������� as kqmc,��λ���� as hwmc,��Ч���� as yxrq
,�������� as scrq,�������� as yhsl,����״�� as zlzk,������� as clyj,�������� as yhjl
FROM Book_������¼���ؽӿڱ�_each

--�����¼
SELECT ������ as hdh,֪ͨ���� as tzdh,֪ͨ���к� as tzdhh,��������Ʒ��� AS spbh,��������Ʒ���� as pm
,�������ͻ���� as dwbh,�������ͻ����� as dwmc,����ʱ�� as fysj,����ʱ�� as dhsj,���ƺ��� as cphm,˾�� as sj
,�ջ���λ as shdw,�ջ���ַ as shdz,�ջ��� as shr,���䷽ʽ as ysfs
FROM Book_�����¼���ؽӿڱ�_each

--��������
SELECT DISTINCT wms�ջ����� AS wmsdh,֪ͨ���� as dh
FROM Pass_����ⷵ�ؽӿڱ�_wait
WHERE ֪ͨ���� LIKE 'JH%' and  ���� = :a
ORDER BY ֪ͨ���� desc

SELECT wms�ջ����� AS dh,֪ͨ���� as yhdbh,֪ͨ���к� as ordr,��Ʒ��� as spbh,���� as pcbh,�ջ����� as shsl
,�������� as jssl,ȡ������ as qxsl,_date as rkrq,��Ч���� as yxrq,�������� as scrq,����Ա as ysy
FROM Pass_����ⷵ�ؽӿڱ�_wait
WHERE WMS�ջ����� = :a

--���ֳ��ⷵ�ؽӿڱ�
SELECT DISTINCT ֪ͨ���� as dh,�������� as ckrq
FROM Pass_���ⷵ�ؽӿڱ�_wait
WHERE ��������=11 and ����=:a

SELECT ֪ͨ���� as dh,֪ͨ���к� as ordr,��Ʒ��� as spbh,���� as pcbh,�������� as cksl,��Ʒ���� as pm
,��Ч���� as yxrq,�������� as scrq
FROM Pass_���ⷵ�ؽӿڱ�_wait
WHERE ֪ͨ����=:a





--���ؼ�¼��ѯ
----�����¼
SELECT ֪ͨ���� dh,֪ͨ���к� ordr,�������Ż����к� pcbh,��������Ʒ��� spbh,��������Ʒ���� pm
,����ʱ�� fysj,����ʱ�� dhsj,���ƺ��� cphm,˾�� sj,�ջ���λ shdw,�ջ���ַ shdz,�����ͺ� gg
,���� cd,��λ jldw,��Ч���� yxrq,�������� scrq,�������� shul,����Ա psy,������ fyr
,����ʱ�� fhsj,ί�о����� jbr,���˵�λ cydw,������ַ fhdz,���� jx,���䷽ʽ ysfs,��Ʒ��װ spbz,�������� zjsl
,ɢ������ sjsl
FROM book_�����¼���ؽӿڱ�_each
WHERE �������=:a and ֪ͨ���� LIKE  '%'+:b+'%'

--�����¼
SELECT ֪ͨ���� dh,֪ͨ���к� ordr,������ cyjg,���鴦���ʩ cyclcs,�������ͻ���� khbh,�������ͻ����� khmc
,����ʱ�� dhsj,�������� cyrq,������� rklx,ҵ��Ա ywy,����Ա cyy,��������Ʒ��� spbh,��������Ʒ���� pm
,�����ͺ� gg,���� cd,�������� sccj,��λ jldw,��װ bzsl,�������� cctj,ע��֤�� zczh
,������ҵ���֤�Ż򱸰�ƾ֤�� xkzh,��Ʒ���� hpdl,��Ʒ���� hpsx,��Ч���� yxrq,�������� scrq,�ϸ�֤�� hgzm
,�ƻ����� jhsl,����ԭ�� jsyy,�������� cysl,����ϸ����� hgsl,ʵ�ʼ��� sjjs,���ϸ����� bhgsy
,�����ʩ clcs,�������� hzmc,���� jx,��׼�ĺ� pzwh,�������Ż����к� pcbh
FROM book_�����¼���ؽӿڱ�_each
WHERE �������=:a and ֪ͨ���� like '%'+:b+'%'

--���˼�¼
SELECT ֪ͨ���� dh,֪ͨ���к� ordr,������� kqbh,��λ��� hwbh,�������Ż����к� pcbh,�������ͻ���� khbh
,�������ͻ����� khmc,�������� fhrq,�������� cklx,���Ա jhy,����Ա fhy,��������Ʒ��� spbh,��������Ʒ���� pm
,�����ͺ� gg,���� cd,�������� sccj,��λ jldw,��װ bzsl,�������� cctj,ע��֤�� zczh
,������ҵ���֤�Ż򱸰�ƾ֤�� xkzh,��Ʒ���� hpdl,��Ʒ���� hpsx,�������� kqmc,��λ���� hwmc,��Ч���� yxrq
,�������� scrq,�ƻ����� jhsl,�������� fhsl,���� jx,����״�� zlzk,�������� hzmc,'' ����
FROM book_���˼�¼���ؽӿڱ�_each
WHERE �������=:a and ֪ͨ���� like '%'+:b+'%'

--�ջ���¼
SELECT ֪ͨ���� dh,֪ͨ���к� ordr,�������Ż����к� pcbh,�������ͻ���� khbh
,�������ͻ����� khmc,�ջ����� shrq,������� rklx,ҵ��Ա ywy,�ջ�Ա shy,��������Ʒ��� spbh,��������Ʒ���� pm
,�����ͺ� gg,���� cd,�������� sccj,��λ jldw,��װ bz,�������� cctj,ע��֤�� zczh
,������ҵ���֤�Ż򱸰�ƾ֤�� xkzh,��Ʒ���� hpdl,��Ʒ���� hpsx,���ͬ��Ʊ�� shtxph,���˷�ʽ cyfs,��Ч���� yxrq
,�������� scrq,�ƻ����� jhsl,ʵ������ sssl,�������� jssl,����ʱ�� dhsj,�ջ����� shjl,�������� hzmc,����ʱ�� fhsj
,���䷽ʽ ysfs,'�����д������йش�Ƽ�԰����������ҽҩ��ҵ�����پ�·13��Ժ1��¥1��' shdz,���� jx
FROM book_�ջ���¼���ؽӿڱ�_each
WHERE �������=:a and ֪ͨ���� like '%'+:b+'%'

--�̵��¼
SELECT ֪ͨ���� dh,֪ͨ���к� ordr,������� kqbh,��λ��� hwbh,�������Ż����к� pcbh,�̵㵥�� pddh
,�̵����� pdrq,�̵����� pdlx,����Ա czy,ְԱ���� zybm,��������Ʒ��� spbh,��������Ʒ���� pm
,�����ͺ� gg,���� cd,�������� sccj,��λ jldw,��װ bzsl,�������� cctj,ע��֤�� zczh
,������ҵ���֤�Ż򱸰�ƾ֤�� xkzh,��Ʒ���� hpdl,��Ʒ���� hpsx,�������� kqmc,��λ���� hwmc,��Ч���� yxrq
,�������� scrq,�̵����� pdsl,ժҪ zy,��ע bz
FROM book_�̵��¼���ؽӿڱ�_each
WHERE �������=:a and ֪ͨ���� like '%'+:b+'%'

-- �ջ���¼
SELECT ֪ͨ���� dh,֪ͨ���к� ordr,�������Ż����к� pcbh,�������ͻ���� khbh
,�������ͻ����� khmc,�ջ����� shrq,������� rklx,ҵ��Ա ywy,�ջ�Ա shy,��������Ʒ��� spbh,��������Ʒ���� pm
,�����ͺ� gg,���� cd,�������� sccj,��λ jldw,��װ bz,�������� cctj,ע��֤�� zczh
,������ҵ���֤�Ż򱸰�ƾ֤�� xkzh,��Ʒ���� hpdl,��Ʒ���� hpsx,���ͬ��Ʊ�� shtxph,���˷�ʽ cyfs,��Ч���� yxrq
,�������� scrq,�ƻ����� jhsl,ʵ������ sssl,�������� jssl,����ʱ�� dhsj,�ջ����� shjl
FROM book_�ջ���¼���ؽӿڱ�_each
WHERE �������=:a and ֪ͨ���� like '%'+:b+'%'

-- ������¼
SELECT ������¼���� dh,������� kqbh,��λ��� hwbh,�������Ż����к� pcbh
,�������� yhrq,�������� yhlx,����Ա yhy,��������Ʒ��� spbh,��������Ʒ���� pm
,�����ͺ� gg,���� cd,�������� sccj,��λ jldw,��װ bzsl,�������� cctj,ע��֤�� zczh
,������ҵ���֤�Ż򱸰�ƾ֤�� xkzh,��Ʒ���� hpdl,��Ʒ���� hpsx,�������� kqmc,��λ���� hwmc,��Ч���� yxrq
,�������� scrq,�������� yhsl,����״�� zlzk,������� clyj,�������� yhjl,˵�� sm
FROM book_������¼���ؽӿڱ�_each
WHERE �������=:a and ������¼���� like '%'+:b+'%'

-- �ջ�����¼
SELECT wms�ջ����� wmsdh,֪ͨ���� dh,֪ͨ���к� ordr,��Ʒ��� spbh,���� pcbh,�ջ����� shsl,�������� jssl
,ȡ������ qxsl,������� rkrq,��Ʒ���� pm,��Ч���� yxrq,�������� scrq,����ԭ�� jsyy,����Ա ysy,��׼�ĺ� pzwh
,��׼�ĺ�Ч�� pzwhyxq,˵�� sm,ע��֤�� zczh,ע��֤Ч�� zczxq,������ҵ���֤�Ż򱸰�ƾ֤�� xkzh
,������ҵ���֤�Ż򱸰�ƾ֤��Ч�� xkzxq,���ͬ��Ʊ�� shtxph,�������� wlzx,������� rklx,���� hz
,������� mjph,������ klx
from pass_����ⷵ�ؽӿڱ�_wait
WHERE ֪ͨ���� = :a


-- ����������������¼ 2024��10��9�� 14:46:17
CREATE TABLE t_bjsl_rkjl
(
	wlzx INT NOT null,			--��������
	rklx INT NOT null,			--�������
	hz NVARCHAR(50) NOT null,	--����
	wmsdh NVARCHAR(20) NOT NULL,--wms�ջ�����
	dh NVARCHAR(50) NOT NULL,	--֪ͨ����
	hh INT	NOT NULL,			--֪ͨ���к�
	spbh NVARCHAR(50) NOT NULL,	--����
	pcbh NVARCHAR(50) NOT NULL,	--����
	mjph NVARCHAR(50) NOT NULL,	--�������
	klx INT NOT NULL,			--������
	shsl DECIMAL(18,4),			--�ջ�����
	jssl DECIMAL(18,4),			--��������
	qxsl DECIMAL(18,4),			--ȡ������
	rkrq DATETIME,				--�������
	pm NVARCHAR(50),			--��Ʒ����
	yxrq DATETIME,				--��Ч����
	scrq DATETIME,				--��������
	sm NVARCHAR(200),			--˵��
	ysy NVARCHAR(50),			--����Ա
	zczh NVARCHAR(100),			--ע��֤��
	zczxq DATETIME,				--ע��֤Ч��
	pzwh NVARCHAR(100),			--��׼�ĺ�
	pzwhxq DATETIME,			--��׼�ĺ�Ч��
	xkzh NVARCHAR(100),			--������ҵ���֤�Ż򱸰�ƾ֤��
	xkzxq DATETIME,				--������ҵ���֤�Ż򱸰�ƾ֤��Ч��
	shtxph NVARCHAR(1000),		--���ͬ��Ʊ��
	PRIMARY KEY(wlzx,rklx,hz,wmsdh,dh,hh,spbh,pcbh,mjph,klx)
)




/****************
* ���ܣ����Ͳɹ��ƻ��������������ݿ�
* ʱ�䣺2024��9��11�� 13:31:00
* ������hz varchar(30)		����
*		yhdbh varchar(32)	Ҫ������
****************/
create PROCEDURE bjsl_cgjh @yhdbh varchar(32),@hz VARCHAR(30) AS
begin

INSERT INTO bjsl.�м��_cs.dbo.Pass_���ӿڱ�_wait
(��������,�������,����,֪ͨ����,֪ͨ���к�,�ͻ����,��Ʒ���,����,����,�ͻ�����,��Ʒ����,��Ч����,
��������,ҵ��Ա,ʱ��,˵��,����,���)
SELECT 1,1,@hz,z.yhdbh,m.ordr,m.gysbh,m.spbh,m.yhsl,'',g.gysmc,s.pm,'','','',z.yhrq,z.bz,m.jhj,m.jhj*m.yhsl
FROM t_yhjhzb z
JOIN t_yhjhmx m ON m.YHDBH = z.YHDBH
JOIN V_SPXX s ON s.SPBH = m.SPBH
LEFT JOIN t_gysxx g ON m.GYSBH=g.GYSBH
WHERE isnull(m.gysbh,'') <> '' AND z.yhdbh = @yhdbh;

END 
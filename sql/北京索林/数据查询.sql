SELECT *  -- delete 
FROM Assign_��Ʒ�ӿڱ�_each
WHERE ����='010013' and ��� in('100816','400426','11787','4074110','409978')

SELECT *  -- delete 
FROM Assign_�ͻ��ջ���ַ�ӿڱ�_each
WHERE ����='010013'

SELECT *
FROM Pass_����ӿڱ�_wait
WHERE ����='010013'

SELECT *  -- delete
FROM Pass_����ӿڱ�_each
WHERE ����='010013'

SELECT *  -- delete 
FROM pass_���ӿڱ�_each
WHERE ����='010013' and ֪ͨ����='YH24000791'

SELECT *  -- delete 
FROM pass_���ӿڱ�_wait
WHERE ����='010013' and ֪ͨ����='YH24000791_00432'

SELECT *  -- delete 
FROM pass_����ⷵ�ؽӿڱ�_wait
WHERE ����='010013'

SELECT *  -- delete 
FROM pass_����ⷵ�ؽӿڱ�_each
WHERE ����='010013'

SELECT *  -- delete 
FROM Pass_��ⷵ�ؽӿڱ�_wait
WHERE ����='010013'

SELECT *  -- delete 
FROM Pass_��ⷵ�ؽӿڱ�_each
WHERE ����='010013'

SELECT *  -- delete 
FROM Pass_���ⷵ�ؽӿڱ�_wait
WHERE ����='010013'

SELECT *   -- delete 
FROM Pass_���ⷵ�ؽӿڱ�_each
WHERE ����='010013'

SELECT *   -- delete 
FROM book_�����¼���ؽӿڱ�_each
WHERE �������='010013' and ֪ͨ���� = 'YH24001087_00338' 

SELECT *   -- delete 
FROM book_���˼�¼���ؽӿڱ�_each
WHERE �������='010013'

SELECT *   -- delete 
FROM book_�̵��¼���ؽӿڱ�_each
WHERE �������='010013'

SELECT *  -- delete 
FROM book_�ջ���¼���ؽӿڱ�_each
WHERE �������='010013'

SELECT *  -- delete 
FROM book_�����¼���ؽӿڱ�_each
WHERE �������='010013'

SELECT *  -- delete 
FROM book_������¼���ؽӿڱ�_each
WHERE �������='010013'

SELECT *  -- delete 
FROM Assign_�ͻ��ӿڱ�_each
WHERE ����='010013'

SELECT DISTINCT wms�ջ����� AS dh,֪ͨ���� as yhdbh
FROM Pass_����ⷵ�ؽӿڱ�_wait
WHERE ֪ͨ���� LIKE 'JH%' 
ORDER BY ֪ͨ���� desc


SELECT ֪ͨ���� as dh,֪ͨ���к� as ordr,�������Ż����к� as pcbh,��������Ʒ��� as spbh,��������Ʒ���� as pm
,����ʱ�� as fysj,����ʱ�� as dhsj,���ƺ��� as cphm,˾�� as sj,�ջ���λ as shdw,�ջ���ַ as shdz,�����ͺ� as gg
,���� as cd,��λ as jldw,��Ч���� as yxrq,�������� as scrq,�������� as shul,����Ա as pAS,������ as fyr
,����ʱ�� fhsj,ί�о����� jbr,���˵�λ cydw,������ַ fhdz,���� jx,���䷽ʽ ysfs,��Ʒ��װ spbz,�������� zjsl
,ɢ������ sjsl
FROM book_�����¼���ؽӿڱ�_each
WHERE  �������=:a and ֪ͨ���� like '%'+:b+'%'

SELECT distinct ���鵥�� cydh,֪ͨ���� dh,�������ͻ���� khbh,�������ͻ����� khmc,����ʱ�� dhsj,�������� cyrq,������������ wlzxmc
FROM book_�����¼���ؽӿڱ�_each
WHERE �������=:a 

SELECT ֪ͨ���� dh,֪ͨ���к� ordr,������ cyjg,���鴦���ʩ cyclcs,�������ͻ���� khbh,�������ͻ����� khmc
,����ʱ�� dhsj,�������� cyrq,������� rklx,ҵ��Ա ywy,����Ա cyy,��������Ʒ��� spbh,��������Ʒ���� pm
,�����ͺ� gg,���� cd,�������� sccj,��λ jldw,��װ bzsl,�������� cctj,ע��֤�� zczh
,������ҵ���֤�Ż򱸰�ƾ֤�� xkzh,��Ʒ���� hpdl,��Ʒ���� hpsx,��Ч���� yxrq,�������� scrq,�ϸ�֤�� hgzm
,�ƻ����� jhsl,����ԭ�� jsyy,�������� cysl,����ϸ����� hgsl,ʵ�ʼ��� sjjs,���ϸ����� bhgsy
,�����ʩ clcs,_id id,���� jx,��׼�ĺ� pzwh,������������ wlzxmc,��������ID wlzx,���鵥�� cydh
,�������Ż����к� pcbh,������� hz,�������� hzmc
FROM book_�����¼���ؽӿڱ�_each
WHERE �������=:a and ���鵥�� = :b

----- ���˼�¼ 2024��11��19�� 14:38:51
SELECT distinct ֪ͨ���� dh,_date ckrq
FROM book_���˼�¼���ؽӿڱ�_each
WHERE �������= :a

SELECT ֪ͨ���� dh,֪ͨ���к� ordr,������� kqbh,��λ��� hwbh,�������Ż����к� pcbh,�������ͻ���� khbh
,�������ͻ����� khmc,�������� fhrq,�������� cklx,���Ա jhy,����Ա fhy,��������Ʒ��� spbh,��������Ʒ���� pm
,�����ͺ� gg,���� cd,�������� sccj,��λ jldw,��װ bzsl,�������� cctj,ע��֤�� zczh
,������ҵ���֤�Ż򱸰�ƾ֤�� xkzh,��Ʒ���� hpdl,��Ʒ���� hpsx,�������� kqmc,��λ���� hwmc,��Ч���� yxrq
,�������� scrq,�ƻ����� jhsl,�������� fhsl,���� jx,����״�� zlzk,��������ID wlzx,���˵��� fhdh,_id id
,_date ckrq,������������ wlzxmc,������� hz,�������� hzmc
FROM book_���˼�¼���ؽӿڱ�_each
WHERE �������=:a and ֪ͨ����=:b


SELECT ֪ͨ���� dh,֪ͨ���к� ordr,������� kqbh,��λ��� hwbh,�������Ż����к� pcbh,�̵㵥�� pddh
,�̵����� pdrq,�̵����� pdlx,����Ա czy,ְԱ���� zybm,��������Ʒ��� spbh,��������Ʒ���� pm
,�����ͺ� gg,���� cd,�������� sccj,��λ jldw,��װ bzsl,�������� cctj,ע��֤�� zczh
,������ҵ���֤�Ż򱸰�ƾ֤�� xkzh,��Ʒ���� hpdl,��Ʒ���� hpsx,�������� kqmc,��λ���� hwmc,��Ч���� yxrq
,�������� scrq,�̵����� pdsl,ժҪ zy,��ע bz
FROM book_�̵��¼���ؽӿڱ�_each
WHERE �������=:a and ֪ͨ���� like '%'+:b+'%'

SELECT ֪ͨ���� dh,֪ͨ���к� ordr,�������Ż����к� pcbh,�������ͻ���� khbh
,�������ͻ����� khmc,�ջ����� shrq,������� rklx,ҵ��Ա ywy,�ջ�Ա shy,��������Ʒ��� spbh,��������Ʒ���� pm
,�����ͺ� gg,���� cd,�������� sccj,��λ jldw,��װ bz,�������� cctj,ע��֤�� zczh
,������ҵ���֤�Ż򱸰�ƾ֤�� xkzh,��Ʒ���� hpdl,��Ʒ���� hpsx,���ͬ��Ʊ�� shtxph,���˷�ʽ cyfs,��Ч���� yxrq
,�������� scrq,�ƻ����� jhsl,ʵ������ sssl,�������� jssl,����ʱ�� dhsj,�ջ����� shjl
FROM book_�ջ���¼���ؽӿڱ�_each
WHERE �������=:a and ֪ͨ���� like '%'+:b+'%'


SELECT ������¼���� dh,������� kqbh,��λ��� hwbh,�������Ż����к� pcbh
,�������� yhrq,�������� yhlx,����Ա yhy,��������Ʒ��� spbh,��������Ʒ���� pm
,�����ͺ� gg,���� cd,�������� sccj,��λ jldw,��װ bzsl,�������� cctj,ע��֤�� zczh
,������ҵ���֤�Ż򱸰�ƾ֤�� xkzh,��Ʒ���� hpdl,��Ʒ���� hpsx,�������� kqmc,��λ���� hwmc,��Ч���� yxrq
,�������� scrq,�������� yhsl,����״�� zlzk,������� clyj,�������� yhjl,˵�� sm
FROM book_������¼���ؽӿڱ�_each
WHERE �������=:a and ������¼���� like '%'+:b+'%'

---- �ջ����ͷ��Ϣ 
SELECT DISTINCT wms�ջ����� AS dh,֪ͨ���� as yhdbh,ʱ�� dhrq
FROM Pass_����ⷵ�ؽӿڱ�_wait
WHERE ���� = :a

-- �ջ�����¼��ϸ
SELECT wms�ջ����� wmsdh,֪ͨ���� dh,֪ͨ���к� ordr,��Ʒ��� spbh,���� pcbh,�ջ����� shsl,�������� jssl
,ȡ������ qxsl,������� rkrq,��Ʒ���� pm,��Ч���� yxrq,�������� scrq,����ԭ�� jsyy,����Ա ysy,��׼�ĺ� pzwh
,��׼�ĺ�Ч�� pzwhyxq,˵�� sm,ע��֤�� zczh,ע��֤Ч�� zczxq,������ҵ���֤�Ż򱸰�ƾ֤�� xkzh
,������ҵ���֤�Ż򱸰�ƾ֤��Ч�� xkzxq,���ͬ��Ʊ�� shtxph,�������� wlzx,������� rklx,���� hz
,������� mjph,������ klx,ʱ�� dhrq,���״̬ wczt,�������� rwhs,��װ bzsl
from pass_����ⷵ�ؽӿڱ�_wait
WHERE ���� = :a and wms�ջ����� = :b

-- �����¼ͷ��Ϣ
SELECT DISTINCT ֪ͨ���� dh
FROM Pass_���ⷵ�ؽӿڱ�_wait
WHERE ��������=11 and ���� = :a

--�����¼��ϸ
SELECT ֪ͨ���� dh,֪ͨ���к� ordr,��Ʒ��� spbh,���� pcbh,�������� cksl,�������� cysl
,��Ʊ���� kpsl,�������� ckrq,��Ʒ���� pm,��Ч���� yxrq,�������� scrq,�������� wlzx,�������� cklx,���� hz
,������� mjph,������ klx,��װ bzsl,���״̬ wczt,�������� rwhs,˵�� shm,������� ckjs
FROM Pass_���ⷵ�ؽӿڱ�_wait
WHERE ����=:a and ֪ͨ����=:b

-- �˿��¼����Ӧ������ⷵ�ؽӿڱ� 2024��11��19�� 10:04:35
SELECT DISTINCT ֪ͨ���� dh, ������� rkrq
FROM Pass_��ⷵ�ؽӿڱ�_wait
WHERE ����=:a

SELECT ֪ͨ���� dh,֪ͨ���к� ordr,��Ʒ��� spbh,���� pcbh,�ջ����� shsl,�������� jssl
,ȡ������ qxsl,������� rkrq,��Ʒ���� pm,��Ч���� yxrq,�������� scrq,����ԭ�� jsyy,����Ա ysy,��׼�ĺ� pzwh
,��׼�ĺ�Ч�� pzwhyxq,˵�� sm,ע��֤�� zczh,ע��֤Ч�� zczxq,������ҵ���֤�Ż򱸰�ƾ֤�� xkzh
,������ҵ���֤�Ż򱸰�ƾ֤��Ч�� xkzxq,���ͬ��Ʊ�� shtxph,�������� wlzx,������� rklx,���� hz
,������� mjph,������ klx,ʱ�� dhrq,���״̬ wczt,�������� rwhs,��װ bzsl
from pass_��ⷵ�ؽӿڱ�_wait
WHERE ���� = :a and ֪ͨ���� = :b


-- ���ռ�¼���ر����Ϊ�յ� 2024��11��12�� 14:29:02
SELECT a.���,a.����,a.��׼�ĺ�,b.����,b.��׼�ĺ�  -- delete 
FROM Assign_��Ʒ�ӿڱ�_each  a
JOIN book_�����¼���ؽӿڱ�_each b on a.���=b.��������Ʒ���
WHERE b.�������='010013' and b.���� is null


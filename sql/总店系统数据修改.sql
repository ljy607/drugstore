------------��¼������ 2021��9��15�� 16:23:45
INSERT INTO t_jhdzb(JHDBH, JHRQ, GYSBH, FKQX, PJKL, LRR, JSBZ, BZ, fkbz, ysr, JHDW,
            yhdbh, pmje, wmsflag, zpflag, dhrq, fdyhd, fdckd, zdfh, flag)
SELECT 'JH21001721',jhrq,'00347',FKQX, PJKL, LRR, JSBZ, BZ, fkbz, ysr, JHDW, yhdbh, 858,
       wmsflag, zpflag, dhrq, fdyhd, fdckd, zdfh, flag
FROM t_jhdzb 
WHERE jhrq BETWEEN '2021-5-9' AND '2021-5-11'
AND jhdbh = 'JH21000872'

INSERT INTO t_jhdmxb(JHDBH, ORDR, LPHM, SPBH, YXQ, SCRQ, PCBH, SL, PFJ, JHJ, LSJ,
            GBJ, KL, HWBH, FLAG, SCCJ, PZWH, fkbz, FK, DJZBH, WLHBS, qjhj,
            HGSL, YHSL, fhflag, cd, scqyxkzh, jybgpath)
SELECT 'JH21001721', 1, '0072', spbh, '2023-02-01', SCRQ, '129211068', 30, PFJ, 28.6, LSJ, GBJ, KL, HWBH,
       FLAG, SCCJ, PZWH, fkbz, FK, DJZBH, WLHBS, qjhj, 30, 30, fhflag, cd,
       scqyxkzh, 'E:\����\WORKPATH\��ҩ�ع�\11447_129211068.jpg'
FROM t_jhdmxb 
WHERE jhdbh = 'JH21001153' AND spbh = '11447'
------- �޸� ���ⵥ ����
SELECT *  -- update a set a.pcbh= '129211068'
FROM t_ckdmxb a
WHERE ckdbh = 'CK21000639' AND spbh = '11447'



----- �޸Ľ����� ��Ӧ�� 2021��9��14�� 14:06:53
SELECT jhdbh,jhrq,gysbh,pmje   -- update a set a.gysbh='00336'
FROM T_JHDZB a
WHERE jhdbh IN('jh21001652','jh21001653')
---- ��ѯ��������ҩ��¼�����漰��Ӧ�����������ݣ��漰��ͬʱ�޸Ķ�Ӧ��Ӧ�� 
SELECT *
FROM T_JKYPDJB 
WHERE jhdbh IN('jh21001652','jh21001653')

--SELECT * FROM t_gysxx WHERE gysbh = '00336'

------ɾ���˻����� �˻�������Ʒ���� 2021��7��29�� 10:24:13 ----------------
SELECT *  -- delete c
FROM T_THDMXB tt
JOIN T_THDZB tt2 ON tt2.THDBH = tt.THDBH
JOIN t_chxx c ON tt.spbh = c.spbh AND tt.pcbh = c.PCBH
WHERE tt.THDBH IN('th21000215','th21000224')

-----���½����������ʶ 2021��6��1�� 16:20:17 ---------------
SELECT z.*
FROM t_jhdzb z
WHERE z.jhdbh in( 'JH20000027','JH20000098','JH20000481','JH20001207')

SELECT z.*
FROM t_jhdzb z
WHERE z.jhdbh in( 'JH19001870','JH19002739')


SELECT m.jhdbh,m.ORDR,m.spbh,m.fkbz,m.FK  -- update m set m.fkbz = 0
FROM t_Jhdmxb m  
WHERE m.jhdbh in( 'JH20000027','JH20000098','JH20000481','JH20001207')

SELECT m.jhdbh,m.ORDR,m.spbh,m.fkbz,m.FK,m.id   -- update m set m.fkbz = 0
FROM t_Jhdmxb m  
-- LEFT JOIN T_FKJLMXB tf ON m.id = tf.id --AND tf.lx = 1
WHERE m.jhdbh in( 'JH19001870','JH19002739')

SELECT * FROM T_FKJLMXB tf WHERE tf.FKJLBH='2021000226'

SELECT * 
FROM t_fkjlzb a 
JOIN t_fkjlmxb b ON a.FKJLBH=b.FKJLBH
WHERE a.gysbh = '000304'--#  �˻�����
SELECT *
FROM T_FKJLMXB tf 
JOIN T_THdmxb tm ON tf.ID=tm.id AND tf.lx=2
WHERE tf.FKJLBH='2021000226'

--# ��������
SELECT tf.*,tz.jhdbh,tz.gysbh,tm.SL, tm.JHJ, tm.KL, tm.fkbz,sl*jhj
FROM T_FKJLMXB tf 
JOIN T_jHdmxb tm ON tf.ID=tm.id AND tf.lx=1
JOIN t_jhdzb tz ON tm.JHDBH=tz.JHDBH
WHERE tf.FKJLBH='2021000226'

----- ��ѯ������������ͼ۵���Ʒ 2021��4��20�� 17:20:20 --------------
SELECT g.GYSMC,m.spbh,s.pm,s.gg,s.CJMC,min(m.jhj)
FROM t_jhdzb z
JOIN t_jhdmxb m ON m.JHDBH = z.JHDBH
JOIN v_spxx s ON m.spbh = s.SPBH
JOIN t_gysxx g ON z.GYSBH=g.GYSBH
WHERE DATEDIFF(DAY,z.JHRQ,GETDATE()) < 181
GROUP BY g.GYSMC,s.pm,m.spbh,s.gg,s.CJMC
ORDER BY m.spbh

-------------- �޸�������ⵥ״̬ 2021��4��14�� 18:02:09 ----------
SELECT *   -- UPDATE a SET a.yxbz = 15
FROM T_CKDZB a
WHERE jsdw = '201' AND yxbz = 10


--------------��ѯ�����Ʒ��Ϣ  2021��4��3�� 13:24:08  -------------
SELECT DISTINCT a.spbh,s.pm,s.gg,s.CJMC,s.GMP,j.lsj,j.ZDJJ,s.is
FROM t_fgskc a 
JOIN V_SPXX s ON a.spbh = s.SPBH
JOIN t_jgxx j ON a.spbh = j.SPBH
WHERE a.shul - a.yxsl > 0

----------����ϵͳ���ݵ���sql  2021��4��2�� 11:11:55 -------------
SELECT a.spbh �̼ұ���,a.spbh ��Ʒ����,b.pm ��Ʒ����,b.gg �������,'' �����,b.spbm ����,0 ����ۼ�,0 ���ۼ�,0 �ɱ���,
0 ������, 0 ��Ա��,0 �г���,0 ��Ч��,0 ��,0 ��,0 ��,0 ����,0 ˰��,0 �������к�,0 �������,0 ���ⲻ�����,
0 ����0�ɱ�,0 ������ڳɱ���,0 ���ս���,0 ���,0 ��Ʒ������λ,0 ��Ʒ������λ,a.pcbh ��Ʒ�Զ���1,a.yxrq ��Ʒ�Զ���2,
'' ��Ʒ�Զ���3,'' ��Ʒ�Զ���4,'' ��Ʒ�Զ���5,'' ��Ʒ�Զ���6,'' ���������,'' ����ջ���,'' ���ۻ���,'' �������,
'' �������,'' ��Ʒ��ע,'' ͬһ���γ���
FROM t_ckdmxb a
JOIN v_spxx b ON a.spbh=b.spbh
WHERE ckdbh = 'CK19000314'


--------2020��2��8�� 20:35:38
-----�����ܵ���ʱɾ������ ��˾ϵͳ������304972��304973��30434������Ʒ2020��1��22��ǰ�Ľ�����¼
SELECT m.* -- UPDATE m SET m.FLAG = 0
FROM t_jhdmxb m
JOIN t_jhdzb z ON z.JHDBH = m.JHDBH
WHERE z.jhrq > '2020.1.22' AND m.spbh IN ('304972','304973','30434')

---- �޸Ĺ�˾���۵����  2021��3��10�� 17:21:36
SELECT *
FROM t_chxx 
WHERE spbh = '30924'

---- ����̨������ 
SELECT *  --  UPDATE a SET a.sl=50,a.jine=50*jiag
FROM t_ckmx a
WHERE djhm = 'gsls' AND SPBH='30924' AND ordr=28

---- �����������
INSERT INTO t_chxx(SPBH, PCBH, yxrq, jiag,sccj,scrq,dhrq,CHSL,HWBH, FLAG)
SELECT TOP 1 spbh,pcbh,yxq,jhj,sccj,SCRQ,b.jhrq,50,'H01',1
FROM t_jhdmxb a
JOIN t_jhdzb b ON b.JHDBH = a.JHDBH
WHERE spbh = '30924' AND pcbh = '20200908'
ORDER BY a.jhdbh desc






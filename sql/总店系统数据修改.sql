----- �ֹ������۵� 2022��12��10�� 15:45:03
--SELECT MAX(bjdbh)
--FROM t_bjdzb 
--WHERE bjrq > '2022.1.1'

--INSERT INTO t_bjdzb
--SELECT 'BJ22000292', BJRQ, PZR, KPR, BZ, JSBZ, DWBH, DWMC
--FROM t_bjdzb WHERE bjdbh = 'BJ22000291'

--SELECT m.*,j.lsj,j.zdjj,j.pfj,j.gbj,j.dslsj,j.hyj 
---- update m set m.lszk=100,m.jlsj=j.lsj,m.jpfj=j.pfj,m.jgbj=j.gbj,m.dbj=j.zdjj,m.jdslsj=j.dslsj,m.jhyj=j.hyj
--FROM t_bjdmxb m
--JOIN t_jgxx j ON j.SPBH = m.SPBH
--WHERE bjdbh = 'BJ22000292'

--------------- �޸ľ�Ӫ��Χ 2022��7��29�� 10:50:25 -----------------
--INSERT INTO t_options(	pid,code,name,note,sort,flag)
--VALUES( 5,8,'�г�ҩ','�г�ҩ',1,1 );
--INSERT INTO t_options(	pid,code,name,note,sort,flag)
--VALUES( 5,9,'��ѧҩ�Ƽ�','��ѧҩ�Ƽ�',2,1 );
--INSERT INTO t_options(	pid,code,name,note,sort,flag)
--VALUES( 5,10,'������','������',3,1 );
--INSERT INTO t_options(	pid,code,name,note,sort,flag)
--VALUES( 5,11,'ʳƷ','ʳƷ',4,1 );
--INSERT INTO t_options(	pid,code,name,note,sort,flag)
--VALUES( 5,12,'����Ʒ','����Ʒ',5,1 );
--INSERT INTO t_options(	pid,code,name,note,sort,flag)
--VALUES( 5,13,'������','������',6,1 );
--INSERT INTO t_options(	pid,code,name,note,sort,flag)
--VALUES( 5,14,'��ױƷ','��ױƷ',7,1 );
--INSERT INTO t_options(	pid,code,name,note,sort,flag)
--VALUES( 5,15,'�ջ�','�ջ�',8,1 );


--UPDATE t_options
--SET name = '����ҩƷ',note='����ҩƷ',sort=5 WHERE id = 141;


--SELECT *
--FROM t_options e
----LEFT JOIN t_dwxx_jyfw e1 ON e.code = e1.jyfwid  and e1.dwbh = :a
--WHERE e.pid = 5
--ORDER BY e.sort

--------------- ɾ��������־ 2022��7��27�� 20:56:49 -------------
--SELECT *  -- delete
--FROM T_SYS_LOG 
--WHERE UserID='001'

---------------- �������浥ת�˿ⵥ  2022��7��26�� 15:50:08
----INSERT INTO T_TKDZB(TKDBH, TKRQ, TKDW, SQR, PZR, FLAG, BZ, wmsflag, ysr, fhr, delflag)
--SELECT distinct 'TK201'+ substring(a.bsdbh,3,8),bsrq,'201',kpr,bsr,10,'�����˿�',1,'023','090',1
--FROM t_bsdzb a
--JOIN t_bsdmxb b ON a.BSDBH=b.BSDBH
--WHERE a.bz LIKE '%����%' 
--AND b.bstp = 1
--ORDER BY a.bsrq

----INSERT INTO t_tkdmxb(TKDBH, ORDR, SPBH, PCBH, JHJG, SHUL, GUIW, TKYY, yxrq, scrq, zlzk, ysjl, cd,sccj, delflag)
--SELECT 'TK201'+ substring(b.bsdbh,3,8),b.ordr,b.spbh,b.pcbh,b.bsjg,b.bssl,'H01','',b.yxrq,NULL,'���װ���Ϲ涨','�ϸ����','','',1
--FROM t_bsdzb a
--JOIN t_bsdmxb b ON a.BSDBH=b.BSDBH
--WHERE a.bz LIKE '%����%' 
--AND b.bstp = 1
--ORDER BY a.bsrq
------------------------ �������浥ת�˿���� -----------------------------------------

--SELECT a.id, s.spbh,s.pm,s.gg,s.CJMC,s.pzwh,b.gmp,b.otc
--FROM t_1 a
-- JOIN v_spxx s ON s.pzwh = a.bz
-- JOIN t_jgxx j ON j.spbh=s.spbh
-- JOIN t_spxx b ON b.spbh=s.spbh
--AND isnull(b.otc,0) = 1
----and s.GMP='Y' 
--ORDER BY a.id

--SELECT a.id, a.spbh,ISNULL(s.PZWH,'') pzwh,ISNULL(b.gnzz,'') gnzz,ISNULL(j.zdjj,0) zdjj,h.jhrq
--FROM t_1 a
--left JOIN v_spxx s ON s.spbh = a.spbh
--left JOIN t_jgxx j ON j.spbh=a.spbh
--LEFT JOIN t_spxx b ON b.spbh=a.spbh
--left JOIN (
--	SELECT e.spbh,max(e1.jhrq) jhrq
--	FROM t_jhdmxb e
--	JOIN t_jhdzb e1 ON e1.JHDBH = e.JHDBH
--	WHERE e1.JHRQ > '2021.7.1'
--	GROUP BY e.spbh
--) h ON a.spbh=h.spbh
--ORDER BY a.id

------------��ѯ�ܵ�һ����ǰ�����Ŀ����Ʒ 2022��6��14�� 18:17:58
--SELECT s.spbh,s.pm,s.gg,s.cjmc,s.gmp,s.cctj,s.FLAG,j.zdjj,j.zhgys,g.gysmc,c.yxrq,c.pcbh,c.chsl
--FROM (
--SELECT a.spbh,a.pcbh,a.yxrq,a.chsl
--FROM t_chxx a
--left JOIN (
--	SELECT DISTINCT e.spbh,pcbh
--	FROM t_jhdmxb e
--	JOIN t_jhdzb e1 ON e1.JHDBH = e.JHDBH
--	WHERE e1.JHRQ>'2022.6.6'
--) b ON a.spbh=b.spbh AND a.PCBH=b.pcbh AND a.CHSL>0
--WHERE b.spbh IS NULL 
--) c 
--join v_spxx s ON s.spbh=c.spbh
--JOIN t_jgxx j ON s.spbh=j.spbh
--JOIN t_gysxx g ON j.zhgys=g.gysbh
--ORDER BY  c.yxrq 

-------------��ѯ��3��otcҩƷ�����ͼ۸� 2022��5��18�� 11:45:01
--SELECT a.spbh,sj.pm,sj.gg,sj.cjmc,s.spbm,sj.zdjj,a.sl,g.GYSBH,g.GYSMC
--FROM (
--SELECT tl.spbh,COUNT(tl.shul) sl
--FROM T_LSHZB tl 
--where tl.lsrq > DATEADD(MONTH,-1,GETDATE())
--group BY tl.spbh
--) a
--JOIN v_spxx_qtcx sj ON a.spbh=sj.spbh
--JOIN t_spxx s ON a.SPBH=s.spbh
--JOIN t_jgxx j ON a.spbh=j.SPBH
--JOIN t_Gysxx g ON j.zhgys=g.GYSBH
--WHERE 1=1  
----AND (a.spbh LIKE '1%' OR a.spbh LIKE '4%')
--AND isnull(s.otc,0) = 1
----and s.GMP='Y' 
--ORDER BY  a.sl DESC

--SELECT a.spbh,isnull(a.sl,0)
--FROM (
--SELECT tl.spbh,COUNT(tl.shul) sl
--FROM T_LSHZB tl 
--where tl.lsrq > DATEADD(MONTH,-1,GETDATE())
--group BY tl.spbh
--) a
--right JOIN t_aa b ON a.spbh=b.spbh
--WHERE b.ordr >= 930
--ORDER BY b.ordr

--SELECT a.spbh,b.zdjj,c.GYSBH,c.gysmc
--FROM t_aa a
--JOIN t_jgxx b ON a.spbh=b.SPBH
--JOIN t_gysxx c ON b.zhgys=c.GYSBH
--WHERE a.ordr >= 930
--ORDER BY ordr

--------------��ѯ�����Ʒ�Ľ��ۺͽ�����λ 2022��5��4�� 21:01:57
--SELECT s.spbh,s.pm,s.gg,s.cjmc,s.gmp,s.cctj,s.FLAG,j.zdjj,j.zhgys,g.gysmc,c.yxrq,c.pcbh
--FROM v_spxx s
--JOIN t_jgxx j ON s.spbh=j.spbh
--JOIN t_gysxx g ON j.zhgys=g.gysbh
--JOIN(
--	SELECT spbh,pcbh,yxrq 
--FROM t_chxx 
--WHERE CHSL > 0
--UNION
--SELECT DISTINCT spbh,pcbh,YXRQ
--FROM t_fgskc 
--WHERE shul - yxsl > 0
--) c ON s.spbh=c.spbh
--ORDER BY c.yxrq 

------ ������Ʒ�Ļ��ֱ�־��ë������0.3�Ĳ����� 2022��4��26�� 14:24:49
--SELECT a.spbh,(b.hyj-b.zdjj)/b.hyj,b.zdjj,b.hyj,s.jfbz,s.gxrq   -- UPDATE s set s.jfbz=0,s.gxrq=getdate()
--FROM t_spxx s
--join
--(
--SELECT spbh 
--FROM t_chxx 
--WHERE CHSL > 0
--UNION
--SELECT DISTINCT spbh
--FROM t_fgskc 
--WHERE shul - yxsl > 0
--) a ON a.SPBH = s.SPBH
--JOIN t_jgxx b ON a.spbh=b.spbh 
--WHERE b.hyj >0 AND (b.hyj-b.zdjj)/b.hyj <= 0.3
--AND s.jfbz = 1

--------��ѯ�ֵ���Ʒ�۸���Ϣ  2022��2��17�� 13:12:03
--SELECT DISTINCT b.spbh,b.pm,b.gg,b.cjmc,c.lsj,c.zdjj,c.hyj,b.SPLB
--FROM t_fgskc a
--JOIN v_spxx b ON a.spbh=b.SPBH
--JOIN t_jgxx c ON a.spbh=c.spbh
--WHERE a.shul-a.yxsl > 0
--ORDER BY b.SPBH

----------���ɱ�۵� 2022��2��7�� 18:05:39
--SELECT * FROM t_bjdzb WHERE bjrq > '2022.1.1'
--INSERT INTO t_bjdzb(bjdbh,bjrq,kpr,jsbz,dwbh,dwmc)
--VALUES('BJ22000014','2022-02-07','002',0,'000','��˾')

--SELECT * FROM t_bjdzb WHERE BJDBH='BJ22000014'

--INSERT INTO t_bjdmxb(bjdbh,SPBH, DWBH, LSZK, JLSJ, LSJ, JPFJ, PFJ, JGBJ, GBJ, DBJ,
--            jhyj, hyj, dslsj)
--SELECT 'BJ22000014',e.spbh,'***',100,e1.lsj,e1.lsj,e1.pfj,e1.pfj,e1.gbj,e1.gbj,e1.zdjj,e1.hyj,e1.hyj,e1.lsj 
--FROM t_aa e
--JOIN t_jgxx e1 ON e.spbh=e1.spbh

------��Ʒ����
--SELECT b.spbh,b.pcbh,b.jhj 
--FROM (
--SELECT spbh,pcbh,MAX(id) id
--FROM t_jhdmxb
--GROUP BY spbh,PCBH
--) a
--JOIN t_jhdmxb b ON a.id = b.id

--SELECT s.spbh,s.ordr,CASE WHEN s.jhj IS NULL then s1.zdjj else s.jhj END  jhj
--FROM (
--SELECT e.spbh,e.ordr,e1.jhj
--FROM t_2 e
--left JOIN (
--SELECT b.spbh,b.pcbh,b.jhj 
--FROM (
--SELECT spbh,pcbh,MAX(id) id
--FROM t_jhdmxb
--GROUP BY spbh,PCBH
--) a
--JOIN t_jhdmxb b ON a.id = b.id
--) e1 ON e.spbh=e1.spbh AND e.pcbh=e1.pcbh
--) s
--JOIN t_jgxx s1 ON s1.spbh = s.spbh
--ORDER BY s.ordr

---- �������й����������۵�����Ʒ�������Ʒ��Ϣ 2021��12��7�� 08:49:35 
--SELECT a.spbh,a.PM, a.GG, a.JLDW, a.LSJ, a.cjmc, a.ZDJJ, a.PZWH,a.spbm,b.gysbh,b.gysmc
--FROM(
--SELECT sq.spbh,sq.PM, sq.GG, sq.JLDW, sq.LSJ, sq.cjmc, sq.ZDJJ, sq.PZWH,s.spbm
--FROM V_SPXX_QTCX sq 
--JOIN t_spxx s ON sq.spbh=s.spbh
--WHERE len(s.spbm)>10 
--) a
--JOIN(
--	SELECT m.spbh,z1.gysbh,g.GYSMC
--	FROM (
--	SELECT m.spbh,MAX(id) id
--	FROM t_jhdzb z
--	JOIN t_jhdmxb m ON m.JHDBH = z.JHDBH
--	WHERE z.jhrq > '2021.6.7'
--	GROUP BY m.spbh
--	) m JOIN t_Jhdmxb m1 ON m.id=m1.id
--	JOIN t_jhdzb z1 ON m1.JHDBH=z1.JHDBH
--	JOIN t_gysxx g ON z1.GYSBH = g.GYSBH
--) b ON a.spbh=b.spbh
--JOIN (
--SELECT DISTINCT spbh
--FROM t_lshzb 
--WHERE lsrq > '2021.6.7'
--) c ON a.spbh=c.spbh
--ORDER by a.spbh

--SELECT *
--FROM(
--SELECT sq.spbh,sq.PM, sq.GG, sq.JLDW, sq.LSJ, sq.cjmc, sq.ZDJJ, sq.PZWH,s.spbm
--FROM (select distinct spbh from t_chxx WHERE CHSL>0) a 
--JOIN V_SPXX_QTCX sq ON a.spbh=sq.spbh
--JOIN t_spxx s ON a.spbh=s.spbh
--union
--SELECT sq.spbh,sq.PM, sq.GG, sq.JLDW, sq.LSJ, sq.cjmc, sq.ZDJJ, sq.PZWH,s.spbm
--FROM (select distinct spbh from t_fgskc WHERE shul-yxsl>0) a 
--JOIN V_SPXX_QTCX sq ON a.spbh=sq.spbh
--JOIN t_spxx s ON a.spbh=s.spbh
--) a
--ORDER BY spbh


--------- ɾ�������Ϣ 30886 40������ 2021��11��25�� 17:49:28 --------------
--SELECT *  --  DELETE    --ɾ������ 40
--FROM t_chxx WHERE spbh = '30886'

------- ����ѯ�۵� 2021��11��4�� 10:05:44
--SELECT MAX(xjdbh) FROM t_xjdzb tx

----- ����ѯ�۵�
--INSERT INTO t_xjdzb(xjdbh,gysbh,rq,bz,flag) VALUES(	'XJ21000126','00035',GETDATE(),'',0)

--SELECT *
--FROM t_xjdzb tx
--JOIN t_xjdmxb tm ON tm.xjdbh = tx.xjdbh
--WHERE tx.xjdbh = 'XJ21000126'


---- �޸�����ܿ�ҩƷ��isMHJ��ʶΪ 1������ܿذ�����Ƽ�Ҫ��������ѣ������տ�Ա��¼��ҩ�û��ĸ�����Ϣ
---- ����ҩ��ļ��Ҫ�� 2021��10��26�� 13:48:51
--SELECT distinct b.spbh,b.pm,b.IsMHJ,b.GMP,b.TZM
---- update b set b.tzm = '0',b.isMHJ='1',b.gxrq=getdate()
--FROM t_3 a  
--JOIN t_spxx b ON a.pm=b.pm
--WHERE b.FLAG=1 AND b.GMP='N' AND b.IsMHJ=0
------- ����Ʒ������� 2021��10��28�� 08:27:27
--SELECT distinct b.spbh,b.pm,b.IsMHJ,b.GMP,b.TZM
---- update b set b.tzm = '0',b.isMHJ='1',b.gxrq=getdate()
--FROM t_3 a  
--JOIN t_spxx b ON a.spbh=b.spbh
--WHERE b.FLAG=1 AND b.GMP='N' AND b.IsMHJ=0


------------- ɾ�� 00080 ��Ӧ�� ��ʷ������ 2021��10��19�� 17:32:42---------
--SELECT a.*  -- delete b
--FROM t_jhdzb a
--JOIN t_jhdmxb b ON b.JHDBH = a.JHDBH
--WHERE a.gysbh = '00080' AND a.JHRQ < '2021-1-1'

--SELECT a.*  -- delete a
--FROM t_jhdzb a
--WHERE a.gysbh = '00080' AND a.JHRQ < '2021-1-1'

--------------��¼������ 2021��9��15�� 16:23:45
--INSERT INTO t_jhdzb(JHDBH, JHRQ, GYSBH, FKQX, PJKL, LRR, JSBZ, BZ, fkbz, ysr, JHDW,
--            yhdbh, pmje, wmsflag, zpflag, dhrq, fdyhd, fdckd, zdfh, flag)
--SELECT 'JH21001721',jhrq,'00347',FKQX, PJKL, LRR, JSBZ, BZ, fkbz, ysr, JHDW, yhdbh, 858,
--       wmsflag, zpflag, dhrq, fdyhd, fdckd, zdfh, flag
--FROM t_jhdzb 
--WHERE jhrq BETWEEN '2021-5-9' AND '2021-5-11'
--AND jhdbh = 'JH21000872'

--INSERT INTO t_jhdmxb(JHDBH, ORDR, LPHM, SPBH, YXQ, SCRQ, PCBH, SL, PFJ, JHJ, LSJ,
--            GBJ, KL, HWBH, FLAG, SCCJ, PZWH, fkbz, FK, DJZBH, WLHBS, qjhj,
--            HGSL, YHSL, fhflag, cd, scqyxkzh, jybgpath)
--SELECT 'JH21001721', 1, '0072', spbh, '2023-02-01', SCRQ, '129211068', 30, PFJ, 28.6, LSJ, GBJ, KL, HWBH,
--       FLAG, SCCJ, PZWH, fkbz, FK, DJZBH, WLHBS, qjhj, 30, 30, fhflag, cd,
--       scqyxkzh, 'E:\����\WORKPATH\��ҩ�ع�\11447_129211068.jpg'
--FROM t_jhdmxb 
--WHERE jhdbh = 'JH21001153' AND spbh = '11447'
--------- �޸� ���ⵥ ����
--SELECT *  -- update a set a.pcbh= '129211068'
--FROM t_ckdmxb a
--WHERE ckdbh = 'CK21000639' AND spbh = '11447'



------- �޸Ľ����� ��Ӧ�� 2021��9��14�� 14:06:53
--SELECT jhdbh,jhrq,gysbh,pmje   -- update a set a.gysbh='00336'
--FROM T_JHDZB a
--WHERE jhdbh IN('jh21001652','jh21001653')
------ ��ѯ��������ҩ��¼�����漰��Ӧ�����������ݣ��漰��ͬʱ�޸Ķ�Ӧ��Ӧ�� 
--SELECT *
--FROM T_JKYPDJB 
--WHERE jhdbh IN('jh21001652','jh21001653')

----SELECT * FROM t_gysxx WHERE gysbh = '00336'

--------ɾ���˻����� �˻�������Ʒ���� 2021��7��29�� 10:24:13 ----------------
--SELECT *  -- delete c
--FROM T_THDMXB tt
--JOIN T_THDZB tt2 ON tt2.THDBH = tt.THDBH
--JOIN t_chxx c ON tt.spbh = c.spbh AND tt.pcbh = c.PCBH
--WHERE tt.THDBH IN('th21000215','th21000224')

-------���½����������ʶ 2021��6��1�� 16:20:17 ---------------
--SELECT z.*
--FROM t_jhdzb z
--WHERE z.jhdbh in( 'JH20000027','JH20000098','JH20000481','JH20001207')

--SELECT z.*
--FROM t_jhdzb z
--WHERE z.jhdbh in( 'JH19001870','JH19002739')


--SELECT m.jhdbh,m.ORDR,m.spbh,m.fkbz,m.FK  -- update m set m.fkbz = 0
--FROM t_Jhdmxb m  
--WHERE m.jhdbh in( 'JH20000027','JH20000098','JH20000481','JH20001207')

--SELECT m.jhdbh,m.ORDR,m.spbh,m.fkbz,m.FK,m.id   -- update m set m.fkbz = 0
--FROM t_Jhdmxb m  
---- LEFT JOIN T_FKJLMXB tf ON m.id = tf.id --AND tf.lx = 1
--WHERE m.jhdbh in( 'JH19001870','JH19002739')

--SELECT * FROM T_FKJLMXB tf WHERE tf.FKJLBH='2021000226'

--SELECT * 
--FROM t_fkjlzb a 
--JOIN t_fkjlmxb b ON a.FKJLBH=b.FKJLBH
--WHERE a.gysbh = '000304'--#  �˻�����
--SELECT *
--FROM T_FKJLMXB tf 
--JOIN T_THdmxb tm ON tf.ID=tm.id AND tf.lx=2
--WHERE tf.FKJLBH='2021000226'

----# ��������
--SELECT tf.*,tz.jhdbh,tz.gysbh,tm.SL, tm.JHJ, tm.KL, tm.fkbz,sl*jhj
--FROM T_FKJLMXB tf 
--JOIN T_jHdmxb tm ON tf.ID=tm.id AND tf.lx=1
--JOIN t_jhdzb tz ON tm.JHDBH=tz.JHDBH
--WHERE tf.FKJLBH='2021000226'

------- ��ѯ������������ͼ۵���Ʒ 2021��4��20�� 17:20:20 --------------
--SELECT g.GYSMC,m.spbh,s.pm,s.gg,s.CJMC,min(m.jhj)
--FROM t_jhdzb z
--JOIN t_jhdmxb m ON m.JHDBH = z.JHDBH
--JOIN v_spxx s ON m.spbh = s.SPBH
--JOIN t_gysxx g ON z.GYSBH=g.GYSBH
--WHERE DATEDIFF(DAY,z.JHRQ,GETDATE()) < 181
--GROUP BY g.GYSMC,s.pm,m.spbh,s.gg,s.CJMC
--ORDER BY m.spbh

---------------- �޸�������ⵥ״̬ 2021��4��14�� 18:02:09 ----------
--SELECT *   -- UPDATE a SET a.yxbz = 15
--FROM T_CKDZB a
--WHERE jsdw = '201' AND yxbz = 10


----------------��ѯ�����Ʒ��Ϣ  2021��4��3�� 13:24:08  -------------
--SELECT DISTINCT a.spbh,s.pm,s.gg,s.CJMC,s.GMP,j.lsj,j.ZDJJ,s.is
--FROM t_fgskc a 
--JOIN V_SPXX s ON a.spbh = s.SPBH
--JOIN t_jgxx j ON a.spbh = j.SPBH
--WHERE a.shul - a.yxsl > 0

------------����ϵͳ���ݵ���sql  2021��4��2�� 11:11:55 -------------
--SELECT a.spbh �̼ұ���,a.spbh ��Ʒ����,b.pm ��Ʒ����,b.gg �������,'' �����,b.spbm ����,0 ����ۼ�,0 ���ۼ�,0 �ɱ���,
--0 ������, 0 ��Ա��,0 �г���,0 ��Ч��,0 ��,0 ��,0 ��,0 ����,0 ˰��,0 �������к�,0 �������,0 ���ⲻ�����,
--0 ����0�ɱ�,0 ������ڳɱ���,0 ���ս���,0 ���,0 ��Ʒ������λ,0 ��Ʒ������λ,a.pcbh ��Ʒ�Զ���1,a.yxrq ��Ʒ�Զ���2,
--'' ��Ʒ�Զ���3,'' ��Ʒ�Զ���4,'' ��Ʒ�Զ���5,'' ��Ʒ�Զ���6,'' ���������,'' ����ջ���,'' ���ۻ���,'' �������,
--'' �������,'' ��Ʒ��ע,'' ͬһ���γ���
--FROM t_ckdmxb a
--JOIN v_spxx b ON a.spbh=b.spbh
--WHERE ckdbh = 'CK19000314'


----------2020��2��8�� 20:35:38
-------�����ܵ���ʱɾ������ ��˾ϵͳ������304972��304973��30434������Ʒ2020��1��22��ǰ�Ľ�����¼
--SELECT m.* -- UPDATE m SET m.FLAG = 0
--FROM t_jhdmxb m
--JOIN t_jhdzb z ON z.JHDBH = m.JHDBH
--WHERE z.jhrq > '2020.1.22' AND m.spbh IN ('304972','304973','30434')

------ �޸Ĺ�˾���۵����  2021��3��10�� 17:21:36
--SELECT *
--FROM t_chxx 
--WHERE spbh = '30924'

------ ����̨������ 
--SELECT *  --  UPDATE a SET a.sl=50,a.jine=50*jiag
--FROM t_ckmx a
--WHERE djhm = 'gsls' AND SPBH='30924' AND ordr=28

------ �����������
--INSERT INTO t_chxx(SPBH, PCBH, yxrq, jiag,sccj,scrq,dhrq,CHSL,HWBH, FLAG)
--SELECT TOP 1 spbh,pcbh,yxq,jhj,sccj,SCRQ,b.jhrq,50,'H01',1
--FROM t_jhdmxb a
--JOIN t_jhdzb b ON b.JHDBH = a.JHDBH
--WHERE spbh = '30924' AND pcbh = '20200908'
--ORDER BY a.jhdbh desc






--SELECT z.rq, m.spbh,s.pm,s.gg,m.lsj,m.jhjhs,z.ZDZK,m.ZK,m.SL,z.LSDBH,m.ORDR
--FROM t_lsdmxb m 
--JOIN t_lsdzb z ON z.LSDBH = m.LSDBH
--JOIN t_spxx s ON m.spbh = s.SPBH
----WHERE z.rq > '2018-11-21' --AND m.lsj < m.jhjhs 
--WHERE m.spbh ='30580' AND z.rq > '2019.1.20'
--ORDER BY z.rq DESC

------���¼۸�
--UPDATE a
--SET a.jhjhs = 51
----SELECT a.*
--FROM t_lsdmxb a
--WHERE a.spbh = '30580' AND a.jhjhs = 58.7500

------��ѯ������Ϊ0
--SELECT *
----UPDATE c SET c.jiag = 7.8
--FROM t_chxx c
--WHERE c.spbh = '78049'

--SELECT *
--FROM t_ckdmxb 
--WHERE spbh = '405103'

--SELECT *
--FROM T_CKMX 
--WHERE spbh = '405103'

--SELECT m.*
--FROM t_lsdmxb m 
--JOIN t_lsdzb z ON z.LSDBH = m.LSDBH
--WHERE z.rq > '2018-3-1' AND m.spbh = '405172'
--ORDER BY m.SPBH

----��ѯ��Ӧ��Ʒ��ʷ�۸�
--SELECT tl.*
--FROM T_LSDMXB tl
--JOIN t_lsdzb z ON z.LSDBH = tl.LSDBH
--WHERE spbh = '73743' AND z.rq > '2018-2-1'
--ORDER BY tl.LSDBH

------  �ֹ����ɱ�۵�   ��ʼ  ------------------------
--------���ұ�۵���󵥺�
----SELECT MAX(BJDBH)
----FROM t_bjdzb 
----WHERE bjrq > '2018-10-01'

----------�����۵�����
--INSERT INTO T_bjdzb(BJDBH, BJRQ, PZR, KPR, BZ, JSBZ, DWBH, DWMC)
--SELECT 'BJ18000258',GETDATE(),NULL,kpr,N'ȷ�������',0,'000','��˾'
--FROM t_Bjdzb 
--WHERE bjdbh = 'BJ18000257'

-------��������ϸ������Ƭ��
--INSERT INTO t_bjdmxb(BJDBH, SPBH, DWBH, LSZK, JLSJ, LSJ, JPFJ, PFJ, JGBJ, GBJ, DBJ,
--            BJYY, jhyj, hyj)
--SELECT 'BJ18000258',kc.spbh,'***',100,jg.lsj,jg.lsj,jg.pfj,jg.pfj,jg.gbj,jg.gbj,jg.gbj,'ȷ�������',0,0
--FROM 
--(select DISTINCT k.spbh from t_fgskc k WHERE LEFT(k.spbh,1) < '7') kc
--JOIN t_jgxx jg ON kc.spbh=jg.SPBH
----WHERE bjdbh = 'BJ18000257'

---------------    ���ɱ�۵�   ����    --------------------------

---------------------------------------
-------�����˿ⵥ �������ҺͲ���
--SELECT e.*,e3.sccj
------UPDATE e SET e.sccj = e3.sccj
--FROM t_tkdmxb e
--JOIN t_tkdzb e1 ON e1.TKDBH = e.TKDBH
--JOIN (SELECT DISTINCT spbh,pcbh,sccj 
--      FROM t_ckdmxb c 
--      WHERE sccj IS NOT NULL AND 
--      EXISTS(SELECT TOP 1 sccj,MAX(ckDBH) FROM t_ckdmxb WHERE spbh=c.SPBH AND pcbh=c.PCBH GROUP BY sccj)
--) e3 ON e.spbh = e3.spbh AND e.pcbh=e3.pcbh
--WHERE e.spbh LIKE '7%' AND YEAR(e1.TKRQ) > 2014
--ORDER BY e.spbh,e.PCBH

--SELECT e.*,e3.cd
------UPDATE e SET e.cd = e3.cd
--FROM t_tkdmxb e
--JOIN t_tkdzb e1 ON e1.TKDBH = e.TKDBH
--JOIN (SELECT DISTINCT spbh,pcbh,cd 
--      FROM t_ckdmxb c 
--      WHERE cd IS NOT NULL AND 
--      EXISTS(SELECT TOP 1 cd,MAX(ckDBH) FROM t_ckdmxb WHERE spbh=c.SPBH AND pcbh=c.PCBH GROUP BY cd)
--) e3 ON e.spbh = e3.spbh AND e.pcbh=e3.pcbh
--WHERE e.spbh LIKE '7%' AND YEAR(e1.TKRQ) > 2014
--ORDER BY e.spbh,e.PCBH

-------------2019��5��3�� 20:32:40------------
--------�޸���־ -----
--SELECT e.operationdatetime,e.datano,e.operationDesc,f.FUNNM,b.XM,e.UserID,f.id
------UPDATE e SET e.UserID = '124'
------delete e
--FROM T_sys_log e
--JOIN T_FUNCS f ON e.funcid = f.ID
--JOIN T_zgxx b ON e.userid = b.bh
--WHERE 
----f.funnm = '���ϸ�ҩƷ���ټ�¼'
--e.OperationDatetime BETWEEN '2016.8.23' AND '2020.7.31' AND 
--f.funnm = '������Ϣ����' and e.userid <> '124' --and e.userid = '016'
--ORDER BY e.ID

-----------ɾ������----
--SELECT *
----INTO t_bsdzb_del
----DELETE e
--FROM t_bsdzb e WHERE e.bsdbh IN('BS19000011','BS19000009','BS19000007')
--SELECT e.*
----INTO t_bsdmxb_del
----DELETE e 
--FROM t_bsdmxb e WHERE e.bsdbh IN('BS19000011','BS19000009','BS19000007')

--SELECT * 
----INTO t_tkdzb_del
----DELETE e
--FROM t_tkdzb e WHERE tkdbh IN('TK19000061')
--SELECT * 
----INTO t_tkdmxb_del
----DELETE e
--FROM t_tkdmxb e WHERE tkdbh IN('TK19000061')

--SELECT *
----INTO t_ckdzb_del
----DELETE e
--FROM t_ckdzb e
--WHERE e.ckdbh IN('CK15005926','CK16003802','CK17001122')

--SELECT *
----INTO t_ckdmxb_del
----DELETE e
--FROM t_ckdmxb e
--WHERE e.ckdbh IN('CK15005926','CK16003802','CK17001122')

--------������
--SELECT *
----DELETE e
--FROM t_cxmxb e
--WHERE e.spbh IN('30737','40105','40350')

-----------������--------
--SELECT * 
----INTO t_jhdzb_del
----DELETE e
--FROM t_jhdzb e WHERE jhdbh IN('JH19000267')
--SELECT * 
----INTO t_jhdmxb_del
----DELETE e
--FROM t_jhdmxb e WHERE jhdbh IN('JH19000267')

-------------�޸����ۼ�¼����  --------------------
--SELECT *
----UPDATE e SET e.pcbh = 'JS05110'
--FROM t_lsdmxb e
--WHERE e.LSDBH = '1811290019' AND e.spbh = '101203'

--SELECT *
----UPDATE e SET e.pcbh = 'JS05110'
--FROM t_ckmx e
--WHERE e.djhm = '1811290019' AND e.spbh = '101203'

-------------�޸Ĳ˵����� ----------------
--SELECT *
----UPDATE tf SET tf.UFLAG = 1
--FROM T_FUNCS tf
--WHERE tf.FUNNM LIKE '%����%'













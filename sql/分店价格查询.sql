--SELECT z.rq, m.spbh,s.pm,s.gg,m.lsj,m.jhjhs,z.ZDZK,m.ZK
--FROM t_lsdmxb m 
--JOIN t_lsdzb z ON z.LSDBH = m.LSDBH
--JOIN t_spxx s ON m.spbh = s.SPBH
--WHERE z.rq > '2018-11-21' --AND m.lsj < m.jhjhs 
--ORDER BY m.SPBH

----��ѯ������Ϊ0
--SELECT *
----UPDATE c SET c.jiag = 7.8
--FROM t_chxx c
--WHERE c.spbh = '405103'


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

----���¼۸�
--UPDATE a
--SET a.jhjhs = 187.8261
----SELECT a.*
--FROM t_lsdmxb a
--WHERE a.lsdbh = '1803090117' AND a.ORDR = 1

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




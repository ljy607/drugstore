----------2019��1��19�� 17:11:26------------------
------���ӽ�������Ҫ�����ȶԹ���--------
--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--            fdbz, parameter)
--VALUES(30,'����Ҫ���Ա�',1,0,'����Ҫ���Ա�','image\tom_wap.gif','w_jh4yh',1,1,1,0)



----------2018��12��20�� 15:38:02------------------
------������Ʒ��Ϣ�޸Ĺ���--------
--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--            fdbz, parameter)
--VALUES(23,'��Ʒ��Ϣ�޸�',6,0,'��Ʒ��Ϣ�޸�','image\tom_wap.gif','w_spxx_bg',0,1,1,0)


----------   2018��11��25�� 18:24:13 ---------------------------
------��۵����ӱ�۵�λ��¼��
--CREATE TABLE t_bjddw
--(
--	id INT IDENTITY(1,1) NOT NULL,
--	bjdbh NvarCHAR(10) NOT NULL,
--	dwbh NVARCHAR(10) NOT NULL,
--	flag TINYINT DEFAULT 0,
--	PRIMARY KEY(id)
--)


-----------2018��9��1�� 10:29:36 ---------
-------Ҫ���ƻ�����һ�� �Ƿ����
--ALTER TABLE T_YHJHMX
--ADD isdb TINYINT NULL		----�Ƿ����

-----------2018��7��26�� 17:29:11------------
-------������Ʒ��Ϣ��������
--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--            fdbz, parameter)
--VALUES(22,'��Ʒ��Ϣ���',6,0,'��Ʒ��Ϣ���','image\tom_wap.gif','w_spxxwh_main_sh',1,1,1,0)

-------��Ʒ���� ������ҵ���֤��
--ALTER TABLE t_spxx 
--ADD scqyxkzh NVARCHAR(32) NULL		----������ҵ���֤��

--ALTER TABLE t_jhdmxb 
--ADD scqyxkzh NVARCHAR(32) NULL		----������ҵ���֤��
 

------------2018��5��12�� 11:45:32-----------
--------��Ʒ��Ϣ���Ӿ��鷶Χ�����ڿ���ĳЩ��Ʒ���ܳ��⵽ĳ���ֵ�------------
--SET IDENTITY_INSERT t_options ON
--INSERT INTO t_options(id,pid, code, name, note, sort, flag)
--VALUES(5,0,'jyfw',N'��Ӫ��Χ',N'��Ӫ��Χ',200,1)
--SET IDENTITY_INSERT t_options OFF

------�ֵ꾭Ӫ��Χ
--CREATE TABLE t_dwxx_jyfw
--(
--	id INT IDENTITY(1,1) NOT NULL,
--	dwbh VARCHAR(3) NOT NULL,
--	jyfwid INT NOT NULL,
--  flag TINYINT NULL,
--	PRIMARY KEY(id)
--)

--INSERT INTO t_options(pid, code, name, note, sort, flag)
--VALUES(5,'1',N'ҩƷ',N'ҩƷ',200,1)
--INSERT INTO t_options(pid, code, name, note, sort, flag)
--VALUES(5,'2',N'��Ƭ',N'��Ƭ',200,1)
--INSERT INTO t_options(pid, code, name, note, sort, flag)
--VALUES(5,'3',N'һ��ҽ����е',N'һ��ҽ����е',200,1)
--INSERT INTO t_options(pid, code, name, note, sort, flag)
--VALUES(5,'4',N'����ҽ����е',N'����ҽ����е',200,1)
--INSERT INTO t_options(pid, code, name, note, sort, flag)
--VALUES(5,'5',N'����ҽ����е',N'����ҽ����е',200,1)
--INSERT INTO t_options(pid, code, name, note, sort, flag)
--VALUES(5,'6',N'�ٻ�',N'�ٻ�',200,1)
--INSERT INTO t_options(pid, code, name, note, sort, flag)
--VALUES(5,'7',N'����',N'����',200,1)

------��Ʒ���Ӿ�Ӫ��Χ����
--ALTER TABLE T_SPXX
--ADD jyfwid INT NULL


-----------2018��4��2�� 10:34:51---------------
--------��Ʒ��Ϣ����������Ч�ڣ���׼�ĺ���Ч��
--ALTER TABLE t_spxx 
--ADD sxyxq DATETIME NULL,   ----������Ч��
--pzwhyxq DATETIME NULL  ----��׼�ĺ���Ч��

------------2018��1��24�� 17:04:38--------------------
-------���ӹ�Ӧ�̹���ͳ�Ƶ�������
--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--            fdbz, parameter)
--VALUES(28,'����Ʒ��ͳ��',4,0,'����Ʒ��ͳ��','image\tom_wap.gif','w_jhpztj',1,1,1,0)



--------------2017��12��2�� 16:16:04---------------
----��Ʒ������ӳ�����
--INSERT INTO t_options(pid, code, name, note, sort, flag)
--VALUES(2,'09','����','��������Ʒ',200,1)

----��ʼ�����н���¼��ר���ʺ�
--INSERT INTO t_zgxx(BH, XM, XB, SYSID, XL, ZC, ZW, SFZH, BM, QX, MM, JG, LXDZ, YZBM,
--            CSRQ, DH1, DH2, JBGZ, RZSJ, LZSJ, MEMO, GXRQ, GXZ, FLAG, tjyxrq)
--SELECT '999', '���н���', XB, SYSID, XL, ZC, ZW, SFZH, BM, QX, '999', JG, LXDZ, YZBM, CSRQ, DH1,
--       DH2, JBGZ, RZSJ, LZSJ, MEMO, GXRQ, GXZ, FLAG, tjyxrq
--FROM t_zgxx
--WHERE bh = '001'


----------------2017��4��30�� 17:48:29--------------
----�˿������������
--ALTER TABLE t_tkdmxb 
--ADD scrq DATETIME NULL

----������ת���ⵥ�����������ڡ�����
--ALTER TABLE t_ckdmxb_temp
--ADD  scrq DATETIME NULL,cd NVARCHAR(16) NULL

----------------2017��3��30�� 18:32:14-----------------------------------------
----���������Ӳ����ֶΣ���¼��Ƭ�Ĳ���
--ALTER TABLE t_jhdmxb 
--ADD cd NVARCHAR(16) NULL

----Ҫ���ƻ����Ӳ���
--ALTER TABLE t_yhjhmx 
--ADD cd NVARCHAR(16) NULL


----��Ӧ������ҵ��Ա��������Ա��Ϣ
--ALTER TABLE T_GYSXX
--ADD ywyxm NVARCHAR(16) NULL,	--ҵ��Ա����
--	ywydh VARCHAR(16) NULL,		--ҵ��Ա�绰
--	ywysfzh VARCHAR(18) NULL,	--ҵ��Ա���֤
--	ywyyxq	DATETIME NULL,		--ҵ��Ա��Ч��
--	cwxm NVARCHAR(16) NULL,		--��������
--	cwdh VARCHAR(16) NULL,		--����绰
--	cwsfzh VARCHAR(18) NULL,	--�������֤
--	cwyxq DATETIME null   		--������Ч��

----------------2017��3��7�� 18:33:44-----------------------------------------
----���Ӹ����¼��ѯ
--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--            fdbz, parameter)
--VALUES('07','�����¼��ѯ',3,1,'�����¼��ѯ','image\tom_wap.gif','w_fkjl_cx',1,1,1,0)

----��ӪƷ������������׼��������ַ
--ALTER TABLE T_SYPZSPB 
--ADD scbz NVARCHAR(64) NULL, --������׼
--    scdz NVARCHAR(64) NULL  --������ַ

----��Ӫ��ҵ����ҵ��Ա��������Ա��Ϣ
--ALTER TABLE T_SYQYSPB
--ADD ywyxm NVARCHAR(16) NULL,	--ҵ��Ա����
--	ywydh VARCHAR(16) NULL,		--ҵ��Ա�绰
--	ywysfzh VARCHAR(18) NULL,	--ҵ��Ա���֤
--	ywyyxq	DATETIME NULL,		--ҵ��Ա��Ч��
--	cwxm NVARCHAR(16) NULL,		--��������
--	cwdh VARCHAR(16) NULL,		--����绰
--	cwsfzh VARCHAR(18) NULL,	--�������֤
--	cwyxq DATETIME null   		--������Ч��

----���ⵥ���Ӳ��أ���Ƭ��Ҫ���Ӳ���¼���ֶ�
--ALTER TABLE t_ckdmxb 
--ADD cd NVARCHAR(16) NULL		--��Ƭ����

----��Ʒ��Ϣ���ӹ�������
--ALTER TABLE T_SPXX
--ADD gnzz NVARCHAR(64) NULL



---------------2016��11��19�� 16:25:07----------------------
-----����ҽ��ҩƷĿ¼
--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--            fdbz, parameter)
--VALUES(21,'ҽ��ҩƷĿ¼',6,0,'ҽ��ҩƷĿ¼','image\tom_wap.gif','w_yb_spxx_main',1,1,1,0)


--------2016.10.15-----------------
-----�޸Ŀ������ҩƷ��������,��������
--ALTER TABLE t_chxx 
--ADD scrq DATETIME NULL,dhrq DATETIME

-----�޸ĳ��ⵥ����ҩƷ��������
--ALTER TABLE t_ckdmxb
--ADD scrq DATETIME NULL

------��ҩ��Ʒ����������������¼����������
--ALTER TABLE T_FYSP
--ADD sl INT NULL,	--������������		
--lx TINYINT NULL		--���� 1-��ҩ��¼ 2-��Ƭ��������������¼
--GO
--UPDATE T_FYSP
--SET lx = 1



--------2016.9.29-----------------
-----�޸�ȫ����������������
--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--            fdbz, parameter)
--VALUES(28,'����Աȷ�ϳ���',1,0,'����Աȷ�ϳ���','image\tom_wap.gif','w_ckdrk',1,1,1,0)

--ALTER TABLE t_thdzb
--ADD shr NVARCHAR(3) NULL
--GO

--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--            fdbz, parameter)
--VALUES(29,'����Աȷ���˻�',1,0,'����Աȷ���˻�','image\tom_wap.gif','w_thdrk',1,1,1,0)




--------2016.8.27----------------------------------
-----1�����е����������� 2�����е��������������� 3����Ա��λ

-------ȡ���ܵ���Ƭװ����¼
--ALTER table t_options
--ADD flag TINYINT NULL DEFAULT 1
--GO
--UPDATE t_options SET flag = 1
--GO
--UPDATE t_options SET flag = 0 WHERE id = 115
--GO

--INSERT INTO t_options(pid,code, name, note, sort,flag)
--VALUES(3,16,N'�����˻ؼ�¼','',0,1)
--GO


-------  2016.7.31 start   ---------------------
-------  ������������ 
--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--            fdbz, parameter)
--VALUES(27,'�ۺϲ�ѯ',4,0,'�ۺϲ�ѯ','image\tom_wap.gif','w_zh_report',1,1,0,0)

----ѯ�۵�ά��
--DROP TABLE T_xjdzb
--CREATE TABLE t_xjdzb
--(
--	xjdbh NVARCHAR(16) NOT NULL,
--	gysbh NVARCHAR(10) NOT NULL,
--	rq DATETIME NOT NULL,
--	bz NVARCHAR(32) NULL,
--	flag TINYINT NULL DEFAULT 0,
--	PRIMARY KEY(xjdbh)
--)

--CREATE TABLE t_xjdmxb
--(
--	xjdbh NVARCHAR(16) NOT NULL,
--	spbh NVARCHAR(16) NOT NULL,
--	jg	DECIMAL(14,4) NULL DEFAULT 0,
--	bz NVARCHAR(32),
--	PRIMARY KEY(xjdbh,spbh)
--)

--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--            fdbz, parameter)
--VALUES(23,'ѯ�۵�¼��',1,0,'ѯ�۵�¼��','image\tom_wap.gif','w_xjdlr',1,1,0,0)





----2016.7.3 start------------------------------------
----������Ʒ��Ӧ�����ƣ���Ҫ������Ƽ���ҩƷ���ƣ�Ҫ���ƻ�����Ҫ��֤�ܹ�Ӧ�����Ƶ���Ʒ��������ҲҪ��֤
--CREATE TABLE T_R_SP_GYS
--(
--	id INT IDENTITY(1,1) NOT NULL,
--	spbh NVARCHAR(16) NOT NULL,
--	gysbh NVARCHAR(16) NOT NULL,
--	PRIMARY KEY(id)
--)

--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--            fdbz, parameter)
--VALUES(20,'ҩƷ�޶���Ӧ��ά��',6,0,'ҩƷ�޶���Ӧ��ά��','image\tom_wap.gif','w_sp_gys',1,1,0,0)

-----ѡ��Ӧ�̽ű�
----SELECT z.GYSBH,min(m.jhj) AS jhj ,(select top 1 e.jhj from t_jhdmxb e join t_jhdzb e1 on e.jhdbh = e1.jhdbh 
----where e.spbh = '10114' and e1.gysbh=z.gysbh and e1.jhrq > dateadd(month,-6,getdate()) order by e1.jhrq desc ) as zhjj,
----g.gsyzrq,g.jyxkzrq,g.gsprq,g.frrq,g.xyrq
----FROM  T_JHDZB z
----join t_jhdmxb m ON m.JHDBH = z.JHDBH
----join t_gysxx g ON z.GYSBH=g.GYSBH
----WHERE m.spbh = '10114' and
----		z.jhrq > dateadd(month,-24,getdate())
----group by z.gysbh,g.gsyzrq,g.jyxkzrq,g.gsprq,g.frrq,g.xyrq

----UNION

----SELECT r.GYSBH,min(a.jhj) AS jhj ,(select top 1 e.jhj from t_jhdmxb e join t_jhdzb e1 on e.jhdbh = e1.jhdbh 
----where e.spbh = '10114' and e1.gysbh=r.gysbh and e1.jhrq > dateadd(month,-6,getdate()) order by e1.jhrq desc ) as zhjj,
----a.gsyzrq,a.jyxkzrq,a.gsprq,a.frrq,a.xyrq
----FROM t_r_sp_gys r
----left join (
----	select z.gysbh,z.JHRQ,m.jhj,m.spbh,g.gsyzrq, g.jyxkzrq, g.gsprq, g.xyrq,g.frrq
----    from T_JHDZB z
----	join t_jhdmxb m ON m.JHDBH = z.JHDBH AND m.spbh = '10114'
----	join t_gysxx g ON z.GYSBH=g.GYSBH
----) a ON r.gysbh = a.gysbh AND r.spbh = a.spbh and a.jhrq > dateadd(month,-24,getdate())
----WHERE r.spbh = '10114' 
----group by r.gysbh,a.gsyzrq,a.jyxkzrq,a.gsprq,a.frrq,a.xyrq
----order by jhj





-----------------2016.7.3 end--------------------------------

----ALTER TABLE t_jhdzb 
----ADD zpflag TINYINT

----ALTER TABLE t_ckdzb 
----ADD zpflag TINYINT

----------2016.6.18
------���ӽ�����ϸ���˱�־��1����ͨ�� 0����δͨ�� null δ����
----ALTER TABLE t_jhdmxb 
----ADD fhflag TINYINT

-------���ӽ�������⹦�ܣ������г�
----INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
----            fdbz, parameter)
----VALUES('03','����Աȷ�����',1,0,'����Աȷ�����','image\tom_wap.gif','w_jhdrk',1,1,1,0)

--------2016.06.27----------------------
------�ܵ���������ӵ���ʱ�䣬Ĭ�ϵ���
----ALTER TABLE t_jhdzb 
----ADD dhrq DATETIME NULL





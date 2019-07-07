---------2019年7月7日 17:51:11-----------
--------同步分店会员信息--------
--INSERT INTO hj00.zddb.dbo.t_member(code, name, sex, phone, [address], jine, flag,
--       enddate, wxcode)
--SELECT tm.code, tm.name, tm.sex, tm.phone, tm.[address], tm.jine, tm.flag,
--       tm.enddate, tm.wxcode
--FROM t_member tm
--left JOIN hj00.zddb.dbo.t_member z ON z.code=tm.code
--WHERE tm.tbflag IS NULL AND tm.NAME <> '' and z.code IS NULL


--SELECT COUNT(tm.code)
----UPDATE tm SET tm.tbflag = 1
--FROM t_member tm
--WHERE tm.tbflag IS NULL AND tm.NAME <> ''

--insert into hj00.zddb.dbo.t_member_fd(code,dwbh,jine,flag)
--SELECT tm.code, '108',tm.jine,1
--FROM t_member tm
----JOIN hj00.zddb.dbo.t_member z ON z.code=tm.code
--WHERE tm.tbflag = 1

--SELECT COUNT(m.code)
----UPDATE m1 SET m1.name = m.name,m1.sex =m.sex,m1.phone=m.phone,m1.[address]=m.[address],m1.tbflag=1
--FROM hj00.zddb.dbo.t_member m
--LEFT JOIN hj00.zddb.dbo.t_member_fd f ON f.code = m.code AND f.dwbh = '108'
--JOIN t_member m1 ON m.code = m1.code
--WHERE f.code IS NULL

--------同步分店会员信息 end-------


--SELECT z.rq, m.spbh,s.pm,s.gg,m.lsj,m.jhjhs,m.jhj,z.ZDZK,m.ZK,m.SL,z.LSDBH,m.ORDR
--FROM t_lsdmxb m 
--JOIN t_lsdzb z ON z.LSDBH = m.LSDBH
--JOIN t_spxx s ON m.spbh = s.SPBH
----WHERE z.rq > '2018-11-21' --AND m.lsj < m.jhjhs 
--WHERE m.spbh ='780491' AND z.rq > '2019.5.1'
--ORDER BY z.rq DESC

------更新价格
----UPDATE a
----SET a.jhjhs = 1958
--SELECT a.*
--FROM t_lsdmxb a
--WHERE a.spbh = '780491' AND a.jhjhs = 2369.1800

--------查询进货价为0
--SELECT *
----UPDATE c SET c.jiag = 1958
--FROM t_chxx c
--WHERE c.spbh = '780491'

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

----查询对应商品历史价格
--SELECT tl.*
--FROM T_LSDMXB tl
--JOIN t_lsdzb z ON z.LSDBH = tl.LSDBH
--WHERE spbh = '73743' AND z.rq > '2018-2-1'
--ORDER BY tl.LSDBH

------  手工生成变价单   开始  ------------------------
--------查找变价单最大单号
----SELECT MAX(BJDBH)
----FROM t_bjdzb 
----WHERE bjrq > '2018-10-01'

----------插入变价单主表
--INSERT INTO T_bjdzb(BJDBH, BJRQ, PZR, KPR, BZ, JSBZ, DWBH, DWMC)
--SELECT 'BJ18000258',GETDATE(),NULL,kpr,N'确定国标价',0,'000','公司'
--FROM t_Bjdzb 
--WHERE bjdbh = 'BJ18000257'

-------插入变价明细，除饮片外
--INSERT INTO t_bjdmxb(BJDBH, SPBH, DWBH, LSZK, JLSJ, LSJ, JPFJ, PFJ, JGBJ, GBJ, DBJ,
--            BJYY, jhyj, hyj)
--SELECT 'BJ18000258',kc.spbh,'***',100,jg.lsj,jg.lsj,jg.pfj,jg.pfj,jg.gbj,jg.gbj,jg.gbj,'确定国标价',0,0
--FROM 
--(select DISTINCT k.spbh from t_fgskc k WHERE LEFT(k.spbh,1) < '7') kc
--JOIN t_jgxx jg ON kc.spbh=jg.SPBH
----WHERE bjdbh = 'BJ18000257'

---------------    生成变价单   结束    --------------------------

---------------------------------------
-------更新退库单 生产厂家和产地
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

-------------2019年5月3日 20:32:40------------
--------修改日志 -----
--SELECT e.operationdatetime,e.datano,e.operationDesc,f.FUNNM,b.XM,e.UserID,f.id
------UPDATE e SET e.UserID = '124'
------delete e
--FROM T_sys_log e
--JOIN T_FUNCS f ON e.funcid = f.ID
--JOIN T_zgxx b ON e.userid = b.bh
--WHERE 
----f.funnm = '不合格药品销毁记录'
--e.OperationDatetime BETWEEN '2016.8.23' AND '2020.7.31' AND 
--f.funnm = '质量信息反馈' and e.userid <> '124' --and e.userid = '016'
--ORDER BY e.ID

-----------删除单据----
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

--------催销表
--SELECT *
----DELETE e
--FROM t_cxmxb e
--WHERE e.spbh IN('30737','40105','40350')

-----------进货单--------
--SELECT * 
----INTO t_jhdzb_del
----DELETE e
--FROM t_jhdzb e WHERE jhdbh IN('JH19000267')
--SELECT * 
----INTO t_jhdmxb_del
----DELETE e
--FROM t_jhdmxb e WHERE jhdbh IN('JH19000267')

-------------修改零售记录批号  --------------------
--SELECT *
----UPDATE e SET e.pcbh = 'JS05110'
--FROM t_lsdmxb e
--WHERE e.LSDBH = '1811290019' AND e.spbh = '101203'

--SELECT *
----UPDATE e SET e.pcbh = 'JS05110'
--FROM t_ckmx e
--WHERE e.djhm = '1811290019' AND e.spbh = '101203'

-------------修改菜单功能 ----------------
--SELECT *
----UPDATE tf SET tf.UFLAG = 1
--FROM T_FUNCS tf
--WHERE tf.FUNNM LIKE '%网络%'

--------------修改养护记录养护时间-----------------------
--SELECT *,CONVERT(CHAR(6),e.yhrq,112)
----UPDATE e SET e.YHRQ = '2018-07-13 09:20:53.220'
--FROM t_yhjlzb e
----WHERE e.YHJLBH <> CONVERT(CHAR(6),e.yhrq,112)
--WHERE e.YHjlbh = '201807'

---------------养护记录删除效期一个月内的商品----------------------------
--SELECT e.*,DATEADD(MONTH,1,e.yxrq),e1.YHRQ
----DELETE FROM e
--FROM t_yhjlmx e
--JOIN t_yhjlzb e1 ON e1.YHJLBH = e.YHJLBH
--WHERE e.yhlx = 1 AND DATEADD(MONTH,1,e.yxrq) <= e1.YHRQ

----------------修改单据生产日期----------------------------
--SELECT e.*
----UPDATE e SET e.scrq = '2015.9.16'--,e.cd = '山东'
--FROM t_ckdmxb e
--JOIN t_ckdzb e1 ON e1.CKDBH = e.CKDBH
--WHERE e.spbh = '10668' AND pcbh = '190228124' --AND e.scrq = '2018-02-28'

--SELECT *
----UPDATE e SET e.scrq = '2015.9.16'--,e.cd = '山东',e.sccj = '212495'
--FROM t_chxx e
--WHERE e.spbh = '10668' AND pcbh = '190228124'

--SELECT e.*,'20'+LEFT(e.pcbh,2)+'.'+SUBSTRING(e.pcbh,3,2)+'.'+SUBSTRING(e.pcbh,5,2)
----UPDATE e SET e.scrq = '20'+LEFT(e.pcbh,2)+'.'+SUBSTRING(e.pcbh,3,2)+'.'+SUBSTRING(e.pcbh,5,2)
--FROM t_ckdmxb e
--JOIN t_chxx e1 ON e1.spbh = e.spbh
--WHERE e.ckdbh = 'ck16005658' --AND  e.spbh = '71811' --AND pcbh = '398171201' --AND e.scrq = '2018-02-28'
----AND e.scrq IS NULL














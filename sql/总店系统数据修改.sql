----- 手工导入变价单 2022年12月10日 15:45:03
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

--------------- 修改经营范围 2022年7月29日 10:50:25 -----------------
--INSERT INTO t_options(	pid,code,name,note,sort,flag)
--VALUES( 5,8,'中成药','中成药',1,1 );
--INSERT INTO t_options(	pid,code,name,note,sort,flag)
--VALUES( 5,9,'化学药制剂','化学药制剂',2,1 );
--INSERT INTO t_options(	pid,code,name,note,sort,flag)
--VALUES( 5,10,'抗生素','抗生素',3,1 );
--INSERT INTO t_options(	pid,code,name,note,sort,flag)
--VALUES( 5,11,'食品','食品',4,1 );
--INSERT INTO t_options(	pid,code,name,note,sort,flag)
--VALUES( 5,12,'保健品','保健品',5,1 );
--INSERT INTO t_options(	pid,code,name,note,sort,flag)
--VALUES( 5,13,'消毒剂','消毒剂',6,1 );
--INSERT INTO t_options(	pid,code,name,note,sort,flag)
--VALUES( 5,14,'化妆品','化妆品',7,1 );
--INSERT INTO t_options(	pid,code,name,note,sort,flag)
--VALUES( 5,15,'日化','日化',8,1 );


--UPDATE t_options
--SET name = '生化药品',note='生化药品',sort=5 WHERE id = 141;


--SELECT *
--FROM t_options e
----LEFT JOIN t_dwxx_jyfw e1 ON e.code = e1.jyfwid  and e1.dwbh = :a
--WHERE e.pid = 5
--ORDER BY e.sort

--------------- 删除操作日志 2022年7月27日 20:56:49 -------------
--SELECT *  -- delete
--FROM T_SYS_LOG 
--WHERE UserID='001'

---------------- 电商损益单转退库单  2022年7月26日 15:50:08
----INSERT INTO T_TKDZB(TKDBH, TKRQ, TKDW, SQR, PZR, FLAG, BZ, wmsflag, ysr, fhr, delflag)
--SELECT distinct 'TK201'+ substring(a.bsdbh,3,8),bsrq,'201',kpr,bsr,10,'电商退库',1,'023','090',1
--FROM t_bsdzb a
--JOIN t_bsdmxb b ON a.BSDBH=b.BSDBH
--WHERE a.bz LIKE '%电商%' 
--AND b.bstp = 1
--ORDER BY a.bsrq

----INSERT INTO t_tkdmxb(TKDBH, ORDR, SPBH, PCBH, JHJG, SHUL, GUIW, TKYY, yxrq, scrq, zlzk, ysjl, cd,sccj, delflag)
--SELECT 'TK201'+ substring(b.bsdbh,3,8),b.ordr,b.spbh,b.pcbh,b.bsjg,b.bssl,'H01','',b.yxrq,NULL,'外包装符合规定','合格入库','','',1
--FROM t_bsdzb a
--JOIN t_bsdmxb b ON a.BSDBH=b.BSDBH
--WHERE a.bz LIKE '%电商%' 
--AND b.bstp = 1
--ORDER BY a.bsrq
------------------------ 电商损益单转退款单结束 -----------------------------------------

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

------------查询总店一周以前进货的库存商品 2022年6月14日 18:17:58
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

-------------查询进3月otc药品销量和价格 2022年5月18日 11:45:01
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

--------------查询库存商品的进价和进货单位 2022年5月4日 21:01:57
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

------ 设置商品的积分标志，毛利低于0.3的不积分 2022年4月26日 14:24:49
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

--------查询分店商品价格信息  2022年2月17日 13:12:03
--SELECT DISTINCT b.spbh,b.pm,b.gg,b.cjmc,c.lsj,c.zdjj,c.hyj,b.SPLB
--FROM t_fgskc a
--JOIN v_spxx b ON a.spbh=b.SPBH
--JOIN t_jgxx c ON a.spbh=c.spbh
--WHERE a.shul-a.yxsl > 0
--ORDER BY b.SPBH

----------生成变价单 2022年2月7日 18:05:39
--SELECT * FROM t_bjdzb WHERE bjrq > '2022.1.1'
--INSERT INTO t_bjdzb(bjdbh,bjrq,kpr,jsbz,dwbh,dwmc)
--VALUES('BJ22000014','2022-02-07','002',0,'000','公司')

--SELECT * FROM t_bjdzb WHERE BJDBH='BJ22000014'

--INSERT INTO t_bjdmxb(bjdbh,SPBH, DWBH, LSZK, JLSJ, LSJ, JPFJ, PFJ, JGBJ, GBJ, DBJ,
--            jhyj, hyj, dslsj)
--SELECT 'BJ22000014',e.spbh,'***',100,e1.lsj,e1.lsj,e1.pfj,e1.pfj,e1.gbj,e1.gbj,e1.zdjj,e1.hyj,e1.hyj,e1.lsj 
--FROM t_aa e
--JOIN t_jgxx e1 ON e.spbh=e1.spbh

------商品进价
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

---- 半年内有过进货和销售的有商品条码的商品信息 2021年12月7日 08:49:35 
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


--------- 删除存货信息 30886 40个数量 2021年11月25日 17:49:28 --------------
--SELECT *  --  DELETE    --删除数量 40
--FROM t_chxx WHERE spbh = '30886'

------- 导入询价单 2021年11月4日 10:05:44
--SELECT MAX(xjdbh) FROM t_xjdzb tx

----- 导入询价单
--INSERT INTO t_xjdzb(xjdbh,gysbh,rq,bz,flag) VALUES(	'XJ21000126','00035',GETDATE(),'',0)

--SELECT *
--FROM t_xjdzb tx
--JOIN t_xjdmxb tm ON tm.xjdbh = tx.xjdbh
--WHERE tx.xjdbh = 'XJ21000126'


---- 修改疫情管控药品的isMHJ标识为 1，疫情管控按照麻黄碱要求给出提醒，提醒收款员记录购药用户的个人信息
---- 满足药监的监管要求 2021年10月26日 13:48:51
--SELECT distinct b.spbh,b.pm,b.IsMHJ,b.GMP,b.TZM
---- update b set b.tzm = '0',b.isMHJ='1',b.gxrq=getdate()
--FROM t_3 a  
--JOIN t_spxx b ON a.pm=b.pm
--WHERE b.FLAG=1 AND b.GMP='N' AND b.IsMHJ=0
------- 按商品编码更新 2021年10月28日 08:27:27
--SELECT distinct b.spbh,b.pm,b.IsMHJ,b.GMP,b.TZM
---- update b set b.tzm = '0',b.isMHJ='1',b.gxrq=getdate()
--FROM t_3 a  
--JOIN t_spxx b ON a.spbh=b.spbh
--WHERE b.FLAG=1 AND b.GMP='N' AND b.IsMHJ=0


------------- 删除 00080 供应商 历史进货单 2021年10月19日 17:32:42---------
--SELECT a.*  -- delete b
--FROM t_jhdzb a
--JOIN t_jhdmxb b ON b.JHDBH = a.JHDBH
--WHERE a.gysbh = '00080' AND a.JHRQ < '2021-1-1'

--SELECT a.*  -- delete a
--FROM t_jhdzb a
--WHERE a.gysbh = '00080' AND a.JHRQ < '2021-1-1'

--------------补录进货单 2021年9月15日 16:23:45
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
--       scqyxkzh, 'E:\良田\WORKPATH\国药控股\11447_129211068.jpg'
--FROM t_jhdmxb 
--WHERE jhdbh = 'JH21001153' AND spbh = '11447'
--------- 修改 出库单 批号
--SELECT *  -- update a set a.pcbh= '129211068'
--FROM t_ckdmxb a
--WHERE ckdbh = 'CK21000639' AND spbh = '11447'



------- 修改进货单 供应商 2021年9月14日 14:06:53
--SELECT jhdbh,jhrq,gysbh,pmje   -- update a set a.gysbh='00336'
--FROM T_JHDZB a
--WHERE jhdbh IN('jh21001652','jh21001653')
------ 查询关联进口药记录表里涉及对应进货单的数据，涉及的同时修改对应供应商 
--SELECT *
--FROM T_JKYPDJB 
--WHERE jhdbh IN('jh21001652','jh21001653')

----SELECT * FROM t_gysxx WHERE gysbh = '00336'

--------删除退货单中 退货区的商品存量 2021年7月29日 10:24:13 ----------------
--SELECT *  -- delete c
--FROM T_THDMXB tt
--JOIN T_THDZB tt2 ON tt2.THDBH = tt.THDBH
--JOIN t_chxx c ON tt.spbh = c.spbh AND tt.pcbh = c.PCBH
--WHERE tt.THDBH IN('th21000215','th21000224')

-------更新进货单付款标识 2021年6月1日 16:20:17 ---------------
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
--WHERE a.gysbh = '000304'--#  退货付款
--SELECT *
--FROM T_FKJLMXB tf 
--JOIN T_THdmxb tm ON tf.ID=tm.id AND tf.lx=2
--WHERE tf.FKJLBH='2021000226'

----# 进货付款
--SELECT tf.*,tz.jhdbh,tz.gysbh,tm.SL, tm.JHJ, tm.KL, tm.fkbz,sl*jhj
--FROM T_FKJLMXB tf 
--JOIN T_jHdmxb tm ON tf.ID=tm.id AND tf.lx=1
--JOIN t_jhdzb tz ON tm.JHDBH=tz.JHDBH
--WHERE tf.FKJLBH='2021000226'

------- 查询最近半年进货最低价的商品 2021年4月20日 17:20:20 --------------
--SELECT g.GYSMC,m.spbh,s.pm,s.gg,s.CJMC,min(m.jhj)
--FROM t_jhdzb z
--JOIN t_jhdmxb m ON m.JHDBH = z.JHDBH
--JOIN v_spxx s ON m.spbh = s.SPBH
--JOIN t_gysxx g ON z.GYSBH=g.GYSBH
--WHERE DATEDIFF(DAY,z.JHRQ,GETDATE()) < 181
--GROUP BY g.GYSMC,s.pm,m.spbh,s.gg,s.CJMC
--ORDER BY m.spbh

---------------- 修改网店出库单状态 2021年4月14日 18:02:09 ----------
--SELECT *   -- UPDATE a SET a.yxbz = 15
--FROM T_CKDZB a
--WHERE jsdw = '201' AND yxbz = 10


----------------查询库存商品信息  2021年4月3日 13:24:08  -------------
--SELECT DISTINCT a.spbh,s.pm,s.gg,s.CJMC,s.GMP,j.lsj,j.ZDJJ,s.is
--FROM t_fgskc a 
--JOIN V_SPXX s ON a.spbh = s.SPBH
--JOIN t_jgxx j ON a.spbh = j.SPBH
--WHERE a.shul - a.yxsl > 0

------------网店系统数据导出sql  2021年4月2日 11:11:55 -------------
--SELECT a.spbh 商家编码,a.spbh 货品编码,b.pm 货品名称,b.gg 规格名称,'' 规格码,b.spbm 条码,0 最低售价,0 零售价,0 成本价,
--0 批发价, 0 会员价,0 市场价,0 有效期,0 长,0 宽,0 高,0 重量,0 税率,0 启用序列号,0 允许负库存,0 出库不用验货,
--0 允许0成本,0 允许低于成本价,0 航空禁运,0 大件,0 单品基本单位,0 单品辅助单位,a.pcbh 单品自定义1,a.yxrq 单品自定义2,
--'' 单品自定义3,'' 单品自定义4,'' 单品自定义5,'' 单品自定义6,'' 最佳销售期,'' 最佳收货期,'' 销售积分,'' 打包积分,
--'' 拣货积分,'' 单品备注,'' 同一批次出库
--FROM t_ckdmxb a
--JOIN v_spxx b ON a.spbh=b.spbh
--WHERE ckdbh = 'CK19000314'


----------2020年2月8日 20:35:38
-------处理总店临时删除数据 公司系统：屏蔽304972、304973、30434三种商品2020年1月22日前的进货记录
--SELECT m.* -- UPDATE m SET m.FLAG = 0
--FROM t_jhdmxb m
--JOIN t_jhdzb z ON z.JHDBH = m.JHDBH
--WHERE z.jhrq > '2020.1.22' AND m.spbh IN ('304972','304973','30434')

------ 修改公司零售的情况  2021年3月10日 17:21:36
--SELECT *
--FROM t_chxx 
--WHERE spbh = '30924'

------ 更新台帐数量 
--SELECT *  --  UPDATE a SET a.sl=50,a.jine=50*jiag
--FROM t_ckmx a
--WHERE djhm = 'gsls' AND SPBH='30924' AND ordr=28

------ 新增库存数量
--INSERT INTO t_chxx(SPBH, PCBH, yxrq, jiag,sccj,scrq,dhrq,CHSL,HWBH, FLAG)
--SELECT TOP 1 spbh,pcbh,yxq,jhj,sccj,SCRQ,b.jhrq,50,'H01',1
--FROM t_jhdmxb a
--JOIN t_jhdzb b ON b.JHDBH = a.JHDBH
--WHERE spbh = '30924' AND pcbh = '20200908'
--ORDER BY a.jhdbh desc






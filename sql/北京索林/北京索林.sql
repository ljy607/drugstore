-- 修改单位信息表，增加经营范围字段
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

--更新供应商信息
update g 
set g.xkzh=ts.xkzh,g.xkzfzjg=ts.xkzfzjg,g.sh=ts.zczh,g.yyzzfzrq=ts.yyzzfzrq,g.yyzzfzjg=ts.yyzzfzjg
FROM T_SYQYSPB ts
JOIN t_gysxx g ON g.gysmc = ts.gysmc

-- 同步货品信息  2024年8月31日 19:33:32
INSERT INTO bjsl.中间库.dbo.Assign_货品接口表( 货主,编号,原编号,guid,名称,查询码,规格,产地,单位,有效期,批准文号
,批准文号效期,通用名称
,条形码,重点养护品种,是否OTC
,是否中药,简称, 生产厂商, 剂型, 储存条件,化学名,上市许可持有人,注册商标,货品属性,货品大类
,货主名称,所属生产企业经营范围,状态)
SELECT '010013',s.SPBH,s.spbh,NEWID(),s.PM, s.JC,S.gg,case isnull(cd,'') WHEN '' then '-' ELSE cd END cd,jldw,yxqx,pzwh
,case s.pzwhyxq WHEN '1900/01/01' THEN '' ELSE isnull(s.pzwhyxq,'2026/12/31') end pzwhyxq,pm
,s.spbm,CASE yhlx WHEN 1 THEN '是' ELSE '否' END yhlx,case gmp WHEN 'Y' THEN '是' ELSE '否' END AS OTC
,CASE LEFT(spbh,1) WHEN '7' THEN '是' ELSE '否' end,jc,cjmc,jxmc,'阴凉' cctj,hxmc,marketby,sb,s.jyfwid,'其它' as hpdl
,'北京市弘济药店有限公司',s.jx,case flag when 1 then '启用' else '禁用' end   
FROM V_SPXx s
WHERE s.flag = 1 AND GXRQ > '2024.10.1'

-- 客户表 0供应商
INSERT INTO bjsl.中间库_cs.dbo.Assign_客户接口表
(货主,编号,客户类型,guid,名称,查询码,原编号,地址,收货地址,联系人,电话,货主名称,企业类型,许可证类别
,发证机关,统一社会信用代码,经营许可证号有效期至,经营许可证号,营业执照号,营业执照有效期至,颁发日期,状态,经营范围)
SELECT '010013',GYSBH,0,NEWID(),GYSMC,GYSJC,gysbh,LXDZ,'',lxr,dh1,'北京市弘济药店有限公司',lb,xkzlb
,xkzfzjg,sh,jyxkzrq,xkzh,sh,gsyzrq,yyzzfzrq,CASE flag WHEN 1 THEN '启用' ELSE '禁用' end,jyfw 
FROM t_gysxx 
WHERE flag = 1 AND xkzh IS NOT null

-- 客户表 1门店
INSERT INTO bjsl.中间库.dbo.Assign_客户接口表
(货主,编号,客户类型,guid,名称,查询码,原编号,地址,收货地址,联系人,电话,货主名称,经营范围,企业类型,许可证类别
,发证机关,统一社会信用代码,经营许可证号有效期至,经营许可证号,营业执照号,营业执照有效期至,颁发日期,状态)
SELECT '010013',dwbh,1,guid,dwmc,jc,dwbh,dwdz,dwdz,'',DH,'北京市弘济药店有限公司',jyfw,'经营企业',xkzlb
,xkzfzjg,sh,ypjyxkzyxrq,ypjyxkzh,sh,yyzzyxrq,yyzzfzrq,CASE flag WHEN 1 THEN '启用' ELSE '禁用' end
FROM t_dwxx 
WHERE dwbh LIKE '1%' AND FLAG = 1 AND dwbh = '100'

-- 客户收货地址接口表
INSERT INTO bjsl.中间库.dbo.Assign_客户收货地址接口表
(货主,客户编号,客户类型,地址编号,guid,收货地址,货主名称,客户名称,联系人,联系电话)
SELECT '010013',dwbh,1,dwbh,guid,dwdz,dwmc,dwmc,'',DH
FROM t_dwxx 
WHERE dwbh LIKE '1%' AND FLAG = 1

INSERT INTO bjsl.中间库.dbo.Assign_客户收货地址接口表_each
(货主,客户编号,客户类型,地址编号,guid,收货地址,货主名称,客户名称,联系人,联系电话)
SELECT '010013',dwbh,1,dwbh,guid,dwdz,dwmc,dwmc,'',DH
FROM t_dwxx 
WHERE dwbh LIKE '1%' AND FLAG = 1

-- 经营许可范围接口表
INSERT INTO bjsl.中间库.dbo.Assign_经营许可范围接口表
(货主,物流中心,经营许可范围ID,经营许可范围名称,备注,货主名称)
SELECT '010013' hz,'1' wlzx,b.code,b.name,b.note,''
FROM t_dwxx_jyfw a
JOIN t_options b ON a.jyfwid=b.code
WHERE b.pid = 5 AND dwbh = '000'

-- 生产企业经营范围接口表
INSERT INTO bjsl.中间库.dbo.Assign_生产企业经营范围接口表
(货主,物流中心,生产企业经营范围ID,生产企业经营范围名称)
SELECT '010013' hz,1 wlzx,id,mc
FROM T_JX tj


-- 要货计划同步 2024年9月6日 14:08:18
-- DELETE FROM bjsl.中间库_cs.dbo.Pass_入库接口表_wait where 通知单号='YH23000391'
INSERT INTO bjsl.中间库_cs.dbo.Pass_入库接口表_wait
(物流中心,入库类型,货主,通知单号,通知单行号,客户编号,货品编号,数量,客户名称,货品名称,时间,说明,单价,金额,客户类型,业务员)
SELECT 2,1,'010013',z.yhdbh,m.ordr,m.gysbh,m.spbh,m.yhsl,g.gysmc,s.pm,z.yhrq,z.bz,m.jhj,m.jhj*m.yhsl,0,a.xm
FROM t_yhjhzb z
JOIN t_yhjhmx m ON m.YHDBH = z.YHDBH
JOIN V_SPXX s ON s.SPBH = m.SPBH
LEFT JOIN t_gysxx g ON m.GYSBH=g.GYSBH
LEFT JOIN t_zgxx a ON a.bh = z.ZBR
WHERE z.yhdbh = 'YH23000391' AND m.gysbh <> ''

--退库单 
INSERT INTO bjsl.中间库_cs.dbo.Pass_入库接口表_wait
(物流中心,入库类型,货主,通知单号,通知单行号,客户编号,货品编号,数量,客户名称,货品名称,时间,说明,单价,金额,客户类型)
SELECT 1,2,'010013',z.tkdbh,m.ordr,m.spbh,m.shul,s.pm,z.tkrq,z.bz,m.jhjg,m.jhjg*m.shul,1,pcbh,yxrq,scrq,z.tkdw,d.dwmc
FROM t_tkdzb z
JOIN t_tkdmxb m ON m.tkDBH = z.tkDBH
JOIN V_SPXX s ON s.SPBH = m.SPBH
JOIN t_dwxx d on z.tkdw = d.dwbh
WHERE z.tkdbh = 'TK10523000545'

--退货单
INSERT INTO bjsl.中间库_cs.dbo.Pass_出库接口表_wait
(物流中心,出库类型,货主,通知单号,通知单行号,客户编号,货品编号,数量,批号,客户名称,货品名称,单价,金额,说明,客户类型,时间,_date)
SELECT 1,12,'',z.thdbh,m.ordr,m.GYSBH,m.spbh,m.thsl,m.pcbh,g.gysmc,s.pm,m.jhj,m.jhj*m.thsl AS je,z.bz,0,z.thrq,z.thrq
FROM t_thdzb z
JOIN t_thdmxb m ON m.THDBH = z.THDBH
JOIN t_gysxx g ON m.GYSBH=g.GYSBH
JOIN v_spxx s ON m.spbh=s.spbh
WHERE z.thdbh = 'TH22000358'

--出库单
INSERT INTO bjsl.中间库_cs.dbo.Pass_出库接口表_wait
(物流中心,出库类型,货主,通知单号,通知单行号,客户编号,货品编号,数量,批号,客户名称,货品名称,单价,金额,说明,客户类型,时间,_date,业务员)
SELECT 1,11,'',z.ckdbh,m.ordr,z.jsdw,m.spbh,m.shul,m.pcbh,g.dwmc,s.pm,m.lsj,m.lsj*m.shul AS je,z.bz,0,z.ckrq,z.ckrq,a.xm
FROM t_ckdzb z
JOIN t_ckdmxb m ON m.ckDBH = z.ckDBH
JOIN t_dwxx g ON z.jsdw=g.dwbh
JOIN v_spxx s ON m.spbh=s.spbh
JOIN t_zgxx a ON z.ckr = z.bh 
WHERE z.ckdbh = 'ck24000037'

-- 初始化菜单 2024年9月11日 09:45:09
INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
VALUES('10','索林数据上传',5,2,'索林数据上传','image\tom_wap.gif','w_bjsl_djsc',1,1,0);

INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
VALUES('11','索林数据获取',5,2,'索林数据获取','image\tom_wap.gif','w_bjsl_djlq',1,1,0);

INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
VALUES('12','索林数据查询',5,2,'索林数据查询','image\tom_wap.gif','w_bjsl_fhjl',1,1,0);


-- 入库单返回接口表
SELECT 物流中心 as wlzx,入库类型 as rklx,货主 as hz,wms收货单号 as wmsdh,通知单号 as tzdh,通知单行号 as ordr
,货品编号 as spbh,批号 as pcbh,收货数量 as shsl,拒收数量 as jssl,取消数量 as qxsl,入库日期 as rkrq
,货品名称 as pm,有效期至 as yxrq,生产日期 as scrq,拒收原因 as jsyy,验收员 as ysy,批准文号 as pzwh
,批准文号效期 as pzwhyxq
FROM Pass_新入库返回接口表_wait t

-- 养护记录返回表
SELECT 养护记录单号 as yhjldh,库区编号 as kqbh,货位编号 as hwbh,生产批号或序列号 as pcbh
,养护日期 as yhrq,养护类型 as yhlx,养护员 as yhy,货主方货品编号 as spbh,货主方货品名称 as pm,规格或型号 as gg
,产地 as cd,生产厂商 as sccj,单位 as jldw,储存条件 as cctj,库区名称 as kqmc,货位名称 as hwmc,有效期至 as yxrq
,生产日期 as scrq,养护数量 as yhsl,质量状况 as zlzk,处理意见 as clyj,养护结论 as yhjl
FROM Book_养护记录返回接口表_each

--运输记录
SELECT 货单号 as hdh,通知单号 as tzdh,通知单行号 as tzdhh,货主方货品编号 AS spbh,货主方货品名称 as pm
,货主方客户编号 as dwbh,货主方客户名称 as dwmc,发运时间 as fysj,到货时间 as dhsj,车牌号码 as cphm,司机 as sj
,收货单位 as shdw,收货地址 as shdz,收货人 as shr,运输方式 as ysfs
FROM Book_运输记录返回接口表_each

--索林入库表
SELECT DISTINCT wms收货单号 AS wmsdh,通知单号 as dh
FROM Pass_新入库返回接口表_wait
WHERE 通知单号 LIKE 'JH%' and  货主 = :a
ORDER BY 通知单号 desc

SELECT wms收货单号 AS dh,通知单号 as yhdbh,通知单行号 as ordr,货品编号 as spbh,批号 as pcbh,收货数量 as shsl
,拒收数量 as jssl,取消数量 as qxsl,_date as rkrq,有效期至 as yxrq,生产日期 as scrq,验收员 as ysy
FROM Pass_新入库返回接口表_wait
WHERE WMS收货单号 = :a

--索林出库返回接口表
SELECT DISTINCT 通知单号 as dh,出库日期 as ckrq
FROM Pass_出库返回接口表_wait
WHERE 出库类型=11 and 货主=:a

SELECT 通知单号 as dh,通知单行号 as ordr,货品编号 as spbh,批号 as pcbh,出库数量 as cksl,货品名称 as pm
,有效期至 as yxrq,生产日期 as scrq
FROM Pass_出库返回接口表_wait
WHERE 通知单号=:a





--返回记录查询
----运输记录
SELECT 通知单号 dh,通知单行号 ordr,生产批号或序列号 pcbh,货主方货品编号 spbh,货主方货品名称 pm
,发运时间 fysj,到货时间 dhsj,车牌号码 cphm,司机 sj,收货单位 shdw,收货地址 shdz,规格或型号 gg
,产地 cd,单位 jldw,有效期至 yxrq,生产日期 scrq,货物数量 shul,配送员 psy,发运人 fyr
,返回时间 fhsj,委托经办人 jbr,承运单位 cydw,发货地址 fhdz,剂型 jx,运输方式 ysfs,商品包装 spbz,整件数量 zjsl
,散件数量 sjsl
FROM book_运输记录返回接口表_each
WHERE 货主编号=:a and 通知单号 LIKE  '%'+:b+'%'

--查验记录
SELECT 通知单号 dh,通知单行号 ordr,查验结果 cyjg,查验处理措施 cyclcs,货主方客户编号 khbh,货主方客户名称 khmc
,到货时间 dhsj,查验日期 cyrq,入库类型 rklx,业务员 ywy,查验员 cyy,货主方货品编号 spbh,货主方货品名称 pm
,规格或型号 gg,产地 cd,生产厂商 sccj,单位 jldw,包装 bzsl,储存条件 cctj,注册证号 zczh
,生产企业许可证号或备案凭证号 xkzh,货品大类 hpdl,货品属性 hpsx,有效期至 yxrq,生产日期 scrq,合格证明 hgzm
,计划数量 jhsl,拒收原因 jsyy,查验数量 cysl,查验合格数量 hgsl,实际件数 sjjs,不合格事宜 bhgsy
,处理措施 clcs,货主名称 hzmc,剂型 jx,批准文号 pzwh,生产批号或序列号 pcbh
FROM book_查验记录返回接口表_each
WHERE 货主编号=:a and 通知单号 like '%'+:b+'%'

--复核记录
SELECT 通知单号 dh,通知单行号 ordr,库区编号 kqbh,货位编号 hwbh,生产批号或序列号 pcbh,货主方客户编号 khbh
,货主方客户名称 khmc,复核日期 fhrq,出库类型 cklx,拣货员 jhy,复核员 fhy,货主方货品编号 spbh,货主方货品名称 pm
,规格或型号 gg,产地 cd,生产厂商 sccj,单位 jldw,包装 bzsl,储存条件 cctj,注册证号 zczh
,生产企业许可证号或备案凭证号 xkzh,货品大类 hpdl,货品属性 hpsx,库区名称 kqmc,货位名称 hwmc,有效期至 yxrq
,生产日期 scrq,计划数量 jhsl,复核数量 fhsl,剂型 jx,质量状况 zlzk,货主名称 hzmc,'' 剂型
FROM book_复核记录返回接口表_each
WHERE 货主编号=:a and 通知单号 like '%'+:b+'%'

--收货记录
SELECT 通知单号 dh,通知单行号 ordr,生产批号或序列号 pcbh,货主方客户编号 khbh
,货主方客户名称 khmc,收货日期 shrq,入库类型 rklx,业务员 ywy,收货员 shy,货主方货品编号 spbh,货主方货品名称 pm
,规格或型号 gg,产地 cd,生产厂商 sccj,单位 jldw,包装 bz,储存条件 cctj,注册证号 zczh
,生产企业许可证号或备案凭证号 xkzh,货品大类 hpdl,货品属性 hpsx,随货同行票号 shtxph,承运方式 cyfs,有效期至 yxrq
,生产日期 scrq,计划数量 jhsl,实收数量 sssl,拒收数量 jssl,到货时间 dhsj,收货结论 shjl,货主名称 hzmc,启运时间 fhsj
,运输方式 ysfs,'北京市大兴区中关村科技园区大兴生物医药产业基地仲景路13号院1号楼1层' shdz,剂型 jx
FROM book_收货记录返回接口表_each
WHERE 货主编号=:a and 通知单号 like '%'+:b+'%'

--盘点记录
SELECT 通知单号 dh,通知单行号 ordr,库区编号 kqbh,货位编号 hwbh,生产批号或序列号 pcbh,盘点单号 pddh
,盘点日期 pdrq,盘点类型 pdlx,操作员 czy,职员部门 zybm,货主方货品编号 spbh,货主方货品名称 pm
,规格或型号 gg,产地 cd,生产厂商 sccj,单位 jldw,包装 bzsl,储存条件 cctj,注册证号 zczh
,生产企业许可证号或备案凭证号 xkzh,货品大类 hpdl,货品属性 hpsx,库区名称 kqmc,货位名称 hwmc,有效期至 yxrq
,生产日期 scrq,盘点数量 pdsl,摘要 zy,备注 bz
FROM book_盘点记录返回接口表_each
WHERE 货主编号=:a and 通知单号 like '%'+:b+'%'

-- 收货记录
SELECT 通知单号 dh,通知单行号 ordr,生产批号或序列号 pcbh,货主方客户编号 khbh
,货主方客户名称 khmc,收货日期 shrq,入库类型 rklx,业务员 ywy,收货员 shy,货主方货品编号 spbh,货主方货品名称 pm
,规格或型号 gg,产地 cd,生产厂商 sccj,单位 jldw,包装 bz,储存条件 cctj,注册证号 zczh
,生产企业许可证号或备案凭证号 xkzh,货品大类 hpdl,货品属性 hpsx,随货同行票号 shtxph,承运方式 cyfs,有效期至 yxrq
,生产日期 scrq,计划数量 jhsl,实收数量 sssl,拒收数量 jssl,到货时间 dhsj,收货结论 shjl
FROM book_收货记录返回接口表_each
WHERE 货主编号=:a and 通知单号 like '%'+:b+'%'

-- 养护记录
SELECT 养护记录单号 dh,库区编号 kqbh,货位编号 hwbh,生产批号或序列号 pcbh
,养护日期 yhrq,养护类型 yhlx,养护员 yhy,货主方货品编号 spbh,货主方货品名称 pm
,规格或型号 gg,产地 cd,生产厂商 sccj,单位 jldw,包装 bzsl,储存条件 cctj,注册证号 zczh
,生产企业许可证号或备案凭证号 xkzh,货品大类 hpdl,货品属性 hpsx,库区名称 kqmc,货位名称 hwmc,有效期至 yxrq
,生产日期 scrq,养护数量 yhsl,质量状况 zlzk,处理意见 clyj,养护结论 yhjl,说明 sm
FROM book_养护记录返回接口表_each
WHERE 货主编号=:a and 养护记录单号 like '%'+:b+'%'

-- 收货入库记录
SELECT wms收货单号 wmsdh,通知单号 dh,通知单行号 ordr,货品编号 spbh,批号 pcbh,收货数量 shsl,拒收数量 jssl
,取消数量 qxsl,入库日期 rkrq,货品名称 pm,有效期至 yxrq,生产日期 scrq,拒收原因 jsyy,验收员 ysy,批准文号 pzwh
,批准文号效期 pzwhyxq,说明 sm,注册证号 zczh,注册证效期 zczxq,生产企业许可证号或备案凭证号 xkzh
,生产企业许可证号或备案凭证号效期 xkzxq,随货同行票号 shtxph,物流中心 wlzx,入库类型 rklx,货主 hz
,灭菌批号 mjph,库类型 klx
from pass_新入库返回接口表_wait
WHERE 通知单号 = :a


-- 北京索林来货入库记录 2024年10月9日 14:46:17
CREATE TABLE t_bjsl_rkjl
(
	wlzx INT NOT null,			--物流中心
	rklx INT NOT null,			--入库类型
	hz NVARCHAR(50) NOT null,	--货主
	wmsdh NVARCHAR(20) NOT NULL,--wms收货单号
	dh NVARCHAR(50) NOT NULL,	--通知单号
	hh INT	NOT NULL,			--通知单行号
	spbh NVARCHAR(50) NOT NULL,	--货号
	pcbh NVARCHAR(50) NOT NULL,	--批号
	mjph NVARCHAR(50) NOT NULL,	--灭菌批号
	klx INT NOT NULL,			--库类型
	shsl DECIMAL(18,4),			--收货数量
	jssl DECIMAL(18,4),			--拒收数量
	qxsl DECIMAL(18,4),			--取消数量
	rkrq DATETIME,				--入库日期
	pm NVARCHAR(50),			--货品名称
	yxrq DATETIME,				--有效期至
	scrq DATETIME,				--生产日期
	sm NVARCHAR(200),			--说明
	ysy NVARCHAR(50),			--验收员
	zczh NVARCHAR(100),			--注册证号
	zczxq DATETIME,				--注册证效期
	pzwh NVARCHAR(100),			--批准文号
	pzwhxq DATETIME,			--批准文号效期
	xkzh NVARCHAR(100),			--生产企业许可证号或备案凭证号
	xkzxq DATETIME,				--生产企业许可证号或备案凭证号效期
	shtxph NVARCHAR(1000),		--随货同行票号
	PRIMARY KEY(wlzx,rklx,hz,wmsdh,dh,hh,spbh,pcbh,mjph,klx)
)




/****************
* 功能：发送采购计划到北京索林数据库
* 时间：2024年9月11日 13:31:00
* 参数：hz varchar(30)		货主
*		yhdbh varchar(32)	要货单号
****************/
create PROCEDURE bjsl_cgjh @yhdbh varchar(32),@hz VARCHAR(30) AS
begin

INSERT INTO bjsl.中间库_cs.dbo.Pass_入库接口表_wait
(物流中心,入库类型,货主,通知单号,通知单行号,客户编号,货品编号,数量,批号,客户名称,货品名称,有效期至,
生产日期,业务员,时间,说明,单价,金额)
SELECT 1,1,@hz,z.yhdbh,m.ordr,m.gysbh,m.spbh,m.yhsl,'',g.gysmc,s.pm,'','','',z.yhrq,z.bz,m.jhj,m.jhj*m.yhsl
FROM t_yhjhzb z
JOIN t_yhjhmx m ON m.YHDBH = z.YHDBH
JOIN V_SPXX s ON s.SPBH = m.SPBH
LEFT JOIN t_gysxx g ON m.GYSBH=g.GYSBH
WHERE isnull(m.gysbh,'') <> '' AND z.yhdbh = @yhdbh;

END 
SELECT *  -- delete 
FROM Assign_货品接口表_each
WHERE 货主='010013' and 编号 in('100816','400426','11787','4074110','409978')

SELECT *  -- delete 
FROM Assign_客户收货地址接口表_each
WHERE 货主='010013'

SELECT *
FROM Pass_出库接口表_wait
WHERE 货主='010013'

SELECT *  -- delete
FROM Pass_出库接口表_each
WHERE 货主='010013'

SELECT *  -- delete 
FROM pass_入库接口表_each
WHERE 货主='010013' and 通知单号='YH24000791'

SELECT *  -- delete 
FROM pass_入库接口表_wait
WHERE 货主='010013' and 通知单号='YH24000791_00432'

SELECT *  -- delete 
FROM pass_新入库返回接口表_wait
WHERE 货主='010013'

SELECT *  -- delete 
FROM pass_新入库返回接口表_each
WHERE 货主='010013'

SELECT *  -- delete 
FROM Pass_入库返回接口表_wait
WHERE 货主='010013'

SELECT *  -- delete 
FROM Pass_入库返回接口表_each
WHERE 货主='010013'

SELECT *  -- delete 
FROM Pass_出库返回接口表_wait
WHERE 货主='010013'

SELECT *   -- delete 
FROM Pass_出库返回接口表_each
WHERE 货主='010013'

SELECT *   -- delete 
FROM book_查验记录返回接口表_each
WHERE 货主编号='010013' and 通知单号 = 'YH24001087_00338' 

SELECT *   -- delete 
FROM book_复核记录返回接口表_each
WHERE 货主编号='010013'

SELECT *   -- delete 
FROM book_盘点记录返回接口表_each
WHERE 货主编号='010013'

SELECT *  -- delete 
FROM book_收货记录返回接口表_each
WHERE 货主编号='010013'

SELECT *  -- delete 
FROM book_运输记录返回接口表_each
WHERE 货主编号='010013'

SELECT *  -- delete 
FROM book_养护记录返回接口表_each
WHERE 货主编号='010013'

SELECT *  -- delete 
FROM Assign_客户接口表_each
WHERE 货主='010013'

SELECT DISTINCT wms收货单号 AS dh,通知单号 as yhdbh
FROM Pass_新入库返回接口表_wait
WHERE 通知单号 LIKE 'JH%' 
ORDER BY 通知单号 desc


SELECT 通知单号 as dh,通知单行号 as ordr,生产批号或序列号 as pcbh,货主方货品编号 as spbh,货主方货品名称 as pm
,发运时间 as fysj,到货时间 as dhsj,车牌号码 as cphm,司机 as sj,收货单位 as shdw,收货地址 as shdz,规格或型号 as gg
,产地 as cd,单位 as jldw,有效期至 as yxrq,生产日期 as scrq,货物数量 as shul,配送员 as pAS,发运人 as fyr
,返回时间 fhsj,委托经办人 jbr,承运单位 cydw,发货地址 fhdz,剂型 jx,运输方式 ysfs,商品包装 spbz,整件数量 zjsl
,散件数量 sjsl
FROM book_运输记录返回接口表_each
WHERE  货主编号=:a and 通知单号 like '%'+:b+'%'

SELECT distinct 查验单号 cydh,通知单号 dh,货主方客户编号 khbh,货主方客户名称 khmc,到货时间 dhsj,查验日期 cyrq,物流中心名称 wlzxmc
FROM book_查验记录返回接口表_each
WHERE 货主编号=:a 

SELECT 通知单号 dh,通知单行号 ordr,查验结果 cyjg,查验处理措施 cyclcs,货主方客户编号 khbh,货主方客户名称 khmc
,到货时间 dhsj,查验日期 cyrq,入库类型 rklx,业务员 ywy,查验员 cyy,货主方货品编号 spbh,货主方货品名称 pm
,规格或型号 gg,产地 cd,生产厂商 sccj,单位 jldw,包装 bzsl,储存条件 cctj,注册证号 zczh
,生产企业许可证号或备案凭证号 xkzh,货品大类 hpdl,货品属性 hpsx,有效期至 yxrq,生产日期 scrq,合格证明 hgzm
,计划数量 jhsl,拒收原因 jsyy,查验数量 cysl,查验合格数量 hgsl,实际件数 sjjs,不合格事宜 bhgsy
,处理措施 clcs,_id id,剂型 jx,批准文号 pzwh,物流中心名称 wlzxmc,物流中心ID wlzx,查验单号 cydh
,生产批号或序列号 pcbh,货主编号 hz,货主名称 hzmc
FROM book_查验记录返回接口表_each
WHERE 货主编号=:a and 查验单号 = :b

----- 复核记录 2024年11月19日 14:38:51
SELECT distinct 通知单号 dh,_date ckrq
FROM book_复核记录返回接口表_each
WHERE 货主编号= :a

SELECT 通知单号 dh,通知单行号 ordr,库区编号 kqbh,货位编号 hwbh,生产批号或序列号 pcbh,货主方客户编号 khbh
,货主方客户名称 khmc,复核日期 fhrq,出库类型 cklx,拣货员 jhy,复核员 fhy,货主方货品编号 spbh,货主方货品名称 pm
,规格或型号 gg,产地 cd,生产厂商 sccj,单位 jldw,包装 bzsl,储存条件 cctj,注册证号 zczh
,生产企业许可证号或备案凭证号 xkzh,货品大类 hpdl,货品属性 hpsx,库区名称 kqmc,货位名称 hwmc,有效期至 yxrq
,生产日期 scrq,计划数量 jhsl,复核数量 fhsl,剂型 jx,质量状况 zlzk,物流中心ID wlzx,复核单号 fhdh,_id id
,_date ckrq,物流中心名称 wlzxmc,货主编号 hz,货主名称 hzmc
FROM book_复核记录返回接口表_each
WHERE 货主编号=:a and 通知单号=:b


SELECT 通知单号 dh,通知单行号 ordr,库区编号 kqbh,货位编号 hwbh,生产批号或序列号 pcbh,盘点单号 pddh
,盘点日期 pdrq,盘点类型 pdlx,操作员 czy,职员部门 zybm,货主方货品编号 spbh,货主方货品名称 pm
,规格或型号 gg,产地 cd,生产厂商 sccj,单位 jldw,包装 bzsl,储存条件 cctj,注册证号 zczh
,生产企业许可证号或备案凭证号 xkzh,货品大类 hpdl,货品属性 hpsx,库区名称 kqmc,货位名称 hwmc,有效期至 yxrq
,生产日期 scrq,盘点数量 pdsl,摘要 zy,备注 bz
FROM book_盘点记录返回接口表_each
WHERE 货主编号=:a and 通知单号 like '%'+:b+'%'

SELECT 通知单号 dh,通知单行号 ordr,生产批号或序列号 pcbh,货主方客户编号 khbh
,货主方客户名称 khmc,收货日期 shrq,入库类型 rklx,业务员 ywy,收货员 shy,货主方货品编号 spbh,货主方货品名称 pm
,规格或型号 gg,产地 cd,生产厂商 sccj,单位 jldw,包装 bz,储存条件 cctj,注册证号 zczh
,生产企业许可证号或备案凭证号 xkzh,货品大类 hpdl,货品属性 hpsx,随货同行票号 shtxph,承运方式 cyfs,有效期至 yxrq
,生产日期 scrq,计划数量 jhsl,实收数量 sssl,拒收数量 jssl,到货时间 dhsj,收货结论 shjl
FROM book_收货记录返回接口表_each
WHERE 货主编号=:a and 通知单号 like '%'+:b+'%'


SELECT 养护记录单号 dh,库区编号 kqbh,货位编号 hwbh,生产批号或序列号 pcbh
,养护日期 yhrq,养护类型 yhlx,养护员 yhy,货主方货品编号 spbh,货主方货品名称 pm
,规格或型号 gg,产地 cd,生产厂商 sccj,单位 jldw,包装 bzsl,储存条件 cctj,注册证号 zczh
,生产企业许可证号或备案凭证号 xkzh,货品大类 hpdl,货品属性 hpsx,库区名称 kqmc,货位名称 hwmc,有效期至 yxrq
,生产日期 scrq,养护数量 yhsl,质量状况 zlzk,处理意见 clyj,养护结论 yhjl,说明 sm
FROM book_养护记录返回接口表_each
WHERE 货主编号=:a and 养护记录单号 like '%'+:b+'%'

---- 收货入库头信息 
SELECT DISTINCT wms收货单号 AS dh,通知单号 as yhdbh,时间 dhrq
FROM Pass_新入库返回接口表_wait
WHERE 货主 = :a

-- 收货入库记录明细
SELECT wms收货单号 wmsdh,通知单号 dh,通知单行号 ordr,货品编号 spbh,批号 pcbh,收货数量 shsl,拒收数量 jssl
,取消数量 qxsl,入库日期 rkrq,货品名称 pm,有效期至 yxrq,生产日期 scrq,拒收原因 jsyy,验收员 ysy,批准文号 pzwh
,批准文号效期 pzwhyxq,说明 sm,注册证号 zczh,注册证效期 zczxq,生产企业许可证号或备案凭证号 xkzh
,生产企业许可证号或备案凭证号效期 xkzxq,随货同行票号 shtxph,物流中心 wlzx,入库类型 rklx,货主 hz
,灭菌批号 mjph,库类型 klx,时间 dhrq,完成状态 wczt,任务行数 rwhs,包装 bzsl
from pass_新入库返回接口表_wait
WHERE 货主 = :a and wms收货单号 = :b

-- 出库记录头信息
SELECT DISTINCT 通知单号 dh
FROM Pass_出库返回接口表_wait
WHERE 出库类型=11 and 货主 = :a

--出库记录明细
SELECT 通知单号 dh,通知单行号 ordr,货品编号 spbh,批号 pcbh,出库数量 cksl,差异数量 cysl
,开票数量 kpsl,出库日期 ckrq,货品名称 pm,有效期至 yxrq,生产日期 scrq,物流中心 wlzx,出库类型 cklx,货主 hz
,灭菌批号 mjph,库类型 klx,包装 bzsl,完成状态 wczt,任务行数 rwhs,说明 shm,出库件数 ckjs
FROM Pass_出库返回接口表_wait
WHERE 货主=:a and 通知单号=:b

-- 退库记录，对应索林入库返回接口表 2024年11月19日 10:04:35
SELECT DISTINCT 通知单号 dh, 入库日期 rkrq
FROM Pass_入库返回接口表_wait
WHERE 货主=:a

SELECT 通知单号 dh,通知单行号 ordr,货品编号 spbh,批号 pcbh,收货数量 shsl,拒收数量 jssl
,取消数量 qxsl,入库日期 rkrq,货品名称 pm,有效期至 yxrq,生产日期 scrq,拒收原因 jsyy,验收员 ysy,批准文号 pzwh
,批准文号效期 pzwhyxq,说明 sm,注册证号 zczh,注册证效期 zczxq,生产企业许可证号或备案凭证号 xkzh
,生产企业许可证号或备案凭证号效期 xkzxq,随货同行票号 shtxph,物流中心 wlzx,入库类型 rklx,货主 hz
,灭菌批号 mjph,库类型 klx,时间 dhrq,完成状态 wczt,任务行数 rwhs,包装 bzsl
from pass_入库返回接口表_wait
WHERE 货主 = :a and 通知单号 = :b


-- 验收记录返回表剂型为空的 2024年11月12日 14:29:02
SELECT a.编号,a.剂型,a.批准文号,b.剂型,b.批准文号  -- delete 
FROM Assign_货品接口表_each  a
JOIN book_查验记录返回接口表_each b on a.编号=b.货主方货品编号
WHERE b.货主编号='010013' and b.剂型 is null


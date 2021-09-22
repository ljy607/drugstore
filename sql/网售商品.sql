------网售商品视图
CREATE VIEW v_mw_goods_pending
AS 
SELECT e.spbh AS erp_goods_code,'1' AS erp_class_id,'' as goods_code,e1.spbm as erp_barcode,
'' as erp_stacode,e1.pm as erp_goods_name,e1.gg as erp_spec,e1.jldw as erp_units,1 as erp_packconver,
e1.cjmc as erp_factory,e1.cd as erp_origin,e1.pzwh as erp_permitno,'' as erp_mnemonic,
case e.flag when 1 then 0 ELSE 1 end as DISABLED,'' as note,0 as has_same_bar_code
FROM hj00.zddb.dbo.t_spxx_wangshou e
JOIN hj00.zddb.dbo.v_spxx e1 ON e.spbh=e1.SPBh
GO

-----网售机构信息视图
CREATE VIEW v_mw_org_pending AS
SELECT dwbh AS erporg_id,dwbh as code,dwmc as NAME,3 as orgtype,
'' as tfn,'' as bankofdep,'' as bankacc,'' as regaddr,'' as warehaddr,
dh as tel,'' as note
FROM hj00.zddb.dbo.t_dwxx 
WHERE dwbh <> '000' AND FLAG = 1
GO

-----网售批次库存视图 
CREATE VIEW v_mw_org_batch_store_pending AS
SELECT e.fgsbh as erporg_id,e.spbh as erp_goods_code,
e.pcbh as batch_id,'' AS batch_no,e.yxrq AS validity,'' AS produce_date,
e.shul as stock_num,e1.jhj AS refercost_price,e.shul * e1.jhj AS cost_amount,
e.shul as vendibility_num, 0 AS n_vendibility_num,'' AS store_date,
'' as note, '' AS shelf_no
FROM hj00.zddb.dbo.t_fgskc e
JOIN hj00.zddb.dbo.t_spxx_wangshou e1 ON e.spbh=e1.spbh
GO

-----网售机构价格视图 
CREATE VIEW v_mw_org_price_pending AS
SELECT a.dwbh as erporg_id,b.spbh as erp_goods_code,b.lsj as retail_price,
b.hyj as member_price,'' as note
FROM hj00.zddb.dbo.t_dwxx a
JOIN hj00.zddb.dbo.t_spxx_wangshou b ON 1=1
WHERE a.dwbh <> '000'
GO

----更新网售商品价格  
SELECT tsw.*,a.zdjj,a.hyj  -- update tsw set tsw.jhj = a.hyj,tsw.hyj=a.hyj
FROM t_spxx_wangshou tsw
JOIN t_jgxx a ON tsw.spbh=a.SPBH

SELECT * FROM t_spxx_wangshou tsw

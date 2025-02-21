/******************* 过程说明 *****************************************************************
  生成北京药监对接入出库记录(门店)
  参数	        
  结果	生成北京药监入出库记录 t_bjyj_rck t_bjyj_rckmx
  修改		
**********************************************************************************************/
DROP PROCEDURE SP_bjyj_rck
go
create PROCEDURE [dbo].[SP_bjyj_rck] AS
BEGIN
	
DECLARE @rq DATETIME
SET @rq = '2022.1.1'

-- 进货入库 102
INSERT INTO t_bjyj_rck(bill_code,bill_time,bill_type,org_code,from_org_code,from_org_name,to_org_code,to_org_name,scbz)            
SELECT a.ckdbh,a.ckrq,'102',c.org_code,b.SH,b.dwmc,c.org_code,c.org_name,0
FROM t_ckdzb a
JOIN t_dwxx b ON dwbh = '000'
JOIN t_bjyj_pzxx c ON 1=1
JOIN (SELECT DISTINCT ckdbh FROM t_ckdmxb WHERE LEFT(spbh,1) IN('1','4')) e ON a.ckdbh=e.ckdbh
LEFT JOIN t_bjyj_rck d ON a.ckdbh = d.bill_code
WHERE a.ckrq > @rq AND a.yxbz = 10 AND d.bill_code IS NULL

INSERT INTO t_bjyj_rckmx(bill_code, ordr,code_count,code_type,code,exprie_date,pm,gg,jldw,pzwh,pcbh,scrq,spbh)
SELECT m.ckdbh,m.ORDR,m.shul,s.spbmlx,s.spbm code,m.yxrq,s.pm,s.gg,s.jldw,s.pzwh,m.PCBH,m.scrq,m.spbh
FROM t_ckdmxb m
JOIN t_ckdzb a ON a.ckDBH = m.ckDBH
JOIN v_spxx s ON m.spbh=s.SPBH
JOIN ( SELECT DISTINCT a.bill_code ckdbh
		FROM t_bjyj_rck a
		LEFT JOIN t_bjyj_rckmx b ON b.bill_code = a.bill_code
      WHERE b.bill_code IS NULL ) e ON m.ckdbh=e.ckdbh
WHERE LEFT(m.spbh,1) IN('1','4') and a.ckrq > @rq AND a.yxbz = 10    

-- 退货出库 202
INSERT INTO t_bjyj_rck(bill_code,bill_time,bill_type,org_code,from_org_code,from_org_name,to_org_code,to_org_name,scbz)            
SELECT a.tkdbh,a.tkrq,'202',c.org_code,b.SH,b.dwmc,c.org_code,c.org_name,0
FROM t_tkdzb a
JOIN t_dwxx b ON b.dwBH = '000'
JOIN t_bjyj_pzxx c ON 1=1
JOIN (SELECT DISTINCT tkdbh FROM t_tkdmxb WHERE LEFT(spbh,1) IN('1','4')) e ON a.tkdbh=e.tkdbh
LEFT JOIN t_bjyj_rck d ON a.tkdbh = d.bill_code
WHERE a.tkrq > @rq AND a.flag = 10 AND d.bill_code IS NULL

INSERT INTO t_bjyj_rckmx(bill_code,ordr,code_count,code_type,code,exprie_date,pm,gg,jldw,pzwh,pcbh,scrq,spbh)
SELECT m.tkdbh,m.ORDR,m.shul,s.spbmlx,s.spbm code,m.yxrq,s.pm,s.gg,s.jldw,s.pzwh,m.PCBH,m.scrq,m.spbh
FROM t_tkdmxb m
JOIN t_tkdzb a ON a.tkDBH = m.tkDBH
JOIN v_spxx s ON m.spbh=s.SPBH
JOIN (SELECT DISTINCT a.bill_code tkdbh
		FROM t_bjyj_rck a
		LEFT JOIN t_bjyj_rckmx b ON b.bill_code = a.bill_code
      WHERE b.bill_code IS NULL) e ON m.tkdbh=e.tkdbh
WHERE LEFT(m.spbh,1) IN('1','4') and a.tkrq > @rq AND a.flag = 10    

END 
GO

/******************* 过程说明 *****************************************************************
  生成北京药监当日库存信息
  参数	        
  结果	生成北京药监入出库记录 t_bjyj_drkc t_bjyj_drkcmx
  修改		
**********************************************************************************************/
DROP PROCEDURE SP_bjyj_drkc
go
create PROCEDURE SP_bjyj_drkc AS
BEGIN
DECLARE @id VARCHAR(8),@i int
SELECT @id = CONVERT(CHAR(8),getdate(),112)

SELECT @i=COUNT(*) FROM t_bjyj_drkc WHERE id = @id
IF @i < 1 
	BEGIN
		INSERT INTO t_bjyj_drkc(ID, AppKey, dwbh, org_code, org_name, jcsb_rq, scbz)
		SELECT @id,AppKey,dwbh,org_code,org_name,CONVERT(varCHAR(16),getdate(),120),0
		FROM t_bjyj_pzxx

		INSERT INTO t_bjyj_drkcmx(ID, spbh, code_type, code, pm, kcsl, cjmc, gg, jx, jldw, pzwh)
		SELECT @id,c.spbh,s.spbmlx,s.spbm,pm,c.chsl,s.cjmc,s.gg,s.jxmc,s.JLDW,s.pzwh
		FROM (SELECT spbh,SUM(isnull(chsl,0)) chsl FROM t_Chxx WHERE LEFT(spbh,1) IN('1','4') GROUP BY SPBH) c
		JOIN v_spxx s ON s.SPBH = c.SPBH
		WHERE c.chsl > 0 
	END
END 
GO

/******************* 过程说明 *****************************************************************
  生成北京药监零售单信息
  参数	        
  结果	生成北京药监零售单记录 t_bjyj_lsd t_bjyj_lsdmx
  修改		
**********************************************************************************************/
DROP PROCEDURE SP_bjyj_lsd
go
create PROCEDURE SP_bjyj_lsd AS
BEGIN
DECLARE @rq DATETIME
SET @rq = '2022.1.1'

---- 零售单销售信息
INSERT INTO t_bjyj_Lsd(bill_code,bill_time,bill_type,oper_ic_code,org_code,data_type,network_bill_flag,scbz,lsdbh)
SELECT b.dwbh+a.lsdbh,convert(varchar(16),a.rq,120),'321',b.AppKey,b.org_code,1,0,0,a.lsdbh
from t_lsdzb a
JOIN t_bjyj_pzxx b ON 1=1
JOIN ( SELECT DISTINCT m.lsdbh 
       FROM t_lsdmxb m JOIN t_lsdzb z ON z.LSDBH = m.LSDBH 
       WHERE LEFT(spbh,1) IN('1','4') AND rq > @rq AND m.sl > 0 ) e ON e.LSDBH = a.LSDBH
LEFT JOIN t_bjyj_lsd d ON a.lsdbh = d.lsdbh
WHERE a.rq > @rq AND d.lsdbh IS NULL

INSERT INTO t_bjyj_lsdmx(lsdbh,ordr,spbh,code_count,code_type,code,pm,gg,jldw,pzwh,pcbh)
SELECT m.lsdbh,m.ORDR,m.SPBH,m.SL,s.spbmlx,s.spbm,s.pm,s.gg,s.jldw,s.pzwh,m.pcbh
FROM t_lsdmxb m
JOIN v_spxx s ON s.spbh=m.spbh
JOIN t_bjyj_pzxx p ON 1=1
JOIN ( SELECT z.lsdbh FROM t_bjyj_lsd z LEFT JOIN t_bjyj_lsdmx m ON z.lsdbh=m.lsdbh 
      WHERE m.lsdbh IS null ) e ON e.lsdbh = m.LSDBH
WHERE LEFT(m.spbh,1) IN('1','4') 

---- 零售单退货信息
INSERT INTO t_bjyj_Lsd(bill_code,bill_time,bill_type,oper_ic_code,org_code,data_type,network_bill_flag,scbz,lsdbh)
SELECT b.dwbh+a.lsdbh,convert(varchar(16),a.rq,120),'116',b.AppKey,b.org_code,1,0,0,a.lsdbh
from t_lsdzb a
JOIN t_bjyj_pzxx b ON 1=1
JOIN ( SELECT DISTINCT m.lsdbh 
       FROM t_lsdmxb m JOIN t_lsdzb z ON z.LSDBH = m.LSDBH 
       WHERE LEFT(spbh,1) IN('1','4') AND rq > @rq AND m.sl < 0 ) e ON e.LSDBH = a.LSDBH
LEFT JOIN t_bjyj_lsd d ON a.lsdbh = d.lsdbh
WHERE a.rq > @rq AND d.lsdbh IS NULL

INSERT INTO t_bjyj_lsdmx(lsdbh,ordr,spbh,code_count,code_type,code,pm,gg,jldw,pzwh,pcbh)
SELECT m.lsdbh,m.ORDR,m.SPBH,m.SL * -1,s.spbmlx,s.spbm,s.pm,s.gg,s.jldw,s.pzwh,m.pcbh
FROM t_lsdmxb m
JOIN v_spxx s ON s.spbh=m.spbh
JOIN t_bjyj_pzxx p ON 1=1
JOIN ( SELECT z.lsdbh FROM t_bjyj_lsd z LEFT JOIN t_bjyj_lsdmx m ON z.lsdbh=m.lsdbh 
      WHERE m.lsdbh IS null ) e ON e.lsdbh = m.LSDBH
WHERE LEFT(m.spbh,1) IN('1','4') 

---- 外卖销售信息
INSERT INTO t_bjyj_Lsd(bill_code,bill_time,bill_type,oper_ic_code,org_code,data_type,network_bill_flag,scbz,lsdbh)
SELECT b.dwbh+a.lsdbh,convert(varchar(16),a.rq,120),'321',b.AppKey,b.org_code,1,1,0,a.lsdbh
from t_lsdzb_W a
JOIN t_bjyj_pzxx b ON 1=1
JOIN ( SELECT DISTINCT m.lsdbh 
       FROM t_lsdmxb_w m JOIN t_lsdzb_w z ON z.LSDBH = m.LSDBH 
       WHERE LEFT(spbh,1) IN('1','4') AND rq > @rq ) e ON e.LSDBH = a.LSDBH
LEFT JOIN t_bjyj_lsd d ON a.lsdbh = d.lsdbh
WHERE a.rq > @rq AND d.lsdbh IS NULL

INSERT INTO t_bjyj_lsdmx(lsdbh,ordr,spbh,code_count,code_type,code,pm,gg,jldw,pzwh,pcbh)
SELECT m.lsdbh,m.id,m.SPBH,m.SL,s.spbmlx,s.spbm,s.pm,s.gg,s.jldw,s.pzwh,m.pcbh
FROM t_lsdmxb_w m
JOIN v_spxx s ON s.spbh=m.spbh
JOIN t_bjyj_pzxx p ON 1=1
JOIN ( SELECT z.lsdbh FROM t_bjyj_lsd z LEFT JOIN t_bjyj_lsdmx m ON z.lsdbh=m.lsdbh 
      WHERE m.lsdbh IS null ) e ON e.lsdbh = m.LSDBH
WHERE LEFT(m.spbh,1) IN('1','4') 


END 
GO


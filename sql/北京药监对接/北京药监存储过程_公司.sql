/******************* 过程说明 *****************************************************************
  生成北京药监对接入出库记录（公司）
  参数	@dwbh	单位编号
        
  结果	生成北京药监入出库记录 t_bjyj_rck t_bjyj_rckmx
  修改		
**********************************************************************************************/
DROP PROCEDURE SP_bjyj_rck
go
create PROCEDURE [dbo].[SP_bjyj_rck] AS
begin
DECLARE @rq datetime 
SET @rq = '2024.10.31'

---------------------- 公司入出库信息 ------------------------------
-- 进货入库 102
INSERT INTO t_bjyj_rck(bill_code,bill_time,bill_type,org_code,from_org_code,from_org_name,to_org_code,to_org_name,scbz)            
SELECT a.jhdbh,a.jhrq,'102',c.org_code,b.SH,b.GYSMC,c.org_code,c.org_Name,0
FROM t_jhdzb a
JOIN t_gysxx b ON b.GYSBH = a.GYSBH
JOIN t_bjyj_pzxx c ON 1=1
JOIN (SELECT DISTINCT jhdbh FROM t_jhdmxb a JOIN t_spxx s ON s.SPBH = a.SPBH
      WHERE s.FLAG = 1 and LEFT(a.spbh,1) IN('1','4')) e ON a.jhdbh=e.jhdbh
LEFT JOIN t_bjyj_rck d ON d.bill_code = a.jhdbh
WHERE a.jhrq > @rq AND a.jsbz = 10 AND d.bill_code IS NULL

INSERT INTO t_bjyj_rckmx(bill_code,ordr,code_count,code_type,code,exprie_date,pm,gg,jldw,pzwh,pcbh,scrq,spbh)
SELECT m.jhdbh,m.ORDR,m.sl,s.spbmlx,s.spbm code,m.yxq,s.pm,s.gg,s.jldw,s.pzwh,m.PCBH,m.scrq,m.spbh
FROM t_jhdmxb m
JOIN t_jhdzb a ON a.JHDBH = m.JHDBH
JOIN v_spxx s ON s.spbh = m.SPBH and s.flag = 1 
JOIN (SELECT DISTINCT a.bill_code jhdbh
		FROM t_bjyj_rck a
		LEFT JOIN t_bjyj_rckmx b ON b.bill_code = a.bill_code
      WHERE b.bill_code IS NULL) e ON m.jhdbh=e.jhdbh
WHERE LEFT(m.spbh,1) IN('1','4') AND a.jsbz = 10    

-- 销售出库 201
INSERT INTO t_bjyj_rck(bill_code,bill_time,bill_type,org_code,from_org_code,from_org_name,to_org_code,to_org_name,scbz)            
SELECT a.ckdbh,a.ckrq,'201',c.org_code,c.org_code,c.org_Name,b.sh,b.dwmc,0
FROM t_ckdzb a
JOIN t_dwxx b ON b.dwBH = a.jsdw
JOIN t_bjyj_pzxx c ON 1=1
JOIN (SELECT DISTINCT ckdbh 
      FROM t_ckdmxb a JOIN t_spxx s ON s.SPBH = a.SPBH
      WHERE s.FLAG = 1 and LEFT(a.spbh,1) IN('1','4')) e ON a.ckdbh=e.ckdbh
LEFT JOIN t_bjyj_rck d ON d.bill_code = a.ckdbh
WHERE a.ckrq > @rq AND a.yxbz IN (10,15) AND d.bill_code IS NULL

INSERT INTO t_bjyj_rckmx(bill_code,ordr,code_count,code_type,code,exprie_date,pm,gg,jldw,pzwh,pcbh,scrq,spbh)
SELECT m.ckdbh,m.ORDR,m.shul,s.spbmlx,s.spbm code,m.yxrq,s.pm,s.gg,s.jldw,s.pzwh,m.PCBH,m.scrq,m.spbh
FROM t_ckdmxb m
JOIN t_ckdzb a ON a.ckDBH = m.ckDBH
JOIN v_spxx s ON s.spbh = m.SPBH and s.flag = 1
JOIN (SELECT DISTINCT a.bill_code ckdbh
		FROM t_bjyj_rck a
		LEFT JOIN t_bjyj_rckmx b ON b.bill_code = a.bill_code
      WHERE b.bill_code IS NULL) e ON m.ckdbh=e.ckdbh
WHERE LEFT(m.spbh,1) IN('1','4') AND a.yxbz IN (10,15)    

----退货入库	103
INSERT INTO t_bjyj_rck(bill_code,bill_time,bill_type,org_code,from_org_code,from_org_name,to_org_code,to_org_name,scbz)            
SELECT a.tkdbh,a.tkrq,'103',c.org_code,b.SH,b.dwmc,c.org_code,c.org_name,0
FROM t_tkdzb a
JOIN t_dwxx b ON b.dwBH = a.tkdw
JOIN t_bjyj_pzxx c ON 1=1
JOIN (SELECT DISTINCT tkdbh FROM t_tkdmxb a
      join t_spxx s ON s.SPBH = a.SPBH WHERE s.FLAG = 1 and LEFT(a.spbh,1) IN('1','4')) e ON a.tkdbh=e.tkdbh
LEFT JOIN t_bjyj_rck d ON d.bill_code = a.tkdbh
WHERE a.tkrq > @rq AND a.flag = 10 AND d.bill_code IS NULL

INSERT INTO t_bjyj_rckmx(bill_code,ordr,code_count,code_type,code,exprie_date,pm,gg,jldw,pzwh,pcbh,scrq,spbh)
SELECT m.tkdbh,m.ORDR,m.shul,s.spbmlx,s.spbm code,m.yxrq,s.pm,s.gg,s.jldw,s.pzwh,m.PCBH,m.scrq,m.spbh
FROM t_tkdmxb m
JOIN t_tkdzb a ON a.tkDBH = m.tkDBH
JOIN v_spxx s ON s.spbh = m.SPBH and s.flag = 1
JOIN (SELECT DISTINCT a.bill_code tkdbh
		FROM t_bjyj_rck a
		LEFT JOIN t_bjyj_rckmx b ON b.bill_code = a.bill_code
      WHERE b.bill_code IS NULL) e ON m.tkdbh=e.tkdbh
WHERE LEFT(m.spbh,1) IN('1','4') AND a.flag = 10    

----退货出库	202
----更新退货单主表上供应商
update tt SET tt.gysbh = a.gysbh from T_THDZB tt
JOIN (SELECT thdbh,GYSBH FROM t_thdmxb GROUP BY thdbh,gysbh) a ON a.thdbh = tt.THDBH
WHERE ISNULL(tt.gysbh,'') = ''

INSERT INTO t_bjyj_rck(bill_code,bill_time,bill_type,org_code,from_org_code,from_org_name,to_org_code,to_org_name,scbz)            
SELECT a.thdbh,a.thrq,'202',c.org_code,c.org_code,c.org_name,b.sh,b.gysmc,0
FROM t_thdzb a
JOIN t_gysxx b ON b.gysBH = a.gysbh
JOIN t_bjyj_pzxx c ON 1=1
JOIN (SELECT DISTINCT thdbh FROM t_thdmxb a
	  join t_spxx s ON s.SPBH = a.SPBH WHERE s.FLAG = 1 and LEFT(a.spbh,1) IN('1','4')) e ON a.thdbh=e.thdbh
LEFT JOIN t_bjyj_rck d ON d.bill_code = a.thdbh
WHERE a.thrq > @rq AND a.yxbz = 10 AND d.bill_code IS NULL

INSERT INTO t_bjyj_rckmx(bill_code,ordr,code_count,code_type,code,exprie_date,pm,gg,jldw,pzwh,pcbh,scrq,spbh)
SELECT m.thdbh,m.ORDR,m.thsl,s.spbmlx,s.spbm code,m.yxrq,s.pm,s.gg,s.jldw,s.pzwh,m.PCBH,m.scrq,m.spbh
FROM t_thdmxb m
JOIN t_thdzb a ON a.thDBH = m.thDBH
JOIN v_spxx s ON m.spbh=s.SPBH and s.flag = 1
JOIN (SELECT DISTINCT a.bill_code thdbh
		FROM t_bjyj_rck a
		LEFT JOIN t_bjyj_rckmx b ON b.bill_code = a.bill_code
      WHERE b.bill_code IS NULL) e ON m.thdbh=e.thdbh
WHERE LEFT(m.spbh,1) IN('1','4') AND a.yxbz = 10    

-------------------------------- 公司与门店损益数据 ------------------------------------------------------
-- 盘盈入库 111  损益单溢出 
INSERT INTO t_bjyj_rck(bill_code,bill_time,bill_type,org_code,from_org_code,from_org_name,to_org_code,to_org_name,scbz)            
SELECT a.bsdbh,a.bsrq,'111',b.sh,b.SH,b.dwmc,b.SH,b.DWMC,0
FROM t_bsdzb a
JOIN t_dwxx b ON b.dwBH = a.bsdw
JOIN (SELECT DISTINCT bsdbh FROM t_bsdmxb m 
	  JOIN t_spxx s ON s.SPBH = m.SPBH AND s.FLAG = 1 WHERE m.bstp = 1 and LEFT(m.spbh,1) IN('1','4')) e ON a.bsdbh=e.bsdbh
LEFT JOIN t_bjyj_rck d ON d.bill_code = a.bsdbh
WHERE a.bsrq > @rq AND a.yxbz = 10 AND d.bill_code IS NULL

INSERT INTO t_bjyj_rckmx(bill_code,ordr,code_count,code_type,code,exprie_date,pm,gg,jldw,pzwh,pcbh,scrq,spbh)
SELECT m.bsdbh,m.ORDR,m.bssl,s.spbmlx,s.spbm code,m.yxrq,s.pm,s.gg,s.jldw,s.pzwh,m.PCBH,m.scrq,m.spbh
FROM t_bsdmxb m
JOIN t_bsdzb a ON a.bsDBH = m.bsDBH
JOIN v_spxx s ON m.spbh=s.SPBH and s.flag = 1
JOIN (SELECT DISTINCT a.bill_code bsdbh
		FROM t_bjyj_rck a
		LEFT JOIN t_bjyj_rckmx b ON b.bill_code = a.bill_code
      WHERE b.bill_code IS NULL) e ON m.bsdbh=e.bsdbh
WHERE m.bstp = 1 AND LEFT(m.spbh,1) IN('1','4') AND a.yxbz = 10    

-- 盘亏出库 214  损益单溢出 
INSERT INTO t_bjyj_rck(bill_code,bill_time,bill_type,org_code,from_org_code,from_org_name,to_org_code,to_org_name,scbz,djhm)            
SELECT a.bsdbh + 'PK',a.bsrq,'214',b.sh,b.SH,b.dwmc,b.SH,b.DWMC,0,a.bsdbh
FROM t_bsdzb a
JOIN t_dwxx b ON b.dwBH = a.bsdw
JOIN (SELECT DISTINCT bsdbh FROM t_bsdmxb m 
	  JOIN t_spxx s ON s.SPBH = m.SPBH AND s.FLAG = 1 WHERE m.bstp = -1 and LEFT(m.spbh,1) IN('1','4')) e ON a.bsdbh=e.bsdbh
LEFT JOIN t_bjyj_rck d ON d.bill_code = a.bsdbh + 'PK'
WHERE a.bsrq > @rq AND a.yxbz = 10 AND d.bill_code IS NULL

INSERT INTO t_bjyj_rckmx(bill_code,ordr,code_count,code_type,code,exprie_date,pm,gg,jldw,pzwh,pcbh,scrq,spbh)
SELECT e.bill_code,m.ORDR,m.bssl,s.spbmlx,s.spbm code,m.yxrq,s.pm,s.gg,s.jldw,s.pzwh,m.PCBH,m.scrq,m.spbh
FROM t_bsdmxb m
JOIN t_bsdzb a ON a.bsDBH = m.bsDBH
JOIN v_spxx s ON m.spbh=s.SPBH and s.flag = 1
JOIN (SELECT DISTINCT a.bill_code,djhm bsdbh
		FROM t_bjyj_rck a
		LEFT JOIN t_bjyj_rckmx b ON b.bill_code = a.bill_code
      WHERE b.bill_code IS NULL) e ON m.bsdbh=e.bsdbh
WHERE m.bstp = -1 AND LEFT(m.spbh,1) IN('1','4') AND a.yxbz = 10    


---------------------------------- 门店入出库信息 ------------------------------------------
---- 门店进货入库 102
INSERT INTO t_bjyj_rck(bill_code,bill_time,bill_type,org_code,from_org_code,from_org_name,to_org_code,to_org_name,scbz,djhm)            
SELECT a.ckdbh+b.sh,a.ckrq,'102',b.sh,c.org_code,c.org_name,b.sh,b.dwmc,0,a.ckdbh
FROM t_ckdzb a
JOIN t_dwxx b ON b.dwbh = a.jsdw
JOIN t_bjyj_pzxx c ON 1=1
JOIN (SELECT DISTINCT ckdbh FROM t_ckdmxb a 
	JOIN t_spxx s ON s.SPBH = a.SPBH WHERE s.FLAG =1 and LEFT(a.spbh,1) IN('1','4')) e ON a.ckdbh=e.ckdbh
LEFT JOIN t_bjyj_rck d ON d.bill_code = a.ckdbh + b.sh
WHERE a.ckrq > @rq AND a.yxbz = 10 AND d.bill_code IS null

INSERT INTO t_bjyj_rckmx(bill_code, ordr,code_count,code_type,code,exprie_date,pm,gg,jldw,pzwh,pcbh,scrq,spbh)
SELECT e.bill_code,m.ORDR,m.shul,s.spbmlx,s.spbm code,m.yxrq,s.pm,s.gg,s.jldw,s.pzwh,m.PCBH,m.scrq,m.spbh
FROM ( SELECT DISTINCT a.djhm ckdbh,a.bill_code
		FROM t_bjyj_rck a
		LEFT JOIN t_bjyj_rckmx b ON b.bill_code = a.bill_code
      WHERE b.bill_code IS NULL ) e
join t_ckdmxb m ON m.ckdbh=e.ckdbh
JOIN v_spxx s ON m.spbh=s.SPBH and s.flag = 1
WHERE LEFT(m.spbh,1) IN('1','4') 

---- 门店退货出库 202
INSERT INTO t_bjyj_rck(bill_code,bill_time,bill_type,org_code,from_org_code,from_org_name,to_org_code,to_org_name,scbz,djhm)            
SELECT a.tkdbh+b.sh,a.tkrq,'202',b.sh,b.SH,b.dwmc,c.org_code,c.org_name,0,a.tkdbh
FROM t_tkdzb a
JOIN t_dwxx b ON b.dwBH = a.tkdw
JOIN t_bjyj_pzxx c ON 1=1
JOIN (SELECT DISTINCT tkdbh FROM t_tkdmxb a 
	JOIN t_spxx s ON s.SPBH = a.SPBH WHERE s.FLAG = 1 AND LEFT(a.spbh,1) IN('1','4')) e ON a.tkdbh=e.tkdbh
LEFT JOIN t_bjyj_rck d ON d.bill_code = a.tkdbh + b.sh
WHERE a.tkrq > @rq AND a.flag = 10 AND d.bill_code IS NULL

INSERT INTO t_bjyj_rckmx(bill_code,ordr,code_count,code_type,code,exprie_date,pm,gg,jldw,pzwh,pcbh,scrq,spbh)
SELECT e.bill_code,m.ORDR,m.shul,s.spbmlx,s.spbm code,m.yxrq,s.pm,s.gg,s.jldw,s.pzwh,m.PCBH,m.scrq,m.spbh
FROM ( SELECT DISTINCT a.bill_code,a.djhm
		FROM t_bjyj_rck a
		LEFT JOIN t_bjyj_rckmx b ON b.bill_code = a.bill_code
      WHERE b.bill_code IS NULL ) e
join t_tkdmxb m ON m.tkdbh = e.djhm
JOIN v_spxx s ON m.spbh=s.SPBH and s.flag = 1
WHERE LEFT(m.spbh,1) IN('1','4') 

---- 门店调拨 调拨入库 104  取调入单位
INSERT INTO t_bjyj_rck(bill_code,bill_time,bill_type,org_code,from_org_code,from_org_name,to_org_code,to_org_name,scbz)            
SELECT a.dbdbh,a.dbrq,'104',r.sh,c.sh,c.dwmc,r.sh,r.dwmc,0
FROM t_dbdzb a
JOIN t_dwxx c ON c.dwbh = a.drdw
JOIN t_dwxx r ON r.dwbh = a.dcdw
JOIN (SELECT DISTINCT dbdbh FROM t_dbdmxb a 
	  JOIN t_spxx s ON s.SPBH = a.SPBH WHERE s.FLAG = 1 AND LEFT(a.spbh,1) IN('1','4')) e ON a.dbdbh=e.dbdbh
LEFT JOIN t_bjyj_rck d ON d.bill_code = a.dbdbh 
WHERE a.dbrq > @rq AND a.yxbz = 10 AND d.bill_code IS null

INSERT INTO t_bjyj_rckmx(bill_code, ordr,code_count,code_type,code,exprie_date,pm,gg,jldw,pzwh,pcbh,scrq,spbh)
SELECT e.bill_code,m.ORDR,m.sl,s.spbmlx,s.spbm code,m.yxrq,s.pm,s.gg,s.jldw,s.pzwh,m.PCBH,m.scrq,m.spbh
FROM ( SELECT DISTINCT a.bill_code
		FROM t_bjyj_rck a
		LEFT JOIN t_bjyj_rckmx b ON b.bill_code = a.bill_code
      WHERE b.bill_code IS NULL ) e
join t_dbdmxb m ON m.dbdbh=e.bill_code
JOIN v_spxx s ON m.spbh=s.SPBH and s.flag = 1
WHERE LEFT(m.spbh,1) IN('1','4') 

---- 门店调拨 调拨出库 203  取调出单位
INSERT INTO t_bjyj_rck(bill_code,bill_time,bill_type,org_code,from_org_code,from_org_name,to_org_code,to_org_name,scbz,djhm)            
SELECT a.dbdbh+'DC',a.dbrq,'203',c.sh,c.sh,c.dwmc,r.sh,r.dwmc,0,a.dbdbh
FROM t_dbdzb a
JOIN t_dwxx c ON c.dwbh = a.drdw
JOIN t_dwxx r ON r.dwbh = a.dcdw
JOIN (SELECT DISTINCT dbdbh FROM t_dbdmxb a 
	  JOIN t_spxx s ON s.SPBH = a.SPBH WHERE s.FLAG = 1 AND LEFT(a.spbh,1) IN('1','4')) e ON a.dbdbh=e.dbdbh
LEFT JOIN t_bjyj_rck d ON d.bill_code = a.dbdbh + 'DC' 
WHERE a.dbrq > @rq AND a.yxbz = 10 AND d.bill_code IS null

INSERT INTO t_bjyj_rckmx(bill_code, ordr,code_count,code_type,code,exprie_date,pm,gg,jldw,pzwh,pcbh,scrq,spbh)
SELECT e.bill_code,m.ORDR,m.sl,s.spbmlx,s.spbm code,m.yxrq,s.pm,s.gg,s.jldw,s.pzwh,m.PCBH,m.scrq,m.spbh
FROM ( SELECT DISTINCT a.bill_code,djhm 
		FROM t_bjyj_rck a
		LEFT JOIN t_bjyj_rckmx b ON b.bill_code = a.bill_code
      WHERE b.bill_code IS NULL ) e
join t_dbdmxb m ON m.dbdbh=e.djhm
JOIN v_spxx s ON m.spbh=s.SPBH and s.flag = 1
WHERE LEFT(m.spbh,1) IN('1','4') 

END 
GO

/******************* 过程说明 *****************************************************************
  生成北京药监当日库存信息（公司）
  参数	        
  结果	生成北京药监当日库存记录 t_bjyj_drkc t_bjyj_drkcmx
  修改		
**********************************************************************************************/
DROP PROCEDURE SP_bjyj_drkc
go
create PROCEDURE SP_bjyj_drkc AS
BEGIN
DECLARE @id VARCHAR(20),@i int
SELECT @id = CONVERT(CHAR(8),getdate(),112)

SELECT @i=COUNT(*) FROM t_bjyj_drkc WHERE id like @id  + '%'
IF @i < 1 
	BEGIN
		-- 分店100的库存特殊处理，按公司000处理 2024年11月20日 13:21:41
		INSERT INTO t_bjyj_drkc(ID, AppKey, dwbh, org_code, org_name, jcsb_rq, scbz)
		SELECT @id + a.dwbh,b.AppKey,a.dwbh,a.sh,a.DWMC,CONVERT(varCHAR(16),getdate(),120),0
		FROM t_dwxx a
		JOIN ( SELECT '000' dwbh FROM t_chxx c
			JOIN t_spxx s ON s.SPBH = c.SPBH AND s.FLAG = 1
			WHERE LEFT(c.spbh,1) IN('1','4')
			union
			SELECT case fgsbh WHEN '100' THEN '000' ELSE fgsbh END dwbh FROM t_fgskc c
			JOIN t_spxx s ON s.SPBH = c.SPBH AND s.FLAG = 1
			WHERE LEFT(c.spbh,1) IN('1','4') ) c ON c.dwbh = a.dwbh
		JOIN t_bjyj_pzxx b ON 1=1
		WHERE a.FLAG = 1

		INSERT INTO t_bjyj_drkcmx(ID, spbh, code_type, code, pm, kcsl, cjmc, gg, jx, jldw, pzwh)
		SELECT @id + c.fgsbh,c.spbh,s.spbmlx,s.spbm,pm,c.chsl,s.cjmc,s.gg,s.jxmc,s.JLDW,s.pzwh
		FROM (SELECT fgsbh,spbh,SUM(isnull(shul,0)) chsl 
		      FROM t_fgskc WHERE fgsbh <> '100' and LEFT(spbh,1) IN('1','4') GROUP BY fgsbh,SPBH ) c
		JOIN v_spxx s ON s.SPBH = c.SPBH and s.flag = 1
		JOIN t_dwxx d ON c.fgsbh=d.dwbh AND d.flag = 1
		WHERE c.chsl > 0 
		UNION ALL
		SELECT @id + '000',c.spbh,s.spbmlx,s.spbm,pm,c.chsl,s.cjmc,s.gg,s.jxmc,s.JLDW,s.pzwh
		FROM (SELECT spbh,SUM(isnull(chsl,0)) chsl 
			  FROM (SELECT spbh,chsl FROM t_Chxx WHERE LEFT(spbh,1) IN('1','4')
					UNION ALL 
					SELECT spbh,shul chsl FROM t_fgskc 
					WHERE FGSBH = '100' and LEFT(spbh,1) IN('1','4') ) e GROUP BY SPBH 
			  ) c
		JOIN v_spxx s ON s.SPBH = c.SPBH and s.flag = 1
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
SET @rq = '2024.10.31'

--SELECT CONVERT(CHAR(8),lsrq,112) from t_lshzb WHERE lsrq > @rq
-- SELECT CONVERT(CHAR(8),rq,112),fgsbh from t_lsdzb_w WHERE rq > @rq

-- 更新日期为8字符 yyyymmdd 格式
UPDATE t_lshzb SET code = CONVERT(CHAR(8),lsrq,112) + fgsbh where isnull(code,'')='' and lsrq > @rq
UPDATE t_lsdzb_w SET code = CONVERT(CHAR(8),rq,112) + fgsbh where isnull(code,'')='' and rq > @rq

---- 零售出库信息
INSERT INTO t_bjyj_Lsd(bill_code,bill_time,bill_type,oper_ic_code,org_code,data_type,network_bill_flag,scbz)
SELECT a.code,convert(varchar(16),GETDATE(),120),'321',b.AppKey,e.sh,2,0,0
from ( SELECT DISTINCT code,fgsbh
       FROM t_lshzb m JOIN t_spxx s ON s.SPBH = m.SPBH AND s.FLAG = 1 
       WHERE LEFT(m.spbh,1) IN('1','4') AND m.lsrq > @rq AND m.shul > 0 ) a
JOIN t_dwxx e ON e.dwbh = a.fgsbh
JOIN t_bjyj_pzxx b ON 1=1
LEFT JOIN t_bjyj_lsd d ON d.bill_code = a.code
WHERE d.bill_code IS NULL

INSERT INTO t_bjyj_lsdmx(bill_code,ordr,spbh,code_count,code_type,code,pm,gg,jldw,pzwh,pcbh)
SELECT e.bill_code,m.ORDR,m.SPBH,m.ShuL,s.spbmlx,s.spbm,s.pm,s.gg,s.jldw,s.pzwh,m.pcbh
FROM ( SELECT z.bill_code FROM t_bjyj_lsd z LEFT JOIN t_bjyj_lsdmx m ON z.bill_code = m.bill_code 
      WHERE m.bill_code IS null ) e
JOIN t_lshzb m ON m.code = e.bill_code
JOIN v_spxx s ON s.spbh=m.spbh AND s.FLAG = 1
WHERE LEFT(m.spbh,1) IN('1','4') AND m.shul > 0

---- 零售退货入库信息
INSERT INTO t_bjyj_Lsd(bill_code,bill_time,bill_type,oper_ic_code,org_code,data_type,network_bill_flag,scbz)
SELECT a.code+'TH',convert(varchar(16),GETDATE(),120),'116',b.AppKey,e.sh,2,0,0
from ( SELECT DISTINCT code,fgsbh
       FROM t_lshzb m JOIN t_spxx s ON s.SPBH = m.SPBH AND s.FLAG = 1 
       WHERE LEFT(m.spbh,1) IN('1','4') AND m.lsrq > @rq AND m.shul < 0 ) a
JOIN t_dwxx e ON e.dwbh = a.fgsbh
JOIN t_bjyj_pzxx b ON 1=1
LEFT JOIN t_bjyj_lsd d ON d.bill_code = a.code+'TH'
WHERE d.bill_code IS NULL

INSERT INTO t_bjyj_lsdmx(bill_code,ordr,spbh,code_count,code_type,code,pm,gg,jldw,pzwh,pcbh)
SELECT e.bill_code,m.ORDR,m.SPBH,m.ShuL*-1,s.spbmlx,s.spbm,s.pm,s.gg,s.jldw,s.pzwh,m.pcbh
FROM ( SELECT z.bill_code,LEFT(z.bill_code,LEN(z.bill_code) - 2) code 
       FROM t_bjyj_lsd z LEFT JOIN t_bjyj_lsdmx m ON z.bill_code = m.bill_code 
      WHERE m.bill_code IS null ) e
JOIN t_lshzb m ON m.code = e.code
JOIN v_spxx s ON s.spbh=m.spbh AND s.FLAG = 1
WHERE LEFT(m.spbh,1) IN('1','4') AND m.shul < 0

---- 外卖销售信息
INSERT INTO t_bjyj_Lsd(bill_code,bill_time,bill_type,oper_ic_code,org_code,data_type,network_bill_flag,scbz)
SELECT a.code+'XS',convert(varchar(16),GETDATE(),120),'321',b.AppKey,e.sh,2,1,0
from ( SELECT DISTINCT case z.fgsbh WHEN '100' THEN '000' ELSE z.fgsbh END fgsbh,z.code 
       FROM t_lsdmxb_w m JOIN t_lsdzb_w z ON z.LSDBH = m.LSDBH 
       JOIN t_spxx s ON s.SPBH = m.SPBH AND s.FLAG = 1 
       WHERE LEFT(m.spbh,1) IN('1','4') AND z.rq > @rq ) a
JOIN t_dwxx e ON e.dwbh = a.fgsbh
JOIN t_bjyj_pzxx b ON 1=1
LEFT JOIN t_bjyj_lsd d ON d.bill_code = a.code + 'XS'
WHERE d.bill_code IS NULL

CREATE TABLE #t 
( 
	code VARCHAR(100),
	spbh VARCHAR(30),
	pcbh VARCHAR(60),
	sl INT,
	bill_code VARCHAR(100)
)

CREATE TABLE #tt 
( 
	code VARCHAR(100),
	spbh VARCHAR(30),
	pcbh VARCHAR(60),
	sl INT,
	bill_code VARCHAR(100),
	id INT IDENTITY
)
INSERT INTO #t(code,spbh,pcbh,sl,bill_code)                                            
select a.code,m.SPBH,m.pcbh,m.sl,e.bill_code
FROM ( SELECT z.bill_code,LEFT(z.bill_code,LEN(z.bill_code) - 2) code 
       FROM t_bjyj_lsd z 
       LEFT JOIN t_bjyj_lsdmx m ON z.bill_code = m.bill_code        
       WHERE m.bill_code IS null ) e
JOIN t_lsdzb_w a ON a.code = e.code
join t_lsdmxb_w m ON m.LSDBH = a.LSDBH
WHERE LEFT(m.spbh,1) IN ('1','4')

INSERT INTO #tt(bill_code, spbh, pcbh, sl)
SELECT t.bill_code,t.SPBH,t.pcbh,SUM(t.sl) shul 
FROM #t t
GROUP BY t.bill_code,t.SPBH,t.pcbh

INSERT INTO t_bjyj_lsdmx(bill_code,ordr,spbh,code_count,code_type,code,pm,gg,jldw,pzwh,pcbh)
SELECT m.bill_code,m.id,m.SPBH,m.SL,s.spbmlx,s.spbm,s.pm,s.gg,s.jldw,s.pzwh,m.pcbh
FROM #tt m
JOIN v_spxx s ON s.spbh=m.spbh AND s.FLAG = 1

DROP TABLE #t
DROP TABLE #tt

END 
GO


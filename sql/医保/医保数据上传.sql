/* 

-- 修改医保商品表，增加字段上传医保的属性  0 不上传 1 上传 
alter table t_yb_spxx 
add ybscbz tinyint default 0   


update t_yb_spxx set ybscbz = yblx 
update t_yb_spxx set ybscbz = 0 where len(ybbm) > 25


DROP TABLE [dbo].[t_ybjk_pzxx];
CREATE TABLE [dbo].[t_ybjk_pzxx](
    ID INT NOT NULL IDENTITY(1,1),
    INF_VER NVARCHAR(10) DEFAULT  'V1.0',
    HOSP_CODE NVARCHAR(30),
    HOSP_TYPE NVARCHAR(10) DEFAULT  '00',
    AppKey NVARCHAR(255),
    PRIMARY KEY (ID)
)

EXEC sp_addextendedproperty 'MS_Description', '医保接口配置信息', 'user', dbo, 'table', t_ybjk_pzxx, null, null;
EXEC sp_addextendedproperty 'MS_Description', 'ID', 'user', dbo, 'table', t_ybjk_pzxx, 'column', ID;
EXEC sp_addextendedproperty 'MS_Description', '接口版本号', 'user', dbo, 'table', t_ybjk_pzxx, 'column', INF_VER;
EXEC sp_addextendedproperty 'MS_Description', '药店编码;8位药店编码+01（默认补位）', 'user', dbo, 'table', t_ybjk_pzxx, 'column', HOSP_CODE;
EXEC sp_addextendedproperty 'MS_Description', '产生方类型;药店产生方类型是 00', 'user', dbo, 'table', t_ybjk_pzxx, 'column', HOSP_TYPE;
EXEC sp_addextendedproperty 'MS_Description', '密钥', 'user', dbo, 'table', t_ybjk_pzxx, 'column', AppKey;

DROP TABLE [dbo].[t_ybjk_spxx];
CREATE TABLE [dbo].[t_ybjk_spxx](
    ID NVARCHAR(50) NOT NULL,
    INF_VER NVARCHAR(10) DEFAULT  'V1.0',
    HOSP_CODE NVARCHAR(30),
    MSG_NO NVARCHAR(50),
    MSG_TYPE NVARCHAR(30) DEFAULT  '0801',
    SCBZ smallint DEFAULT  0,
    SCSBYY NVARCHAR(1000),
    CJSJ DATETIME DEFAULT  getdate(),
    PRIMARY KEY (ID)
)

EXEC sp_addextendedproperty 'MS_Description', '医保药品信息上传（报文编号0801）', 'user', dbo, 'table', t_ybjk_spxx, null, null;
EXEC sp_addextendedproperty 'MS_Description', 'ID;8位日期20241204', 'user', dbo, 'table', t_ybjk_spxx, 'column', ID;
EXEC sp_addextendedproperty 'MS_Description', '接口版本号', 'user', dbo, 'table', t_ybjk_spxx, 'column', INF_VER;
EXEC sp_addextendedproperty 'MS_Description', '药店编码;8位药店编码+01（默认补位）', 'user', dbo, 'table', t_ybjk_spxx, 'column', HOSP_CODE;
EXEC sp_addextendedproperty 'MS_Description', '处理流水编号前2部分;药店编码+产生方类型+yyyyMMddHHmmss+四位流水号。药店请求的报文，产生方类型为00，这里只记录 药店编码+产生方类型（072000160100），后面部分由接口调用是生成', 'user', dbo, 'table', t_ybjk_spxx, 'column', MSG_NO;
EXEC sp_addextendedproperty 'MS_Description', '报文编号', 'user', dbo, 'table', t_ybjk_spxx, 'column', MSG_TYPE;
EXEC sp_addextendedproperty 'MS_Description', '上报标志;0，待上传，1 成功，-1 失败', 'user', dbo, 'table', t_ybjk_spxx, 'column', SCBZ;
EXEC sp_addextendedproperty 'MS_Description', '上传失败原因', 'user', dbo, 'table', t_ybjk_spxx, 'column', SCSBYY;
EXEC sp_addextendedproperty 'MS_Description', '创建时间', 'user', dbo, 'table', t_ybjk_spxx, 'column', CJSJ;

DROP TABLE [dbo].[t_ybjk_spxxmx];
CREATE TABLE [dbo].[t_ybjk_spxxmx](
    ID NVARCHAR(50) NOT NULL,
    YBBM NVARCHAR(50) NOT NULL,
    LSJ DECIMAL(10,4),
    XSSL DECIMAL(10,2) DEFAULT  0,
    KCBS smallint DEFAULT  1,
    PRIMARY KEY (ID,YBBM)
)

EXEC sp_addextendedproperty 'MS_Description', '医保药品信息上传明细（报文编号0801）', 'user', dbo, 'table', t_ybjk_spxxmx, null, null;
EXEC sp_addextendedproperty 'MS_Description', 'ID;8位日期20241204', 'user', dbo, 'table', t_ybjk_spxxmx, 'column', ID;
EXEC sp_addextendedproperty 'MS_Description', '医保药品编码', 'user', dbo, 'table', t_ybjk_spxxmx, 'column', YBBM;
EXEC sp_addextendedproperty 'MS_Description', '零售价', 'user', dbo, 'table', t_ybjk_spxxmx, 'column', LSJ;
EXEC sp_addextendedproperty 'MS_Description', '销售数量', 'user', dbo, 'table', t_ybjk_spxxmx, 'column', XSSL;
EXEC sp_addextendedproperty 'MS_Description', '库存标识;1：有库存，2：无库存48小时内可采买，3：无库存且48小时内不能采买', 'user', dbo, 'table', t_ybjk_spxxmx, 'column', KCBS;

go

-- 三店 hjdb07
-- insert into t_ybjk_pzxx(INF_VER,HOSP_CODE,HOSP_TYPE,appKey) values('V1.0','0720001601','00','ABBEF1647E7949649A9919F04A0F1C87')

-- 益德堂 hjdb
-- insert into t_ybjk_pzxx(INF_VER,HOSP_CODE,HOSP_TYPE,appKey) values('V1.0','0720000101','00','0CDAE5ECBF2D4A2883896187D89559F0')

-- 小屯 hjdb05
-- insert into t_ybjk_pzxx(INF_VER,HOSP_CODE,HOSP_TYPE,appKey) values('V1.0','0620007801','00','597DD230951345528F580831BCA55AA0')

-- exec SP_ybjk_spxx

truncate table t_ybjk_spxx
truncate table t_ybjk_spxxmx


select * from t_ybjk_spxx
select * from t_ybjk_spxxmx  where id = '202412200'
select * from t_ybjk_pzxx

select *  -- update a set a.gxrq = '2024-12-20 13:47:07.267'
from t_chxx a where gxrq > '2024-12-20 11:47:07.267'

CREATE INDEX IX_lsdzb_rq ON t_lsdzb (rq);
create index ix_lsdmxb_spbh on t_lsdmxb(spbh);

select ybbm,count(*)
from t_ybjk_spxxmx 
group by ybbm
having count(*) > 1


*/

/******************* 过程说明 *****************************************************************
  生成北京医保接口商品信息上传数据
  参数	
        
  结果	生成北京医保商品信息上传记录 SP_ybjk_spxx SP_ybjk_spxxmx
  修改		
**********************************************************************************************/
DROP PROCEDURE SP_ybjk_spxx
go
create PROCEDURE SP_ybjk_spxx AS
begin
DECLARE @rq datetime 
SET @rq = '2024.12.01'

DECLARE @id VARCHAR(20),@i int
SELECT @id = CONVERT(CHAR(8),getdate(),112)
--SET @id = '20241203'

CREATE TABLE #t 
(
	id int IDENTITY(1,1),
	code VARCHAR(10),
	ybbm VARCHAR(50),
	lsj DECIMAL(10,2),
	kcbs TINYINT DEFAULT 1,
	p100 INT 
)
	

SELECT @i=COUNT(*) FROM t_ybjk_spxx
IF @i < 1	---- 首次数据，取有库存的和有销售的全部数据
	BEGIN
		-- 获取全部数据到临时表
		INSERT INTO #t(code,YBBM, LSJ)
		SELECT @id,e.ybbm,max(j.lsj)
		FROM (
			SELECT s.spbh,s.ybbm
			FROM t_chxx c
			JOIN t_yb_spxx s ON s.SPBH = c.SPBH AND s.ybscbz = 1
			WHERE c.CHSL > 0
			UNION
			SELECT m.spbh,s.ybbm  -- select convert(char(8),z.rq,112)
			FROM t_lsdzb z
			JOIN t_lsdmxb m ON m.LSDBH = z.LSDBH
			JOIN t_yb_spxx s ON s.SPBH = m.SPBH  AND s.ybscbz = 1
			WHERE convert(char(8),z.rq,112) = @id
		) e 
		JOIN t_jgxx j ON j.spbh = e.spbh
		GROUP BY e.ybbm
		
		UPDATE #t SET p100 = id/100		-- 按100行分页

		UPDATE #t SET code = code + CAST( p100 AS VARCHAR(3)) -- 组装代码  

		
		INSERT INTO t_ybjk_spxx(ID, INF_VER, HOSP_CODE, MSG_NO, MSG_TYPE, SCBZ)
		SELECT a.code,INF_VER,HOSP_CODE,HOSP_CODE + HOSP_TYPE,'0801',0
		FROM t_ybjk_pzxx 
		JOIN (SELECT DISTINCT code FROM #t) a ON 1=1
		WHERE id = 1 
		
		INSERT INTO t_ybjk_spxxmx(ID, YBBM, LSJ)
		SELECT code,ybbm,lsj 
		FROM #t
		
		-- 更新销售数量 
		update e set e.xssl = e1.sl
		FROM t_ybjk_spxxmx e
		JOIN t_yb_spxx e2 ON e2.ybbm = e.ybbm AND e2.ybscbz = 1
		JOIN(
			SELECT m.spbh,SUM(m.sl) sl
			FROM t_lsdzb z
			JOIN t_lsdmxb m ON m.LSDBH = z.LSDBH
			WHERE z.rq > @rq 
			GROUP BY m.SPBH ) e1 ON e1.spbh=e2.spbh
		WHERE e.id like @id  + '%'
					
	END
else
	BEGIN
		SELECT @i=COUNT(*) FROM t_ybjk_spxx WHERE id like @id  + '%'
		IF @i < 1 
			BEGIN			
				INSERT INTO #t(code, YBBM, kcbs)	---- 查找发生库存变动的商品				
				SELECT @id,y.ybbm,case when SUM(e1.chsl)> 0 THEN 1 ELSE 3 END kcbs
				FROM (
					SELECT spbh
					FROM t_chxx c
					JOIN (SELECT MAX(cjsj) cjsj FROM t_ybjk_spxx) y ON 1=1
					WHERE c.gxrq > y.cjsj
					GROUP by c.spbh ) e
				JOIN t_chxx e1 ON e1.spbh = e.spbh
				JOIN t_yb_spxx y ON y.spbh = e.spbh AND y.ybscbz = 1
				GROUP BY y.ybbm
				
				UPDATE #t SET p100 = id/100		-- 按100行分页

				UPDATE #t SET code = code + CAST( p100 AS VARCHAR(3)) -- 组装编码，每编码不超100行  
				                                                      
				INSERT INTO t_ybjk_spxxmx(ID,YBBM,KCBS) 
				SELECT code,ybbm,kcbs FROM #t
				
				INSERT INTO t_ybjk_spxx(ID, INF_VER, HOSP_CODE, MSG_NO, MSG_TYPE, SCBZ)
				SELECT a.code,INF_VER,HOSP_CODE,HOSP_CODE + HOSP_TYPE,'0801',0
				FROM t_ybjk_pzxx 
				JOIN (SELECT DISTINCT code FROM #t) a ON 1=1
				WHERE id = 1 
				
									
				-- 更新价格
				UPDATE a SET a.lsj = b.lsj
				FROM t_ybjk_spxxmx a
				JOIN (select s1.YBBM,MAX(j.lsj) lsj
				     from t_ybjk_spxxmx s1
				     JOIN t_yb_spxx s2 ON s2.YBBM = s1.YBBM AND s2.ybscbz = 1
				     JOIN t_jgxx j ON j.spbh = s2.spbh
					 WHERE s1.ID LIKE @id + '%'
				     GROUP BY s1.YBBM
				) b ON b.YBBM = a.YBBM
				WHERE a.id LIKE @id + '%'
				
				-- 更新销售数量
				UPDATE a SET a.xssl = b.sl
				FROM t_ybjk_spxxmx a 
				JOIN (
					SELECT e.ybbm,SUM(m.sl) sl
					FROM t_ybjk_spxxmx e
					JOIN t_yb_spxx e5 ON e5.YBBM = e.YBBM AND e5.ybscbz = 1
					JOIN t_lsdmxb m ON m.SPBH = e5.SPBH
					join t_lsdzb z ON m.LSDBH = z.LSDBH
					WHERE e.id LIKE @id + '%' AND z.rq > @rq 
					GROUP BY e.ybbm ) b ON b.ybbm = a.ybbm
				WHERE a.id LIKE @id + '%'
				
				
			END			
	END
	
-- 删除临时表	
DROP TABLE #t

END

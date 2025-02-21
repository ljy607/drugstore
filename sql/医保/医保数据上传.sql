/* 

-- �޸�ҽ����Ʒ�������ֶ��ϴ�ҽ��������  0 ���ϴ� 1 �ϴ� 
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

EXEC sp_addextendedproperty 'MS_Description', 'ҽ���ӿ�������Ϣ', 'user', dbo, 'table', t_ybjk_pzxx, null, null;
EXEC sp_addextendedproperty 'MS_Description', 'ID', 'user', dbo, 'table', t_ybjk_pzxx, 'column', ID;
EXEC sp_addextendedproperty 'MS_Description', '�ӿڰ汾��', 'user', dbo, 'table', t_ybjk_pzxx, 'column', INF_VER;
EXEC sp_addextendedproperty 'MS_Description', 'ҩ�����;8λҩ�����+01��Ĭ�ϲ�λ��', 'user', dbo, 'table', t_ybjk_pzxx, 'column', HOSP_CODE;
EXEC sp_addextendedproperty 'MS_Description', '����������;ҩ������������� 00', 'user', dbo, 'table', t_ybjk_pzxx, 'column', HOSP_TYPE;
EXEC sp_addextendedproperty 'MS_Description', '��Կ', 'user', dbo, 'table', t_ybjk_pzxx, 'column', AppKey;

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

EXEC sp_addextendedproperty 'MS_Description', 'ҽ��ҩƷ��Ϣ�ϴ������ı��0801��', 'user', dbo, 'table', t_ybjk_spxx, null, null;
EXEC sp_addextendedproperty 'MS_Description', 'ID;8λ����20241204', 'user', dbo, 'table', t_ybjk_spxx, 'column', ID;
EXEC sp_addextendedproperty 'MS_Description', '�ӿڰ汾��', 'user', dbo, 'table', t_ybjk_spxx, 'column', INF_VER;
EXEC sp_addextendedproperty 'MS_Description', 'ҩ�����;8λҩ�����+01��Ĭ�ϲ�λ��', 'user', dbo, 'table', t_ybjk_spxx, 'column', HOSP_CODE;
EXEC sp_addextendedproperty 'MS_Description', '������ˮ���ǰ2����;ҩ�����+����������+yyyyMMddHHmmss+��λ��ˮ�š�ҩ������ı��ģ�����������Ϊ00������ֻ��¼ ҩ�����+���������ͣ�072000160100�������沿���ɽӿڵ���������', 'user', dbo, 'table', t_ybjk_spxx, 'column', MSG_NO;
EXEC sp_addextendedproperty 'MS_Description', '���ı��', 'user', dbo, 'table', t_ybjk_spxx, 'column', MSG_TYPE;
EXEC sp_addextendedproperty 'MS_Description', '�ϱ���־;0�����ϴ���1 �ɹ���-1 ʧ��', 'user', dbo, 'table', t_ybjk_spxx, 'column', SCBZ;
EXEC sp_addextendedproperty 'MS_Description', '�ϴ�ʧ��ԭ��', 'user', dbo, 'table', t_ybjk_spxx, 'column', SCSBYY;
EXEC sp_addextendedproperty 'MS_Description', '����ʱ��', 'user', dbo, 'table', t_ybjk_spxx, 'column', CJSJ;

DROP TABLE [dbo].[t_ybjk_spxxmx];
CREATE TABLE [dbo].[t_ybjk_spxxmx](
    ID NVARCHAR(50) NOT NULL,
    YBBM NVARCHAR(50) NOT NULL,
    LSJ DECIMAL(10,4),
    XSSL DECIMAL(10,2) DEFAULT  0,
    KCBS smallint DEFAULT  1,
    PRIMARY KEY (ID,YBBM)
)

EXEC sp_addextendedproperty 'MS_Description', 'ҽ��ҩƷ��Ϣ�ϴ���ϸ�����ı��0801��', 'user', dbo, 'table', t_ybjk_spxxmx, null, null;
EXEC sp_addextendedproperty 'MS_Description', 'ID;8λ����20241204', 'user', dbo, 'table', t_ybjk_spxxmx, 'column', ID;
EXEC sp_addextendedproperty 'MS_Description', 'ҽ��ҩƷ����', 'user', dbo, 'table', t_ybjk_spxxmx, 'column', YBBM;
EXEC sp_addextendedproperty 'MS_Description', '���ۼ�', 'user', dbo, 'table', t_ybjk_spxxmx, 'column', LSJ;
EXEC sp_addextendedproperty 'MS_Description', '��������', 'user', dbo, 'table', t_ybjk_spxxmx, 'column', XSSL;
EXEC sp_addextendedproperty 'MS_Description', '����ʶ;1���п�棬2���޿��48Сʱ�ڿɲ���3���޿����48Сʱ�ڲ��ܲ���', 'user', dbo, 'table', t_ybjk_spxxmx, 'column', KCBS;

go

-- ���� hjdb07
-- insert into t_ybjk_pzxx(INF_VER,HOSP_CODE,HOSP_TYPE,appKey) values('V1.0','0720001601','00','ABBEF1647E7949649A9919F04A0F1C87')

-- ����� hjdb
-- insert into t_ybjk_pzxx(INF_VER,HOSP_CODE,HOSP_TYPE,appKey) values('V1.0','0720000101','00','0CDAE5ECBF2D4A2883896187D89559F0')

-- С�� hjdb05
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

/******************* ����˵�� *****************************************************************
  ���ɱ���ҽ���ӿ���Ʒ��Ϣ�ϴ�����
  ����	
        
  ���	���ɱ���ҽ����Ʒ��Ϣ�ϴ���¼ SP_ybjk_spxx SP_ybjk_spxxmx
  �޸�		
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
IF @i < 1	---- �״����ݣ�ȡ�п��ĺ������۵�ȫ������
	BEGIN
		-- ��ȡȫ�����ݵ���ʱ��
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
		
		UPDATE #t SET p100 = id/100		-- ��100�з�ҳ

		UPDATE #t SET code = code + CAST( p100 AS VARCHAR(3)) -- ��װ����  

		
		INSERT INTO t_ybjk_spxx(ID, INF_VER, HOSP_CODE, MSG_NO, MSG_TYPE, SCBZ)
		SELECT a.code,INF_VER,HOSP_CODE,HOSP_CODE + HOSP_TYPE,'0801',0
		FROM t_ybjk_pzxx 
		JOIN (SELECT DISTINCT code FROM #t) a ON 1=1
		WHERE id = 1 
		
		INSERT INTO t_ybjk_spxxmx(ID, YBBM, LSJ)
		SELECT code,ybbm,lsj 
		FROM #t
		
		-- ������������ 
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
				INSERT INTO #t(code, YBBM, kcbs)	---- ���ҷ������䶯����Ʒ				
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
				
				UPDATE #t SET p100 = id/100		-- ��100�з�ҳ

				UPDATE #t SET code = code + CAST( p100 AS VARCHAR(3)) -- ��װ���룬ÿ���벻��100��  
				                                                      
				INSERT INTO t_ybjk_spxxmx(ID,YBBM,KCBS) 
				SELECT code,ybbm,kcbs FROM #t
				
				INSERT INTO t_ybjk_spxx(ID, INF_VER, HOSP_CODE, MSG_NO, MSG_TYPE, SCBZ)
				SELECT a.code,INF_VER,HOSP_CODE,HOSP_CODE + HOSP_TYPE,'0801',0
				FROM t_ybjk_pzxx 
				JOIN (SELECT DISTINCT code FROM #t) a ON 1=1
				WHERE id = 1 
				
									
				-- ���¼۸�
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
				
				-- ������������
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
	
-- ɾ����ʱ��	
DROP TABLE #t

END

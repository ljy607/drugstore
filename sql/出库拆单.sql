DECLARE @ckdbh NVARCHAR(16),@dh NVARCHAR(16)

SELECT @dh='CK16003813',  @ckdbh = 'CK16003814'

------插入出库单主表
INSERT INTO t_ckdzb(CKDBH, CKRQ, JSDW, ZBR, CKR, YXBZ, BZ, wmsflag,zpflag)
SELECT @ckdbh,GETDATE(),jsdw,'028','028',0,bz,0,1
FROM t_ckdzb z
WHERE z.ckdbh = @dh 

update m set m.ckdbh = @ckdbh
FROM T_ckDZB Z
JOIN T_ckDMXB M ON Z.ckDBH = M.ckDBH
JOIN T_SPXX S ON M.SPBH = S.SPBH
LEFT JOIN T_OPTIONS O ON S.LB = O.NAME
WHERE Z.ckDBH = @dh AND 'B' = ISNULL(O.code,'A') and o.pid=1;

SELECT @ckdbh = 'CK16003815'

------插入出库单主表
INSERT INTO t_ckdzb(CKDBH, CKRQ, JSDW, ZBR, CKR, YXBZ, BZ, wmsflag,zpflag)
SELECT @ckdbh,GETDATE(),jsdw,'028','028',0,bz,0,1
FROM t_ckdzb z
WHERE z.ckdbh = @dh 

update m set m.ckdbh = @ckdbh
FROM T_ckDZB Z
JOIN T_ckDMXB M ON Z.ckDBH = M.ckDBH
JOIN T_SPXX S ON M.SPBH = S.SPBH
LEFT JOIN T_OPTIONS O ON S.LB = O.NAME
WHERE Z.ckDBH = @dh AND 'C' = ISNULL(O.code,'A') and o.pid=1;

--SELECT @ckdbh = 'CK16003816'

--------插入出库单主表
--INSERT INTO t_ckdzb(CKDBH, CKRQ, JSDW, ZBR, CKR, YXBZ, BZ, wmsflag,zpflag)
--SELECT @ckdbh,GETDATE(),jsdw,'028','028',0,bz,0,1
--FROM t_ckdzb z
--WHERE z.ckdbh = @dh 

--update m set m.ckdbh = @ckdbh
--FROM T_ckDZB Z
--JOIN T_ckDMXB M ON Z.ckDBH = M.ckDBH
--JOIN T_SPXX S ON M.SPBH = S.SPBH
--LEFT JOIN T_OPTIONS O ON S.LB = O.NAME
--WHERE Z.ckDBH = @dh AND 'D' = ISNULL(O.code,'A') and o.pid=1;



SELECT m.ckdbh, m.spbh,m.PCBH, m.YXRQ, m.JHJ, m.LSJ, m.SHUL, m.YXKW,o.code
FROM T_ckDZB Z
JOIN T_ckDMXB M ON Z.ckDBH = M.ckDBH
JOIN T_SPXX S ON M.SPBH = S.SPBH
LEFT JOIN T_OPTIONS O ON S.LB = O.NAME
WHERE Z.ckDBH >= @dh AND 'A' <> ISNULL(O.code,'A') and o.pid=1;



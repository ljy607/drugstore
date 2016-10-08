--SELECT *
--FROM T_BankAccount tba

DROP PROCEDURE sp_BankAccountCheck
GO

--银行账务核对
CREATE PROCEDURE sp_BankAccountCheck @ksrq CHAR(8),@jsrq CHAR(8)
AS 
BEGIN
	
DECLARE @jyrq CHAR(8),@kh VARCHAR(32),@amt DECIMAL(14,2),@name NVARCHAR(16)
CREATE TABLE #t 
(
	id INT IDENTITY(1,1),
	jyrq CHAR(8) NOT NULL,
	a1 DECIMAL(14,2) NULL ,	--益德堂
	a1a DECIMAL(14,2) NULL,	--益德堂基本户
	a2 DECIMAL(14,2) NULL,	--弘济
	a2a DECIMAL(14,2) NULL,	--弘济基本户
	a3 DECIMAL(14,2) NULL,	--康宁
	a4 DECIMAL(14,2) NULL,	--二店
	a4a DECIMAL(14,2) NULL,	--二店基本户
	a5 DECIMAL(14,2) NULL,	--三店
	a5a DECIMAL(14,2) NULL,	--三店基本户
	a6 DECIMAL(14,2) NULL,	--小屯
	a7 DECIMAL(14,2) NULL,	--广安门
	a9 DECIMAL(14,2) NULL,	--九店
	a10 DECIMAL(14,2) NULL,	--大折
	a11 DECIMAL(14,2) NULL,	--转账
	sort INT NULL DEFAULT 10		--排序
)

DECLARE cur CURSOR fast_forward read_only FOR 
SELECT '00000000' businessdate,e.Balance,e.BankAccountNo,e2.BankAccountName
FROM T_BankAccountData e
JOIN (
SELECT tbad.BankAccountNo, max(id) id
FROM T_BankAccountData tbad
WHERE tbad.BusinessDate<@ksrq
GROUP BY tbad.BankAccountNo
) e1 ON e.BankAccountNo=e1.BankAccountNo AND e.id=e1.id
JOIN T_BankAccount e2 ON e.BankAccountNo=e2.BankAccountNo
UNION 
SELECT e.businessdate,e.Amount,e.BankAccountNo,e1.BankAccountName
FROM T_BankAccountData e
JOIN T_BankAccount e1 ON e.BankAccountNo=e1.BankAccountNo
WHERE e.BusinessDate BETWEEN @ksrq AND @jsrq
ORDER BY e.BusinessDate,e.BankAccountNo

OPEN cur
FETCH NEXT FROM cur INTO @jyrq,@amt,@kh,@name
WHILE @@FETCH_STATUS = 0
BEGIN
	if @name='益德堂' --判断是否存在这行数据，存在就新增，不存在就更新
	BEGIN
		IF EXISTS(SELECT 1 FROM #t WHERE jyrq=@jyrq AND isnull(a1,0)=0)
			UPDATE #t SET a1 = @amt WHERE jyrq=@jyrq AND id=(SELECT MIN(id) FROM #t WHERE jyrq=@jyrq AND isnull(a1,0)=0)			
		ELSE
			INSERT INTO #t(jyrq,a1) VALUES(@jyrq,@amt)
	END
	ELSE IF @name='益德堂基本户'
	BEGIN
		IF EXISTS(SELECT 1 FROM #t WHERE jyrq=@jyrq AND isnull(a1a,0)=0)
			UPDATE #t SET a1a = @amt WHERE jyrq=@jyrq AND id=(SELECT MIN(id) FROM #t WHERE jyrq=@jyrq AND isnull(a1a,0)=0)			
		ELSE
			INSERT INTO #t(jyrq,a1a) VALUES(@jyrq,@amt)			
	END
	ELSE IF @name='弘济'
	BEGIN
		IF EXISTS(SELECT 1 FROM #t WHERE jyrq=@jyrq AND isnull(a2,0)=0)
			UPDATE #t SET a2 = @amt WHERE jyrq=@jyrq AND id=(SELECT MIN(id) FROM #t WHERE jyrq=@jyrq AND isnull(a2,0)=0)			
		ELSE
			INSERT INTO #t(jyrq,a2) VALUES(@jyrq,@amt)			
	END
	ELSE IF @name='弘济基本户'
	BEGIN
		IF EXISTS(SELECT 1 FROM #t WHERE jyrq=@jyrq AND isnull(a2a,0)=0)
			UPDATE #t SET a2a = @amt WHERE jyrq=@jyrq AND id=(SELECT MIN(id) FROM #t WHERE jyrq=@jyrq AND isnull(a2a,0)=0)			
		ELSE
			INSERT INTO #t(jyrq,a2a) VALUES(@jyrq,@amt)			
	END
	ELSE IF @name='康宁'
	BEGIN
		IF EXISTS(SELECT 1 FROM #t WHERE jyrq=@jyrq AND isnull(a3,0)=0)
			UPDATE #t SET a3 = @amt WHERE jyrq=@jyrq AND id=(SELECT MIN(id) FROM #t WHERE jyrq=@jyrq AND isnull(a3,0)=0)			
		ELSE
			INSERT INTO #t(jyrq,a3) VALUES(@jyrq,@amt)			
	END
	ELSE IF @name='二店'
	BEGIN
		IF EXISTS(SELECT 1 FROM #t WHERE jyrq=@jyrq AND isnull(a4,0)=0)
			UPDATE #t SET a4 = @amt WHERE jyrq=@jyrq AND id=(SELECT MIN(id) FROM #t WHERE jyrq=@jyrq AND isnull(a4,0)=0)			
		ELSE
			INSERT INTO #t(jyrq,a4) VALUES(@jyrq,@amt)			
	END
	ELSE IF @name='二店基本户'
	BEGIN
		IF EXISTS(SELECT 1 FROM #t WHERE jyrq=@jyrq AND isnull(a4a,0)=0)
			UPDATE #t SET a4a = @amt WHERE jyrq=@jyrq AND id=(SELECT MIN(id) FROM #t WHERE jyrq=@jyrq AND isnull(a4a,0)=0)			
		ELSE
			INSERT INTO #t(jyrq,a4a) VALUES(@jyrq,@amt)			
	END
	ELSE IF @name='三店'
	BEGIN
		IF EXISTS(SELECT 1 FROM #t WHERE jyrq=@jyrq AND isnull(a5,0)=0)
			UPDATE #t SET a5 = @amt WHERE jyrq=@jyrq AND id=(SELECT MIN(id) FROM #t WHERE jyrq=@jyrq AND isnull(a5,0)=0)			
		ELSE
			INSERT INTO #t(jyrq,a5) VALUES(@jyrq,@amt)			
	END
	ELSE IF @name='三店基本户'
	BEGIN
		IF EXISTS(SELECT 1 FROM #t WHERE jyrq=@jyrq AND isnull(a5a,0)=0)
			UPDATE #t SET a5a = @amt WHERE jyrq=@jyrq AND id=(SELECT MIN(id) FROM #t WHERE jyrq=@jyrq AND isnull(a5a,0)=0)			
		ELSE
			INSERT INTO #t(jyrq,a5a) VALUES(@jyrq,@amt)			
	END
	ELSE IF @name='小屯'
	BEGIN
		IF EXISTS(SELECT 1 FROM #t WHERE jyrq=@jyrq AND isnull(a6,0)=0)
			UPDATE #t SET a6 = @amt WHERE jyrq=@jyrq AND id=(SELECT MIN(id) FROM #t WHERE jyrq=@jyrq AND isnull(a6,0)=0)			
		ELSE
			INSERT INTO #t(jyrq,a6) VALUES(@jyrq,@amt)			
	END
	ELSE IF @name='广安门'
	BEGIN
		IF EXISTS(SELECT 1 FROM #t WHERE jyrq=@jyrq AND isnull(a7,0)=0)
			UPDATE #t SET a7 = @amt WHERE jyrq=@jyrq AND id=(SELECT MIN(id) FROM #t WHERE jyrq=@jyrq AND isnull(a7,0)=0)			
		ELSE
			INSERT INTO #t(jyrq,a7) VALUES(@jyrq,@amt)			
	END
	ELSE IF @name='九店'
	BEGIN
		IF EXISTS(SELECT 1 FROM #t WHERE jyrq=@jyrq AND isnull(a9,0)=0)
			UPDATE #t SET a9 = @amt WHERE jyrq=@jyrq AND id=(SELECT MIN(id) FROM #t WHERE jyrq=@jyrq AND isnull(a9,0)=0)			
		ELSE
			INSERT INTO #t(jyrq,a9) VALUES(@jyrq,@amt)			
	END
	ELSE IF @name='大折'
	BEGIN
		IF EXISTS(SELECT 1 FROM #t WHERE jyrq=@jyrq AND isnull(a10,0)=0)
			UPDATE #t SET a10 = @amt WHERE jyrq=@jyrq AND id=(SELECT MIN(id) FROM #t WHERE jyrq=@jyrq AND isnull(a10,0)=0)			
		ELSE
			INSERT INTO #t(jyrq,a10) VALUES(@jyrq,@amt)			
	END
	ELSE IF @name='转账'
	BEGIN
		IF EXISTS(SELECT 1 FROM #t WHERE jyrq=@jyrq AND isnull(a11,0)=0)
			UPDATE #t SET a11 = @amt WHERE jyrq=@jyrq AND id=(SELECT MIN(id) FROM #t WHERE jyrq=@jyrq AND isnull(a11,0)=0)			
		ELSE
			INSERT INTO #t(jyrq,a11) VALUES(@jyrq,@amt)			
	END
	
	FETCH NEXT FROM cur INTO @jyrq,@amt,@kh,@name
END
	
CLOSE cur
deallocate cur

--汇总收入和支出
INSERT INTO #t(jyrq, a1,sort)
SELECT '收入合计',SUM(a1),5
FROM #t
WHERE ISNULL(a1,0) > 0
UPDATE #t 
SET a1a = (SELECT SUM(a1a) FROM #t WHERE ISNULL(a1a,0)>0),
a2 = (SELECT SUM(a2) FROM #t WHERE ISNULL(a2,0)>0),
a2a = (SELECT SUM(a2a) FROM #t WHERE ISNULL(a2a,0)>0),
a3 = (SELECT SUM(a3) FROM #t WHERE ISNULL(a3,0)>0),
a4 = (SELECT SUM(a4) FROM #t WHERE ISNULL(a4,0)>0),
a4a = (SELECT SUM(a4a) FROM #t WHERE ISNULL(a4a,0)>0),
a5 = (SELECT SUM(a5) FROM #t WHERE ISNULL(a5,0)>0),
a5a = (SELECT SUM(a5a) FROM #t WHERE ISNULL(a5a,0)>0),
a6 = (SELECT SUM(a6) FROM #t WHERE ISNULL(a6,0)>0),
a7 = (SELECT SUM(a7) FROM #t WHERE ISNULL(a7,0)>0),
a9 = (SELECT SUM(a9) FROM #t WHERE ISNULL(a9,0)>0),
a10 = (SELECT SUM(a10) FROM #t WHERE ISNULL(a10,0)>0),
a11 = (SELECT SUM(a11) FROM #t WHERE ISNULL(a11,0)>0)
WHERE jyrq='收入合计'


INSERT INTO #t(jyrq, a1,sort)
SELECT '支出合计',SUM(a1 ),6
FROM #t
WHERE ISNULL(a1,0) < 0
UPDATE #t 
SET a1a = (SELECT SUM(a1a) FROM #t WHERE ISNULL(a1a,0)<0),
a2 = (SELECT SUM(a2) FROM #t WHERE ISNULL(a2,0)<0),
a2a = (SELECT SUM(a2a) FROM #t WHERE ISNULL(a2a,0)<0),
a3 = (SELECT SUM(a3) FROM #t WHERE ISNULL(a3,0)<0),
a4 = (SELECT SUM(a4) FROM #t WHERE ISNULL(a4,0)<0),
a4a = (SELECT SUM(a4a) FROM #t WHERE ISNULL(a4a,0)<0),
a5 = (SELECT SUM(a5) FROM #t WHERE ISNULL(a5,0)<0),
a5a = (SELECT SUM(a5a) FROM #t WHERE ISNULL(a5a,0)<0),
a6 = (SELECT SUM(a6) FROM #t WHERE ISNULL(a6,0)<0),
a7 = (SELECT SUM(a7) FROM #t WHERE ISNULL(a7,0)<0),
a9 = (SELECT SUM(a9) FROM #t WHERE ISNULL(a9,0)<0),
a10 = (SELECT SUM(a10) FROM #t WHERE ISNULL(a10,0)<0),
a11 = (SELECT SUM(a11) FROM #t WHERE ISNULL(a11,0)<0)
WHERE jyrq='支出合计'

UPDATE #t
SET jyrq = '期初',sort=0
WHERE jyrq = '00000000'


SELECT e.jyrq AS '交易日期',
e.a1 as '益德堂',
e.a1a as '益德堂基本户',
e.a2 as '弘济',
e.a2a as '弘济基本户',
e.a3 as '康宁',
e.a4 as '二店',
e.a4a as '二店基本户',
e.a5 as '三店',
e.a5a as '三店基本户',
e.a6 as '小屯',
e.a7 AS '广安门',
e.a9 AS '九店', 
e.a10 AS '大折',
e.a11 AS '转账'
FROM #t e
ORDER BY e.sort

DROP TABLE #t

END
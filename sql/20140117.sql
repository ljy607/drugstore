--需要更新t_jhdmxb的触发器 和存储过程 sp_zgsckmx

SELECT TOP 1 *
FROM T_JHDMXB tj
WHERE tj.SPBH IN('10113', '60087') AND ISNULL(wlhbs,0) = 0
ORDER BY id DESC

--SELECT *
--FROM T_CKMX tc
--WHERE tc.DJHM='JH14000001'

SELECT * FROM T_JGXX tj
WHERE tj.spbh IN('10113', '60087')

--SELECT *
--FROM t_spxx
--WHERE jc LIKE '%jsz%'


--ALTER TABLE t_jhdmxb
--ADD qjhj DECIMAL(20,4) NULL DEFAULT 0


--SELECT *
--FROM T_JHDMXB tj
--WHERE wlhbs = 1


DECLARE @id INT, @jhj DECIMAL(20,4),@spbh NVARCHAR(32),@mid int

--CREATE TABLE #t(id INT,spbh NVARCHAR(32),jhj DECIMAL(20,4))

DECLARE cur CURSOR FOR
SELECT tj.id,tj.SPBH
FROM T_JHDMXB tj
WHERE tj.id BETWEEN 610567 AND 620566

OPEN cur

FETCH NEXT FROM cur INTO @id,@spbh
WHILE @@FETCH_STATUS=0
BEGIN
	SELECT  @mid = MAX(id)
	FROM T_JHDMXB tj
	WHERE tj.SPBH = @spbh AND ISNULL(wlhbs,0) = 0 AND tj.id < @id
	
	SELECT @jhj = jhj FROM T_JHDMXB tj WHERE id = @mid
	
	UPDATE t_jhdmxb SET qjhj=@jhj WHERE id=@id
	
	FETCH NEXT FROM cur INTO @id,@spbh
END

CLOSE cur    

DEALLOCATE cur    





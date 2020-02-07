
DECLARE @je DECIMAL(18,2),@lsj DECIMAL(18,2),@je1 DECIMAL(14,2),@sl DECIMAL(14,2) 
DECLARE @rq1 int,@rq2 INT, @m1 INT, @m2 INT
DECLARE @lsdbh VARCHAR(15)
DECLARE @id INT 

SET @rq1 = 201701
--SET @rq2 = 201712
SET @m1 = 170101
SET @m2 = 170131

SELECT @je = SUM(round(z.js*z.zdzk*m.sl*m.zk*m.lsj/10000.0,2))
FROM t_lsdmxb m
JOIN t_lsdzb z ON z.LSDBH = m.LSDBH
WHERE CONVERT(CHAR(6),z.rq,112) = CAST( @rq1 AS CHAR(6))	

set @je = @je * 0.1 / 30
SET @je1 = 0
WHILE @m1 <= @m2
BEGIN
	SET @je1 = 0
	
	SET NOCOUNT ON
	DECLARE C CURSOR FOR  --SCORLL 后，有了更多的游标操作（滚动游标）
		SELECT lsdbh,lsj,ordr,sl FROM t_lsdmxb WHERE LEFT(lsdbh,6) = CAST(@m1 AS CHAR(6))	
	OPEN C 
	FETCH NEXT FROM C INTO  @lsdbh,@lsj,@id,@sl
	WHILE @@FETCH_STATUS = 0
    BEGIN	
    	
    	IF @sl< 0 OR @sl > 9 or @je - @je1 < @lsj 
    	BEGIN
    		FETCH NEXT FROM C INTO  @lsdbh,@lsj,@id,@sl 
    		CONTINUE;
    	END    	
    	SET @je1 = @lsj + @je1
    	UPDATE t_lsdmxb SET sl = sl + 1 WHERE lsdbh = @lsdbh AND ordr = @id     	
        FETCH NEXT FROM C INTO  @lsdbh,@lsj,@id,@sl  
        FETCH NEXT FROM C INTO  @lsdbh,@lsj,@id,@sl 
        FETCH NEXT FROM C INTO  @lsdbh,@lsj,@id,@sl 
        FETCH NEXT FROM C INTO  @lsdbh,@lsj,@id,@sl 
        FETCH NEXT FROM C INTO  @lsdbh,@lsj,@id,@sl 
        FETCH NEXT FROM C INTO  @lsdbh,@lsj,@id,@sl  
               
    END    
	CLOSE C
	DEALLOCATE C
	
	SET @m1 = @m1 + 1	
END



--SELECT SUM(round(z.js*z.zdzk*m.sl*m.zk*m.lsj/10000.0,2))
--FROM t_lsdmxb m
--JOIN t_lsdzb z ON z.LSDBH = m.LSDBH
--WHERE CONVERT(CHAR(6),z.rq,112) = '201701'

--SELECT e.*
----UPDATE e SET e.sl = e1.sl
--FROM t_lsdmxb e
--JOIN gamdb1.dbo.t_lsdmxb e1 ON e1.LSDBH = e.LSDBH AND e1.ORDR = e.ORDR
--WHERE LEFT(e.lsdbh,4) BETWEEN '1701' AND '1704'


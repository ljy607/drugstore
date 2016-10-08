--DECLARE @i INT

----201511
--SET @i = 1

declare @date1 datetime,@date2 DATETIME,@rq CHAR(8)
set @date1='2015-11-01'
set @date2='2016-04-23'

CREATE TABLE #t
(
	rq CHAR(8)
)

INSERT INTO #t(rq)
select [day]=convert(varchar(8),dateadd(dd,number,@date1),112)
from master..spt_values
where type='p'  and number <= datediff(dd,@date1,@date2) 

declare auth_cur cursor for
SELECT rq from #t 

open auth_cur
fetch next from auth_cur into @rq	
while (@@fetch_status=0)
  BEGIN
	EXEC SP_LS_SW @rq,0.5 
	PRINT @rq
	fetch next from auth_cur into @rq
  end
close auth_cur
deallocate auth_cur	

DROP TABLE #t
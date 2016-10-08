--SELECT MAX(yhdbh) FROM hj109.hj09.dbo.t_yhjhzb 

--INSERT INTO hj109.hj09.dbo.t_yhjhzb(YHDBH, YHRQ, BZ, ZBR, JSBZ)
--VALUES('',GETDATE(),'','',0)

--CREATE TABLE #t(spbh NVARCHAR(32),id INT IDENTITY(1,1))

--INSERT INTO #t(spbh)
--SELECT spbh
--FROM t_chxx c
--LEFT JOIN hj109.hj09.dbo.t_chxx c1 ON c.spbh=c1.spbh
--WHERE c1.spbh IS NULL

--INSERT INTO hj109.hj09.dbo.T_YHJHMX(YHDBH,YHRQ,ORDR,SPBH,KLOW,DCL,LSJ,YHSL,FLAG,BZ,dhsl)

--SELECT '' yhdbh,GETDATE(),a.id,a.spbh,0,0,0,5,0,'',0
--FROM t_chxx c
--JOIN #t a ON c.spbh=a.spbh 



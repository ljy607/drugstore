--DECLARE @bh VARCHAR(5),@mc VARCHAR(16)
--SELECT @bh = '00134',@mc = '%ºÓ±±¼½±±%'

--SELECT *
--FROM t_gysxx 
--WHERE GYSBH = @bh OR gysmc LIKE @mc

--SELECT ts.id, ts.gysbh, ts.gysmc, ts.sqrq, ts.shrq, ts.sprq
--FROM T_SYQYSPB ts
--WHERE ts.gysmc LIKE @mc



DECLARE @id NVARCHAR(32)
SET @id = '25,28,29,30,23'

--UPDATE ts
--SET ts.shrq = ts.sqrq,ts.sprq = ts.sqrq
--FROM T_SYQYSPB ts
--JOIN dbo.fn_SplitToTable(@id,',') fstt ON ts.id =fstt.[value]

SELECT ts.id,ts.gysbh,ts.gysmc, ts.sqrq, ts.shrq, ts.sprq,ts.ywbmfzr,ts.kcr,ts.zlglfzr
FROM T_SYQYSPB ts
JOIN dbo.fn_SplitToTable(@id,',') fstt ON ts.id =fstt.[value]

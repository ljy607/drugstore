------------------------------------------------------------------
--2016年8月24日 08:46:39----------------------------------
---零售明细表记录经营类别，便于调整经营类别不影响历史提奖数据-----
--

--ALTER TABLE t_lsdmxb 
--ADD jylb NVARCHAR(2) NULL ----对应t_spxx表的lbbh
--GO

--UPDATE m SET jylb = s.LBBH
--FROM t_lsdmxb m
--JOIN t_spxx s ON m.spbh = s.SPBH
--JOIN t_lsdzb z ON z.LSDBH = m.LSDBH
--WHERE z.rq > '2016-8-23' AND m.jylb IS NULL



                          
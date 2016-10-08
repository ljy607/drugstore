--
--1>
select top 1 id from sysobjects where  name='T_spxx' --可以查出表的Objectid
--2>
exec  sp_lock   --就可以找到 spid
--3>
kill spid  --解锁

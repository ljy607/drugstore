--地址：223.72.243.38
--端口：10187
--用户名：hjyf
--密码：  hjyf@bjkhx@2024
--数据库： khx_wtps



--连锁库存：
select * from khx.khx_wtps.dbo.v_hjyf_xkphkc

--凯宏鑫库存： hshj为供货价
select * from khx.khx_wtps.dbo.v_hjyf_khxspkc
--商品对应关系：
select * from khx.khx_wtps.dbo.v_hjyf_spdygx
--凯宏鑫库存连接商品对应关系：
select * 
from khx.khx_wtps.dbo.v_hjyf_khxspkc a
left join khx.khx_wtps.dbo.v_hjyf_spdygx b on a.spid=b.spid 

---- 删除链接服务器语法 
---- exec sp_dropserver 'HJWL', 'droplogins '

EXEC  sp_addlinkedserver
      @server='khx',--被访问的服务器别名 
      @srvproduct='',
      @provider='SQLOLEDB',
      @datasrc='223.72.243.38,10187'   --要访问的服务器


EXEC sp_addlinkedsrvlogin
     'khx', --被访问的服务器别名
     'false',
     NULL,
     'hjyf', --帐号
     'hjyf@bjkhx@2024' --密码

go

select * from khx.khx_wtps.dbo.v_hjyf_xkphkc

go

/*
* 
地址：223.72.243.38
端口：10187
用户名：hjyf
密码：  hjyf@bjkhx@2024
数据库： khx_wtps


use khx_wtps
--连锁库存：
select * from v_hjyf_xkphkc

--凯宏鑫库存： hshj为供货价
select * from v_hjyf_khxspkc
--商品对应关系：
select * from v_hjyf_spdygx
--凯宏鑫库存连接商品对应关系：
select * from v_hjyf_khxspkc a
left join v_hjyf_spdygx b on a.spid=b.spid 

*/


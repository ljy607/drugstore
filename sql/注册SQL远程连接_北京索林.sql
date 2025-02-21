---- 删除链接服务器语法 
 exec sp_dropserver 'bjsl', 'droplogins '

EXEC  sp_addlinkedserver
      @server='bjsl',--被访问的服务器别名  北京索林
      @srvproduct='',
      @provider='SQLOLEDB',
      @datasrc='210.13.54.210,1000'   --要访问的服务器


EXEC sp_addlinkedsrvlogin
     'bjsl', --被访问的服务器别名
     'false',
     NULL,
     'sa', --帐号
     'abcd@1234' --密码

GO

-- 210.13.54.210,1000  账号：TEST001   密码：TEST001@1   

select * from bjsl.中间库_cs.dbo.Book_收货记录返回接口表_each be

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


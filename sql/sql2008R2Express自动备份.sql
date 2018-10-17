
------sql2008R2 EXPRESS 版本备份数据库脚本
----1.查看SQL 版本:

--select @@VERSION 
----可以看到 Express Edition 精简免费版

----Microsoft SQL Server 2008 R2 (SP2) - 10.50.4000.0 (X64)   Jun 28 2012 08:36:30   
----Copyright (c) Microsoft Corporation  Express Edition (64-bit) on 
----Windows NT 6.1 <X64> (Build 7601: Service Pack 1) (Hypervisor)

----2. sqlserver 2008 r2 express版本是不带自动备份功能的, 所以需要手动写sql脚本, 和给系统添加计划任务来执行

----3. 在需要存放备份的分区下创建目录, 比如D:\databackup. 将该脚本命名为 JFSuQian.sql , 
----然后放到D:\databackup下, 下面是脚本内容:

--print ‘开始备份苏家数据库‘
GO  
DECLARE  
@backupTime VARCHAR(20)  --备份时间
DECLARE  
@fileName VARCHAR(1000)    --备份路径
SELECT 
 @backupTime=(CONVERT(VARCHAR(8), GETDATE(), 112) +REPLACE(CONVERT(VARCHAR(5), GETDATE(), 114), ‘:‘, ‘‘))   
SELECT @fileName=‘D:\databackup\JFSuQian_‘+@backupTime+‘.bak‘ 
backup database 数据库名字 to disk=@fileName 
--print ‘开始备份苏家数据库‘
--

----4. 创建bat文件,在桌面任意建立一个txt的文本文件, 输入下面的内容, 然后将该txt的文本文件, 更改为JFSuQian.bat, 也放到D:\databackup目录下

----cd C:\Program Files\Microsoft SQL Server\100\Tools\Binn  
----sqlcmd -S . -i D:\databackup\JPKFSuQian.sql
----解释:
----第一行: 是你的SqlServer的安装路径
----　第二行: 需要执行的sql脚本路径, 就是我们前面写的那个备份脚本

----5. 创建删除备份的bat文件, 跟第四步一样, 在桌面任意建立一个txt文本文件, 输入以下内容, 然后将该txt文件, 更名为del_4_bak.bat, 也放到D:\databackup

----forfiles /p C:\SqlDataBack\JPKF_DATA_BACKUP /m *.bak /d -4 /c "cmd /c del /f @path"
----  解释: /p   在该路径下搜索要操作的文件

----          /m    搜索掩码. 默认匹配所有

----          /d    使用日期条件过滤文件. 默认操作为+. 默认单位为 天

----          /c    所要执行的cmd命令,必须使用””引起来,  它的默认命令是 "cmd /c echo @file"[返回文件名而已]

----6. 至此准备工作已完成, 接下来创建计划任务, 定期每天执行

----控制面板→右上角(小图标)→管理工具→任务计划程序(下图), 后面的不再叙述:
create proc dbbf_test
as
declare 
@dbname varchar(20),
@cmd1 nvarchar(120),
@cmd2 varchar(120),
@cmd3 varchar(120),
@i int,
@filename varchar(80),
@path varchar(80)
set @dbname='TEST'--\\这是数据库名，使用时只需要把它改成你所要备份的数据库名即可，这个必须修改\\--
----删除当前日期前15-前10天内的数据库备份,可根需要自行修改----
set @i=10
while @i<15 
begin 
set @cmd1 ='if exist E:\DATABACKUP\'+@dbname+convert(varchar(10),DATEADD(day,-@i,getdate()),112) +'*' +' del '+'E:\DATABACKUP\'+@dbname+convert(varchar(10),DATEADD(day,-@i,getdate()),112) +'*'
exec master..xp_cmdshell @cmd1----删除10天之前的数据库备份    
set @i=@i+1
END

----备份数据库----
exec master..xp_cmdshell 'if not exist E:\DATABACKUP (md E:\DATABACKUP)'--如果E盘根目录没有DATABACKUP文件夹，则新建此文件夹
SELECT @filename=@dbname+replace(replace(replace(CONVERT(varchar(16), getdate(), 120 ),'-',''),' ','-'),':','') 
SET @path='E:\DATABACKUP\'+@filename
BACKUP DATABASE @dbname TO DISK=@path

----压缩数据库备份，删除原备份文件
set @cmd2='C:\PROGRA~1\WinRAR\winrar.exe a -ibck E:\DATABACKUP\'+@filename+'.rar E:\DATABACKUP\'+@filename
exec master..xp_cmdshell @cmd2----压缩数据库
set @cmd3='DEL E:\DATABACKUP\'+@filename

exec master..xp_cmdshell @cmd3----删除原备份文件（只保留压缩包）
                              --
go

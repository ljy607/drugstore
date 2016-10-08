declare @i int
--set @i = 1
--while(@i<10)
--begin
--	insert into t_member(code,[name],sex,phone,address,jine,flag)
--	values('00000'+cast(@i as char(1)),'','','','',0,'Y')

--	set @i = @i+1
--END

--set @i = 10
--while(@i<100)
--begin
--	insert into t_member(code,[name],sex,phone,address,jine,flag)
--	values('0000'+cast(@i as char(2)),'','','','',0,'Y')

--	set @i = @i+1
--END

--set @i = 100
--while(@i<1000)
--begin
--	insert into t_member(code,[name],sex,phone,address,jine,flag)
--	values('000'+cast(@i as char(3)),'','','','',0,'Y')

--	set @i = @i+1
--END

--set @i = 1000
--while(@i<10000)
--begin
--	insert into t_member(code,[name],sex,phone,address,jine,flag)
--	values('00'+cast(@i as char(4)),'','','','',0,'Y')

--	set @i = @i+1
--END

set @i = 80001
while(@i<100000)
begin
	insert into t_member(code,[name],sex,phone,address,jine,flag)
	values('0'+cast(@i as char(5)),'','','','',0,'N')

	set @i = @i+1
END

insert into t_member(code,[name],sex,phone,address,jine,flag)
values('100000','','','','',0,'N')
go


--select * from t_member where code > '050000'

--select max(code) from t_member
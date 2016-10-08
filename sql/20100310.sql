
--会员积分兑换
drop table t_member_jfdh
go
create table t_member_jfdh
(
T_Member_jfdhId int identity(1,1) not null,
code varchar(10) not null,	--会员代码
dhjf decimal(10,2) not null,			--兑换积分
memo nvarchar(256),			--描述
dhrq datetime not null,		--兑换时间
zxr	 varchar(10) not null,	--执行人
Primary Key (t_member_jfdhId)
)
go
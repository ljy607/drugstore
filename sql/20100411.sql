-- 修改供应商信息，增加工商验证、经营许可证、GSP三证有效期
alter table t_gysxx
add jyxkzrq datetime null

alter table t_gysxx
add gsprq datetime null

alter table t_gysxx
add gsyzrq datetime null

alter table t_gysxx
drop zzyxq

--协议日期
alter table t_gysxx
add xyrq date null

--法人委托日期
alter table t_gysxx
add frrq date null

--修改商品信息，增加进口药标识
alter table T_SPXX
add jky tinyint default 0 null
go

update t_spxx
set jky = 0
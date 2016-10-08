drop function fn_GetJhj
go

--
--@type 1 表示需要浮动计算
create function [dbo].[fn_GetJhj](@spbh varchar(30), @pcbh varchar(30),@type int)
returns decimal(14,2)
as 
begin

	declare @result decimal(14,2)
	set @result = 0

	select @result = sum(jiag*sl)/sum(sl) 
	from t_ckmx 
	where ywtp in (0,1,2,3) and spbh = @spbh and pcbh = @pcbh

	if @type = 1
	begin
		 select  @result = 1
	end
	

	return @result

end


GO

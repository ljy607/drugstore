--------2020年2月8日 20:35:38
-----处理总店临时删除数据 公司系统：屏蔽304972、304973、30434三种商品2020年1月22日前的进货记录
SELECT m.*
--UPDATE m SET m.FLAG = 0
FROM t_jhdmxb m
JOIN t_jhdzb z ON z.JHDBH = m.JHDBH
WHERE z.jhrq > '2020.1.22' AND m.spbh IN ('304972','304973','30434')





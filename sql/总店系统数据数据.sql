--------2020��2��8�� 20:35:38
-----�����ܵ���ʱɾ������ ��˾ϵͳ������304972��304973��30434������Ʒ2020��1��22��ǰ�Ľ�����¼
SELECT m.*
--UPDATE m SET m.FLAG = 0
FROM t_jhdmxb m
JOIN t_jhdzb z ON z.JHDBH = m.JHDBH
WHERE z.jhrq > '2020.1.22' AND m.spbh IN ('304972','304973','30434')





-------------2019��4��6�� 21:01:55------------
/******************* ����˵�� ******************
  ͨ���ֵ��ϴ���Ҫ���ƻ��Զ�����Ҫ���ƻ���ϸ��¼
  ����  @sspbh   ��Ʒ���
        @ckdbh   Ҫ�������
        @decyhsl Ҫ������
        @ordr    ���
  ���  �������ϸ���в���һ����Ч�ļ�¼
  ���	��Ӧ��֤�չ��ڵĹ�Ӧ�̽�ֹ���� 2019��4��6�� 20:59:52
		���ӽ������� 2024��12��20�� 14:22:23
************************************************/
ALTER PROCEDURE [dbo].[SP_YHDSC] @sspbh varchar(15),@ckdbh varchar(15),@decyhsl decimal(8,2), @ordr int ,@sbz varchar(32)AS
begin
	DECLARE @decjhj decimal(8,2), @declsj decimal(8,2),@deckcl decimal(8,2),@decfgskc decimal(8,2)
	DECLARE @gysbh varchar(15),@jhrq datetime


	-- �������ۡ����ۼۡ��������Ϊ�����־
	SET @decjhj = 0
	SET @declsj = 0
	SET @deckcl = 0

	--���Ҹ���Ʒ�Ĵ��
	SELECT @deckcl =ISNULL(SUM(CHSL),0) FROM T_CHXX WHERE SPBH = @sspbh  

	--�������ۼ�
	SELECT @declsj = ISNULL(LSJ,0) FROM T_JGXX WHERE SPBH = @sspbh

	--������ͽ����ۺͶ�Ӧ�Ĺ�Ӧ��
	SELECT top 1 @gysbh=isnull(z.GYSBH,''),@decjhj=isnull(min(m.jhj),0) 
	FROM  T_JHDZB z,t_jhdmxb m,t_gysxx g
	WHERE z.jhdbh = m.jhdbh and
			m.spbh = @sspbh and
			z.jhrq > dateadd(month,-6,getdate()) AND
			( GETDATE() < jyxkzrq AND 
			GETDATE() < g.gsprq AND 
			GETDATE() < g.gsyzrq AND 
			GETDATE() < g.xyrq AND 
			GETDATE() < g.frrq AND 
			GETDATE() < g.ywyyxq AND
			GETDATE() < g.cwyxq )
	group by z.gysbh
	order by min(m.jhj)

	--���ҷֹ�˾���
	SELECT  @decfgskc=isnull(sum(SHUL - YXSL),0) FROM T_FGSKC WHERE SPBH = @sspbh
	
	--�������������� 2024��12��20�� 14:22:44
	SELECT @jhrq = MAX(jhrq) 
	FROM t_jhdzb z
	JOIN t_jhdmxb m ON m.JHDBH = z.JHDBH
	WHERE z.jhrq > '2020.1.1' AND spbh = @sspbh

	-- ��Ҫ������ϸ�����һ����¼
	INSERT INTO T_YHJHMX (YHDBH,ORDR,SPBH,GYSBH,DCL,YHSL,LSJ,JHJ,FLAG,BZ,fgskc,jhrq)
		  VALUES(@ckdbh, @ordr, @sspbh, @gysbh, @deckcl, @decyhsl, @declsj,@decjhj,0,@sbz,cast(@decfgskc as varchar(20)),@jhrq)
end 

GO



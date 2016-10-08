DROP TABLE T_JX
GO
CREATE TABLE T_JX
(
	[ID] VARCHAR(3),
	MC NVARCHAR(32)
)

insert into t_jx([id],mc) values('01',N'∆¨º¡')
insert into t_jx([id],mc) values('02',N'»ÌΩ∫ƒ“º¡')
insert into t_jx([id],mc) values('03',N'Ù˙º¡')
insert into t_jx([id],mc) values('04',N'»Ì∏‡º¡')
insert into t_jx([id],mc) values('05',N'»Èº¡')
insert into t_jx([id],mc) values('06',N'’Îº¡')
insert into t_jx([id],mc) values('07',N'∑€’Îº¡')
insert into t_jx([id],mc) values('08',N' ‰“∫º¡')
insert into t_jx([id],mc) values('09',N'”Õº¡')
insert into t_jx([id],mc) values('10',N'ø≈¡£º¡')
insert into t_jx([id],mc) values('11',N'µŒÕËº¡')
insert into t_jx([id],mc) values('12',N'œ¥º¡')
insert into t_jx([id],mc) values('13',N'»ÈΩ∫º¡')
insert into t_jx([id],mc) values('14',N'Ã«Ω¨º¡')
insert into t_jx([id],mc) values('15',N'≤Îº¡')
insert into t_jx([id],mc) values('16',N'∏‡∫˝º¡')
insert into t_jx([id],mc) values('17',N'∆¯ŒÌº¡')
insert into t_jx([id],mc) values('18',N'…¢º¡')
insert into t_jx([id],mc) values('19',N'ÀÆº¡')
insert into t_jx([id],mc) values('20',N'æ∆º¡')
insert into t_jx([id],mc) values('21',N'À®º¡')
insert into t_jx([id],mc) values('22',N'Ω∫Ω¨º¡')
insert into t_jx([id],mc) values('23',N'∫œº¡')
insert into t_jx([id],mc) values('24',N'∫˝º¡')
insert into t_jx([id],mc) values('25',N'—€”√»‹“∫º¡')
insert into t_jx([id],mc) values('26',N'—€”√»Ì∏‡º¡')
insert into t_jx([id],mc) values('27',N'µŒ±«º¡')
insert into t_jx([id],mc) values('28',N'∂˙”√»‹“∫º¡')
insert into t_jx([id],mc) values('29',N'ÕËº¡')
insert into t_jx([id],mc) values('30',N'∆‰À˚')
insert into t_jx([id],mc) values('31',N'∫¨ ˛º¡')
insert into t_jx([id],mc) values('32',N'»‹“∫º¡')
insert into t_jx([id],mc) values('33',N'ªÏ–¸º¡')
insert into t_jx([id],mc) values('34',N'Ã«Ω¨º¡')
insert into t_jx([id],mc) values('35',N'∆¯ŒÌº¡')
insert into t_jx([id],mc) values('36',N'ƒ§º¡')
insert into t_jx([id],mc) values('37',N'ıØº¡')
insert into t_jx([id],mc) values('38',N'”≤Ω∫ƒ“º¡')
go


DROP VIEW [dbo].[V_SPXX]
GO

CREATE VIEW [dbo].[V_SPXX]
AS
SELECT T_SPXX.SPBH, T_SPXX.LBBH, T_SPLB.SPLB, T_SPXX.SBBZ, T_SPXX.TZM, 
      T_SPXX.PM, T_SPXX.JC, T_SPXX.SB, T_SPXX.PZWH, T_SPXX.GG, T_JLDW.JLDW, 
      T_SCCJ.JC AS CJJC, T_SPXX.YXQX, T_SPXX.ZDJL, T_SPXX.BZ, T_SCCJ.CJMC, 
      T_JX.MC AS jx, T_SPXX.GMP, T_SPXX.FLAG, T_SPXX.YHBZ
FROM T_SCCJ RIGHT OUTER JOIN
      T_SPXX ON T_SCCJ.CJBH = T_SPXX.CJBH LEFT OUTER JOIN
      T_SPLB ON T_SPXX.LBBH = T_SPLB.SPLBBH LEFT OUTER JOIN
      T_JLDW ON T_SPXX.JLDWBH = T_JLDW.JLDWBH LEFT OUTER JOIN
      T_JX ON T_SPXX.JX = T_JX.ID
GO



	
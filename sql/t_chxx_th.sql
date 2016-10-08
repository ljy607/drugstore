CREATE TABLE #tt
(
	ID INT IDENTITY(1,1) NOT NULL,
	[SPBH] [varchar](32) NOT NULL,
	[PCBH] [varchar](32) NOT NULL,
	[CHSL] [decimal](8,2) NULL,
	[yxrq] [datetime] NULL,
	[jiag] [decimal](10, 4) NULL
)

INSERT INTO #tt(spbh,pcbh,chsl,yxrq,jiag)
SELECT tt.spbh,tt.pcbh,c.CHSL, c.yxrq, c.jiag
FROM T_THDMXB tt
JOIN t_chxx c ON tt.spbh=c.spbh AND tt.pcbh=c.pcbh
WHERE tt.THDBH IN('th05000059','th05000376','th05000388','th06000078')                        
UNION ALL
SELECT tt.spbh,tt.pcbh,c.CHSL, c.yxrq, c.jiag
FROM T_THDMXB tt
JOIN t_chxx c ON tt.spbh=c.spbh AND tt.pcbh=c.pcbh
WHERE tt.THDBH IN('th0600352','th08000117','th09000042','th09000120')                        
UNION ALL
SELECT tt.spbh,tt.pcbh,c.CHSL, c.yxrq, c.jiag
FROM T_THDMXB tt
JOIN t_chxx c ON tt.spbh=c.spbh AND tt.pcbh=c.pcbh
WHERE tt.THDBH IN('th09000125','th10000281','th10000375','th10000425')
UNION ALL
SELECT tt.spbh,tt.pcbh,c.CHSL, c.yxrq, c.jiag
FROM T_THDMXB tt
JOIN t_chxx c ON tt.spbh=c.spbh AND tt.pcbh=c.pcbh
WHERE tt.THDBH IN('th10000441','th10000470','th11000116','th11000170')  
UNION ALL
SELECT tt.spbh,tt.pcbh,c.CHSL, c.yxrq, c.jiag
FROM T_THDMXB tt
JOIN t_chxx c ON tt.spbh=c.spbh AND tt.pcbh=c.pcbh
WHERE tt.THDBH IN('th11000187','th11000222','th11000322','th11000492')
UNION ALL
SELECT tt.spbh,tt.pcbh,c.CHSL, c.yxrq, c.jiag
FROM T_THDMXB tt
JOIN t_chxx c ON tt.spbh=c.spbh AND tt.pcbh=c.pcbh
WHERE tt.THDBH IN('th11000723','th12000055','th12000117','th12000130')
UNION ALL
SELECT tt.spbh,tt.pcbh,c.CHSL, c.yxrq, c.jiag
FROM T_THDMXB tt
JOIN t_chxx c ON tt.spbh=c.spbh AND tt.pcbh=c.pcbh
WHERE tt.THDBH IN('th12000838','th12001367','th12001389','th12001937')
UNION ALL
SELECT tt.spbh,tt.pcbh,c.CHSL, c.yxrq, c.jiag
FROM T_THDMXB tt
JOIN t_chxx c ON tt.spbh=c.spbh AND tt.pcbh=c.pcbh
WHERE tt.THDBH IN('th13000216','th13000485','th13000541','th13000655')
UNION ALL
SELECT tt.spbh,tt.pcbh,c.CHSL, c.yxrq, c.jiag
FROM T_THDMXB tt
JOIN t_chxx c ON tt.spbh=c.spbh AND tt.pcbh=c.pcbh
WHERE tt.THDBH IN('th13000704','th13000738','th13000897','th13001541')
UNION ALL
SELECT tt.spbh,tt.pcbh,c.CHSL, c.yxrq, c.jiag
FROM T_THDMXB tt
JOIN t_chxx c ON tt.spbh=c.spbh AND tt.pcbh=c.pcbh
WHERE tt.THDBH IN('th13001626','th14000179','th14000329','th14000532','th14000819','th14000818')                                                

ORDER BY tt. spbh 
 
 --SELECT spbh,pcbh,SUM(chsl)
 --FROM #tt
 --GROUP BY spbh,pcbh
 
 SELECT * FROM #tt ORDER BY #tt.spbh
 
 DROP TABLE #tt                     
                        

INSERT INTO T_FUNCS(FUNCID,FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,	UFLAG,parameter	-- ID -- this column value is auto-generated
)
VALUES('17','分店库存查询',2,1,'分店库存查询','image\tom_wap.gif','w_fdkc',0,1,0)


INSERT INTO T_FUNCS(FUNCID,FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,	UFLAG,parameter	-- ID -- this column value is auto-generated
)
VALUES('19','商品类别调整',6,1,'商品类别调整','image\tom_wap.gif','w_splbtz',0,1,0)


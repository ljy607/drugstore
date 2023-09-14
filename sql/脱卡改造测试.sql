--0003
INSERT INTO t_chxx(HWBH, SPBH, PCBH, CHSL, yxrq, jiag, FLAG, scrq,
            dhrq, sccj, cd, gxrq)
SELECT 'G0112','0003','20230120',100,'2025.01.20',10,1,'2023.01.10','2023.2.1','','',GETDATE()

INSERT INTO t_sphw(SPBH, JHHW, LSHW) VALUES('0003','G0112','G0112')

INSERT into t_jgxx(SPBH, LSJ, PFJ, DBJ, GBJ, ZK, hyj, GXRQ, dslsj)
SELECT '0003', LSJ, PFJ, DBJ, GBJ, ZK, hyj, GXRQ, dslsj
FROM t_jgxx
WHERE spbh = '41299'

INSERT INTO t_spxx(SPBH, LBBH, SBBZ, XQBJ, TZM, PM, JC, SB, PZWH, GG, JLDWBH, CJBH,
            YXQX, ZDJL, BZ, GXRQ, GXZ, FLAG, YHBZ, JX, GMP, GB, CD, yplb, hxmc, lb,
            jky, jgzt, ypztbh, jfbz, yhlx, IsMHJ, cctj, ypfl, spbm, ybbm, gnzz,
            sxyxq, pzwhyxq, scqyxkzh, jyfwid, slyp, sfth, gjgbbm)
SELECT '0003', LBBH, SBBZ, XQBJ, TZM, PM, JC, SB, PZWH, GG, JLDWBH, CJBH,
            YXQX, ZDJL, BZ, GXRQ, GXZ, FLAG, YHBZ, JX, GMP, GB, CD, yplb, hxmc, lb,
            jky, jgzt, ypztbh, jfbz, yhlx, IsMHJ, cctj, ypfl, spbm, '105501092190000010200000000000000', gnzz,
            sxyxq, pzwhyxq, scqyxkzh, jyfwid, slyp, sfth, gjgbbm
FROM t_spxx 
WHERE 1=1 
AND spbh = '41299'
--PM LIKE '%参松养心胶囊%'

--0001
INSERT INTO t_chxx(HWBH, SPBH, PCBH, CHSL, yxrq, jiag, FLAG, scrq,dhrq, sccj, cd, gxrq)
SELECT 'G0112','0001','20230120',100,'2025.01.20',10,1,'2023.01.10','2023.2.1','','',GETDATE()

INSERT INTO t_sphw(SPBH, JHHW, LSHW) VALUES('0001','G0112','G0112')

INSERT into t_jgxx(SPBH, LSJ, PFJ, DBJ, GBJ, ZK, hyj, GXRQ, dslsj)
SELECT '0001', LSJ, PFJ, DBJ, GBJ, ZK, hyj, GXRQ, dslsj
FROM t_jgxx
WHERE spbh = '109942'

INSERT INTO t_spxx(SPBH, LBBH, SBBZ, XQBJ, TZM, PM, JC, SB, PZWH, GG, JLDWBH, CJBH,
            YXQX, ZDJL, BZ, GXRQ, GXZ, FLAG, YHBZ, JX, GMP, GB, CD, yplb, hxmc, lb,
            jky, jgzt, ypztbh, jfbz, yhlx, IsMHJ, cctj, ypfl, spbm, ybbm, gnzz,
            sxyxq, pzwhyxq, scqyxkzh, jyfwid, slyp, sfth, gjgbbm)
SELECT '0001', LBBH, SBBZ, XQBJ, TZM, '阿莫西林片', JC, SB, PZWH, GG, JLDWBH, CJBH,
            YXQX, ZDJL, BZ, GXRQ, GXZ, FLAG, YHBZ, JX, GMP, GB, CD, yplb, hxmc, lb,
            jky, jgzt, ypztbh, jfbz, yhlx, IsMHJ, cctj, ypfl, spbm, 'XJ01CAA040A001010405611', gnzz,
            sxyxq, pzwhyxq, scqyxkzh, jyfwid, slyp, sfth, gjgbbm
FROM t_spxx 
WHERE spbh = '109942'

--SELECT *
--FROM t_spxx 
--WHERE 1=1 and PM LIKE '%阿莫西林分散片%'

--0002
INSERT INTO t_chxx(HWBH, SPBH, PCBH, CHSL, yxrq, jiag, FLAG, scrq,dhrq, sccj, cd, gxrq)
SELECT 'G0112','0002','20230120',100,'2025.01.20',10,1,'2023.01.10','2023.2.1','','',GETDATE()

INSERT INTO t_sphw(SPBH, JHHW, LSHW) VALUES('0002','G0112','G0112')

INSERT into t_jgxx(SPBH, LSJ, PFJ, DBJ, GBJ, ZK, hyj, GXRQ, dslsj)
SELECT '0002', LSJ, PFJ, DBJ, GBJ, ZK, hyj, GXRQ, dslsj
FROM t_jgxx
WHERE spbh = '10994'

INSERT INTO t_spxx(SPBH, LBBH, SBBZ, XQBJ, TZM, PM, JC, SB, PZWH, GG, JLDWBH, CJBH,
            YXQX, ZDJL, BZ, GXRQ, GXZ, FLAG, YHBZ, JX, GMP, GB, CD, yplb, hxmc, lb,
            jky, jgzt, ypztbh, jfbz, yhlx, IsMHJ, cctj, ypfl, spbm, ybbm, gnzz,
            sxyxq, pzwhyxq, scqyxkzh, jyfwid, slyp, sfth, gjgbbm)
SELECT '0002', LBBH, SBBZ, XQBJ, TZM, '哈士蟆', JC, SB, PZWH, GG, JLDWBH, CJBH,
            YXQX, ZDJL, BZ, GXRQ, GXZ, FLAG, YHBZ, JX, GMP, GB, CD, yplb, '', lb,
            jky, jgzt, ypztbh, jfbz, yhlx, IsMHJ, cctj, ypfl, spbm, 'T511702879', gnzz,
            sxyxq, pzwhyxq, scqyxkzh, jyfwid, slyp, sfth, gjgbbm
FROM t_spxx 
WHERE spbh = '109942'




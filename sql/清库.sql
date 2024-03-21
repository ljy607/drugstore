truncate table t_bjdmxb;
truncate table t_bjdzb;

truncate table t_ckdmxb;
truncate table t_ckdzb;

truncate table t_dbdmxb;
truncate table t_dbdzb;

truncate table t_tkdmxb;
truncate table t_tkdzb;

truncate table t_bsdmxb;
truncate table t_bsdzb;

truncate table t_chxx;

truncate table t_ckmx;
truncate table t_hwxx;
truncate table t_jgxx;

truncate table t_lsdmxb;
truncate table t_lsdmxb_ls;
truncate table t_lsdzb;
truncate table t_lsdzb_ls;

truncate table t_sphw;
truncate table t_spkcl;
truncate table t_clxz;
truncate table t_cxmxb;
truncate table t_cxzb;
truncate table t_djcsb;
truncate table t_jgxxjl;
truncate table t_lshzb;

truncate table t_yhjhmx;
truncate table t_yhjhzb;

truncate table t_member;
truncate table t_member_jfdh;
truncate table t_member_hd;

--truncate table t_dwxx;
truncate table t_bmxx;
truncate table t_clxz;
truncate table t_dwxx;
truncate table t_ghfy;
truncate table t_jgxxjl;

truncate table t_pddmxb;
truncate table t_pddzb;

truncate table t_sccj;
truncate table t_sphw;
truncate table t_splb;
truncate table t_sptzm;
truncate table t_spxx;
truncate table t_spys;
truncate table t_spysxx;
truncate table t_spyx;
truncate table t_umsgs;
--truncate table t_zgxx;
truncate table t_ghfy;
--truncate table t_hosts;
truncate table t_jgxxjl;

truncate table t_yhjhmx;
truncate table t_yhjhzb;
truncate table t_yhjlmx;
truncate table t_yhjlzb;
truncate table t_member_jfdh;
truncate table t_pddmxb;
truncate table t_pddzb;
truncate table t_sccj;
truncate table t_spxx;
truncate table t_spys;
truncate table t_spysxx;
-- truncate table t_hosts;

TRUNCATE TABLE t_chxx_tbjl;
TRUNCATE TABLE T_JCDZB;
TRUNCATE TABLE T_JCDMXB;
TRUNCATE TABLE t_spxx_tj

TRUNCATE TABLE t_yb_divide;
TRUNCATE TABLE t_yb_divide_fundpay;
TRUNCATE TABLE T_yb_divide_items;
TRUNCATE TABLE T_YB_LSDMXB;
TRUNCATE TABLE T_YB_LSDZB;
TRUNCATE TABLE t_yb_personinfo;
TRUNCATE TABLE t_yb_rxdiagnosisinfo;
TRUNCATE TABLE t_yb_rxdiagnosisinfo_items;

--truncate table t_jhdmxb;
--truncate table t_jhdzb;
--truncate table t_thdmxb;
--truncate table t_thdzb;
--truncate table t_lsrb;
--truncate table t_spcd;
--truncate table t_spgb;
--truncate table t_lshzb;
--truncate table t_sppzwh;
--truncate table t_bczd;
--truncate table t_fdyhmxb;
--truncate table t_fdyhzb;
--truncate table t_fgskc;
--truncate table t_fkjl;
--delete from t_fkjlmxb;
--delete from t_fkjlzb;
--truncate table t_gysghxx;
--truncate table t_gyswlk;
--truncate table t_gysxx;
--truncate table t_jgxx_fd;

DELETE FROM t_zgxx WHERE bh <> '001';
delete from t_usrfunc where zgbh <> '001';

--SELECT * FROM t_dwxx_jyfw

 --增加临时货位,用于铺货
INSERT INTO t_hwxx(hwbh,LSHW, HWMC, HWTP, SXKW, CKSX,FLAG)
VALUES('L0000','***','临时货位',1,0,0,1)


----同步价格信息
INSERT INTO t_jgxx(SPBH, LSJ, PFJ, DBJ, GBJ, ZK, hyj, GXRQ, dslsj)
SELECT SPBH, LSJ, PFJ, DBJ, GBJ, ZK, hyj, GXRQ, dslsj
FROM hj01.hjdb.dbo.T_JGXX
 
---- 同步商品信息
INSERT INTO t_spxx(SPBH, LBBH, SBBZ, XQBJ, TZM, PM, JC, SB, PZWH, GG, JLDWBH, CJBH, YXQX, ZDJL,
       BZ, GXRQ, GXZ, FLAG, YHBZ, JX, GMP, GB, CD, yplb, hxmc, jky, lb, ypztbh,
       jgzt, jfbz, yhlx, IsMHJ, cctj, ypfl, spbm, ybbm, gnzz, sxyxq, pzwhyxq,
       scqyxkzh, jyfwid, slyp, sfth, gjgbbm, MarketBy)
SELECT SPBH, LBBH, SBBZ, XQBJ, TZM, PM, JC, SB, PZWH, GG, JLDWBH, CJBH, YXQX, ZDJL,
       BZ, GXRQ, GXZ, FLAG, YHBZ, JX, GMP, GB, CD, yplb, hxmc, jky, lb, ypztbh,
       jgzt, jfbz, yhlx, IsMHJ, cctj, ypfl, spbm, ybbm, gnzz, sxyxq, pzwhyxq,
       scqyxkzh, jyfwid, slyp, sfth, gjgbbm, MarketBy
FROM hj00.zddb.dbo.t_spxx 

SELECT a.spbh,a.MarketBy,b.marketby
FROM t_spxx a
JOIN hj00.zddb.dbo.t_spxx b ON a.spbh=b.spbh




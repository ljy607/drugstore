----- 第一步 首先需要医保的数据，包括医保流水号等信息，根据医保流水号查询医保分解记录是否存在
SELECT *
FROM T_yb_divide_items tydi
WHERE tydi.tradeno = '062000780A250322300003'

SELECT *   -- update a set a.cbdbz = 2,dzbz = 0   -- update a set a.flag = 1
FROM T_yb_divide a
WHERE a.tradeno = '072000160A250616000016'

-- 第二步 查询零售单是否存在，一般情况会存在主单，缺少明细，将补录的零售单号更新成丢失的零售单号
----- 补录零售单，更改零售单号未医保单号
SELECT a.*  
--update b set b.tradeno = '072000160A250616000016',b.js=a.js,b.djhj=a.djhj,b.hjje=a.hjje,b.ysje=a.ysje,b.fphm=a.fphm
--,b.kpr=a.kpr,b.yxbz=a.yxbz,b.member_code=a.member_code,b.idnumber=a.idnumber,b.CustomerName=a.CustomerName,b.swbz=a.swbz
--,b.cash=0,b.personcountpay=a.ysje,b.fund=0,b.bz = '补丢失的医保数据'
FROM t_lsdzb a
JOIN t_lsdzb b ON 1=1 AND b.lsdbh = '2506160040'
WHERE a.lsdbh = '2506160057'

SELECT *  -- update a set a.bz = '补丢失的医保数据',a.tradeno = '072000160A250616000016',a.personcountpay=361.50,a.cash=0,a.fund=0
FROM t_lsdzb a
WHERE lsdbh = '2507050009'    -- 2502110050

SELECT *   ---  update e set e.lsdbh = '2507050009'
FROM t_lsdmxb e
WHERE lsdbh = '2507050009'

select *  -- DELETE 
FROM t_lsdzb WHERE lsdbh = '2507050012'

---- 新增医保分解主表数据，用于对账，不做明细数据的的分解
INSERT INTO t_yb_divide(tradeno, ic_no, feeno,  tradedate, feeall, fund,
            cash, personcountpay, fee, feein, feeout, payfirst, selfpay2, bigpay,
            bigselfpay, outofbig, bcpay, jcbz, medicine, tmedicine, therb, flag,
            recordtype, dzbz, cbdbz)
VALUES( '072000160A250616000016','10230692300S', '2506160040', '20250616181616', 361.50, 0,
            0, 361.5, 361.5, 0, 361.5, 0, 0, 0,
            0, 0, 0, 0, 0, 361.5, 0, 1,
            0, 0, 1)


-- 补医保分解数据 2025年2月12日 11:16:29
INSERT INTO t_yb_divide(tradeno, ic_no, feeno, curetype, tradedate, feeall, fund,
            cash, personcountpay, fee, feein, feeout, payfirst, selfpay2, bigpay,
            bigselfpay, outofbig, bcpay, jcbz, medicine, tmedicine, therb, flag,
            recordtype, depatradeno, mzpayfirst, mzfee, BasePay, GwybzPay,
            mzbigpay, MzbzPay, OtherPay, PersonCountBalance, PromptMessage,
            SelfPayFlag, FundCode, FundName, FundPay, diagnosis, examine, labexam,
            treatment, operation, material, medicalservice, commonservice,
            registfee, otheropfee, dzbz, dzxx, selfPayFirst, selFeeAll,
            nationtradedate, mzfeein, mzfeeout, cbdbz)
SELECT '072000010A250207300002', ic_no, '2502070027', curetype, tradedate, feeall, fund,
            cash, personcountpay, fee, feein, feeout, payfirst, selfpay2, bigpay,
            bigselfpay, outofbig, bcpay, jcbz, medicine, tmedicine, therb, flag,
            recordtype, depatradeno, mzpayfirst, mzfee, BasePay, GwybzPay,
            mzbigpay, MzbzPay, OtherPay, PersonCountBalance, PromptMessage,
            SelfPayFlag, FundCode, FundName, FundPay, diagnosis, examine, labexam,
            treatment, operation, material, medicalservice, commonservice,
            registfee, otheropfee, 0, dzxx, selfPayFirst, selFeeAll,
            nationtradedate, mzfeein, mzfeeout, cbdbz
FROM T_yb_divide tyd
WHERE tyd.tradeno = '072000010A250207300003'

SELECT *  -- update a set a.dzbz = 0,feeno = '2502070027'
FROM t_yb_divide a WHERE tradeno = '072000010A250207300002'

INSERT INTO T_yb_divide_items(
	tradeno,itemno,recipeno,hiscode,itemcode,itemname,itemtype,unitprice,qty,fee,feein,	feeout,
	selfpay2,[STATE],fee_type,preferentialfee,preferentialscale,approval_number,EX_RECIPE_DETAIL_N)
SELECT '072000010A250207300002',itemno,recipeno,hiscode,itemcode,itemname,itemtype,unitprice,qty,fee,feein,	feeout,
	selfpay2,[STATE],fee_type,preferentialfee,preferentialscale,approval_number,EX_RECIPE_DETAIL_N
FROM T_yb_divide_items tyd
WHERE tyd.tradeno = '072000010A250207300003'

SELECT *
FROM T_yb_divide_items tydi
WHERE tydi.tradeno = '072000160A250616000016'

SELECT *
FROM T_yb_divide tydi
WHERE tydi.tradeno = '072000160A250616000016'

SELECT *
FROM T_yb_divide tyd
WHERE tyd.feeno like '2507050009'
---- 补录零售单，更改零售单号未医保单号
SELECT *  
-- update a set a.member_code = b.member_code,a.tradeno = '072000010A250207300002'
--,a.cash=b.cash,a.personcountpay=b.personcountpay,a.fund=b.fund,a.bz = '补2月7日医保数据'
FROM t_lsdzb a
JOIN t_lsdzb b ON 1=1 AND b.lsdbh = '2502070029'
WHERE a.lsdbh = '2502120012'

SELECT *  -- update a set a.bz = '补2月11日医保数据',a.tradeno = '072000160A250211000015',a.fund=0,a.personcountpay=42
FROM t_lsdzb a
WHERE lsdbh = '2502120011'    -- 2502110050


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
WHERE tydi.tradeno = '072000010A250207300002'


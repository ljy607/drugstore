ALTER TABLE t_jhdzb 
ADD zpflag TINYINT

ALTER TABLE t_ckdzb 
ADD zpflag TINYINT

------2016.6.18
--增加进货明细表复核标志，1复核通过 0复核未通过 null 未复核
ALTER TABLE t_jhdmxb 
ADD fhflag TINYINT

---增加进货单入库功能，单独列出
INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
            fdbz, parameter)
VALUES('03','保管员确认入库',1,0,'保管员确认入库','image\tom_wap.gif','w_jhdrk',1,1,1,0)

----2016.06.27----------------------
--总店进货单增加到货时间，默认当天
ALTER TABLE t_jhdzb 
ADD dhrq DATETIME NULL





--SELECT SUBSTRING(tt.BZ,Len(tt.bz),1),SUBSTRING(tt.BZ,1,Len(tt.bz)-1),tt.FLAG
----UPDATE tt 
----SET tt.FLAG=SUBSTRING(tt.BZ,Len(tt.bz),1),tt.bz = SUBSTRING(tt.BZ,1,Len(tt.bz)-1)
--FROM T_TKDZB tt
--WHERE tt.FLAG > 200

--SELECT SUBSTRING(tt.BZ,Len(tt.bz),1),SUBSTRING(tt.BZ,1,Len(tt.bz)-1)
--UPDATE tt 
--SET tt.YXBZ=SUBSTRING(tt.BZ,Len(tt.bz),1),bz=SUBSTRING(tt.BZ,1,Len(tt.bz)-1)
--FROM T_THDZB tt
--WHERE tt.YXBZ > 200

--SELECT SUBSTRING(tt.BZ,Len(tt.bz),1),SUBSTRING(tt.BZ,1,Len(tt.bz)-1)
--UPDATE tt 
--SET tt.YXBZ=SUBSTRING(tt.BZ,Len(tt.bz),1),bz=SUBSTRING(tt.BZ,1,Len(tt.bz)-1)
--FROM T_BSDZB tt
--WHERE tt.YXBZ = 254

--SELECT * --SUBSTRING(tt.BZ,Len(tt.bz),1),SUBSTRING(tt.BZ,1,Len(tt.bz)-1)
--UPDATE tt 
--SET tt.YXBZ=1
--FROM T_BSDZB tt
--WHERE tt.YXBZ = 255

--SELECT *
--FROM T_bjdZB tc
--WHERE tc.jsbz >200


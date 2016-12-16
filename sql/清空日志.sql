use master 
go
backup  log  hjdb  with  no_log
go
DBCC  SHRINKdatabase  (hjdb)
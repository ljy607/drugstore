
DROP TABLE T_BankAccount
go
--银行帐号信息
CREATE TABLE T_BankAccount
(
	ID INT IDENTITY(1,1) NOT NULL,
	BankAccountNo NVARCHAR(32) NOT NULL,
	BankAccountName NVARCHAR(32) NOT NULL,
	BankAccountDesc NVARCHAR(64) NULL,
	BankName NVARCHAR(16) NOT NULL,
	RecordStatus TINYINT DEFAULT 0,	-- 0正常 1删除
	PRIMARY KEY(ID)
)

DROP TABLE T_BankAccountData
GO
CREATE TABLE T_BankAccountData
(
	id INT IDENTITY(1,1) NOT NULL,
	BankAccountNo NVARCHAR(32) NOT NULL,
	BusinessDate VARCHAR(8) NOT NULL,
	Addr	NVARCHAR(64) NULL,
	Mode	NVARCHAR(64) NULL,
	Amount	DECIMAL(18,2) DEFAULT 0 NULL,
	Balance DECIMAL(18,2) DEFAULT 0 NULL,
	PRIMARY KEY(id)	
)
DROP TABLE T_BankTemp
GO
CREATE TABLE T_BankTemp
(
	f1 NVARCHAR(32) NULL,
	f2 NVARCHAR(32) NULL,
	f3 NVARCHAR(32) NULL,
	f4 NVARCHAR(32) NULL,
	f5 NVARCHAR(32) NULL,
	f6 NVARCHAR(32) NULL,
	f7 NVARCHAR(32) NULL,
	f8 NVARCHAR(32) NULL,
	f9 NVARCHAR(32) NULL,
	f10 NVARCHAR(32) NULL,
	f11 NVARCHAR(32) NULL,
	f12 NVARCHAR(32) NULL,
	f13 NVARCHAR(32) NULL,
	f14 NVARCHAR(32) NULL,
	f15 NVARCHAR(32) NULL,
)

INSERT INTO T_BankAccount(BankAccountNo,BankAccountName,BankAccountDesc,BankName)
VALUES('6221386102068115538','小屯','小屯销售款账户','农商银行')

INSERT INTO T_BankAccount(BankAccountNo,BankAccountName,BankAccountDesc,BankName)
VALUES('6221386102104849942','益德堂','益德堂销售款账户','农商银行')

INSERT INTO T_BankAccount(BankAccountNo,BankAccountName,BankAccountDesc,BankName)
VALUES('6210981000019033218','广安门','广安门销售款账户','邮政银行')

INSERT INTO T_BankAccount(BankAccountNo,BankAccountName,BankAccountDesc,BankName)
VALUES('6227000010340170366','二店','二店销售款账户','建设银行')

INSERT INTO T_BankAccount(BankAccountNo,BankAccountName,BankAccountDesc,BankName)
VALUES('6227000010340170358','三店','三店销售款账户','建设银行')

INSERT INTO T_BankAccount(BankAccountNo,BankAccountName,BankAccountDesc,BankName)
VALUES('6227000010340170374','康宁','康宁销售款账户','建设银行')

INSERT INTO T_BankAccount(BankAccountNo,BankAccountName,BankAccountDesc,BankName)
VALUES('6221386102104978865','弘济','弘济销售款账户','农商银行')


GO






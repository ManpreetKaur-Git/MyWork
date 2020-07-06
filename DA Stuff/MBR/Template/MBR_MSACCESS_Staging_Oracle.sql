--============================================================
--   DI Module Name: MBR
--   Template_MBR 	(rmA16.4 and above)
--   DESCRIPTION: Structure Definition Script for
--		LINEITEMS,
--		HEADER
--   Script Date: 07/25/2011 14:54:43
--	 Author		: VSONI5
--==============================================================


--==============================================================
declare 
isRmdb number;
iExists NUMBER;
begin
select count(*) into isRmdb from user_tables where table_name='SYS_PARMS';
if isRmdb > 0 then
dbms_output.put_line('Error: Script Execution Aborted - Script trying to execute on RISKMASTER database not on DA Access Staging database. Please open the correct Access Staging database and execute this script.');
else

BEGIN

--==============================================================

--------------------------------------------------
--/****** Object 1:  Table HEADER
-- Drop the table if exists already

BEGIN
SELECT COUNT(*) INTO iExists FROM USER_OBJECTS WHERE OBJECT_TYPE='TABLE' AND OBJECT_NAME='HEADER';
IF iExists = 1 THEN
EXECUTE IMMEDIATE
 'DROP TABLE HEADER';
END IF;
END;

--==============================================================

--/****** Object 2:  Table LINEITEMS
-- Drop the table if exists already

BEGIN
SELECT COUNT(*) INTO iExists FROM USER_OBJECTS WHERE OBJECT_TYPE='TABLE' AND OBJECT_NAME='LINEITEMS';
IF iExists = 1 THEN
EXECUTE IMMEDIATE
 'DROP TABLE LINEITEMS';
END IF;
END;


--==============================================================

-- /******Create the Staging Tables
--------------------------------------------------
--/****** Object 1:  Table HEADER

BEGIN
SELECT COUNT(*) INTO iExists FROM USER_OBJECTS WHERE OBJECT_TYPE='TABLE' AND OBJECT_NAME='HEADER';
IF iExists = 0 THEN

EXECUTE IMMEDIATE
'CREATE TABLE HEADER(
	OPTIONSET_ID number NOT NULL,
	PAY_OR_COLLECTION varchar(1) NULL,
	CLAIM_NUMBER varchar(25) NOT NULL,
	BILL_DOCUMENT_NUMBER varchar(25) NOT NULL,
	ACCOUNT_NAME varchar(100) NULL,
	PT_PROV_LAST_NAME varchar(255) NULL,
	PT_PROV_FIRST_NAME varchar(255) NULL,
	PT_PROV_MI varchar(1) NULL,
	PT_PROV_ADDRESS1 varchar(50) NULL,
	PT_PROV_ADDRESS2 varchar(50) NULL,
	PT_PROV_CITY varchar(25) NULL,
	PT_PROV_STATE varchar(2) NULL,
	PT_PROV_ZIPCODE varchar(14) NULL,
	PT_PROV_TAX_ID varchar(9) NULL,
	TOTAL_BILLED decimal(10, 2) NULL,
	TOTAL_PAID decimal(10, 2) NULL,
	DATE_BILLS_PAID varchar(8) NULL,
	PATIENT_LAST_NAME varchar(255) NULL,
	PATIENT_FIRST_NAME varchar(255) NULL,
	PATIENT_MI varchar(1) NULL,
	PATIENT_SUFFIX varchar(10) NULL,
	PATIENT_SSN varchar(9) NULL,
	BAD_FLAG number NULL,
	BAD_REASON varchar(50) NULL,
	CHECK_NUMBER varchar(10) NULL,
	CHECK_DATE varchar(8) NULL,
	TOT_SCHEDULED_AMT decimal(10, 2) NULL,
	TOT_REDUCTION_AMT decimal(10, 2) NULL,
	PATIENT_ACCT_NO varchar(14) NULL,
	PROV_INVOICE_NUMBER varchar(25) NULL,
	DATE_BILL_RECEIVED varchar(8) NULL,
	DATE_BILL_RECEIVED_BY_MBR_CO varchar(8) NULL,
	PPO_REDUCTION decimal(10, 2) NULL,
	OTHER_REDUCTION decimal(10, 2) NULL,
	OTHER_VENDOR_DOC_NUM varchar(25) NULL,
	PT_PROV_SUFFIX varchar(25) NULL,
	NPI_NUMBER varchar(10) NULL,
  	PT_PROV_PREFIX varchar(25) NULL,
	MEMO_PHRASE varchar (25) NULL
	)';
END IF;
END;
--------------------------------------------------

--/****** Object 2:  Table LINEITEMS

BEGIN
SELECT COUNT(*) INTO iExists FROM USER_OBJECTS WHERE OBJECT_TYPE='TABLE' AND OBJECT_NAME='LINEITEMS';
IF iExists = 0 THEN

EXECUTE IMMEDIATE
'CREATE TABLE LINEITEMS(
	OPTIONSET_ID number NULL,
	LI_LINE_NUMBER number NOT NULL,
	BILL_DOCUMENT_NUMBER varchar(25) NOT NULL,
	LINE_ITEM_CPT varchar(10) NULL,
	CPT_DESCRIPTION varchar(100) NULL,
	LI_PLACE_OF_SER_CODE varchar(25) NULL,
	LI_TYPE_OF_SER_CODE varchar(25) NULL,
	LI_CHARGES decimal(10, 2) NULL,
	LI_PAID decimal(10, 2) NULL,
	LI_UNITS number NULL,
	LI_BEGIN_DATE varchar(8) NULL,
	LI_END_DATE varchar(8) NULL,
	TRANS_TYPE_CODE varchar(25) NULL,
	SUFFIX varchar(14) NULL,
	SCHEDULED_AMT decimal(10, 2) NULL,
	REDUCTION_AMT decimal(10, 2) NULL,
	REASON varchar(80) NULL,
	PROV_INVOICE_NUMBER varchar(25) NULL,
	PPO_REDUCTION decimal(10, 2) NULL,
	OTHER_REDUCTION decimal(10, 2) NULL,
	NETWORK_SERVICE_CODE varchar(1) NULL,
	PAID_PROC_CODE_MOD varchar(8) NULL,
	PRIM_ICD9_DIAG_CODE varchar(14) NULL,
	SEC_ICD9_DIAG_CODE varchar(14) NULL,
	PROV_TYPE_CODE varchar(20) NULL,
	PRIM_ICD10_DIAG_CODE varchar(14) NULL,	--MITS 33392 - ICD 10 Requirement
	SEC_ICD10_DIAG_CODE varchar(14) NULL,	--MITS 33392 - ICD 10 Requirement
  	POLICY_NAME varchar(20) NULL,
	UNIT_TYPE varchar (6) NULL,
	UNIT_NUMBER varchar (25) NULL, 
	COVERAGE_CODE varchar (25) NULL,
  	COVERAGE_TEXT varchar (100) NULL,
	CVG_SEQUENCE_NO varchar (8) NULL,
	TRANS_SEQ_NO varchar (8) NULL,
	LOSS_CODE varchar (25) NULL,
	DIS_CAT_CODE varchar (25) NULL,
	DIS_LOSS_CODE varchar (25) NULL,
	RESERVE_SUB_TYPE varchar(25) NULL
)';
END IF;
END;

-------------------------------------------------
END;
END IF;
END;
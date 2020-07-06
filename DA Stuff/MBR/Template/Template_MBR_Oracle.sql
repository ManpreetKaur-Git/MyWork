-- ============================================================
--   SCRIPT HEADER (DATABASE STRUCTURE)
--   Database Type: Oracle
--   DI Module Name: MBR
--   Template_MBR (rmA16.4 and above)
--   DESCRIPTION: Structure Definition Script for
--   Table:	T_MBR_XML_SETTING,
--		T_MBR_LINEITEMS_TEMP,
--		T_MBR_LINEITEMS,
--		T_MBR_HEADER_TEMP,
--		T_MBR_HEADER_CORVEL,
--		T_MBR_HEADER
--		T_MBR_ENTITY_SUFF
--		T_MBR_EXTR
--		ERROR_LOG
--   DATE:	17/24/2119 
--    Vsoni5 :10/29/2010 : MITS 22447,21335. : Added T_MBR_EXTR table.  
--    vgupta20 06/08/2011:[DA_ROW_ID],[INPUT_ROW_ID],[INVALID_ROW],[UPDATE_ROW]  columns added to all tables. Error log table modified to match DA2 -- Error --  Log table.
--    mpandey24 01/03/2012:MITS 27508 :Table ENTITY_X_ADDRESSES Added.
--    mpandey24 07/15/2013: MITS 33029 : Table ACTIVITY_TRACK Added
--    mpandey24 12/30/2013: MITS 33392 : Table INVDETAIL_X_DIAG_ICD10 Added

-- aramkumarsha (09 June 2017): Added tales for Rollback Functionality:
--=======================
--		RM_ACTIVITY_TRACK
--		RM_FUNDS
--		RM_FUNDS_SUPP
--		RM_FUNDS_TRANS_SPLIT
--		RM_FUNDS_X_PAYEE
--		RM_INVDETAIL_X_DIAG
--		RM_INVDETAIL_X_DIAG_ICD10
--		RM_INVDETAIL_X_EOB
--		RM_INVDETAIL_X_MOD
--		RM_INVOICE
--		RM_INVOICE_DETAIL
--========================

-- aramkumarsha (10 SEP 2019): BCF Issue: JIRA-68270
--=======================
--		T_MBR_FILTER_RC0
--		T_MBR_FILTER_RC
--========================
-- ============================================================= 

DECLARE
isRmdb NUMBER;
iExists NUMBER;
BEGIN
SELECT count(*) INTO isRmdb FROM user_tables WHERE table_name='SYS_PARMS';
IF isRmdb > 0 THEN
dbms_output.put_line('Error: Script Execution Aborted - Script trying to execute on RISKMASTER database not on DA Staging database. Please open the correct Staging database and execute this script.');
ELSE
BEGIN

-- /******Drop the Staging Tables
--------------------------------------------------
--/****** Object:  Table T_MBR_ADJLOGDATA
-- Drop the table if exists already

BEGIN
SELECT COUNT(*) INTO iExists FROM USER_OBJECTS WHERE OBJECT_TYPE='TABLE' AND OBJECT_NAME='T_MBR_ADJLOGDATA';
IF iExists = 1 THEN
EXECUTE IMMEDIATE
 'DROP TABLE T_MBR_ADJLOGDATA';
END IF;
END;

--------------------------------------------------
--/****** Object 1:  Table T_MBR_XML_SETTING
-- Drop the table if exists already

BEGIN
SELECT COUNT(*) INTO iExists FROM USER_OBJECTS WHERE OBJECT_TYPE='TABLE' AND OBJECT_NAME='T_MBR_XML_SETTING';
IF iExists = 1 THEN
EXECUTE IMMEDIATE
 'DROP TABLE T_MBR_XML_SETTING';
END IF;
END;

----------------------------------------------
--/****** Object 2:  Table ENTITY
-- Drop the table if exists already

BEGIN
SELECT COUNT(*) INTO iExists FROM USER_OBJECTS WHERE OBJECT_TYPE='TABLE' AND OBJECT_NAME='ENTITY';
IF iExists = 1 THEN
EXECUTE IMMEDIATE
 'DROP TABLE ENTITY';
END IF;
END;

-------------------------------------------------------
--/****** Object 3:  Table T_MBR_LINEITEMS
-- Drop the table if exists already

BEGIN
SELECT COUNT(*) INTO iExists FROM USER_OBJECTS WHERE OBJECT_TYPE='TABLE' AND OBJECT_NAME='T_MBR_LINEITEMS';
IF iExists = 1 THEN
EXECUTE IMMEDIATE
 'DROP TABLE T_MBR_LINEITEMS';
END IF;
END;

----------------------------------------------
--/****** Object 4:  Table INVOICE_DETAIL
-- Drop the table if exists already

BEGIN
SELECT COUNT(*) INTO iExists FROM USER_OBJECTS WHERE OBJECT_TYPE='TABLE' AND OBJECT_NAME='INVOICE_DETAIL';
IF iExists = 1 THEN
EXECUTE IMMEDIATE
 'DROP TABLE INVOICE_DETAIL';
END IF;
END;

-----------------------------------------------------
--/****** Object 5:  T_MBR_HEADER_CORVEL
-- Drop the table if exists already

BEGIN
SELECT COUNT(*) INTO iExists FROM USER_OBJECTS WHERE OBJECT_TYPE='TABLE' AND OBJECT_NAME='T_MBR_HEADER_CORVEL';
IF iExists = 1 THEN
EXECUTE IMMEDIATE
 'DROP TABLE T_MBR_HEADER_CORVEL';
END IF;
END;
-----------------------------------------------------
--/****** Object 6:  Table T_MBR_HEADER
-- Drop the table if exists already

BEGIN
SELECT COUNT(*) INTO iExists FROM USER_OBJECTS WHERE OBJECT_TYPE='TABLE' AND OBJECT_NAME='T_MBR_HEADER';
IF iExists = 1 THEN
EXECUTE IMMEDIATE
 'DROP TABLE T_MBR_HEADER';
END IF;
END;

-----------------------------------------------------
--/****** Object 7:  Table T_MBR_ENTITY_SUFF
-- Drop the table if exists already

BEGIN
SELECT COUNT(*) INTO iExists FROM USER_OBJECTS WHERE OBJECT_TYPE='TABLE' AND OBJECT_NAME='T_MBR_ENTITY_SUFF';
IF iExists = 1 THEN
EXECUTE IMMEDIATE
'DROP TABLE T_MBR_ENTITY_SUFF';
END IF;
END;

-----------------------------------------------------
--/****** Object 8:  Table T_MBR_EXTR
-- Drop the table if exists already

BEGIN
SELECT COUNT(*) INTO iExists FROM USER_OBJECTS WHERE OBJECT_TYPE='TABLE' AND OBJECT_NAME='T_MBR_EXTR';
IF iExists = 1 THEN
EXECUTE IMMEDIATE
 'DROP TABLE T_MBR_EXTR';
END IF;
END;

-----------------------------------------------------
--/****** Object 9:  Table ERROR_LOG
-- Drop the table if exists already

BEGIN
SELECT COUNT(*) INTO iExists FROM USER_OBJECTS WHERE OBJECT_TYPE='TABLE' AND OBJECT_NAME='ERROR_LOG';
IF iExists = 1 THEN
EXECUTE IMMEDIATE
 'DROP TABLE ERROR_LOG';
END IF;
END;
-----------------------------------------------------
--/****** Object 10:  Table ENTITY_SUPP
-- Drop the table if exists already

BEGIN
SELECT COUNT(*) INTO iExists FROM USER_OBJECTS WHERE OBJECT_TYPE='TABLE' AND OBJECT_NAME='ENTITY_SUPP';
IF iExists = 1 THEN
EXECUTE IMMEDIATE
 'DROP TABLE ENTITY_SUPP';
END IF;
END;
-----------------------------------------------------
--/****** Object 11:  Table FUNDS_SUPP
-- Drop the table if exists already

BEGIN
SELECT COUNT(*) INTO iExists FROM USER_OBJECTS WHERE OBJECT_TYPE='TABLE' AND OBJECT_NAME='FUNDS_SUPP';
IF iExists = 1 THEN
EXECUTE IMMEDIATE
 'DROP TABLE FUNDS_SUPP';
END IF;
END;
-----------------------------------------------------
--/****** Object 12:  Table FUNDS
-- Drop the table if exists already

BEGIN
SELECT COUNT(*) INTO iExists FROM USER_OBJECTS WHERE OBJECT_TYPE='TABLE' AND OBJECT_NAME='FUNDS';
IF iExists = 1 THEN
EXECUTE IMMEDIATE
 'DROP TABLE FUNDS';
END IF;
END;
--------------------------------------------------
--/****** Object 13:  Table FUNDS_TRANS_SPLIT
-- Drop the table if exists already

BEGIN
SELECT COUNT(*) INTO iExists FROM USER_OBJECTS WHERE OBJECT_TYPE='TABLE' AND OBJECT_NAME='FUNDS_TRANS_SPLIT';
IF iExists = 1 THEN
EXECUTE IMMEDIATE
 'DROP TABLE FUNDS_TRANS_SPLIT';
END IF;
END;

--------------------------------------------------
--/****** Object 14:  Table RESERVE_CURRENT
-- Drop the table if exists already

BEGIN
SELECT COUNT(*) INTO iExists FROM USER_OBJECTS WHERE OBJECT_TYPE='TABLE' AND OBJECT_NAME='RESERVE_CURRENT';
IF iExists = 1 THEN
EXECUTE IMMEDIATE
 'DROP TABLE RESERVE_CURRENT';
END IF;
END;

----------------------------------------------
----------------------------------------------
--/****** Object 15:  Table INVOICE
-- Drop the table if exists already

BEGIN
SELECT COUNT(*) INTO iExists FROM USER_OBJECTS WHERE OBJECT_TYPE='TABLE' AND OBJECT_NAME='INVOICE';
IF iExists = 1 THEN
EXECUTE IMMEDIATE
 'DROP TABLE INVOICE';
END IF;
END;

----------------------------------------------
--/****** Object 16:  Table RESERVE_HISTORY
-- Drop the table if exists already

BEGIN
SELECT COUNT(*) INTO iExists FROM USER_OBJECTS WHERE OBJECT_TYPE='TABLE' AND OBJECT_NAME='RESERVE_HISTORY';
IF iExists = 1 THEN
EXECUTE IMMEDIATE
 'DROP TABLE RESERVE_HISTORY';
END IF;
END;

----------------------------------------------
--/****** Object 17:  Table INVDETAIL_X_DIAG
-- Drop the table if exists already

BEGIN
SELECT COUNT(*) INTO iExists FROM USER_OBJECTS WHERE OBJECT_TYPE='TABLE' AND OBJECT_NAME='INVDETAIL_X_DIAG';
IF iExists = 1 THEN
EXECUTE IMMEDIATE
 'DROP TABLE INVDETAIL_X_DIAG';
END IF;
END;

----------------------------------------------
--/****** Object 18:  Table INVDETAIL_X_MOD
-- Drop the table if exists already

BEGIN
SELECT COUNT(*) INTO iExists FROM USER_OBJECTS WHERE OBJECT_TYPE='TABLE' AND OBJECT_NAME='INVDETAIL_X_MOD';
IF iExists = 1 THEN
EXECUTE IMMEDIATE
 'DROP TABLE INVDETAIL_X_MOD';
END IF;
END;

----------------------------------------------
--/****** Object 19:  Table INVDETAIL_X_EOB
-- Drop the table if exists already

BEGIN
SELECT COUNT(*) INTO iExists FROM USER_OBJECTS WHERE OBJECT_TYPE='TABLE' AND OBJECT_NAME='INVDETAIL_X_EOB';
IF iExists = 1 THEN
EXECUTE IMMEDIATE
 'DROP TABLE INVDETAIL_X_EOB';
END IF;
END;

----------------------------------------------
--/****** Object 20:  Table CODES
-- Drop the table if exists already

BEGIN
SELECT COUNT(*) INTO iExists FROM USER_OBJECTS WHERE OBJECT_TYPE='TABLE' AND OBJECT_NAME='CODES';
IF iExists = 1 THEN
EXECUTE IMMEDIATE
 'DROP TABLE CODES';
END IF;
END;

----------------------------------------------
--/****** Object 21:  Table CODES_TEXT
-- Drop the table if exists already

BEGIN
SELECT COUNT(*) INTO iExists FROM USER_OBJECTS WHERE OBJECT_TYPE='TABLE' AND OBJECT_NAME='CODES_TEXT';
IF iExists = 1 THEN
EXECUTE IMMEDIATE
 'DROP TABLE CODES_TEXT';
END IF;
END;

----------------------------------------------
--/****** Object 22:  Table UNIQUE_CODE
-- Drop the table if exists already

BEGIN
SELECT COUNT(*) INTO iExists FROM USER_OBJECTS WHERE OBJECT_TYPE='TABLE' AND OBJECT_NAME='UNIQUE_CODE';
IF iExists = 1 THEN
EXECUTE IMMEDIATE
 'DROP TABLE UNIQUE_CODE';
END IF;
END;
----------------------------------------------

----------------------------------------------
--/****** Object 23:  Table T_MBR_DOC_ATTACHMENT
-- Drop the table if exists already

BEGIN
SELECT COUNT(*) INTO iExists FROM USER_OBJECTS WHERE OBJECT_TYPE='TABLE' AND OBJECT_NAME='T_MBR_DOC_ATTACHMENT';
IF iExists = 1 THEN
EXECUTE IMMEDIATE
 'DROP TABLE T_MBR_DOC_ATTACHMENT';
END IF;
END;
----------------------------------------------


----------------------------------------------
--/****** Object 24:  Table T_MBR_PROCESS_LOG
-- Drop the table if exists already

BEGIN
SELECT COUNT(*) INTO iExists FROM USER_OBJECTS WHERE OBJECT_TYPE='TABLE' AND OBJECT_NAME='T_MBR_PROCESS_LOG';
IF iExists = 1 THEN
EXECUTE IMMEDIATE
 'DROP TABLE T_MBR_PROCESS_LOG';
END IF;
END;
----------------------------------------------

----------------------------------------------
--/****** Object 25:  Table T_MBR_DOC_ATTACH_VALID
-- Drop the table if exists already

BEGIN
SELECT COUNT(*) INTO iExists FROM USER_OBJECTS WHERE OBJECT_TYPE='TABLE' AND OBJECT_NAME='T_MBR_DOC_ATTACH_VALID';
IF iExists = 1 THEN
EXECUTE IMMEDIATE
 'DROP TABLE T_MBR_DOC_ATTACH_VALID';
END IF;
END;
--------------------------------------------
----------------------------------------------
--/****** Object 26:  Table ENTITY_X_ADDRESSES
-- Drop the table if exists already

BEGIN
SELECT COUNT(*) INTO iExists FROM USER_OBJECTS WHERE OBJECT_TYPE='TABLE' AND OBJECT_NAME='ENTITY_X_ADDRESSES';
IF iExists = 1 THEN
EXECUTE IMMEDIATE
 'DROP TABLE ENTITY_X_ADDRESSES';
END IF;
END;
--------------------------------------------
----------------------------------------------
--/****** Object 27:  Table FUNDS_X_PAYEE
-- Drop the table if exists already

BEGIN
SELECT COUNT(*) INTO iExists FROM USER_OBJECTS WHERE OBJECT_TYPE='TABLE' AND OBJECT_NAME='FUNDS_X_PAYEE';
IF iExists = 1 THEN
EXECUTE IMMEDIATE
 'DROP TABLE FUNDS_X_PAYEE';
END IF;
END;
--------------------------------------------

----------------------------------------------
--/****** Object 28:  Table T_MBR_POLICY
-- Drop the table if exists already

BEGIN
SELECT COUNT(*) INTO iExists FROM USER_OBJECTS WHERE OBJECT_TYPE='TABLE' AND OBJECT_NAME='T_MBR_POLICY';
IF iExists = 1 THEN
EXECUTE IMMEDIATE
 'DROP TABLE T_MBR_POLICY';
END IF;
END;
--------------------------------------------
--/****** Object 29:  Table T_MBR_RES_BALANCE
-- Drop the table if exists already

BEGIN
SELECT COUNT(*) INTO iExists FROM USER_OBJECTS WHERE OBJECT_TYPE='TABLE' AND OBJECT_NAME='T_MBR_RES_BALANCE';
IF iExists = 1 THEN
EXECUTE IMMEDIATE
 'DROP TABLE T_MBR_RES_BALANCE';
END IF;
END;

--/****** Object 30:  Table ACTIVITY_TRACK
-- Drop the table if exists already

BEGIN
SELECT COUNT(*) INTO iExists FROM USER_OBJECTS WHERE OBJECT_TYPE='TABLE' AND OBJECT_NAME='ACTIVITY_TRACK';
IF iExists = 1 THEN
EXECUTE IMMEDIATE
 'DROP TABLE ACTIVITY_TRACK';
END IF;
END;

--/****** Object 31:  Table INVDETAIL_X_DIAG_ICD10
-- Drop the table if exists already
BEGIN
SELECT COUNT(*) INTO iExists FROM USER_OBJECTS WHERE OBJECT_TYPE='TABLE' AND OBJECT_NAME='INVDETAIL_X_DIAG_ICD10';
IF iExists = 1 THEN
EXECUTE IMMEDIATE
 'DROP TABLE INVDETAIL_X_DIAG_ICD10';
END IF;
END;

--/****** Object 32:  Table ENTITY_X_ROLES
-- Drop the table if exists already

BEGIN
SELECT COUNT(*) INTO iExists FROM USER_OBJECTS WHERE OBJECT_TYPE='TABLE' AND OBJECT_NAME='ENTITY_X_ROLES';
IF iExists = 1 THEN
EXECUTE IMMEDIATE
 'DROP TABLE ENTITY_X_ROLES';
END IF;
END;

--/****** Object 33:  Table ADDRESS
-- Drop the table if exists already

BEGIN
SELECT COUNT(*) INTO iExists FROM USER_OBJECTS WHERE OBJECT_TYPE='TABLE' AND OBJECT_NAME='ADDRESS';
IF iExists = 1 THEN
EXECUTE IMMEDIATE
 'DROP TABLE ADDRESS';
END IF;
END;


-- /******Create the Staging Tables
--------------------------------------------------
--/****** Object:  Table T_MBR_ADJLOGDATA

BEGIN
  SELECT COUNT(*) INTO iExists FROM USER_OBJECTS WHERE OBJECT_TYPE='TABLE' AND OBJECT_NAME='T_MBR_ADJLOGDATA';
  IF iExists = 0 THEN
  EXECUTE IMMEDIATE
  'CREATE TABLE T_MBR_ADJLOGDATA(
    DA_ROW_ID number NOT NULL,
    JOBID number NOT NULL,
    LOGIN_NAME  varchar2(50) NULL,
    ADJUSTER_EID number NULL,
    RM_USER_ID number NOT NULL,
    ADJ_ROW_ID number NULL,
    CLAIM_ID number NOT NULL,
    CLAIM_NUMBER  varchar2(30) NULL,
    SCHEDULE_USER_LOGIN  varchar2(50) NULL,
    FILE_TYPE number NOT NULL,
    CLAIMANT_EID number NOT NULL
  )';
  EXECUTE IMMEDIATE
  'ALTER TABLE T_MBR_ADJLOGDATA ADD CONSTRAINT PK_T_MBR_ADJLOGDATA PRIMARY KEY (JOBID,DA_ROW_ID ,FILE_TYPE,RM_USER_ID,CLAIM_ID)';
  END IF;
  END;

--------------------------------------------------
--/****** Object 1:  Table T_MBR_XML_SETTING

BEGIN
EXECUTE IMMEDIATE
'CREATE TABLE T_MBR_XML_SETTING(
	JOBID number NULL,
	DA_ROW_ID number NULL,
	INPUT_ROW_ID number NULL,
	INVALID_ROW number NULL,
	UPDATE_ROW number NULL,
	JurisdictionStates1 varchar(1024),
	JurisdictionStates2 varchar(1024),
	ClearGrid number NULL,
	BillDocumentNumberCheck number NULL,
	ImportPrintedChecks number NULL,
	AppendLog number NULL,
	MBRPaymentsPrinted number NULL,
	MBRPayments2Printed number NULL,
	GenerateExceptionFile number NULL,
	ProcessClosedClaims number NULL,
	CorvelFeeTransType number NULL,
	CorvelFeeTransType2 number NULL,
	PostDateType1 varchar(1024),
	PostDateType2 varchar(1024),
	EnclFlag number NULL,
	SearchbySSN number NULL,
	GetfirstPayee number NULL,
	DoNotAddPayee number NULL,
	FilterFrozenClaims number NULL,
	UseSuffixCode number NULL,
	CheckInsuffRes number NULL,
	CheckImportReason number NULL,
	CheckImportProviderInvNum number NULL,
	UseImportPayeeInfo number NULL,
	UsePayeeZipLookup number NULL,
	DuplicatesInclVoids number NULL,
	DuplicatesUseSvcDts number NULL,
	ImportDOCPath varchar(1024),
	CorvelFeeIdentifier varchar(1024),
	CorvelFeeIdentifier2 varchar(1024),
	FileType varchar(1024),
	PipeFileName varchar(1024),
	SourceFile varchar(1024),
	UseProcessLog number NULL,
	ExcludeInvoice number NULL,
	PrintProcessLog number NULL,
	QueuedPayments number NULL,
	ExportDateOnUI varchar(1024),
	Execution_Mode varchar(1024),
	ExportType varchar(1024),
	UpdateSuffix number NULL,
	UpdAllSuffixes number NULL,
    ImportMedFields number NULL,
    EntityTableIds varchar(2049),	
	UseFeePayment number NULL,
	IncludeSuffix number NULL,
	RemoveSSN number NULL,
	OrgHier_To_Export varchar(1024),
	Entity_Category varchar(1024),	
	LOBCodes varchar(1024),
 	ExportDateOnUIForEntity varchar (25),
	ServiceCode varchar(1024),
	ClaimStatus varchar (1024),
	ClaimAjusterEx varchar(1024),
	DistributionTypeCode number NULL
	)';


EXECUTE IMMEDIATE
'ALTER TABLE T_MBR_XML_SETTING ADD CONSTRAINT PK_T_MBR_XML_SETTING PRIMARY KEY (JOBID)';

END;

----------------------------------------------
--/****** Object 2:  Table T_MBR_LINEITEMS

BEGIN
EXECUTE IMMEDIATE
'CREATE TABLE T_MBR_LINEITEMS(
	DA_ROW_ID number NULL,
	INPUT_ROW_ID number NULL,
	INVALID_ROW number NULL,
	UPDATE_ROW number NULL,
	LI_LINE_NUMBER number NULL,
	BILL_DOCUMENT_NUMBER varchar(25),
	LINE_ITEM_CPT varchar(10),
	CPT_DESCRIPTION varchar(100),
	LI_PLACE_OF_SER_CODE varchar(6),
	LI_TYPE_OF_SER_CODE varchar(6),
	LI_CHARGES decimal(19, 4) NULL,
	LI_PAID decimal(19, 4) NULL,
	LI_UNITS number NULL,
	LI_BEGIN_DATE varchar(16),
	LI_END_DATE varchar(16),
	TRANS_TYPE_CODE varchar(25),
	SUFFIX varchar(14),
	GOOD_RCD number NULL,
	INVOICE_DET_ID number NULL,
	INVOICE_ID number NULL,
	TRANS_ID number NULL,
	TTC number NULL,
	POS number NULL,
	TOS number NULL,
	SPLIT_ID number NULL,
	SCHEDULE_AMT float NULL,
	REDUCTION_AMT float NULL,
	REASON varchar(80),
	PROV_INVOICE_NUMBER varchar(25),
	PPO_REDUCTION_AMT float NULL,
	OTH_REDUCTION_AMT float NULL,
	JOBID number NULL,
	NETWORK_SERVICE_CODE varchar(1),
	PAID_PROC_CODE_MOD varchar(8),
	PRIM_ICD9_DIAG_CODE varchar(14),
	SEC_ICD9_DIAG_CODE varchar(14),
 	UNIT_ID number NULL,
	PROV_TYPE_CODE varchar(20),
	PRIM_ICD10_DIAG_CODE varchar(14) NULL,		--MITS 33392 - ICD 10 Requiremnt
	SEC_ICD10_DIAG_CODE varchar(14) NULL,		--MITS 33392 - ICD 10 Requiremnt
	PRIM_ICD9_CODE_ID number NULL,				--MITS 33392 - ICD 10 Requiremnt
	SEC_ICD9_CODE_ID number NULL,				--MITS 33392 - ICD 10 Requiremnt
	PRIM_ICD10_CODE_ID number NULL,				--MITS 33392 - ICD 10 Requiremnt
	SEC_ICD10_CODE_ID number NULL,				--MITS 33392 - ICD 10 Requiremnt
  	POLCVG_ROW_ID number NULL,                  --MITS 31409 - MBR Finnacial enhancement
 	CVG_LOSS_ROW_ID number NULL,                --MITS 31409 - MBR Finnacial enhancement
	POLICY_NAME varchar(20) NULL,
	POLICY_ID number NULL,
	UNIT_TYPE varchar (6) NULL,
	UNIT_NUMBER varchar (10) NULL, 				--mpandey24 MITS 33314 : Size of field changed to Varchar(10)
	COVERAGE_CODE varchar (25) NULL,
	COVERAGE_TEXT varchar (100) NULL,
	CVG_SEQUENCE_NO varchar (8) NULL,
	TRANS_SEQ_NO varchar (8) NULL,
	LOSS_CODE varchar (25) NULL,
	DIS_CAT_CODE varchar (25) NULL,
	DIS_LOSS_CODE varchar (25) NULL,
	COVERAGE_CODE_ID number NULL,
	LOSS_CODE_ID number NULL,
	DIS_CAT_CODE_ID number NULL,
	DIS_LOSS_CODE_ID number NULL,
	RESERVE_SUB_TYPE varchar(25) NULL,
	RC_ROW_ID number NULL,
	RESERVE_SUB_TYPE_CODE_ID number NULL
	 )';

EXECUTE IMMEDIATE
'ALTER TABLE T_MBR_LINEITEMS ADD CONSTRAINT PK_T_MBR_LINEITEMS PRIMARY KEY (DA_ROW_ID, JOBID)';

END;


----------------------------------------------------
--/****** Object 3:  T_MBR_HEADER_CORVEL

BEGIN
EXECUTE IMMEDIATE
'CREATE TABLE T_MBR_HEADER_CORVEL(
	DA_ROW_ID number NULL,
	INPUT_ROW_ID number NULL,
	INVALID_ROW number NULL,
	UPDATE_ROW number NULL,
	PAY_OR_COLLECTION varchar(1),
	CLAIM_NUMBER varchar(25),
	BILL_DOCUMENT_NUMBER varchar(25),
	ACCOUNT_NAME varchar(100),
	PT_PROV_LAST_NAME varchar(255),
	PT_PROV_FIRST_NAME varchar(255), -- smishra73 MITS 38208 : Field size changed to Varchar(255)
	PT_PROV_MI varchar(2),
	PT_PROV_ADDRESS1 varchar(50),
	PT_PROV_ADDRESS2 varchar(50),
	PT_PROV_CITY varchar(25),
	PT_PROV_STATE varchar(4),
	PT_PROV_ZIPCODE varchar(14),
	PT_PROV_TAX_ID varchar(9),
	TOTAL_BILLED decimal(10, 2) NULL,
	TOTAL_PAID decimal(10, 2) NULL,
	DATE_BILLS_PAID varchar(16),
	PATIENT_LAST_NAME varchar(255),  -- smishra73 MITS 38208 : Field size changed to Varchar(255)
	PATIENT_FIRST_NAME varchar(255), -- smishra73 MITS 38208 : Field size changed to Varchar(255)
	PATIENT_MI varchar(2),
	PATIENT_SUFFIX varchar(50),
	PATIENT_SSN varchar(9),
	GOOD_RCD number NULL,
	BAD_FLAG number NULL,
	BAD_REASON varchar(50),
	CLAIMANT_EID number NULL,
	TRANS_ID number NULL,
	CLAIM_ID number NULL,
	INVOICE_ID number NULL,
	PAYEE_EID number NULL,
	DUP number NULL,
	SUB_ACC_ID number NULL,
	CLAIM_STATUS_CODE number NULL,
	CHECK_NUMBER varchar(10),
	CHECK_DATE varchar(8),
	TOT_SCHEDULED_AMT decimal(10, 2) NULL,
	TOT_REDUCTION_AMT decimal(10, 2) NULL,
	PATIENT_ACCT_NO varchar(14),
	PROV_INVOICE_NUMBER varchar(25),
	DATE_BILL_RECEIVED varchar(8),
	DATE_BILL_RECEIVED_BY_MBR varchar(8),
	PPO_REDUCTION_AMT decimal(10, 2) NULL,
	OTH_REDUCTION_AMT decimal(10, 2) NULL,
	OTHER_VENDOR_DOC_NUM varchar(25),
	PT_PROV_SUFFIX varchar(25) NULL,
  PT_PROV_PREFIX varchar (25) NULL,
  RES_SUPP_PAYMENT_FLAG number NULL,							--mpandey24 MITS 33805
	JOBID number NOT NULL
)';

EXECUTE IMMEDIATE
'ALTER TABLE T_MBR_HEADER_CORVEL ADD CONSTRAINT PK_T_MBR_HEADER_CORVEL PRIMARY KEY (JOBID, DA_ROW_ID)';

END;

-----------------------------------------------------
--/****** Object 4:  Table T_MBR_HEADER

BEGIN
EXECUTE IMMEDIATE
'CREATE TABLE T_MBR_HEADER(
	DA_ROW_ID number NOT NULL,
	INPUT_ROW_ID number NULL,
	INVALID_ROW number NULL,
	UPDATE_ROW number NULL,
	PAY_OR_COLLECTION varchar(1),
	CLAIM_NUMBER varchar(25),
	BILL_DOCUMENT_NUMBER varchar(25),
	ACCOUNT_NAME varchar(100),
	PT_PROV_LAST_NAME varchar(255),
	PT_PROV_FIRST_NAME varchar(255),  -- smishra73 MITS 38208 : Field size changed to Varchar(255)
	PT_PROV_MI varchar(2),
	PT_PROV_ADDRESS1 varchar(50),
	PT_PROV_ADDRESS2 varchar(50),
	PT_PROV_CITY varchar(25),
	PT_PROV_STATE varchar(4),
	PT_PROV_ZIPCODE varchar(14),
	PT_PROV_TAX_ID varchar(9),
	TOTAL_BILLED decimal(10, 2) NULL,
	TOTAL_PAID decimal(10, 2) NULL,
	DATE_BILLS_PAID varchar(16),
	PATIENT_LAST_NAME varchar(255),  -- smishra73 MITS 38208 : Field size changed to Varchar(255)
	PATIENT_FIRST_NAME varchar(255), -- smishra73 MITS 38208 : Field size changed to Varchar(255)
	PATIENT_MI varchar(2),
	PATIENT_SUFFIX varchar(50),
	PATIENT_SSN varchar(9),
	GOOD_RCD number NULL,
	BAD_FLAG number NULL,
	BAD_REASON varchar(50),
	CLAIMANT_EID number NULL,
	TRANS_ID number NULL,
	CLAIM_ID number NULL,
	INVOICE_ID number NULL,
	PAYEE_EID number NULL,
	DUP number NULL,
	SUB_ACC_ID number NULL,
	CLAIM_STATUS_CODE number NULL,
	CHECK_NUMBER varchar(10),
	CHECK_DATE varchar(8),
	TOT_SCHEDULED_AMT decimal(10, 2) NULL,
	TOT_REDUCTION_AMT decimal(10, 2) NULL,
	PATIENT_ACCT_NO varchar(14),
	PROV_INVOICE_NUMBER varchar(25),
	DATE_BILL_RECEIVED varchar(8),
	DATE_BILL_RECEIVED_BY_MBR varchar(8),
	PPO_REDUCTION_AMT decimal(10, 2) NULL,
	OTH_REDUCTION_AMT decimal(10, 2) NULL,
	OTHER_VENDOR_DOC_NUM varchar(25),
	PT_PROV_SUFFIX varchar(25),
	JOBID number NOT NULL,
	NPI_NUMBER varchar(10) NULL,
        CORVEL_FEE_TYPE number NULL,
        LINE_OF_BUS_CODE number NULL,
  	MEMO_PHRASE varchar (25) NULL,
	PT_PROV_PREFIX varchar( 25) NULL,
	PT_PROV_PREFIX_CODE_ID number NULL,
	PT_PROV_SUFFIX_CODE_ID number NULL,
	RES_SUPP_PAYMENT_FLAG number NULL,
  POLICY_LOB_CODE number NULL,
	CLAIM_TYPE_CODE number NULL,
	INC_CLAIMANT number NULL,
	INC_RSVSUBTYPE number NULL,
	INC_POL_COVERAGE number NULL,
	INC_LOSS_TYPE number NULL,
	INC_RSVTYPE number NULL,
	RC_ROW_ID number NULL
)';
EXECUTE IMMEDIATE
'ALTER TABLE T_MBR_HEADER ADD CONSTRAINT PK_T_MBR_HEADER PRIMARY KEY (JOBID,DA_ROW_ID)';

END;

-----------------------------------------------------
--/****** Object 5:  Table T_MBR_ENTITY_SUFF

BEGIN
EXECUTE IMMEDIATE
'CREATE TABLE T_MBR_ENTITY_SUFF(
	DA_ROW_ID number NULL,
	INPUT_ROW_ID number NULL,
	INVALID_ROW number NULL,
	UPDATE_ROW number NULL,
	ENTITY_ID number NULL,
	TAX_ID varchar(20) NULL,
	NAME varchar(255) NULL,
	ADD1 varchar(50) NULL,
	ADD2 varchar(50) NULL,
	ENTITY_TYPE varchar(18) NULL,
	CITY varchar(50) NULL,
	STATE_ID number NULL,
	ZIP_CODE varchar(10) NULL,
	SUFFIX number NULL,
	JOBID number NULL
)';
END;

-----------------------------------------------------
--/****** Object 6:  Table T_MBR_EXTR

BEGIN
EXECUTE IMMEDIATE
'CREATE TABLE T_MBR_EXTR(

INPUT_ROW_ID number NULL,
INVALID_ROW number NULL,
UPDATE_ROW number NULL,
JOBID number NOT NULL,
EVENT_ID number NULL,
CLAIM_ID number NOT NULL,
CLAIMANT_ID number NOT NULL,
EV_DEPT_EID number NULL,
JURIS_ID number NULL,
STATE_ID number NULL,
SEX_CODE number NULL,
JURISDICTION varchar(10),
CLAIM_NUMBER varchar(50),
POLICY_NUMBER varchar(50) NULL,
TAX_ID varchar(11),
EMPLOYER_TAX_ID varchar(11),
DATE_OF_EVENT varchar(10),
EMP_DEPT_ABBREV varchar(65),
ADJUSTER_AKA varchar(65),
DOB varchar(10),
SEX varchar(10),
ADDR_1 varchar(65),
CITY varchar(65),
STATE varchar(10),
ZIP_CODE varchar(14),
L_NAME varchar(65),
EMPLOYER_LAST_NAME varchar(255),  -- smishra73 MITS 38208 : Field size changed to Varchar(255)
F_NAME varchar(65),
EV_DEPT_APPREV varchar(65),
FNOLID varchar(65),
ADDITIONAL_REF_ID number NULL,
ADDITIONAL_REF varchar(65),
ORG_DBA_NAME varchar(50),
ORG_NAME varchar(50),
CLAIM_STATUS varchar(25),
CLAIM_TYPE_CODE NUMBER NULL, 
CLAIM_STATUS_CODE number NULL,
LINE_OF_BUS_CODE number NULL,
EFFECTIVE_DATE varchar(10),   
  ADJUSTER_EID_INTERNAL    NUMBER NULL,    
DTTM_CLOSED varchar(14))';

EXECUTE IMMEDIATE
'ALTER TABLE T_MBR_EXTR ADD CONSTRAINT PK_T_MBR_EXTR PRIMARY KEY (JOBID, CLAIM_ID)';

END;

-----------------------------------------------------
--/****** Object 7:  Table ERROR_LOG
BEGIN
EXECUTE IMMEDIATE
'CREATE TABLE ERROR_LOG(
	ERR_LOG_ROW_ID number NULL,
	MODULE_NAME varchar(50),
	WORK_FLOW_NAME varchar(50),
	DATA_FLOW_NAME varchar(60),
	ERROR_TIME varchar(14),
	ERROR_TITLE varchar(100),
	ERROR_DESC varchar(4000),
	INPUT_ROW_ID number NULL,
	IS_VALIDATION number NULL,
	ERROR_TABLE varchar(50) NULL,
	TABLE_ROW_ID number NULL,
	ERROR_COLUMNS varchar(4000) NULL,
	JOBID number NULL
)';
EXECUTE IMMEDIATE
'ALTER TABLE ERROR_LOG ADD CONSTRAINT PK_ERROR_LOG PRIMARY KEY (JOBID, ERR_LOG_ROW_ID)';
END;

---------------------------------------------------
--/****** Object 8:  Table ENTITY_SUPP
BEGIN
EXECUTE IMMEDIATE
'CREATE TABLE ENTITY_SUPP(
	DA_ROW_ID number NULL,
	INPUT_ROW_ID number NULL,
	INVALID_ROW number NULL,
	UPDATE_ROW number NULL,
	ENTITY_ID number NULL,
	TAXONOMY_TEXT varchar(20) NULL,
	JOBID number NOT NULL,
        ATTY_SUF_TEXT varchar(25) NULL
)';
END;

--------------------------------------------------
--/****** Object 9:  Table FUNDS_SUPP
BEGIN
EXECUTE IMMEDIATE
'CREATE TABLE FUNDS_SUPP(
	DA_ROW_ID number NULL,
	INPUT_ROW_ID number NULL,
	INVALID_ROW number NULL,
	UPDATE_ROW number NULL,
	TRANS_ID number NULL,
	NETWRK_SRVC_CODE number NULL,
	JOBID number NOT NULL,
        BILL_REV_CM_EID number NULL,
	BILL_RCVD_DATE varchar(8) NULL,
	BILL_RCDMBR_DATE varchar(8) NULL,
	OTH_VEN_DOC_TEXT varchar(25) NULL,
	BILL_DOC_NO_TEXT varchar(25) NULL
)';
END;

---------------------------------------------------
--/****** Object 10:  Table FUNDS
BEGIN
EXECUTE IMMEDIATE
'CREATE TABLE FUNDS(
	DA_ROW_ID number NOT NULL,
	JOBID number NOT NULL,
	INPUT_ROW_ID number NULL,
	INVALID_ROW number NULL,
	UPDATE_ROW number NULL,
	AUTO_CHECK_DETAIL varchar(30) NULL,
	ROLLUP_ID number NULL,
	VOID_DATE varchar(8) NULL,
	ADDR1 varchar(50) NULL,
	ADDR2 varchar(50) NULL,
	AUTO_CHECK_FLAG number NULL,
	CITY varchar(50) NULL,
	CLAIMANT_EID number NULL,
	COUNTRY_CODE number NULL,
	FIRST_NAME varchar(255) NULL,  -- smishra73 MITS 38208 : Field size changed to Varchar(255)
	LAST_NAME varchar(255) NULL,
	PRECHECK_FLAG number NULL,
	STATE_ID number NULL,
	UNIT_ID number NULL,
	ZIP_CODE varchar(10) NULL,
	TRANS_ID number NOT NULL,
	CLAIM_ID number NULL,
	CLAIM_NUMBER varchar(25) NULL,
	CTL_NUMBER varchar(25) NULL,
	VOID_FLAG number NULL,
	DATE_OF_CHECK varchar(8) NULL,
	CHECK_MEMO varchar(255) NULL,
	TRANS_NUMBER number NULL,
	TRANS_DATE varchar(8) NOT NULL,
	PAYEE_EID number NULL,
	PAYEE_TYPE_CODE number NULL,
	ACCOUNT_ID number NULL,
	AMOUNT number NULL,
	STATUS_CODE number NULL,
	FILED_1099_FLAG number NULL,
	CLEARED_FLAG number NULL,
	PAYMENT_FLAG number NULL,
	COLLECTION_FLAG number NULL,
	COMMENTS clob NULL,
	CRC number NULL,
	DTTM_RCD_LAST_UPD varchar(14) NULL,
	DTTM_RCD_ADDED varchar(14) NULL,
	UPDATED_BY_USER varchar(50) NULL,
	ADDED_BY_USER varchar(50) NULL,
	BATCH_NUMBER number NULL,
	SEC_DEPT_EID number NULL,
	ENCLOSURE_FLAG number NULL,
	APPROVE_USER varchar(8) NULL,
	DTTM_APPROVAL varchar(14) NULL,
	SUB_ACCOUNT_ID number NULL,
	SETTLEMENT_FLAG number NULL,
	APPROVER_ID number NULL,
	VOUCHER_FLAG number NULL,
	WEEKS_PAID_CODE number NULL,
	NUM_OF_PAID_DAYS number NULL,
	TAX_PAYMENT_FLAG number NULL,
	RESUBMIT_EDI number NULL,
	SUPP_PAYMENT_FLAG number NULL,
	HTMLCOMMENTS clob NULL,
	REISSUE_FLAG number NULL,
	REISSUE_BY varchar(25) NULL,
	REISSUE_DATE varchar(8) NULL,
	REISSUE_PARENT_ID number NULL,
	NOTES_HTMLCOMMENTS clob NULL,
	REISSUE_REASON_CODE number NULL,
	MIDDLE_NAME varchar(50) NULL,
	REASON varchar(255) NULL,
	CONF_FLAG number NULL,
	CONF_EVENT_ID number NULL,
	VOID_REASON clob NULL,
	VOID_REASON_HTMLCOMMENTS clob NULL,
  	STAGING_ID number NULL,
  	BILL_DOCUMENT_NUMBER varchar(25) NULL ,
	PMT_CURRENCY_CODE number NULL,
	PMT_CURRENCY_AMOUNT  number NULL,
	PMT_TO_BASE_CUR_RATE  number NULL,
	CLAIM_CURRENCY_CODE  number NULL,
	CLAIM_CURRENCY_AMOUNT  number NULL,
	PMT_TO_CLAIM_CUR_RATE  number NULL,
	BASE_TO_PMT_CUR_RATE   number NULL,
	BASE_TO_CLAIM_CUR_RATE  number NULL,
	RES_SUPP_PAYMENT_FLAG number NULL,                       --mpandey24 MITS 33805
  PAY_TO_THE_ORDER_OF clob NULL,
  RC_ROW_ID number NULL 


)';
EXECUTE IMMEDIATE
'ALTER TABLE FUNDS ADD CONSTRAINT PK_FUNDS PRIMARY KEY (JOBID, DA_ROW_ID)';
END;

-------------------------------------------------
--------------------------------------------------
--/****** Object 11:  Table FUNDS_TRANS_SPLIT
BEGIN
EXECUTE IMMEDIATE
'CREATE TABLE FUNDS_TRANS_SPLIT(
        DA_ROW_ID number NOT NULL,
        JOBID number NOT NULL,
        INPUT_ROW_ID number NULL,
        INVALID_ROW number NULL,
        UPDATE_ROW number NULL,
        SUM_AMOUNT number NULL,
        SPLIT_ROW_ID number NULL,
        TRANS_ID number NULL,
        TRANS_TYPE_CODE number NULL,
        RESERVE_TYPE_CODE number NULL,
        AMOUNT number NULL,
        GL_ACCOUNT_CODE number NULL,
        FROM_DATE varchar(8) NULL,
        TO_DATE varchar(8) NULL,
        INVOICED_BY varchar(20) NULL,
        INVOICE_AMOUNT number NULL,
        INVOICE_NUMBER varchar(25) NULL,
        PO_NUMBER varchar(14) NULL,
        CRC number NULL,
        DTTM_RCD_LAST_UPD varchar(14) NULL,
        DTTM_RCD_ADDED varchar(14) NULL,
        UPDATED_BY_USER varchar(50) NULL,
        ADDED_BY_USER varchar(50) NULL,
        INVOICE_DATE varchar(8) NULL,
        BILL_RCVD_BY_CARRIER_DATE varchar(8) NULL,
        SUPP_PAYMENT_FLAG number NULL,
        STAGING_ID number NULL,
        LI_LINE_NUMBER number NULL,
        CVG_LOSS_ROW_ID number NULL,                      --MITS 31409 - MBR Finnacial enhancement
        POLCVG_ROW_ID number NULL,                        --MITS 31409 - MBR Finnacial enhancement
        RC_ROW_ID number NULL,                           --MITS 31409 - MBR Finnacial enhancement
        PMT_CURRENCY_AMOUNT number NULL,		        
        PMT_CURRENCY_INVOICE_AMOUNT number NULL,	
        PMT_CURRENCY_AUTO_DISCOUNT number NULL,		
        CLAIM_CURRENCY_AMOUNT number NULL,				
        CLAIM_CURRENCY_INVOICE_AMOUNT number NULL,		
        CLAIM_CURRENCY_AUTO_DISCOUNT number NULL            
)';
END;

---------------------------------------------------

--------------------------------------------------
--/****** Object 12:  Table RESERVE_CURRENT
BEGIN
EXECUTE IMMEDIATE
'CREATE TABLE RESERVE_CURRENT(
        DA_ROW_ID number NOT NULL,
	JOBID number NOT NULL,
	INPUT_ROW_ID number NULL,
	INVALID_ROW number NULL,
	UPDATE_ROW number NULL,
	BALANCE_AMOUNT number NULL,
	RC_ROW_ID number NULL,
	CLAIM_ID number NULL,
	UNIT_ID number NULL,
	CLAIMANT_EID number NULL,
	RESERVE_TYPE_CODE number NULL,
	RESERVE_AMOUNT number NULL,
	INCURRED_AMOUNT number NULL,
	COLLECTION_TOTAL number NULL,
	PAID_TOTAL number NULL,
	DATE_ENTERED varchar(8) NULL,
	ENTERED_BY_USER varchar(50) NULL,		--MITS 30467 - increased to 50
	REASON varchar(30) NULL,
	UPDATED_BY_USER varchar(50) NULL,		--MITS 30467 - increased to 50
	DTTM_RCD_ADDED varchar(14) NULL,
	DTTM_RCD_LAST_UPD varchar(14) NULL,
	ADDED_BY_USER varchar(50) NULL,			--MITS 30467 - increased to 50
	CRC number NULL,
	SEC_DEPT_EID number NULL,
	RES_STATUS_CODE number NULL,
	ALLOCATED_AMOUNT number NULL,
	CONF_FLAG number NULL,
	CONF_EVENT_ID number NULL,
	POLCVG_ROW_ID number NULL,
 	POLCVG_LOSS_ROW_ID number NULL,    --MITS 31409 - MBR Finnacial enhancement starts
	STAGING_ID number NULL,
 	CLAIM_CURR_CODE number NULL,					    
  	CLAIM_TO_BASE_CUR_RATE number NULL,			
	CLAIM_CURRENCY_RESERVE_AMOUNT number NULL,	
	CLAIM_CURRENCY_INCURRED_AMOUNT number NULL,
	CLAIM_CURR_COLLECTION_TOTAL number NULL,			
	CLAIM_CURRENCY_PAID_TOTAL number NULL,		
	CLAIM_CURRENCY_BALANCE_AMOUNT number NULL,	
	BASE_TO_CLAIM_CUR_RATE number NULL,			--MITS 31409 Ends.
  RESERVE_CATEGORY number NULL,
  POLICY_CURR_RESERVE_AMOUNT number NULL,	
  POLICY_CURR_INCURRED_AMOUNT number NULL,	
  POLICY_CURR_COLLECTION_TOTAL number NULL,			
  POLICY_CURR_PAID_TOTAL number NULL,		
  POLICY_CURRENCY_BALANCE_AMOUNT number NULL,
  POLICY_CURRENCY_AMOUNT number NULL,      -- Jira 64211 
  CLAIM_CURRENCY_AMOUNT number NULL,
  PAYMENT_AMOUNT number NULL,
  PREV_PRINT_TOTAL number NULL,
  PREV_CLAIM_PRINT_TOTAL number NULL,
  PREV_POLICY_PRINT_TOTAL number NULL,
  PREV_CLAIM_ALLOCATED_TOTAL number NULL,
  PREV_POLICY_ALLOCATED_TOTAL number NULL,
  PREV_ALLOCATED_AMOUNT number NULL               
)';
END;

---------------------------------------------------
----------------------------------------------------
--/****** Object 13:  Table ENTITY
BEGIN
EXECUTE IMMEDIATE
'CREATE TABLE ENTITY(
	        DA_ROW_ID number NOT NULL,
		JOBID number NOT NULL,
		INPUT_ROW_ID number NULL,
		INVALID_ROW number NULL,
		UPDATE_ROW number NULL,
		BUSINESS_TYPE_CODE number NULL,
		COUNTY varchar(30) NULL,
		NATURE_OF_BUSINESS varchar(50) NULL,
		SIC_CODE number NULL,
		SIC_CODE_DESC varchar(150) NULL,
		WC_FILING_NUMBER varchar(30) NULL,
		ENTITY_ID number NULL,
		ENTITY_TABLE_ID number NULL,
		LAST_NAME varchar(255) NULL,    -- smishra73 MITS 38208 : Field size changed to Varchar(255)
		LAST_NAME_SOUNDEX varchar(8) NULL,
		FIRST_NAME varchar(50) NULL,
		ALSO_KNOWN_AS varchar(50) NULL,
		ABBREVIATION varchar(25) NULL,
		COST_CENTER_CODE number NULL,
		ADDR1 varchar(50) NULL,
		ADDR2 varchar(50) NULL,
		CITY varchar(50) NULL,
		COUNTRY_CODE number NULL,
		STATE_ID number NULL,
		ZIP_CODE varchar(10) NULL,
		PARENT_EID number NULL,
		TAX_ID varchar(20) NULL,
		CONTACT varchar(50) NULL,
		COMMENTS clob NULL,
		EMAIL_TYPE_CODE number NULL,
		EMAIL_ADDRESS varchar(100) NULL,
		SEX_CODE number NULL,
		BIRTH_DATE varchar(8) NULL,
		PHONE1 varchar(30) NULL,
		PHONE2 varchar(30) NULL,
		FAX_NUMBER varchar(30) NULL,
		DTTM_RCD_ADDED varchar(14) NULL,
		DTTM_RCD_LAST_UPD varchar(14) NULL,
		UPDATED_BY_USER varchar(50) NULL,
		ADDED_BY_USER varchar(50) NULL,
		DELETED_FLAG number NULL,
		SEC_DEPT_EID number NULL,
		TRIGGER_DATE_FIELD varchar(50) NULL,
		EFF_START_DATE varchar(8) NULL,
		EFF_END_DATE varchar(8) NULL,
		PARENT_1099_EID number NULL,
		REPORT_1099_FLAG number NULL,
		MIDDLE_NAME varchar(50) NULL,
		TITLE varchar(50) NULL,
		NAICS_CODE number NULL,
		RM_USER_ID number NULL,
		FREEZE_PAYMENTS number NULL,
		ORGANIZATION_TYPE number NULL,
		NPI_NUMBER varchar(10) NULL,
		HTMLCOMMENTS clob NULL,
		MMSEA_TIN_EDT_FLAG number NULL,
		AUTO_DISCOUNT number NULL,
		DISCOUNT_FLAG number NULL,
		ENTITY_APPROVAL_STATUS number NULL,
		ENTITY_REJECT_COMMENTS clob NULL,
		FROI_ACORD_PASSWORD varchar(15) NULL,
    PREFIX varchar (25) NULL,
		SUFFIX_COMMON varchar (25) NULL,
		STAGING_ID number NULL
)';
EXECUTE IMMEDIATE
'ALTER TABLE ENTITY ADD CONSTRAINT PK_ENTITY PRIMARY KEY (JOBID, DA_ROW_ID)';
END;


---------------------------------------------------
----------------------------------------------------
--/****** Object 14:  Table RESERVE_HISTORY
BEGIN
EXECUTE IMMEDIATE
'CREATE TABLE RESERVE_HISTORY(
                DA_ROW_ID number NOT NULL,
		JOBID number NOT NULL,
		INPUT_ROW_ID number NULL,
		INVALID_ROW number NULL,
		UPDATE_ROW number NULL,
		BALANCE_AMOUNT number NULL,
		CHANGE_AMOUNT number NULL,
		RSV_ROW_ID number NULL,
		CLAIM_ID number NULL,
		CLAIMANT_EID number NULL,
		UNIT_ID number NULL,
		RESERVE_TYPE_CODE number NULL,
		RESERVE_AMOUNT number NULL,
		COLLECTION_TOTAL number NULL,
		INCURRED_AMOUNT number NULL,
		PAID_TOTAL number NULL,
		DATE_ENTERED varchar(8) NULL,
		ENTERED_BY_USER varchar(50) NULL,
		REASON varchar(30) NULL,
		UPDATED_BY_USER varchar(50) NULL,
		DTTM_RCD_ADDED varchar(14) NULL,
		DTTM_RCD_LAST_UPD varchar(14) NULL,
		ADDED_BY_USER varchar(50) NULL,
		CRC number NULL,
		SEC_DEPT_EID number NULL,
		RES_STATUS_CODE number NULL,
		CLOSED_FLAG number NULL,
		AUTO_ADJ_FLAG number NULL,
		CONF_FLAG number NULL,
		CONF_EVENT_ID number NULL,
		POLCVG_ROW_ID number NULL,
		POLCVG_LOSS_ROW_ID NUMBER NULL,	
    		STAGING_ID number NULL,
		RC_ROW_ID number NULL,			--SDALVI3 JIRA 27488
  	 	CLAIM_CURR_CODE number NULL,					    
  	  	CLAIM_TO_BASE_CUR_RATE number NULL,			
    		CLAIM_CURRENCY_RESERVE_AMOUNT number NULL,	
  		CLAIM_CURRENCY_INCURRED_AMOUNT number NULL,
  		CLAIM_CURR_COLLECTION_TOTAL number NULL,			
  		CLAIM_CURRENCY_PAID_TOTAL number NULL,		
  		CLAIM_CURRENCY_BALANCE_AMOUNT number NULL,
      		RESERVE_CATEGORY NUMBER NULL,
    		BASE_TO_CLAIM_CUR_RATE number NULL,
          POLICY_CURR_RESERVE_AMOUNT number NULL,	
		POLICY_CURR_INCURRED_AMOUNT number NULL,	
		POLICY_CURR_COLLECTION_TOTAL number NULL,			
		POLICY_CURR_PAID_TOTAL number NULL,		
		POLICY_CURRENCY_BALANCE_AMOUNT number NULL,
		POLICY_CURR_CHANGE_AMOUNT number NULL,
		CLAIM_TO_POLICY_CUR_RATE number NULL,
		CLAIM_CURR_CHANGE_AMOUNT number NULL

)';
EXECUTE IMMEDIATE
'ALTER TABLE RESERVE_HISTORY ADD CONSTRAINT PK_RESERVE_HISTORY PRIMARY KEY (JOBID, DA_ROW_ID)';
END;

---------------------------------------------------
----------------------------------------------------
--/****** Object 15:  Table INVOICE
BEGIN
EXECUTE IMMEDIATE
'CREATE TABLE INVOICE(
                DA_ROW_ID number NOT NULL,
		JOBID number NOT NULL,
		INPUT_ROW_ID number NULL,
		INVALID_ROW number NULL,
		UPDATE_ROW number NULL,
		INVOICE_ID number NULL,
		FUNDS_TRANS_ID number NULL,
		CLAIM_ID number NULL,
		CLAIM_NUMBER_TEXT varchar(50) ,
		CLAIMANT_EID number NULL,
		UNIT_ID number NULL,
		PAYEE_TYPE_CODE number NULL,
		PAYEE_EID number NULL,
		PAYEE_SPEC_CODE number NULL,
		LAST_NAME_TEXT varchar(255),  -- smishra73 MITS 38208 : Field size changed to Varchar(255)
		FIRST_NAME_TEXT varchar(255), -- smishra73 MITS 38208 : Field size changed to Varchar(255)
		ADDR1_TEXT varchar(50),
		ADDR2_TEXT varchar(50),
		CITY_TEXT varchar(50),
		STATE_ID number NULL,
		COUNTRY_CODE number NULL,
		POSTAL_CODE_TEXT varchar(15),
		TRANS_DATE_TEXT varchar(8),
		TOT_SCHEDULED_AMT number NULL,
		TOT_REDUCTION_AMT number NULL,
		TOT_AMT_TO_PAY number NULL,
		TOT_AMT_SAVED number NULL,
		TOT_AMT_BILLED number NULL,
		NUM_DETAIL_LINES number NULL,
		DTTM_RCD_ADDED varchar(14),
		ADDED_BY_USER varchar(50),
		DTTM_RCD_LAST_UPD varchar(14),
		UPDATED_BY_USER varchar(50),
		DTTM_EOB_PRINTED varchar(14),
		EOB_PRINTED_USER varchar(50),
		PPO_REDUCTION_AMT decimal(10, 2) NULL,
		OTH_REDUCTION_AMT decimal(10, 2) NULL,
		STAGING_ID number NULL
                
)';
EXECUTE IMMEDIATE
'ALTER TABLE INVOICE ADD CONSTRAINT PK_INVOICE PRIMARY KEY (JOBID, DA_ROW_ID)';
END;

----------------------------------------------------
--/****** Object 16:  Table INVOICE_DETAIL
BEGIN
EXECUTE IMMEDIATE
'CREATE TABLE INVOICE_DETAIL(
                        DA_ROW_ID number NOT NULL,
			JOBID number NOT NULL,
			INPUT_ROW_ID number NULL,
			INVALID_ROW number NULL,
			UPDATE_ROW number NULL,
			INVOICE_DETAIL_ID number NULL,
			INVOICE_ID number NULL,
			FUNDS_SPLIT_ROW_ID number NULL,
			TABLE_CODE number NULL,
			PERCENTILE varchar(4) NULL,
			PLACE_OF_SER_CODE number NULL,
			TYPE_OF_SER_CODE number NULL,
			BILLING_CODE_TEXT varchar(64) NULL,
			UNITS_BILLED_NUM number NULL,
			UNITS_BILLED_TYPE number NULL,
			AMOUNT_BILLED number NULL,
			SCHEDULED_AMOUNT number NULL,
			AMOUNT_REDUCED number NULL,
			AMOUNT_TO_PAY number NULL,
			AMOUNT_SAVED number NULL,
			TOOTH_NUMBER number NULL,
			SURFACE_TEXT varchar(50) NULL,
			MODIFIER_CODE number NULL,
		        QUANTITY varchar(6) NULL,
			STORE varchar(11) NULL,
			CONTRACT_EXISTS number NULL,
			OVERRIDE_TYPE number NULL,
			CONTRACT_AMOUNT number NULL,
			DISCOUNT number NULL,
			AMOUNT_ALLOWED number NULL,
			BASE_AMOUNT number NULL,
			ZIP_CODE varchar(10) NULL,
			FEE_TABLE_AMT number NULL,
			PER_DIEM_AMT number NULL,
			STOP_LOSS_AMT number NULL,
			STOP_LOSS_FLAG number NULL,
			FEE_DATA_SOURCE number NULL,
			FEE_TABLE_STATE varchar(2) NULL,
			FEE_TABLE_STUDY varchar(5) NULL,
			FEE_DATA_REVISION varchar(3) NULL,
			PRESCRIP_NO varchar(30) NULL,
			DRUG_NAME varchar(80) NULL,
			PRESCRIP_DATE varchar(8) NULL,
			DAYS_SUPPLIED number NULL,
			DATE_FILLED varchar(8) NULL,
			REV_CODE varchar(4) NULL,
			PHY_EID number NULL,
			BILL_TYPE number NULL,
			DISPENSED number NULL,
			HCPCS_CODE varchar(5) NULL,
			PURCHASED_IND number NULL,
			FL_LICENSE varchar(25) NULL,
			PHY_PHARM_NDC varchar(20) NULL,
			PHY_PHARM_NDC_DES varchar(50) NULL,
			MEDS_QUANTITY number NULL,
			RX_IND number NULL,
			CERTIFICATION number NULL,
			RX_USUAL_CHARGE number NULL,
			BRS_FEE_AMT2 number NULL,
			BRS_FEE_AMT1 number NULL,
			TABLE_CODE_2 number NULL,
			DIAG_REF_NO varchar(4) NULL,
			MED_SUPPLY_FLAG number NULL,
			PPO_REDUCTION_AMT decimal(10, 2) NULL,
			OTH_REDUCTION_AMT decimal(10, 2) NULL,
			STAGING_ID number NULL
                
)';
EXECUTE IMMEDIATE
'ALTER TABLE INVOICE_DETAIL ADD CONSTRAINT PK_INVOICE_DETAIL PRIMARY KEY (JOBID, DA_ROW_ID)';
END;

----------------------------------------------------
--/****** Object 17:  Table INVDETAIL_X_DIAG
BEGIN
EXECUTE IMMEDIATE
'CREATE TABLE INVDETAIL_X_DIAG(
                DA_ROW_ID number NOT NULL,
		JOBID number NOT NULL,
		INPUT_ROW_ID number NULL,
		INVALID_ROW number NULL,
		UPDATE_ROW number NULL,
		INVOICE_DETAIL_ID number NULL,
		DIAGNOSIS_CODE number NULL
                
)';
EXECUTE IMMEDIATE
'ALTER TABLE INVDETAIL_X_DIAG ADD CONSTRAINT PK_INVDETAIL_X_DIAG PRIMARY KEY (JOBID, DA_ROW_ID)';
END;

----------------------------------------------------
--/****** Object 18:  Table INVDETAIL_X_MOD
BEGIN
EXECUTE IMMEDIATE
'CREATE TABLE INVDETAIL_X_MOD(
                DA_ROW_ID number NOT NULL,
		JOBID number NOT NULL,
		INPUT_ROW_ID number NULL,
		INVALID_ROW number NULL,
		UPDATE_ROW number NULL,
		INVOICE_DETAIL_ID number NOT NULL,
		MODIFIER_CODE number NOT NULL,
		MODIFIER_ORDER number NULL
                
)';
EXECUTE IMMEDIATE
'ALTER TABLE INVDETAIL_X_MOD ADD CONSTRAINT PK_INVDETAIL_X_MOD PRIMARY KEY (JOBID, DA_ROW_ID)';
END;

----------------------------------------------------
--/****** Object 19:  Table INVDETAIL_X_EOB
BEGIN
EXECUTE IMMEDIATE
'CREATE TABLE INVDETAIL_X_EOB(
                DA_ROW_ID number NOT NULL,
		JOBID number NOT NULL,
		INPUT_ROW_ID number NULL,
		INVALID_ROW number NULL,
		UPDATE_ROW number NULL,
		INVOICE_DETAIL_ID number NOT NULL,
		EOB_CODE number NOT NULL,
		EOB_TABLE number NOT NULL
                
)';
EXECUTE IMMEDIATE
'ALTER TABLE INVDETAIL_X_EOB ADD CONSTRAINT PK_INVDETAIL_X_EOB PRIMARY KEY (JOBID, DA_ROW_ID)';
END;

----------------------------------------------------
--/****** Object 20:  Table CODES
BEGIN
EXECUTE IMMEDIATE
'CREATE TABLE CODES(
                DA_ROW_ID number NOT NULL,
		JOBID number NOT NULL,
		INPUT_ROW_ID number NULL,
		INVALID_ROW number NULL,
		UPDATE_ROW number NULL,
		IND_STANDARD_CODE number NULL,
		LINE_OF_BUS_CODE number NULL,
		CODE_ID number NULL,
		TABLE_ID number NULL,
		SHORT_CODE varchar(25) NULL,
		RELATED_CODE_ID number NULL,
		DELETED_FLAG number NULL,
		TRIGGER_DATE_FIELD varchar(50) NULL,
		EFF_START_DATE varchar(8) NULL,
		EFF_END_DATE varchar(8) NULL,
		ORG_GROUP_EID number NULL
                
)';
EXECUTE IMMEDIATE
'ALTER TABLE CODES ADD CONSTRAINT PK_CODES PRIMARY KEY (JOBID, DA_ROW_ID)';
END;


----------------------------------------------------
--/****** Object 21:  Table CODES_TEXT
BEGIN
EXECUTE IMMEDIATE
'CREATE TABLE CODES_TEXT(
                DA_ROW_ID number NOT NULL,
		JOBID number NOT NULL,
		INPUT_ROW_ID number NULL,
		INVALID_ROW number NULL,
		UPDATE_ROW number NULL,
		CODE_ID number NULL,
		LANGUAGE_CODE number NULL,
		SHORT_CODE varchar(25) NULL,
		CODE_DESC varchar(50) NULL
                
)';
EXECUTE IMMEDIATE
'ALTER TABLE CODES_TEXT ADD CONSTRAINT PK_CODES_TEXT PRIMARY KEY (JOBID, DA_ROW_ID)';
END;

----------------------------------------------------
--/****** Object 22:  Table UNIQUE_CODE
BEGIN
EXECUTE IMMEDIATE
'CREATE TABLE UNIQUE_CODE(
                JOBID number NOT NULL,
		DA_ROW_ID number NOT NULL,
		TABLE_ID number NULL,
		CODE_ID number NULL,
		LINE_OF_BUS_CODE number NULL,
		RELATED_CODE_ID number NULL,
		NEW_CODE number NULL,
		SHORT_CODE varchar(25) NULL,
		CODE_TABLE_NAME varchar(30) NULL
                
)';
EXECUTE IMMEDIATE
'ALTER TABLE UNIQUE_CODE ADD CONSTRAINT PK_UNIQUE_CODE PRIMARY KEY (JOBID, DA_ROW_ID)';
END;

----------------------------------------------------
--/****** Object 23:  Table T_MBR_DOC_ATTACHMENT
BEGIN
EXECUTE IMMEDIATE
'CREATE TABLE T_MBR_DOC_ATTACHMENT(
                JOBID number NOT NULL,
		KEYS varchar(50) NULL,
		SHORT_CODE varchar(25) NULL,
		CODE_ID number NULL
                
)';
END;


-------------------------------------------------
----------------------------------------------------
--/****** Object 24:  Table T_MBR_PROCESS_LOG
BEGIN
EXECUTE IMMEDIATE
'CREATE TABLE T_MBR_PROCESS_LOG(
                JOBID number NOT NULL,
		PROCESS_DESC varchar(500) NULL,
                DISPLAY_ORDER number NULL,
                TRANS_ID number NULL,
                IDENTIFIER number NULL
                
)';
END;

-------------------------------------------------

----------------------------------------------------
--/****** Object 25:  Table T_MBR_DOC_ATTACH_VALID
BEGIN
EXECUTE IMMEDIATE
'CREATE TABLE T_MBR_DOC_ATTACH_VALID(
                JOBID number NOT NULL,
		CLAIM_NUMBER varchar(25) NULL,
                BILL_DOCUMENT_NUMBER varchar(25) NULL,
                PAYEE_LAST_NAME varchar(255) NULL,
                CLAIM_ID number NULL        
                
)';
END;
-----------------------------------------------------
-----------------------------------------------------
--/****** Object 26:  Table ENTITY_X_ADDRESSES
BEGIN
EXECUTE IMMEDIATE
 'CREATE TABLE ENTITY_X_ADDRESSES 
   (	"DA_ROW_ID" NUMBER NOT NULL, 
	"JOBID" NUMBER NOT NULL, 
	"INPUT_ROW_ID" NUMBER, 
	"INVALID_ROW" NUMBER, 
	"UPDATE_ROW" NUMBER, 
	"ENTITY_ID" NUMBER NOT NULL, 
	"ADDRESS_ID" NUMBER NOT NULL, 
--	"ADDR1" VARCHAR2(50), 
--	"ADDR2" VARCHAR2(50), 
--	"CITY" VARCHAR2(50), 
--	"STATE_ID" NUMBER, 
--	"COUNTRY_CODE" NUMBER, 
--	"COUNTY" VARCHAR2(30), 
--	"ZIP_CODE" VARCHAR2(10), 
	"EMAIL_ADDRESS" VARCHAR2(100), 
	"PRIMARY_ADD_FLAG" NUMBER, 
	"FAX_NUMBER" VARCHAR2(30),
  "EFFECTIVE_DATE" varchar(14) NULL,
	"EXPIRATION_DATE" varchar(14) NULL,
	"ADDED_BY_USER" varchar(8) NULL,
	"UPDATED_BY_USER" varchar(8) NULL,
   "DTTM_RCD_ADDED"   varchar(10) NULL, 
   "DTTM_RCD_LAST_UPD"  varchar(10) NULL, 
   "ADDRESS_SEQ_NUM" number NULL,
   "LEGACY_UNIQUE_IDENTIFIER" varchar(10) NULL,
    "ADDRESS_TYPE_CODE" number NULL
    )';
  

EXECUTE IMMEDIATE
'ALTER TABLE ENTITY_X_ADDRESSES ADD CONSTRAINT PK_ENTITY_X_ADDRESSES PRIMARY KEY (JOBID, DA_ROW_ID)';
END;

--------------------------------------------------

-----------------------------------------------------
--/****** Object 27:  Table FUNDS_X_PAYEE
BEGIN
EXECUTE IMMEDIATE
 'CREATE TABLE FUNDS_X_PAYEE 
   (	"DA_ROW_ID" NUMBER NOT NULL, 
	"JOBID" NUMBER NOT NULL, 
	"INPUT_ROW_ID" NUMBER, 
	"INVALID_ROW" NUMBER, 
	"UPDATE_ROW" NUMBER, 
	"PAYEE_ROW_ID" NUMBER NOT NULL, 
	"PAYEE_EID" NUMBER NOT NULL, 
	"FUNDS_TRANS_ID" NUMBER NOT NULL,
	"PAYEE_1099_FLAG" NUMBER NULL,
	"DTTM_RCD_ADDED" varchar(14),
	"DTTM_RCD_LAST_UPD" varchar(14),
	"ADDED_BY_USER" varchar(50),
	"UPDATED_BY_USER" varchar(50),
	"PAYEE_TYPE_CODE" NUMBER NOT NULL,
   "PHRASE_TYPE_CODE" NUMBER  NULL
  )';
  

EXECUTE IMMEDIATE
'ALTER TABLE FUNDS_X_PAYEE ADD CONSTRAINT PK_FUNDS_X_PAYEE PRIMARY KEY (JOBID, DA_ROW_ID)';
END;


--/****** Object 28: Table T_MBR_POLICY
BEGIN
EXECUTE IMMEDIATE
'CREATE TABLE T_MBR_POLICY(
	JOBID NUMBER NOT NULL,
	CLAIM_ID NUMBER NOT NULL,
	CLAIM_NUMBER varchar(50) NULL,
  	CLAIMANT_ID NUMBER NULL,
	LOSS_CODE decimal(10, 0) NULL,
	DISABILITY_CAT decimal(10, 0) NULL,
	UNIT_ID decimal(10, 0) NULL,
  	UNIT_NUMBER varchar(10) NULL,		--mpandey24 MITS 33314 : Field added 
	POLICY_NAME varchar(20) NULL,
	CLMNT_SEQNO decimal(20, 0) NULL,
	RECORD_TYPE varchar(1) NULL,		--mpandey24 MITS 33314 : CLAIMANT_FIRST_NAME,CLAIMANT_LAST_NAME and TAX_ID fields removed	
	COVERAGE_TYPE_CODE decimal(10, 0) NULL,
  	COVERAGE_TEXT varchar (100) NULL,
	CVG_SEQUENCE_NO varchar (8) NULL,
	TRANS_SEQ_NO varchar (8) NULL,
	UNIT_TYPE varchar(10) NULL

) ';
END;
--------------------------------------------------
--/****** Object 29:  Table T_MBR_RES_BALANCE
BEGIN 
EXECUTE IMMEDIATE
'CREATE TABLE T_MBR_RES_BALANCE
  (
    JOBID INTEGER NOT NULL,
    CLAIM_ID NUMBER NULL,
    CLAIMANT_EID NUMBER NULL,
    RTC NUMBER NULL,
    BALANCE_AMOUNT NUMBER NULL,
    POLCVG_ROW_ID NUMBER NULL,
	  CVG_LOSS_ROW_ID NUMBER NULL,
    DA_ROW_ID NUMBER NOT NULL )';
  
  EXECUTE IMMEDIATE
'ALTER TABLE T_MBR_RES_BALANCE ADD CONSTRAINT PK_T_MBR_RES_BALANCE PRIMARY KEY (JOBID, DA_ROW_ID)';
END;


--------------------------------------------------
--/****** Object 30:  Table ACTIVITY_TRACK

BEGIN 
EXECUTE IMMEDIATE
'CREATE TABLE ACTIVITY_TRACK 
 (
	JOBID NUMBER NOT NULL,
	DA_ROW_ID NUMBER NOT NULL,	
	INPUT_ROW_ID NUMBER NULL,
	INVALID_ROW NUMBER NULL,
	UPDATE_ROW NUMBER NULL,
	ACTIVITY_ROW_ID NUMBER NOT NULL,
	CLAIM_ID NUMBER NULL,
	FOREIGN_TABLE_ID NUMBER NULL,
	FOREIGN_TABLE_KEY NUMBER NULL,
	UPLOAD_FLAG NUMBER NULL,
	DTTM_RCD_ADDED varchar(14) NULL,
	ADDED_BY_USER varchar(8) NULL,
	CHECK_BATCH_ID NUMBER NULL,
	POLICY_SYSTEM_ID NUMBER NULL,
	IS_UPDATED NUMBER NULL,
	ACTIVITY_TYPE NUMBER NULL,
	ACCOUNT_ID NUMBER NULL,
	RESERVE_AMOUNT NUMBER NULL,
	CHECK_STATUS NUMBER NULL,
	RESERVE_STATUS NUMBER NULL,
	CHANGE_AMOUNT NUMBER NULL,
	VOID_FLAG NUMBER NULL,
	IS_COLLECTION NUMBER NULL )';
	
 EXECUTE IMMEDIATE
'ALTER TABLE ACTIVITY_TRACK ADD CONSTRAINT PK_ACTIVITY_TRACK PRIMARY KEY (JOBID, DA_ROW_ID)';
END;


--/****** Object 31:  Table [dbo].[INVDETAIL_X_DIAG_ICD10]    Script Date: 12/26/2013 16:59:30 ******/

BEGIN
EXECUTE IMMEDIATE
'CREATE TABLE INVDETAIL_X_DIAG_ICD10
(
	DA_ROW_ID number NOT NULL,
	JOBID number NOT NULL,
	INPUT_ROW_ID number NULL,
	INVALID_ROW number NULL,
	UPDATE_ROW number NULL,
	INVOICE_DETAIL_ID number NULL,
	DIAGNOSIS_CODE number NULL ) ';
EXECUTE IMMEDIATE
'ALTER TABLE INVDETAIL_X_DIAG_ICD10 ADD CONSTRAINT PK_INVDETAIL_X_DIAG_ICD10 PRIMARY KEY (JOBID, DA_ROW_ID)';
END;

--/****** Object 32:  Table [dbo].[ENTITY_X_ROLES]    Script Date: 01/28/2015 16:59:30 ******/

BEGIN
EXECUTE IMMEDIATE
'CREATE TABLE ENTITY_X_ROLES
(
	JOBID number NOT NULL,
	DA_ROW_ID number NOT NULL,
	ER_ROW_ID number NULL,
	ENTITY_ID number NULL,
	ENTITY_TABLE_ID number NULL,
	DTTM_RCD_ADDED varchar(14) NULL,
	ADDED_BY_USER varchar(50) NULL,
	DTTM_RCD_LAST_UPD varchar(14) NULL,
	UPDATED_BY_USER varchar(50) NULL,
	DELETED_FLAG number NULL ) ';
EXECUTE IMMEDIATE
'ALTER TABLE ENTITY_X_ROLES ADD CONSTRAINT PK_ENTITY_X_ROLES PRIMARY KEY (JOBID, DA_ROW_ID)';
END;


--/****** Object 33:  Table [dbo].[ADDRESS]    Script Date: 01/28/2015 16:59:30 ******/

BEGIN
EXECUTE IMMEDIATE
'CREATE TABLE ADDRESS(
	JOBID number NOT NULL,
	DA_ROW_ID number NOT NULL,
	ADDRESS_ID number NULL,
	ADDR1 varchar(100) NULL,
	ADDR2 varchar(100) NULL,
	ADDR3 varchar(100) NULL,
	ADDR4 varchar(100) NULL,
	CITY varchar(50) NULL,
	COUNTY varchar(30) NULL,
	COUNTRY_CODE number NULL,
	STATE_ID number NULL,
	ZIP_CODE varchar(15) NULL,
	ADDRESS_SEQ_NUM number NULL,
	LEGACY_UNIQUE_IDENTIFIER varchar(100) NULL,
	ADDED_BY_USER varchar(8) NULL,
	UPDATED_BY_USER varchar(8) NULL,
	DTTM_RCD_ADDED varchar(14) NULL,
	DTTM_RCD_LAST_UPD varchar(14) NULL,
	SEARCH_STRING varchar(4000) NULL,
	DELETED_FLAG number NULL,
	INVALID_ROW number NULL,
	UPDATE_ROW number NULL
)';

EXECUTE IMMEDIATE
'ALTER TABLE ADDRESS ADD CONSTRAINT PK_ADDRESS PRIMARY KEY (JOBID, DA_ROW_ID)';
END;

--=======================================================
--RM_ACTIVITY_TRACK
--=======================================================
--/****** Object:  Table RM_ACTIVITY_TRACK    Script Date: 5/31/2017 4:22:02 PM ******/
BEGIN
SELECT COUNT(*) INTO iExists FROM USER_OBJECTS WHERE OBJECT_TYPE='TABLE' AND OBJECT_NAME='RM_ACTIVITY_TRACK';
IF iExists = 1 THEN
EXECUTE IMMEDIATE
 'DROP TABLE RM_ACTIVITY_TRACK';
END IF;
END;

BEGIN
EXECUTE IMMEDIATE
'CREATE TABLE RM_ACTIVITY_TRACK(
  ACTIVITY_ROW_ID number NOT NULL,
  CLAIM_ID number NULL,
  FOREIGN_TABLE_ID number NULL,
  FOREIGN_TABLE_KEY number NULL,
  UPLOAD_FLAG number NULL,
  DTTM_RCD_ADDED varchar(14) NULL,
  ADDED_BY_USER varchar(50) NOT NULL,
  CHECK_BATCH_ID number NULL,
  POLICY_SYSTEM_ID number NULL,
  IS_UPDATED number NULL,
  ACTIVITY_TYPE number NULL,
  ACCOUNT_ID number NULL,
  RESERVE_AMOUNT decimal(10, 2) NULL,
  RESERVE_STATUS number NULL,
  CHANGE_AMOUNT decimal(10, 2) NULL,
  CHECK_STATUS number NULL,
  VOID_FLAG number NULL,
  IS_COLLECTION number NULL,
  MOVE_HIST_TABLE_ID number NULL,
  MOVE_HIST_TABLE_KEY number NULL,
  ADDITIONAL_UPL_DATA varchar(100) NULL,
  DTTM_RCD_LAST_UPD varchar(14) NULL,
  UPDATED_BY_USER varchar(50) NULL,
  RESERVE_HIST_ID number NULL,
  JOBID number NULL
)';

END;

--=======================================================
--RM_FUNDS
--=======================================================
--/****** Object:  Table RM_FUNDS    Script Date: 5/31/2017 4:25:17 PM ******/
BEGIN
SELECT COUNT(*) INTO iExists FROM USER_OBJECTS WHERE OBJECT_TYPE='TABLE' AND OBJECT_NAME='RM_FUNDS';
IF iExists = 1 THEN
EXECUTE IMMEDIATE
 'DROP TABLE RM_FUNDS';
END IF;
END;

BEGIN
EXECUTE IMMEDIATE
'CREATE TABLE RM_FUNDS(
  AUTO_CHECK_DETAIL varchar(30) NULL,
  ROLLUP_ID number NULL,
  VOID_DATE varchar(8) NULL,
  ADDR1 varchar(100) NULL,
  ADDR2 varchar(100) NULL,
  AUTO_CHECK_FLAG number NULL,
  CITY varchar(50) NULL,
  CLAIMANT_EID_ARCHIVE number NULL,
  COUNTRY_CODE number NULL,
  FIRST_NAME varchar(255) NULL,
  LAST_NAME varchar(255) NULL,
  PRECHECK_FLAG number NULL,
  STATE_ID number NULL,
  UNIT_ID_ARCHIVE number NULL,
  ZIP_CODE varchar(10) NULL,
  TRANS_ID number NOT NULL,
  CLAIM_ID number NULL,
  CLAIM_NUMBER varchar(25) NULL,
  CTL_NUMBER varchar(25) NULL,
  VOID_FLAG number NULL,
  DATE_OF_CHECK varchar(8) NULL,
  CHECK_MEMO varchar(255) NULL,
  TRANS_NUMBER number NULL,
  TRANS_DATE varchar(8) NOT NULL,
  PAYEE_EID number NULL,
  PAYEE_TYPE_CODE number NULL,
  ACCOUNT_ID number NULL,
  AMOUNT decimal(10, 2) NULL,
  STATUS_CODE number NULL,
  FILED_1099_FLAG number NULL,
  CLEARED_FLAG number NULL,
  PAYMENT_FLAG number NULL,
  COLLECTION_FLAG number NULL,
  COMMENTS clob NULL,
  NOTES varchar(2000) NULL,
  CRC number NULL,
  DTTM_RCD_LAST_UPD varchar(14) NULL,
  DTTM_RCD_ADDED varchar(14) NULL,
  UPDATED_BY_USER varchar(50) NULL,
  ADDED_BY_USER varchar(50) NULL,
  BATCH_NUMBER number NULL,
  SEC_DEPT_EID number NULL,
  ENCLOSURE_FLAG number NULL,
  APPROVE_USER varchar(50) NULL,
  DTTM_APPROVAL varchar(14) NULL,
  SUB_ACCOUNT_ID number NULL,
  SETTLEMENT_FLAG number NULL,
  APPROVER_ID number NULL,
  VOUCHER_FLAG number NULL,
  WEEKS_PAID_CODE number NULL,
  NUM_OF_PAID_DAYS number NULL,
  TAX_PAYMENT_FLAG number NULL,
  RESUBMIT_EDI number NULL,
  SUPP_PAYMENT_FLAG number NULL,
  HTMLCOMMENTS clob NULL,
  REISSUE_FLAG number NULL,
  REISSUE_BY varchar(50) NULL,
  REISSUE_DATE varchar(8) NULL,
  REISSUE_PARENT_ID number NULL,
  NOTES_HTMLCOMMENTS clob NULL,
  REISSUE_REASON_CODE number NULL,
  MIDDLE_NAME varchar(255) NULL,
  REASON varchar(255) NULL,
  CONF_FLAG number NULL,
  CONF_EVENT_ID number NULL,
  VOID_REASON clob NULL,
  VOID_REASON_HTMLCOMMENTS clob NULL,
  DORMANCY_STATUS number NOT NULL,
  WITHHOLDING_PMT_FLAG number NOT NULL,
  WITHHOLDING_TYPE number NOT NULL,
  WITHHOLDING_CHILD_FLAG number NOT NULL,
  PARENT_TRANS_ID number NOT NULL,
  COMBINED_PAY_FLAG number NOT NULL,
  PAY_TO_THE_ORDER_OF clob NULL,
  EFT_FLAG number NULL,
  EFT_FILE_NAME varchar(255) NULL,
  EFT_DATE varchar(8) NULL,
  PMT_CURRENCY_CODE number NOT NULL,
  PMT_CURRENCY_AMOUNT decimal(10, 2) NOT NULL,
  PMT_TO_BASE_CUR_RATE_AR decimal(10, 2) NULL,
  CLAIM_CURRENCY_CODE number NOT NULL,
  CLAIM_CURRENCY_AMOUNT decimal(10, 2) NOT NULL,
  PMT_TO_CLAIM_CUR_RATE_AR decimal(10, 2) NULL,
  BASE_TO_PMT_CUR_RATE_AR decimal(10, 2) NULL,
  BASE_TO_CLAIM_CUR_RATE_AR decimal(10, 2) NULL,
  FINAL_PAYMENT_FLAG number NULL,
  BILL_TYPE number NULL,
  MANUAL_CHECK number NOT NULL,
  CHECK_MEMO_HTMLCOMMENTS clob NULL,
  RES_SUPP_PAYMENT_FLAG number NOT NULL,
  OFFSET_FLAG number NULL,
  CHECK_TOTAL decimal(10, 2) NOT NULL,
  ADDR3 varchar(100) NULL,
  ADDR4 varchar(100) NULL,
  STOP_PAY_FLAG number NULL,
  STOP_PAY_DATE varchar(8) NULL,
  DSTRBN_TYPE_CODE number NULL,
  DEDUCTIBLE_CATEGORY number NULL,
  TRANSACTION_REASON number NULL,
  MAIL_TO_EID number NULL,
  MAIL_TO_ADDRESS_ID number NULL,
  COUNTY varchar(200) NULL,
  POLICY_CURRENCY_CODE number NOT NULL,
  POLICY_CURRENCY_AMOUNT decimal(10, 2) NOT NULL,
  POLICY_TO_BASE_CUR_RATE_AR decimal(10, 2) NULL,
  BASE_TO_POLICY_CUR_RATE_AR decimal(10, 2) NULL,
  EOB_PRINT_DATE varchar(8) NULL,
  EOB_PRINTED_BY_USER varchar(50) NULL,
  DISABLE_OVERRIDE_DED number NULL,
  REGEOB_BATCH_ID number NULL,
  IAIABC_ADJUST_DATE varchar(8) NULL,
  IAIABC_CREDIT_DATE varchar(8) NULL,
  IAIABC_REDIST_DATE varchar(8) NULL,
  EDI_BATCH_NUMBER number NULL,
  EDI_MED_EXTRACTED number NULL,
  JOBID number NULL
  )';

EXECUTE IMMEDIATE 
'ALTER TABLE RM_FUNDS 
  ADD CONSTRAINT PK_RM_FUNDS PRIMARY KEY (TRANS_ID)
  ADD CONSTRAINT IDX_RM_FUNDS_CTL_NUMBER UNIQUE (CTL_NUMBER)
  MODIFY REISSUE_REASON_CODE DEFAULT 0
  MODIFY DORMANCY_STATUS DEFAULT 0
  MODIFY WITHHOLDING_PMT_FLAG DEFAULT 0
  MODIFY WITHHOLDING_TYPE DEFAULT 0
  MODIFY WITHHOLDING_CHILD_FLAG DEFAULT 0
  MODIFY PARENT_TRANS_ID DEFAULT 0
  MODIFY COMBINED_PAY_FLAG DEFAULT 0
  MODIFY EFT_FLAG DEFAULT 0
  MODIFY PMT_CURRENCY_CODE DEFAULT 0
  MODIFY PMT_CURRENCY_AMOUNT DEFAULT 0
  MODIFY PMT_TO_BASE_CUR_RATE_AR DEFAULT 0
  MODIFY CLAIM_CURRENCY_CODE DEFAULT 0
  MODIFY CLAIM_CURRENCY_AMOUNT DEFAULT 0
  MODIFY PMT_TO_CLAIM_CUR_RATE_AR DEFAULT 0
  MODIFY BASE_TO_PMT_CUR_RATE_AR DEFAULT 0
  MODIFY BASE_TO_CLAIM_CUR_RATE_AR DEFAULT 0
  MODIFY FINAL_PAYMENT_FLAG DEFAULT 0
  MODIFY MANUAL_CHECK DEFAULT 0
  MODIFY RES_SUPP_PAYMENT_FLAG DEFAULT 0
  MODIFY CHECK_TOTAL DEFAULT 0
  MODIFY STOP_PAY_FLAG DEFAULT 0
  MODIFY DEDUCTIBLE_CATEGORY DEFAULT NULL
  MODIFY POLICY_CURRENCY_CODE DEFAULT 0
  MODIFY POLICY_CURRENCY_AMOUNT DEFAULT 0
  MODIFY POLICY_TO_BASE_CUR_RATE_AR DEFAULT 0
  MODIFY BASE_TO_POLICY_CUR_RATE_AR DEFAULT 0';

END;

--=======================================================
--RM_FUNDS_SUPP
--=======================================================
--/****** Object:  Table RM_FUNDS_SUPP    Script Date: 5/31/2017 4:26:12 PM ******/
BEGIN
SELECT COUNT(*) INTO iExists FROM USER_OBJECTS WHERE OBJECT_TYPE='TABLE' AND OBJECT_NAME='RM_FUNDS_SUPP';
IF iExists = 1 THEN
EXECUTE IMMEDIATE
 'DROP TABLE RM_FUNDS_SUPP';
END IF;
END;

BEGIN
EXECUTE IMMEDIATE
'CREATE TABLE RM_FUNDS_SUPP(
  TRANS_ID number NOT NULL,
  INT_CLAIM_TEXT varchar(21) NULL,
  LSS_INVOICE_ID decimal(10, 2) NULL,
  LSS_HISTORY_ID decimal(10, 2) NULL,
  LSS_USER_ID varchar(50) NULL,
  NETWRK_SRVC_CODE number NULL,
  BILL_RCVD_DATE varchar(8) NULL,
  BILL_RCDMBR_DATE varchar(8) NULL,
  OTH_VEN_DOC_TEXT varchar(25) NULL,
  BILL_DOC_NO_TEXT varchar(25) NULL,
  BILL_REV_CM_EID number NULL,
  LSS_INV_REQ_AMT decimal(10, 2) NULL,
  LSS_APPROVED_AMT decimal(10, 2) NULL,
  LSS_INV_FINAL_DATE varchar(8) NULL,
  LSS_PAY_DISCOUNT decimal(10, 2) NULL,
  BENEFIT_ADJUST number NULL,
  BENEFIT_START varchar(8) NULL,
  BENEFIT_END varchar(8) NULL,
  BENEFIT_TRAN number NULL,
  BENEFIT_ADJ_AMT decimal(10, 2) NULL,
  BEN_ADJUST_R3 number NULL,
  ADJUST_AMT decimal(10, 2) NULL,
  ADJUST_START varchar(8) NULL,
  ADJUST_END varchar(8) NULL,
  ADJUST_TRAN number NULL,
  BENEFIT_CREDIT number NULL,
  CREDIT_AMT decimal(10, 2) NULL,
  CREDIT_START varchar(8) NULL,
  CREDIT_END varchar(8) NULL,
  CREDIT_TRAN number NULL,
  BENEFIT_RED number NULL,
  REDISTR_AMT decimal(10, 2) NULL,
  REDISTR_START varchar(8) NULL,
  REDISTR_END varchar(8) NULL,
  REDISTR_TRAN number NULL,
  GROSS_AMT_DATE varchar(8) NULL,
  NET_WKLY_AMT decimal(10, 2) NULL,
  NET_AMT_DATE varchar(8) NULL,
  SETTLMT_TYPE number NULL,
  DATE_MTC_EXTRACTED varchar(8) NULL,
  RECOVERY_BENEFIT_TRAN number NULL,
  SETTLE_CHECK_DATE varchar(8) NULL,
  EDI_DN0174A_AMT decimal(10, 2) NULL,
  JOBID number NULL
  )';

EXECUTE IMMEDIATE 'ALTER TABLE RM_FUNDS_SUPP ADD CONSTRAINT PK_RM_FUNDS_SUPP PRIMARY KEY (TRANS_ID)';

END;

--=======================================================
--RM_FUNDS_TRANS_SPLIT
--=======================================================
--/****** Object:  Table RM_FUNDS_TRANS_SPLIT    Script Date: 5/31/2017 4:26:29 PM ******/
BEGIN
SELECT COUNT(*) INTO iExists FROM USER_OBJECTS WHERE OBJECT_TYPE='TABLE' AND OBJECT_NAME='RM_FUNDS_TRANS_SPLIT';
IF iExists = 1 THEN
EXECUTE IMMEDIATE
 'DROP TABLE RM_FUNDS_TRANS_SPLIT';
END IF;
END;

BEGIN
EXECUTE IMMEDIATE
'CREATE TABLE RM_FUNDS_TRANS_SPLIT(
  SUM_AMOUNT decimal(10, 2) NULL,
  SPLIT_ROW_ID number NOT NULL,
  TRANS_ID number NULL,
  TRANS_TYPE_CODE number NULL,
  RESERVE_TYPE_CODE_ARCHIVE number NULL,
  AMOUNT decimal(10, 2) NULL,
  GL_ACCOUNT_CODE number NULL,
  FROM_DATE varchar(8) NULL,
  TO_DATE varchar(8) NULL,
  INVOICED_BY varchar(50) NULL,
  INVOICE_AMOUNT decimal(10, 2) NULL,
  INVOICE_NUMBER varchar(30) NULL,
  PO_NUMBER varchar(14) NULL,
  CRC number NULL,
  DTTM_RCD_LAST_UPD varchar(14) NULL,
  DTTM_RCD_ADDED varchar(14) NULL,
  UPDATED_BY_USER varchar(50) NULL,
  ADDED_BY_USER varchar(50) NULL,
  INVOICE_DATE varchar(8) NULL,
  BILL_RCVD_BY_CARRIER_DATE varchar(8) NULL,
  SUPP_PAYMENT_FLAG number NULL,
  AUTO_DISCOUNT varchar(10) NULL,
  SPLIT_CURR_CODE_AR decimal(10, 2) NULL,
  SPLIT_CURRENCY_AMOUNT_AR decimal(10, 2) NULL,
  SPLIT_CURR_INVOICE_AMOUNT_AR decimal(10, 2) NULL,
  SPLIT_CURR_AUTO_DISCOUNT_AR decimal(10, 2) NULL,
  SPLIT_TO_BASE_CURR_RATE_AR decimal(10, 2) NULL,
  BASE_TO_SPLIT_CURR_RATE_AR decimal(10, 2) NULL,
  SPLIT_TO_PMT_CURR_RATE_AR decimal(10, 2) NULL,
  POLCVG_ROW_ID_ARCHIVE number NULL,
  IS_FIRST_FINAL number NULL,
  WITHHOLDING_SPLIT_FLAG number NOT NULL,
  PARENT_SPLIT_ROW_ID number NULL,
  CONTROL_REQ_FLAG number NULL,
  FUNDS_CR_STATUS number NULL,
  PMT_CURRENCY_AMOUNT decimal(10, 2) NOT NULL,
  PMT_CURRENCY_INVOICE_AMOUNT_AR decimal(10, 2) NULL,
  PMT_CURRENCY_AUTO_DISCOUNT decimal(10, 2) NOT NULL,
  CLAIM_CURRENCY_AMOUNT decimal(10, 2) NOT NULL,
  CLAIM_CURR_INVOICE_AMT_AR decimal(10, 2) NULL,
  CLAIM_CURRENCY_AUTO_DISCOUNT decimal(10, 2) NOT NULL,
  UPDATE_POL_SYS number NULL,
  POLICY_SYSTEM_ID number NOT NULL,
  RC_ROW_ID number NOT NULL,
  LEGACY_UNIQUE_IDENTIFIER varchar(100) NULL,
  OVERRIDE_DED_FLAG number NOT NULL,
  POLICY_CURRENCY_AMOUNT decimal(10, 2) NOT NULL,
  POLICY_CURR_INVOICE_AMT_AR decimal(10, 2) NULL,
  CURRENCY_CONVERSION_DATE varchar(14) NULL,
  PMT_TO_BASE_CUR_RATE decimal(10, 2) NULL,
  PMT_TO_CLAIM_CUR_RATE decimal(10, 2) NULL,
  PMT_TO_POLICY_CUR_RATE decimal(10, 2) NULL,
  INVOICE_CURRENCY_CODE number NULL,
  JOBID number NULL
  )';
  
EXECUTE IMMEDIATE 
'ALTER TABLE RM_FUNDS_TRANS_SPLIT 
  ADD CONSTRAINT PK_RM_FUNDS_TRANS_SPLIT PRIMARY KEY (SPLIT_ROW_ID)
  MODIFY POLCVG_ROW_ID_ARCHIVE DEFAULT 0
  MODIFY WITHHOLDING_SPLIT_FLAG DEFAULT 0
  MODIFY PMT_CURRENCY_AMOUNT DEFAULT 0
  MODIFY PMT_CURRENCY_INVOICE_AMOUNT_AR DEFAULT 0
  MODIFY PMT_CURRENCY_AUTO_DISCOUNT DEFAULT 0
  MODIFY CLAIM_CURRENCY_AMOUNT DEFAULT 0
  MODIFY CLAIM_CURR_INVOICE_AMT_AR DEFAULT 0
  MODIFY CLAIM_CURRENCY_AUTO_DISCOUNT DEFAULT 0
  MODIFY POLICY_SYSTEM_ID DEFAULT 0
  MODIFY RC_ROW_ID DEFAULT 0
  MODIFY OVERRIDE_DED_FLAG DEFAULT 0
  MODIFY POLICY_CURRENCY_AMOUNT DEFAULT 0
  MODIFY POLICY_CURR_INVOICE_AMT_AR DEFAULT 0';

END;

--=======================================================
--RM_FUNDS_X_PAYEE
--=======================================================
--/****** Object:  Table RM_FUNDS_X_PAYEE    Script Date: 5/31/2017 4:26:45 PM ******/
BEGIN
SELECT COUNT(*) INTO iExists FROM USER_OBJECTS WHERE OBJECT_TYPE='TABLE' AND OBJECT_NAME='RM_FUNDS_X_PAYEE';
IF iExists = 1 THEN
EXECUTE IMMEDIATE
 'DROP TABLE RM_FUNDS_X_PAYEE';
END IF;
END;

BEGIN
EXECUTE IMMEDIATE
'CREATE TABLE RM_FUNDS_X_PAYEE(
  PAYEE_ROW_ID number NOT NULL,
  PAYEE_EID number NOT NULL,
  FUNDS_TRANS_ID number NOT NULL,
  PAYEE_1099_FLAG number NOT NULL,
  DTTM_RCD_ADDED varchar(14) NOT NULL,
  DTTM_RCD_LAST_UPD varchar(14) NOT NULL,
  ADDED_BY_USER varchar(50) NOT NULL,
  UPDATED_BY_USER varchar(50) NOT NULL,
  PAYEE_TYPE_CODE number NOT NULL,
  PHRASE_TYPE_CODE number NOT NULL,
  BEFORE_PAYEE number NOT NULL,
  JOBID number NULL
)'; 

EXECUTE IMMEDIATE 
'ALTER TABLE RM_FUNDS_X_PAYEE 
  MODIFY PAYEE_TYPE_CODE DEFAULT 0
  MODIFY PHRASE_TYPE_CODE DEFAULT 0
  MODIFY BEFORE_PAYEE DEFAULT 0';

END;

--=======================================================
--RM_INVDETAIL_X_DIAG
--=======================================================
--/****** Object:  Table RM_INVDETAIL_X_DIAG    Script Date: 5/31/2017 4:27:08 PM ******/
BEGIN
SELECT COUNT(*) INTO iExists FROM USER_OBJECTS WHERE OBJECT_TYPE='TABLE' AND OBJECT_NAME='RM_INVDETAIL_X_DIAG';
IF iExists = 1 THEN
EXECUTE IMMEDIATE
 'DROP TABLE RM_INVDETAIL_X_DIAG';
END IF;
END;

BEGIN
EXECUTE IMMEDIATE
'CREATE TABLE RM_INVDETAIL_X_DIAG(
  INVOICE_DETAIL_ID number NOT NULL,
  DIAGNOSIS_CODE number NOT NULL,
  JOBID number NULL
  )';

EXECUTE IMMEDIATE 'ALTER TABLE RM_INVDETAIL_X_DIAG ADD CONSTRAINT PK_RM_INVDETAIL_X_DIAG PRIMARY KEY (INVOICE_DETAIL_ID, DIAGNOSIS_CODE)';

END;

--=======================================================
--RM_INVDETAIL_X_DIAG_ICD10
--=======================================================
--/****** Object:  Table RM_INVDETAIL_X_DIAG_ICD10    Script Date: 5/31/2017 4:27:27 PM ******/
BEGIN
SELECT COUNT(*) INTO iExists FROM USER_OBJECTS WHERE OBJECT_TYPE='TABLE' AND OBJECT_NAME='RM_INVDETAIL_X_DIAG_ICD10';
IF iExists = 1 THEN
EXECUTE IMMEDIATE
 'DROP TABLE RM_INVDETAIL_X_DIAG_ICD10';
END IF;
END;

BEGIN
EXECUTE IMMEDIATE
'CREATE TABLE RM_INVDETAIL_X_DIAG_ICD10(
  INVOICE_DETAIL_ID number NOT NULL,
  DIAGNOSIS_CODE number NOT NULL,
  JOBID number NULL
  )';

EXECUTE IMMEDIATE 'ALTER TABLE RM_INVDETAIL_X_DIAG_ICD10 ADD CONSTRAINT PK_RM_INVDETAIL_X_DIAG_ICD10 PRIMARY KEY (INVOICE_DETAIL_ID, DIAGNOSIS_CODE)';

END;

--=======================================================
--RM_INVDETAIL_X_EOB
--=======================================================
--/****** Object:  Table RM_INVDETAIL_X_EOB    Script Date: 5/31/2017 4:27:39 PM ******/
BEGIN
SELECT COUNT(*) INTO iExists FROM USER_OBJECTS WHERE OBJECT_TYPE='TABLE' AND OBJECT_NAME='RM_INVDETAIL_X_EOB';
IF iExists = 1 THEN
EXECUTE IMMEDIATE
 'DROP TABLE RM_INVDETAIL_X_EOB';
END IF;
END;

BEGIN
EXECUTE IMMEDIATE
'CREATE TABLE RM_INVDETAIL_X_EOB(
  INVOICE_DETAIL_ID number NOT NULL,
  EOB_CODE number NOT NULL,
  EOB_TABLE number NOT NULL,
  JOBID number NULL
  )';

EXECUTE IMMEDIATE 'ALTER TABLE RM_INVDETAIL_X_EOB ADD CONSTRAINT PK_RM_INVDETAIL_X_EOB PRIMARY KEY (INVOICE_DETAIL_ID, EOB_CODE, EOB_TABLE)';

END;

--=======================================================
--RM_INVDETAIL_X_MOD
--=======================================================
--/****** Object:  Table RM_INVDETAIL_X_MOD    Script Date: 5/31/2017 4:28:15 PM ******/
BEGIN
SELECT COUNT(*) INTO iExists FROM USER_OBJECTS WHERE OBJECT_TYPE='TABLE' AND OBJECT_NAME='RM_INVDETAIL_X_MOD';
IF iExists = 1 THEN
EXECUTE IMMEDIATE
 'DROP TABLE RM_INVDETAIL_X_MOD';
END IF;
END;

BEGIN
EXECUTE IMMEDIATE
'CREATE TABLE RM_INVDETAIL_X_MOD(
  INVOICE_DETAIL_ID number NOT NULL,
  MODIFIER_CODE number NOT NULL,
  MODIFIER_ORDER number NULL,
  JOBID number NULL
  )';

EXECUTE IMMEDIATE 'ALTER TABLE RM_INVDETAIL_X_MOD ADD CONSTRAINT PK_RM_INVDETAIL_X_MOD PRIMARY KEY (INVOICE_DETAIL_ID, MODIFIER_CODE)';

END;

--=======================================================
--RM_INVOICE
--=======================================================
--/****** Object:  Table RM_INVOICE    Script Date: 5/31/2017 4:28:31 PM ******/
BEGIN
SELECT COUNT(*) INTO iExists FROM USER_OBJECTS WHERE OBJECT_TYPE='TABLE' AND OBJECT_NAME='RM_INVOICE';
IF iExists = 1 THEN
EXECUTE IMMEDIATE
 'DROP TABLE RM_INVOICE';
END IF;
END;

BEGIN
EXECUTE IMMEDIATE
'CREATE TABLE RM_INVOICE(
  INVOICE_ID number NOT NULL,
  FUNDS_TRANS_ID number NULL,
  CLAIM_ID number NULL,
  CLAIM_NUMBER_TEXT varchar(50) NULL,
  CLAIMANT_EID number NULL,
  UNIT_ID number NULL,
  PAYEE_TYPE_CODE number NULL,
  PAYEE_EID number NULL,
  PAYEE_SPEC_CODE number NULL,
  LAST_NAME_TEXT varchar(255) NULL,
  FIRST_NAME_TEXT varchar(255) NULL,
  ADDR1_TEXT varchar(100) NULL,
  ADDR2_TEXT varchar(100) NULL,
  CITY_TEXT varchar(50) NULL,
  STATE_ID number NULL,
  COUNTRY_CODE number NULL,
  POSTAL_CODE_TEXT varchar(15) NULL,
  TRANS_DATE_TEXT varchar(8) NULL,
  TOT_SCHEDULED_AMT decimal(10, 2) NULL,
  TOT_REDUCTION_AMT decimal(10, 2) NULL,
  TOT_AMT_TO_PAY decimal(10, 2) NULL,
  TOT_AMT_SAVED decimal(10, 2) NULL,
  TOT_AMT_BILLED decimal(10, 2) NULL,
  NUM_DETAIL_LINES number NULL,
  DTTM_RCD_ADDED varchar(14) NULL,
  ADDED_BY_USER varchar(50) NULL,
  DTTM_RCD_LAST_UPD varchar(14) NULL,
  UPDATED_BY_USER varchar(50) NULL,
  DTTM_EOB_PRINTED varchar(14) NULL,
  EOB_PRINTED_USER varchar(50) NULL,
  PPO_REDUCTION_AMT decimal(10, 2) NULL,
  OTH_REDUCTION_AMT decimal(10, 2) NULL,
  ADDR3_TEXT varchar(100) NULL,
  ADDR4_TEXT varchar(100) NULL,
  JOBID number NULL  
  )';

EXECUTE IMMEDIATE 'ALTER TABLE RM_INVOICE ADD CONSTRAINT PK_RM_INVOICE PRIMARY KEY (INVOICE_ID)';

END;

--=======================================================
--RM_INVOICE_DETAIL
--=======================================================
--/****** Object:  Table RM_INVOICE_DETAIL    Script Date: 5/31/2017 4:28:50 PM ******/
BEGIN
SELECT COUNT(*) INTO iExists FROM USER_OBJECTS WHERE OBJECT_TYPE='TABLE' AND OBJECT_NAME='RM_INVOICE_DETAIL';
IF iExists = 1 THEN
EXECUTE IMMEDIATE
 'DROP TABLE RM_INVOICE_DETAIL';
END IF;
END;

BEGIN
EXECUTE IMMEDIATE
'CREATE TABLE RM_INVOICE_DETAIL(
  INVOICE_DETAIL_ID number NOT NULL,
  INVOICE_ID number NULL,
  FUNDS_SPLIT_ROW_ID number NULL,
  TABLE_CODE number NULL,
  PERCENTILE varchar(4) NULL,
  PLACE_OF_SER_CODE number NULL,
  TYPE_OF_SER_CODE number NULL,
  BILLING_CODE_TEXT varchar(64) NULL,
  UNITS_BILLED_NUM decimal(10, 2) NULL,
  UNITS_BILLED_TYPE number NULL,
  AMOUNT_BILLED decimal(10, 2) NULL,
  SCHEDULED_AMOUNT decimal(10, 2) NULL,
  AMOUNT_REDUCED decimal(10, 2) NULL,
  AMOUNT_TO_PAY decimal(10, 2) NULL,
  AMOUNT_SAVED decimal(10, 2) NULL,
  TOOTH_NUMBER number NULL,
  SURFACE_TEXT varchar(50) NULL,
  MODIFIER_CODE number NULL,
  QUANTITY varchar(6) NULL,
  STORE varchar(11) NULL,
  CONTRACT_EXISTS number NULL,
  OVERRIDE_TYPE number NULL,
  CONTRACT_AMOUNT decimal(10, 2) NULL,
  DISCOUNT decimal(10, 2) NULL,
  AMOUNT_ALLOWED decimal(10, 2) NULL,
  BASE_AMOUNT decimal(10, 2) NULL,
  ZIP_CODE varchar(10) NULL,
  FEE_TABLE_AMT decimal(10, 2) NULL,
  PER_DIEM_AMT decimal(10, 2) NULL,
  STOP_LOSS_AMT decimal(10, 2) NULL,
  STOP_LOSS_FLAG number NULL,
  FEE_DATA_SOURCE number NULL,
  FEE_TABLE_STATE varchar(2) NULL,
  FEE_TABLE_STUDY varchar(5) NULL,
  FEE_DATA_REVISION varchar(3) NULL,
  PRESCRIP_NO varchar(30) NULL,
  DRUG_NAME varchar(80) NULL,
  PRESCRIP_DATE varchar(8) NULL,
  DAYS_SUPPLIED number NULL,
  DATE_FILLED varchar(8) NULL,
  REV_CODE varchar(4) NULL,
  PHY_EID number NULL,
  MED_SUPPLY_FLAG number NULL,
  DIAG_REF_NO varchar(4) NULL,
  TABLE_CODE_2 number NULL,
  BRS_FEE_AMT1 decimal(10, 2) NULL,
  BRS_FEE_AMT2 decimal(10, 2) NULL,
  MEDS_QUANTITY number NULL,
  RX_IND number NULL,
  CERTIFICATION number NULL,
  RX_USUAL_CHARGE decimal(10, 2) NULL,
  PHY_PHARM_NDC varchar(20) NULL,
  PHY_PHARM_NDC_DES varchar(50) NULL,
  FL_LICENSE varchar(25) NULL,
  DISPENSED number NULL,
  HCPCS_CODE varchar(5) NULL,
  PURCHASED_IND number NULL,
  BILL_TYPE number NULL,
  PPO_REDUCTION_AMT decimal(10, 2) NULL,
  OTH_REDUCTION_AMT decimal(10, 2) NULL,
  DENY_LINE_ITEM number NULL,
  PHY_PHARM_NDC_SEC varchar(20) NULL,
  PHY_PHARM_NDC_SEC_DES varchar(50) NULL,
  COUNTY varchar(20) NULL,
  SCHEDULED_TYPE number NULL,
  INPATIENT_TYPE number NULL,
  OUTPATIENT_TYPE number NULL,
  JOBID number NULL
  )';

EXECUTE IMMEDIATE 'ALTER TABLE RM_INVOICE_DETAIL ADD CONSTRAINT PK_RM_INVOICE_DETAIL PRIMARY KEY (INVOICE_DETAIL_ID)';

END;


--=======================================================
--T_MBR_FILTER_RC0
--=======================================================
--/****** Object: Table T_MBR_FILTER_RC0 Script Date: 9/10/2019 4:28:50 PM ******/
BEGIN
SELECT COUNT(*) INTO iExists FROM USER_OBJECTS WHERE OBJECT_TYPE='TABLE' AND OBJECT_NAME='T_MBR_FILTER_RC0';
IF iExists = 1 THEN
EXECUTE IMMEDIATE
 'DROP TABLE T_MBR_FILTER_RC0';
END IF;
END;

BEGIN
EXECUTE IMMEDIATE
'CREATE TABLE T_MBR_FILTER_RC0(
	CLAIM_ID number NULL,
	CLAIMANT_EID number NULL,
	PAID_TOTAL decimal(10, 2) NULL,
	RESERVE_TYPE_CODE number NULL,
	COLLECTION_TOTAL decimal(10, 2) NULL,
	LINE_OF_BUS_CODE number NULL,
	CLAIM_STATUS_CODE varchar(25) NULL, 
	COLL_IN_RSV_BAL number NULL,
	BAL_TO_ZERO number NULL,
	NEG_BAL_TO_ZERO number NULL,
	ADJ_RSV number NULL,
	COLL_IN_INCUR_BAL number NULL,
	RC_ROW_ID number NULL,
	POLICY_CURR_PAID_TOTAL decimal(10, 2) NULL,
	POLICY_CURR_COLLECTION_TOTAL decimal(10, 2) NULL,
	CLAIM_CURRENCY_PAID_TOTAL decimal(10, 2) NULL,
	CLAIM_CURR_COLLECTION_TOTAL decimal(10, 2) NULL,
	JOBID number NULL
 )';
END;


--=======================================================
--T_MBR_FILTER_RC
--=======================================================
--/****** Object: Table T_MBR_FILTER_RC Script Date: 9/10/2019 4:28:50 PM ******/
BEGIN
SELECT COUNT(*) INTO iExists FROM USER_OBJECTS WHERE OBJECT_TYPE='TABLE' AND OBJECT_NAME='T_MBR_FILTER_RC';
IF iExists = 1 THEN
EXECUTE IMMEDIATE
 'DROP TABLE T_MBR_FILTER_RC';
END IF;
END;

BEGIN
EXECUTE IMMEDIATE
'CREATE TABLE T_MBR_FILTER_RC(
	DA_ROW_ID number NULL,
	JOBID number NULL,
	INPUT_ROW_ID number NULL,
	INVALID_ROW number NULL,
	UPDATE_ROW number NULL,
	BALANCE_AMOUNT decimal(10, 2) NULL,
	RC_ROW_ID number NULL,
	CLAIM_ID number NULL,
	UNIT_ID number NULL,
	CLAIMANT_EID number NULL,
	RESERVE_TYPE_CODE number NULL,
	RESERVE_AMOUNT decimal(10, 2) NULL,
	INCURRED_AMOUNT decimal(10, 2) NULL,
	COLLECTION_TOTAL decimal(10, 2) NULL,
	PAID_TOTAL decimal(10, 2) NULL,
	DATE_ENTERED varchar(8) NULL,
	ENTERED_BY_USER varchar(8) NULL,
	REASON varchar(30) NULL,
	UPDATED_BY_USER varchar(8) NULL,
	DTTM_RCD_ADDED varchar(14) NULL,
	DTTM_RCD_LAST_UPD varchar(14) NULL,
	ADDED_BY_USER varchar(8) NULL,
	CRC number NULL,
	SEC_DEPT_EID number NULL,
	RES_STATUS_CODE number NULL,
	ALLOCATED_AMOUNT decimal(10, 2) NULL,
	CONF_FLAG number NULL,
	CONF_EVENT_ID number NULL,
	POLCVG_ROW_ID number NULL,
	STAGING_ID number NULL,
	CURRENT_RESERVE_AMOUNT decimal(10, 2) NULL,
	BAL_TO_ZERO number NULL,
	COLL_IN_RSV_BAL number NULL,
	NEG_BAL_TO_ZERO number NULL,
	ADJ_RSV number NULL,
	COLL_IN_INCUR_BAL number NULL,
	CLAIM_STATUS_CODE varchar(25) NULL,
	RESERVE_CATEGORY varchar(4) NULL,
	CLAIM_CURR_BALANCE_AMT decimal(10, 2) NULL,
	CLAIM_CURR_INCURRED_AMT decimal(10, 2) NULL,
	POLICY_CURR_BALANCE_AMT decimal(10, 2) NULL,
	POLICY_CURR_INCURRED_AMT decimal(10, 2) NULL,
	CLAIM_CURR_RESERVE_AMT decimal(10, 2) NULL,
	POLICY_CURR_RESERVE_AMT decimal(10, 2) NULL,
	POLICY_CURR_PAID_TOTAL decimal(10, 2) NULL,
	POLICY_CURR_COLLECTION_TOTAL decimal(10, 2) NULL,
	CLAIM_CURRENCY_PAID_TOTAL decimal(10, 2) NULL,
	CLAIM_CURR_COLLECTION_TOTAL decimal(10, 2) NULL,
	PAYMENT_AMOUNT decimal(10, 2) NULL,
	CLAIM_CURRENCY_AMOUNT decimal(10, 2) NULL,
	POLICY_CURRENCY_AMOUNT decimal(10, 2) NULL,
	PREV_PRINT_TOTAL decimal(10, 2) NULL,
	PREV_POLICY_PRINT_TOTAL decimal(10, 2) NULL,
	PREV_POLICY_ALLOCATED_TOTAL decimal(10, 2) NULL,
	PREV_CLAIM_PRINT_TOTAL decimal(10, 2) NULL,
	PREV_CLAIM_ALLOCATED_TOTAL decimal(10, 2) NULL,
	PREV_ALLOCATED_AMOUNT decimal(10, 2) NULL,
	PAYMENT_FLAG number NULL
 )';
END;


COMMIT;

END;
END IF;
END;


	
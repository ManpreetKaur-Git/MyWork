-- ============================================================
--   SCRIPT HEADER (DATABASE STRUCTURE)
--   DI Module Name: MBR
--   Template_MBR (rmA16.4 and above)
--   Structure Definition Script for
--   Table:	T_MBR_XML_SETTING,
--		T_MBR_LINEITEMS_TEMP,	--vgupta20 6/10/2011: Removed
--		T_MBR_LINEITEMS,
--		T_MBR_HEADER_TEMP,	--vgupta20 6/10/2011: Removed
--		T_MBR_HEADER_CORVEL,
--		T_MBR_HEADER,
--		T_MBR_ENTITY_SUFF,
--		T_MBR_EXTR,
--		ERROR_LOG,
--      FUNDS_SUPP, 
--      ENTITY_SUPP         
--   DATE:	23/03/2009 2:25:50 PM

--vgupta20 6/10/2011: Replicas of RMDB tables
-- 		ENTITY,
-- 		FUNDS,
-- 		FUNDS_TRANS_SPLIT,
-- 		RESERVE_CURRENT,
-- 		RESERVE_HISTORY,
-- 		INVOICE,
-- 		INVOICE_DETAIL,
-- 		INVDETAIL_X_DIAG,
-- 		INVDETAIL_X_MOD,
-- 		INVDETAIL_X_EOB,   --vgupta20 8/20/2011
-- 		CODES,
-- 		CODES_TEXT,
--		UNIQUE_CODE,
--		ACTIVITY_TRACK    --Added mpandey24 07/10/2013

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

---------------------------------------------------------------------

-- Create All the MBR Staging Tables


IF ((SELECT COUNT(*) AS isRMDB FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='SYS_PARMS')=1)
	BEGIN
		PRINT 'Error: Script Execution Aborted - Script trying to execute on RISKMASTER database not on DA Staging database. Please open the correct Staging database and execute this script.';
	END
ELSE
BEGIN

----------------------------------------------------------

--****** Object:  Table [dbo].[T_MBR_ADJLOGDATA]     *******
-- Create the table if not exists already
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[T_MBR_ADJLOGDATA]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[T_MBR_ADJLOGDATA]
BEGIN

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON

CREATE TABLE [dbo].[T_MBR_ADJLOGDATA](
	[DA_ROW_ID] [int] NOT NULL,
	[JOBID] [int] NOT NULL,
	[LOGIN_NAME] [varchar](50) NULL,
	[ADJUSTER_EID] [int] NULL,
	[RM_USER_ID] [int] NOT NULL,
	[ADJ_ROW_ID] [int] NULL,
	[CLAIM_ID] [int] NOT NULL,
	[CLAIM_NUMBER] [varchar](30) NULL,
	[SCHEDULE_USER_LOGIN] [varchar](50) NULL,
	[FILE_TYPE] [int] NOT NULL,
	[CLAIMANT_EID] [int] NOT NULL

CONSTRAINT [PK_T_MBR_ADJLOGDATA] PRIMARY KEY CLUSTERED 
(
	[JOBID] ASC,
	[DA_ROW_ID] ASC,
	[FILE_TYPE] ASC,
	[RM_USER_ID] ASC,
	[CLAIM_ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END

----------------------------------------------------------

--****** Object:  Table [dbo].[T_MBR_XML_SETTING]     *******
-- Create the table if not exists already
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[T_MBR_XML_SETTING]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[T_MBR_XML_SETTING]
BEGIN

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON

CREATE TABLE [dbo].[T_MBR_XML_SETTING](
	[JOBID] [int] NOT NULL,
	[JurisdictionStates1] [varchar](1024),
	[JurisdictionStates2] [varchar](1024),
	[ClearGrid] [int] NULL,
	[BillDocumentNumberCheck] [int] NULL,
	[ImportPrintedChecks] [int] NULL,
	[AppendLog] [int] NULL,
	[MBRPaymentsPrinted] [int] NULL,
	[MBRPayments2Printed] [int] NULL,
	[GenerateExceptionFile] [int] NULL,
	[ProcessClosedClaims] [int] NULL,
	[CorvelFeeTransType] [int] NULL,
	[CorvelFeeTransType2] [int] NULL,
	[PostDateType1] [varchar](1024),
	[PostDateType2] [varchar](1024),
	[EnclFlag] [int] NULL,
	[SearchbySSN] [int] NULL,
	[GetfirstPayee] [int] NULL,
	[DoNotAddPayee] [int] NULL,
	[FilterFrozenClaims] [int] NULL,
	[UseSuffixCode] [int] NULL,
	[CheckInsuffRes] [int] NULL,
	[CheckImportReason] [int] NULL,
	[CheckImportProviderInvNum] [int] NULL,
	[UseImportPayeeInfo] [int] NULL,
	[UsePayeeZipLookup] [int] NULL,
	[DuplicatesInclVoids] [int] NULL,
	[DuplicatesUseSvcDts] [int] NULL,
	[CorvelFeeIdentifier] [varchar](1024),
	[CorvelFeeIdentifier2] [varchar](1024),
	[FileType] [varchar](1024),
	[PipeFileName] [varchar](1024),
	[SourceFile] [varchar](1024),
	[UseProcessLog] [int] NULL,
	[ExcludeInvoice] [int] NULL,
	[PrintProcessLog] [int] NULL,
	[QueuedPayments] [int] NULL,
	[ExportDateOnUI] [varchar](1024),
	[Execution_Mode] [varchar](1024),
	[ExportType] [varchar](1024),
	[UpdateSuffix] [int] NULL,
	[UpdAllSuffixes] [int] NULL,
	[UpdateCodes] [int] NULL,
	[ImportMedFields] [int] NULL,
	[EntityTableIds] [varchar](2049),	--vsoni5 9/2/2011: Increasing field length for ( '1024' + ',' + '1024')
	[UseFeePayment] [int] NULL,
	[IncludeSuffix] [int] NULL,
	[RemoveSSN] [int] NULL,
	[LOBCodes] [varchar](1024),
	[OrgHier_To_Export][varchar](1024),
	[Entity_Category][varchar](1024),
	[ExportDateOnUIForEntity][varchar](25),
	[ServiceCode][varchar](1024),
	[ClaimStatus] [varchar](1024),
	[ClaimAjusterEx] [varchar](1024),
	[DistributionTypeCode] [int] NULL,

	 CONSTRAINT [PK_T_MBR_XML_SETTING] PRIMARY KEY CLUSTERED 
	(
			[JOBID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
END


----------------------------------------------------------

--****** Object:  Table [dbo].[T_MBR_LINEITEMS]     *******
-- Create the table if not exists already
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[T_MBR_LINEITEMS]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[T_MBR_LINEITEMS]
BEGIN

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON

CREATE TABLE [dbo].[T_MBR_LINEITEMS](
	[DA_ROW_ID] [int] NOT NULL,
	[INPUT_ROW_ID] [int] NULL,
	[INVALID_ROW] [int] NULL,
	[UPDATE_ROW] [int] NULL,
	[LI_LINE_NUMBER] [int] NULL,
	[BILL_DOCUMENT_NUMBER] [varchar](25),
	[LINE_ITEM_CPT] [varchar](10),
	[CPT_DESCRIPTION] [varchar](100),
	[LI_PLACE_OF_SER_CODE] [varchar](6),
	[LI_TYPE_OF_SER_CODE] [varchar](6),
	[LI_CHARGES] [decimal](19, 4) NULL,
	[LI_PAID] [decimal](19, 4) NULL,
	[LI_UNITS] [int] NULL,
	[LI_BEGIN_DATE] [varchar](16),
	[LI_END_DATE] [varchar](16),
	[TRANS_TYPE_CODE] [varchar](25),
	[SUFFIX] [varchar](14),
	[GOOD_RCD] [int] NULL,
	[INVOICE_DET_ID] [int] NULL,
	[INVOICE_ID] [int] NULL,
	[TRANS_ID] [int] NULL,
	[TTC] [int] NULL,
	[POS] [int] NULL,
	[TOS] [int] NULL,
	[SPLIT_ID] [int] NULL,
	[SCHEDULE_AMT] [float] NULL,
	[REDUCTION_AMT] [float] NULL,
	[REASON] [varchar](80),
	[PROV_INVOICE_NUMBER] [varchar](25),
	[PPO_REDUCTION_AMT] [decimal](10, 2) NULL,
	[OTH_REDUCTION_AMT] [decimal](10, 2) NULL,
	[JOBID] [int] NOT NULL,
	[NETWORK_SERVICE_CODE] [varchar](1) NULL,
	[PAID_PROC_CODE_MOD] [varchar](8) NULL,
	[PRIM_ICD9_DIAG_CODE] [varchar](14) NULL,
	[SEC_ICD9_DIAG_CODE] [varchar](14) NULL,
	[PROV_TYPE_CODE] [varchar](20) NULL,
	[PRIM_ICD10_DIAG_CODE] [varchar](14) NULL,	--MITS 33392 - ICD 10 Requiremnt
	[SEC_ICD10_DIAG_CODE] [varchar](14) NULL,	--MITS 33392 - ICD 10 Requiremnt
	[PRIM_ICD9_CODE_ID][int] NULL,				--MITS 33392 - ICD 10 Requiremnt
	[SEC_ICD9_CODE_ID][int] NULL,				--MITS 33392 - ICD 10 Requiremnt
	[PRIM_ICD10_CODE_ID][int] NULL,				--MITS 33392 - ICD 10 Requiremnt
	[SEC_ICD10_CODE_ID][int] NULL,				--MITS 33392 - ICD 10 Requiremnt
	[POLICY_ID][int] NULL,						--MITS 33029 - MBR Activity Track Enhancement
	[UNIT_ID] [int] NULL,
	[POLCVG_ROW_ID] [int] NULL,					--MITS 31409 - MBR Finnacial enhancement
	[CVG_LOSS_ROW_ID] [int] NULL,				--MITS 31409 - MBR Finnacial enhancement
	[POLICY_NAME] [varchar](20) NULL,
	[UNIT_TYPE][varchar] (6) NULL,
	[UNIT_NUMBER][varchar] (10) NULL, 			--mpandey24 MITS 33314: Field size changed to Varchar(10) 
	[COVERAGE_CODE][varchar] (25) NULL,
	[COVERAGE_TEXT][varchar] (100) NULL,
	[CVG_SEQUENCE_NO][varchar] (8) NULL,
	[TRANS_SEQ_NO][varchar] (8) NULL,
	[LOSS_CODE][varchar] (25) NULL,
	[DIS_CAT_CODE][varchar] (25) NULL,
	[DIS_LOSS_CODE][varchar] (25) NULL,
	[COVERAGE_CODE_ID][int] NULL,
	[LOSS_CODE_ID][int] NULL,
	[DIS_CAT_CODE_ID][int] NULL,
	[DIS_LOSS_CODE_ID][int] NULL,
	[RESERVE_SUB_TYPE][varchar](25) NULL,
	[RESERVE_SUB_TYPE_CODE_ID][int] NULL,
	[RC_ROW_ID] [int] NULL,
	 
	 CONSTRAINT [PK_T_MBR_LINEITEMS] PRIMARY KEY CLUSTERED 
	(
		[DA_ROW_ID] ASC,
		[JOBID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
---------------------------------------------------------

--****** Object:  Table [dbo].[T_MBR_HEADER_CORVEL]   ******
-- Create the table if not exists already
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[T_MBR_HEADER_CORVEL]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[T_MBR_HEADER_CORVEL]
BEGIN

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON

CREATE TABLE [dbo].[T_MBR_HEADER_CORVEL](
	[DA_ROW_ID] [int] NOT NULL,
	[INPUT_ROW_ID] [int] NULL,
	[INVALID_ROW] [int] NULL,
	[UPDATE_ROW] [int] NULL,
	[PAY_OR_COLLECTION] [varchar](1),
	[CLAIM_NUMBER] [varchar](25),
	[BILL_DOCUMENT_NUMBER] [varchar](25),
	[ACCOUNT_NAME] [varchar](100),
	[PT_PROV_LAST_NAME] [varchar](255),
	[PT_PROV_FIRST_NAME] [varchar](255),   -- smishra73 MITS 38208 : Field size changed to Varchar(255) 
	[PT_PROV_MI] [varchar](2),
	[PT_PROV_ADDRESS1] [varchar](50),
	[PT_PROV_ADDRESS2] [varchar](50),
	[PT_PROV_CITY] [varchar](25),
	[PT_PROV_STATE] [varchar](4),
	[PT_PROV_ZIPCODE] [varchar](14),
	[PT_PROV_TAX_ID] [varchar](9),
	[TOTAL_BILLED] [decimal](10, 2) NULL,
	[TOTAL_PAID] [decimal](10, 2) NULL,
	[DATE_BILLS_PAID] [varchar](16),
	[PATIENT_LAST_NAME] [varchar](255),  -- smishra73 MITS 38208 : Field size changed to Varchar(255)
	[PATIENT_FIRST_NAME] [varchar](255), -- smishra73 MITS 38208 : Field size changed to Varchar(255)
	[PATIENT_MI] [varchar](2),
	[PATIENT_SUFFIX] [varchar](50),
	[PATIENT_SSN] [varchar](9),
	[GOOD_RCD] [int] NULL,
	[BAD_FLAG] [int] NULL,
	[BAD_REASON] [varchar](50),
	[CLAIMANT_EID] [int] NULL,
	[TRANS_ID] [int] NULL,
	[CLAIM_ID] [int] NULL,
	[INVOICE_ID] [int] NULL,
	[PAYEE_EID] [int] NULL,
	[DUP] [int] NULL,
	[SUB_ACC_ID] [int] NULL,
	[CLAIM_STATUS_CODE] [int] NULL,
	[CHECK_NUMBER] [varchar](10),
	[CHECK_DATE] [varchar](8),
	[TOT_SCHEDULED_AMT] [decimal](10, 2) NULL,
	[TOT_REDUCTION_AMT] [decimal](10, 2) NULL,
	[PATIENT_ACCT_NO] [varchar](14),
	[PROV_INVOICE_NUMBER] [varchar](25),
	[DATE_BILL_RECEIVED] [varchar](8),
	[DATE_BILL_RECEIVED_BY_MBR] [varchar](8),
	[PPO_REDUCTION_AMT] [decimal](10, 2) NULL,
	[OTH_REDUCTION_AMT] [decimal](10, 2) NULL,
	[OTHER_VENDOR_DOC_NUM] [varchar](25),
	[PT_PROV_SUFFIX] [varchar](25),
	[PT_PROV_PREFIX][varchar](25) NULL,
	[JOBID] [int] NOT NULL,
	 CONSTRAINT [PK_T_MBR_HEADER_CORVEL] PRIMARY KEY CLUSTERED 
	(
		[DA_ROW_ID] ASC,
		[JOBID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
END

------------------------------------------------------

-- ****** Object:  Table [dbo].[T_MBR_HEADER]   ******
-- Create the table if not exists already
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[T_MBR_HEADER]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[T_MBR_HEADER]
BEGIN

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON

CREATE TABLE [dbo].[T_MBR_HEADER](
	[DA_ROW_ID] [int] NOT NULL,
	[INPUT_ROW_ID] [int] NULL,
	[INVALID_ROW] [int] NULL,
	[UPDATE_ROW] [int] NULL,
	[PAY_OR_COLLECTION] [varchar](1),
	[CLAIM_NUMBER] [varchar](25),
	[BILL_DOCUMENT_NUMBER] [varchar](25),
	[ACCOUNT_NAME] [varchar](100),
	[PT_PROV_LAST_NAME] [varchar](255),
	[PT_PROV_FIRST_NAME] [varchar](255),   -- smishra73 MITS 38208 : Field size changed to Varchar(255)
	[PT_PROV_MI] [varchar](2),
	[PT_PROV_ADDRESS1] [varchar](50),
	[PT_PROV_ADDRESS2] [varchar](50),
	[PT_PROV_CITY] [varchar](25),
	[PT_PROV_STATE] [varchar](4),
	[PT_PROV_ZIPCODE] [varchar](14),
	[PT_PROV_TAX_ID] [varchar](9),
	[TOTAL_BILLED] [decimal](10, 2) NULL,
	[TOTAL_PAID] [decimal](10, 2) NULL,
	[DATE_BILLS_PAID] [varchar](16),
	[PATIENT_LAST_NAME] [varchar](255),  -- smishra73 MITS 38208 : Field size changed to Varchar(255)
	[PATIENT_FIRST_NAME] [varchar](255), -- smishra73 MITS 38208 : Field size changed to Varchar(255)
	[PATIENT_MI] [varchar](2),
	[PATIENT_SUFFIX] [varchar](50),
	[PATIENT_SSN] [varchar](9),
	[GOOD_RCD] [int] NULL,
	[BAD_FLAG] [int] NULL,
	[BAD_REASON] [varchar](50),
	[CLAIMANT_EID] [int] NULL,
	[TRANS_ID] [int] NULL,
	[CLAIM_ID] [int] NULL,
	[INVOICE_ID] [int] NULL,
	[PAYEE_EID] [int] NULL,
	[DUP] [int] NULL,
	[SUB_ACC_ID] [int] NULL,
	[CLAIM_STATUS_CODE] [int] NULL,
	[CHECK_NUMBER] [varchar](10),
	[CHECK_DATE] [varchar](8),
	[TOT_SCHEDULED_AMT] [decimal](10, 2) NULL,
	[TOT_REDUCTION_AMT] [decimal](10, 2) NULL,
	[PATIENT_ACCT_NO] [varchar](14),
	[PROV_INVOICE_NUMBER] [varchar](25),
	[DATE_BILL_RECEIVED] [varchar](8),
	[DATE_BILL_RECEIVED_BY_MBR] [varchar](8),
	[PPO_REDUCTION_AMT] [decimal](10, 2) NULL,
	[OTH_REDUCTION_AMT] [decimal](10, 2) NULL,
	[OTHER_VENDOR_DOC_NUM] [varchar](25),
	[PT_PROV_SUFFIX] [varchar](25),
	[JOBID] [int] NOT NULL,
	[NPI_NUMBER] [varchar](10) NULL,
	[CORVEL_FEE_TYPE] [int] NULL,
	[LINE_OF_BUS_CODE] [int] NULL,
	[MEMO_PHRASE][varchar](25) NULL,
	[PT_PROV_PREFIX][varchar](25) NULL,
	[PT_PROV_PREFIX_CODE_ID][int] NULL,
	[PT_PROV_SUFFIX_CODE_ID][int]NULL,
	[RES_SUPP_PAYMENT_FLAG][int] NULL,				--MITS 33803
	[POLICY_LOB_CODE][int] NULL,
	[CLAIM_TYPE_CODE][int] NULL,
	[INC_CLAIMANT][int] NULL,
	[INC_RSVSUBTYPE][int] NULL,
	[INC_POL_COVERAGE][int] NULL,
	[INC_LOSS_TYPE][int] NULL,
	[INC_RSVTYPE][int] NULL,
	[RC_ROW_ID][int] NULL,
CONSTRAINT [PK_T_MBR_HEADER] PRIMARY KEY CLUSTERED 
	(
		[DA_ROW_ID] ASC,
		[JOBID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
-------------------------------------------------
--/****** Object :  Table [dbo].[T_MBR_ENTITY_SUFF]    Script Date: 03/25/2009 15:27:11 ******/
-- Create the table if not exists already
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[T_MBR_ENTITY_SUFF]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[T_MBR_ENTITY_SUFF]
BEGIN

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON

CREATE TABLE [dbo].[T_MBR_ENTITY_SUFF](
	[ENTITY_ID] [int] NULL,
	[TAX_ID] [varchar](20) NULL,
	[NAME] [varchar](255) NULL,
	[ADD1] [varchar](50) NULL,
	[ADD2] [varchar](50) NULL,
	[ENTITY_TYPE] [varchar](18) NULL,
	[CITY] [varchar](50) NULL,
	[STATE_ID] [INT] NULL,
	[ZIP_CODE] [varchar](10) NULL,
	[SUFFIX] [int] NULL,
	[JOBID] [int] NULL
) ON [PRIMARY]
END
-------------------------------------------------
--/****** Object :  Table [dbo].[ERROR_LOG]    Script Date: 03/25/2009 15:27:11 ******/
-- Create the table if not exists already
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[ERROR_LOG]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[ERROR_LOG]
BEGIN
	CREATE TABLE [dbo].[ERROR_LOG] (
		[ERR_LOG_ROW_ID] [int] NOT NULL,
		[JOBID] [int] NOT NULL,
		[INPUT_ROW_ID] [int] NULL,
		[MODULE_NAME] [varchar](50) NULL,
		[WORK_FLOW_NAME] [varchar](50) NULL,
		[DATA_FLOW_NAME] [varchar](50) NULL,
		[ERROR_TIME] [varchar](14) NULL,
		[ERROR_TITLE] [varchar](100) NULL,
		[ERROR_DESC] [varchar](4000) NULL,
		[IS_VALIDATION] [int] NULL,
		[ERROR_TABLE] [varchar](50) NULL,
		[TABLE_ROW_ID] [int] NULL,
		[ERROR_COLUMNS] [varchar](4000) NULL,
	 CONSTRAINT [PK_ERROR_LOG] PRIMARY KEY CLUSTERED
	(
		[ERR_LOG_ROW_ID] ASC,
		[JOBID] ASC
	) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
-------------------------------------------------------
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[T_MBR_EXTR]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[T_MBR_EXTR]
BEGIN

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON

CREATE TABLE [dbo].[T_MBR_EXTR](
	[JOBID] [int] NOT NULL,
	[EVENT_ID] [int] NULL,
	[CLAIM_ID] [int] NOT NULL,
	[CLAIMANT_ID] [int] NOT NULL,
	[EV_DEPT_EID] [int] NULL,
	[JURIS_ID] [int] NULL,
	[STATE_ID] [int] NULL,
	[SEX_CODE] [int] NULL,
	[JURISDICTION] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CLAIM_NUMBER] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[POLICY_NUMBER] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TAX_ID] [varchar](11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EMPLOYER_TAX_ID] [varchar](11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DATE_OF_EVENT] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EMP_DEPT_ABBREV] [varchar](65) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ADJUSTER_AKA] [varchar](65) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DOB] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SEX] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ADDR_1] [varchar](65) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CITY] [varchar](65) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[STATE] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ZIP_CODE] [varchar](14) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[L_NAME] [varchar](65) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EMPLOYER_LAST_NAME] [varchar](65) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[F_NAME] [varchar](65) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EV_DEPT_APPREV] [varchar](65) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FNOLID] [varchar](65) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ADDITIONAL_REF_ID] [int] NULL,
	[ADDITIONAL_REF] [varchar](65) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ORG_DBA_NAME] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ORG_NAME] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CLAIM_STATUS] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CLAIM_STATUS_CODE] [int] NULL,
    [CLAIM_TYPE_CODE] [int] NULL,  -- gmahajan2 07/25/2011 MITS 23982
	[DTTM_CLOSED] [varchar](14) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EFFECTIVE_DATE] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[INVALID_ROW] [int] NULL,		--vgupta20 8/26/2011
	[LINE_OF_BUS_CODE] [int] NULL,
	[ADJUSTER_EID_INTERNAL] [int] NULL,
	
 CONSTRAINT [PK_T_MBR_EXTR] PRIMARY KEY CLUSTERED 
(
	[JOBID] ASC,
	[CLAIM_ID] ASC
	)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

END

-------------------------------------------------------
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[ENTITY_SUPP]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[ENTITY_SUPP]
BEGIN
	CREATE TABLE [dbo].[ENTITY_SUPP](
	[DA_ROW_ID] [int] NOT NULL,
	[INPUT_ROW_ID] [int] NULL,
	[INVALID_ROW] [int] NULL,
	[UPDATE_ROW] [int] NULL,	
	[ENTITY_ID] [int] NULL,	
    [TAXONOMY_TEXT] [varchar](20) NULL,
    [ATTY_SUF_TEXT] [varchar](25) NULL,
    [JOBID] [int] NOT NULL,
)
END
-------------------------------------------------------
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FUNDS_SUPP]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[FUNDS_SUPP]
BEGIN
	CREATE TABLE [dbo].[FUNDS_SUPP](
	[DA_ROW_ID] [int] NOT NULL,
	[INPUT_ROW_ID] [int] NULL,
	[INVALID_ROW] [int] NULL,
	[UPDATE_ROW] [int] NULL,
	[TRANS_ID] [int] NULL,
	[NETWRK_SRVC_CODE] [int] NULL ,
	[BILL_REV_CM_EID][int] NULL,
	[BILL_RCVD_DATE][varchar](8) NULL,
	[BILL_RCDMBR_DATE][varchar](8) NULL,
	[OTH_VEN_DOC_TEXT][varchar](25) NULL,
	[BILL_DOC_NO_TEXT][varchar](25) NULL,
    [JOBID] [int] NOT NULL,
	) 
END
-------------------------------------------------------
--vgupta20 -- add the RMDB tables' replicas in the staging.

IF EXISTS (SELECT name FROM sys.tables WHERE name = 'ENTITY') 
DROP TABLE [dbo].[ENTITY]
BEGIN
	CREATE TABLE [dbo].[ENTITY](
		[DA_ROW_ID] [int] NOT NULL,
		[JOBID] [int] NOT NULL,
		[INPUT_ROW_ID] [int] NULL,
		[INVALID_ROW] [int] NULL,
		[UPDATE_ROW] [int] NULL,
		[BUSINESS_TYPE_CODE] [int] NULL,
		[COUNTY] [varchar](30) NULL,
		[NATURE_OF_BUSINESS] [varchar](50) NULL,
		[SIC_CODE] [int] NULL,
		[SIC_CODE_DESC] [varchar](150) NULL,
		[WC_FILING_NUMBER] [varchar](30) NULL,
		[ENTITY_ID] [int] NULL,
		[ENTITY_TABLE_ID] [int] NULL,
		[LAST_NAME] [varchar](255) NULL,  -- smishra73 MITS 38208 : Field size changed to Varchar(255)
		[LAST_NAME_SOUNDEX] [varchar](8) NULL,
		[FIRST_NAME] [varchar](255) NULL,   -- smishra73 MITS 38208 : Field size changed to Varchar(255)
		[ALSO_KNOWN_AS] [varchar](50) NULL,
		[ABBREVIATION] [varchar](25) NULL,
		[COST_CENTER_CODE] [int] NULL,
		[ADDR1] [varchar](50) NULL,
		[ADDR2] [varchar](50) NULL,
		[CITY] [varchar](50) NULL,
		[COUNTRY_CODE] [int] NULL,
		[STATE_ID] [int] NULL,
		[ZIP_CODE] [varchar](10) NULL,
		[PARENT_EID] [int] NULL,
		[TAX_ID] [varchar](20) NULL,
		[CONTACT] [varchar](50) NULL,
		[COMMENTS] [varchar](8000) NULL,
		[EMAIL_TYPE_CODE] [int] NULL,
		[EMAIL_ADDRESS] [varchar](100) NULL,
		[SEX_CODE] [int] NULL,
		[BIRTH_DATE] [varchar](8) NULL,
		[PHONE1] [varchar](30) NULL,
		[PHONE2] [varchar](30) NULL,
		[FAX_NUMBER] [varchar](30) NULL,
		[DTTM_RCD_ADDED] [varchar](14) NULL,
		[DTTM_RCD_LAST_UPD] [varchar](14) NULL,
		[UPDATED_BY_USER] [varchar](50) NULL,
		[ADDED_BY_USER] [varchar](50) NULL,
		[DELETED_FLAG] [smallint] NULL,
		[SEC_DEPT_EID] [int] NULL,
		[TRIGGER_DATE_FIELD] [varchar](50) NULL,
		[EFF_START_DATE] [varchar](8) NULL,
		[EFF_END_DATE] [varchar](8) NULL,
		[PARENT_1099_EID] [int] NULL,
		[REPORT_1099_FLAG] [smallint] NULL,
		[MIDDLE_NAME] [varchar](50) NULL,
		[TITLE] [varchar](50) NULL,
		[NAICS_CODE] [int] NULL,
		[RM_USER_ID] [int] NULL,
		[FREEZE_PAYMENTS] [int] NULL,
		[ORGANIZATION_TYPE] [int] NULL,
		[NPI_NUMBER] [varchar](10) NULL,
		[HTMLCOMMENTS] [varchar](8000) NULL,
		[MMSEA_TIN_EDT_FLAG] [smallint] NULL,
		[AUTO_DISCOUNT] [float] NULL,
		[DISCOUNT_FLAG] [int] NULL,
		[ENTITY_APPROVAL_STATUS] [int] NULL,
		[ENTITY_REJECT_COMMENTS] [text] NULL,
		[FROI_ACORD_PASSWORD] [varchar](15) NULL,
		[PREFIX] [varchar](25) NULL,
		[SUFFIX_COMMON] [varchar](25) NULL,
		[STAGING_ID] [int] NULL,
	 CONSTRAINT [PK_ENTITY] PRIMARY KEY CLUSTERED 
	(
		[DA_ROW_ID] ASC,
		[JOBID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
END

-------------------------------------------------------

IF EXISTS (SELECT name FROM sys.tables WHERE name = 'FUNDS') 
DROP TABLE [dbo].[FUNDS]
BEGIN
	CREATE TABLE [dbo].[FUNDS](
		[DA_ROW_ID] [int] NOT NULL,
		[JOBID] [int] NOT NULL,
		[INPUT_ROW_ID] [int] NULL,
		[INVALID_ROW] [int] NULL,
		[UPDATE_ROW] [int] NULL,
	[AUTO_CHECK_DETAIL] [varchar](30) NULL,
	[ROLLUP_ID] [int] NULL,
	[VOID_DATE] [varchar](8) NULL,
	[ADDR1] [varchar](50) NULL,
	[ADDR2] [varchar](50) NULL,
	[AUTO_CHECK_FLAG] [smallint] NULL,
	[CITY] [varchar](50) NULL,
	[CLAIMANT_EID] [int] NULL,
	[COUNTRY_CODE] [int] NULL,
	[FIRST_NAME] [varchar](255) NULL,   --smishra73 MITS 38208 : Field size changed to Varchar(255)
	[LAST_NAME] [varchar](255) NULL,    --smishra73 MITS 38208 : Field size changed to Varchar(255)
	[PRECHECK_FLAG] [smallint] NULL,
	[STATE_ID] [int] NULL,
	[UNIT_ID] [int] NULL,
	[ZIP_CODE] [varchar](10) NULL,
	[TRANS_ID] [int] NOT NULL,
	[CLAIM_ID] [int] NULL,
	[CLAIM_NUMBER] [varchar](25) NULL,
	[CTL_NUMBER] [varchar](25) NULL,
	[VOID_FLAG] [smallint] NULL,
	[DATE_OF_CHECK] [varchar](8) NULL,
	[CHECK_MEMO] [varchar](255) NULL,
	[TRANS_NUMBER] [bigint] NULL,
	[TRANS_DATE] [varchar](8) NOT NULL,
	[PAYEE_EID] [int] NULL,
	[PAYEE_TYPE_CODE] [int] NULL,
	[ACCOUNT_ID] [int] NULL,
	[AMOUNT] [float] NULL,
	[STATUS_CODE] [int] NULL,
	[FILED_1099_FLAG] [smallint] NULL,
	[CLEARED_FLAG] [smallint] NULL,
	[PAYMENT_FLAG] [smallint] NULL,
	[COLLECTION_FLAG] [smallint] NULL,
	[COMMENTS] [text] NULL,
	[CRC] [int] NULL,
	[DTTM_RCD_LAST_UPD] [varchar](14) NULL,
	[DTTM_RCD_ADDED] [varchar](14) NULL,
	[UPDATED_BY_USER] [varchar](50) NULL,
	[ADDED_BY_USER] [varchar](50) NULL,
	[BATCH_NUMBER] [int] NULL,
	[SEC_DEPT_EID] [int] NULL,
	[ENCLOSURE_FLAG] [smallint] NULL,
	[APPROVE_USER] [varchar](8) NULL,
	[DTTM_APPROVAL] [varchar](14) NULL,
	[SUB_ACCOUNT_ID] [int] NULL,
	[SETTLEMENT_FLAG] [smallint] NULL,
	[APPROVER_ID] [int] NULL,
	[VOUCHER_FLAG] [smallint] NULL,
	[WEEKS_PAID_CODE] [int] NULL,
	[NUM_OF_PAID_DAYS] [int] NULL,
	[TAX_PAYMENT_FLAG] [smallint] NULL,
	[RESUBMIT_EDI] [smallint] NULL,
	[SUPP_PAYMENT_FLAG] [smallint] NULL,
	[HTMLCOMMENTS] [text] NULL,
	[REISSUE_FLAG] [smallint] NULL,
	[REISSUE_BY] [varchar](25) NULL,
	[REISSUE_DATE] [varchar](8) NULL,
	[REISSUE_PARENT_ID] [int] NULL,
	[NOTES_HTMLCOMMENTS] [text] NULL,
	[REISSUE_REASON_CODE] [int] NULL,
	[MIDDLE_NAME] [varchar](50) NULL,
	[REASON] [varchar](255) NULL,
	[CONF_FLAG] [smallint] NULL,
	[CONF_EVENT_ID] [int] NULL,
	[VOID_REASON] [varchar](max) NULL,
        [BILL_DOCUMENT_NUMBER] [varchar](25) NULL,
	[VOID_REASON_HTMLCOMMENTS] [varchar](max) NULL,
	[STAGING_ID] [int] NULL,
	[PAY_TO_THE_ORDER_OF] [varchar](max) NULL,
	[PMT_CURRENCY_CODE] [int] NULL,
	[PMT_CURRENCY_AMOUNT] [float] NULL,
	[PMT_TO_BASE_CUR_RATE][float] NULL,
	[CLAIM_CURRENCY_CODE][int] NULL,
	[CLAIM_CURRENCY_AMOUNT][float] NULL,
	[PMT_TO_CLAIM_CUR_RATE][float] NULL,
	[BASE_TO_PMT_CUR_RATE][float] NULL,
	[BASE_TO_CLAIM_CUR_RATE][float] NULL,
	[RES_SUPP_PAYMENT_FLAG][int] NULL,
	[RC_ROW_ID][int] NULL,
	CONSTRAINT [PK_FUNDS] PRIMARY KEY CLUSTERED 
	(
		[DA_ROW_ID] ASC,
		[JOBID] ASC
		)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
END

-------------------------------------------------------

IF EXISTS (SELECT name FROM sys.tables WHERE name = 'FUNDS_TRANS_SPLIT') 
DROP TABLE [dbo].[FUNDS_TRANS_SPLIT]
BEGIN
	CREATE TABLE [dbo].[FUNDS_TRANS_SPLIT](
		[DA_ROW_ID] [int] NOT NULL,
		[JOBID] [int] NOT NULL,
		[INPUT_ROW_ID] [int] NULL,
		[INVALID_ROW] [int] NULL,
		[UPDATE_ROW] [int] NULL,
		[SUM_AMOUNT] [float] NULL,
		[SPLIT_ROW_ID] [int] NULL,
		[TRANS_ID] [int] NULL,
		[TRANS_TYPE_CODE] [int] NULL,
		[RESERVE_TYPE_CODE] [int] NULL,
		[AMOUNT] [float] NULL,
		[GL_ACCOUNT_CODE] [int] NULL,
		[FROM_DATE] [varchar](8) NULL,
		[TO_DATE] [varchar](8) NULL,
		[INVOICED_BY] [varchar](20) NULL,
		[INVOICE_AMOUNT] [float] NULL,
		[INVOICE_NUMBER] [varchar](25) NULL,
		[PO_NUMBER] [varchar](14) NULL,
		[CRC] [int] NULL,
		[DTTM_RCD_LAST_UPD] [varchar](14) NULL,
		[DTTM_RCD_ADDED] [varchar](14) NULL,
		[UPDATED_BY_USER] [varchar](50) NULL,
		[ADDED_BY_USER] [varchar](50) NULL,
		[INVOICE_DATE] [varchar](8) NULL,
		[BILL_RCVD_BY_CARRIER_DATE] [varchar](8) NULL,
		[SUPP_PAYMENT_FLAG] [smallint] NULL,
		[STAGING_ID] [int] NULL,
        	[LI_LINE_NUMBER] [int] NULL,
        	[CVG_LOSS_ROW_ID] [int] NULL,					--MITS 31409 - MBR Finnacial enhancement Starts..
        	[POLCVG_ROW_ID] [int] NULL,					--
        	[RC_ROW_ID] [int] NULL,						--
		[PMT_CURRENCY_AMOUNT] [float] NULL,		        --
		[PMT_CURRENCY_INVOICE_AMOUNT] [float] NULL,	--
		[PMT_CURRENCY_AUTO_DISCOUNT] [float] NULL,		--
		[CLAIM_CURRENCY_AMOUNT] [float] NULL,			--	
		[CLAIM_CURRENCY_INVOICE_AMOUNT][float] NULL,	--	
		[CLAIM_CURRENCY_AUTO_DISCOUNT][float] NULL,	-- MITS 31409 - MBR Finnacial enhancement ENDS..
	
	
	 CONSTRAINT [PK_FUNDS_TRANS_SPLIT] PRIMARY KEY CLUSTERED 
	(
		[DA_ROW_ID] ASC,
		[JOBID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
END


-------------------------------------------------------
IF EXISTS (SELECT name FROM sys.tables WHERE name = 'RESERVE_CURRENT') 
DROP TABLE [dbo].[RESERVE_CURRENT]
BEGIN
	CREATE TABLE [dbo].[RESERVE_CURRENT](
		[DA_ROW_ID] [int] NOT NULL,
		[JOBID] [int] NOT NULL,
		[INPUT_ROW_ID] [int] NULL,
		[INVALID_ROW] [int] NULL,
		[UPDATE_ROW] [int] NULL,
		[BALANCE_AMOUNT] [float] NULL,
		[RC_ROW_ID] [int] NULL,
		[CLAIM_ID] [int] NULL,
		[UNIT_ID] [int] NULL,
		[CLAIMANT_EID] [int] NULL,
		[RESERVE_TYPE_CODE] [int] NULL,
		[RESERVE_AMOUNT] [float] NULL,
		[INCURRED_AMOUNT] [float] NULL,
		[COLLECTION_TOTAL] [float] NULL,
		[PAID_TOTAL] [float] NULL,
		[DATE_ENTERED] [varchar](8) NULL,
		[ENTERED_BY_USER] [varchar](50) NULL,		--MITS 30434 - increased to 50
		[REASON] [varchar](30) NULL,
		[UPDATED_BY_USER] [varchar](50) NULL,		--MITS 30434 - increased to 50
		[DTTM_RCD_ADDED] [varchar](14) NULL,
		[DTTM_RCD_LAST_UPD] [varchar](14) NULL,
		[ADDED_BY_USER] [varchar](50) NULL,		--MITS 30434 - increased to 50
		[CRC] [int] NULL,
		[SEC_DEPT_EID] [int] NULL,
		[RES_STATUS_CODE] [int] NULL,
		[ALLOCATED_AMOUNT] [float] NULL,
		[CONF_FLAG] [smallint] NULL,
		[CONF_EVENT_ID] [int] NULL,
		[POLCVG_ROW_ID] [int] NULL,
		[POLCVG_LOSS_ROW_ID][int] NULL,					--MITS 31409 - MBR Finnacial enhancement
		[CLAIM_CURR_CODE][int] NULL,					--
		[CLAIM_TO_BASE_CUR_RATE][float] NULL,			--	
		[CLAIM_CURRENCY_RESERVE_AMOUNT][float] NULL,	--
		[CLAIM_CURRENCY_INCURRED_AMOUNT][float] NULL,	--
		[CLAIM_CURR_COLLECTION_TOTAL][float] NULL,		--	
		[CLAIM_CURRENCY_PAID_TOTAL][float] NULL,		--
		[CLAIM_CURRENCY_BALANCE_AMOUNT][float] NULL,	--	
		[BASE_TO_CLAIM_CUR_RATE][float] NULL,			--MITS 31409 Ends.
		[RESERVE_CATEGORY][int] NULL,
		[STAGING_ID] [int] NULL,
		[POLICY_CURR_RESERVE_AMOUNT][float] NULL,	
		[POLICY_CURR_INCURRED_AMOUNT][float] NULL,	
		[POLICY_CURR_COLLECTION_TOTAL][float] NULL,			
		[POLICY_CURR_PAID_TOTAL][float] NULL,		
		[POLICY_CURRENCY_BALANCE_AMOUNT][float] NULL,
		[POLICY_CURRENCY_AMOUNT][float] NULL,           -- Jira 64211
		[CLAIM_CURRENCY_AMOUNT][float] NULL,
		[PAYMENT_AMOUNT][float] NULL,
		[PREV_PRINT_TOTAL][float] NULL,
		[PREV_CLAIM_PRINT_TOTAL][float] NULL,
		[PREV_POLICY_PRINT_TOTAL][float] NULL,
		[PREV_CLAIM_ALLOCATED_TOTAL][float] NULL,
		[PREV_POLICY_ALLOCATED_TOTAL][float] NULL,
		[PREV_ALLOCATED_AMOUNT][float] NULL,
	 CONSTRAINT [PK_RESERVE_CURRENT] PRIMARY KEY CLUSTERED 
	(
		[DA_ROW_ID] ASC,
		[JOBID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
END

-------------------------------------------------------
IF EXISTS (SELECT name FROM sys.tables WHERE name = 'RESERVE_HISTORY') 
DROP TABLE [dbo].[RESERVE_HISTORY]
BEGIN
	CREATE TABLE [dbo].[RESERVE_HISTORY](
		[DA_ROW_ID] [int] NOT NULL,
		[JOBID] [int] NOT NULL,
		[INPUT_ROW_ID] [int] NULL,
		[INVALID_ROW] [int] NULL,
		[UPDATE_ROW] [int] NULL,
		[BALANCE_AMOUNT] [float] NULL,
		[CHANGE_AMOUNT] [float] NULL,
		[RSV_ROW_ID] [int] NULL,
		[CLAIM_ID] [int] NULL,
		[CLAIMANT_EID] [int] NULL,
		[UNIT_ID] [int] NULL,
		[RESERVE_TYPE_CODE] [int] NULL,
		[RESERVE_AMOUNT] [float] NULL,
		[COLLECTION_TOTAL] [float] NULL,
		[INCURRED_AMOUNT] [float] NULL,
		[PAID_TOTAL] [float] NULL,
		[DATE_ENTERED] [varchar](8) NULL,
		[ENTERED_BY_USER] [varchar](50) NULL,
		[REASON] [varchar](30) NULL,
		[UPDATED_BY_USER] [varchar](50) NULL,
		[DTTM_RCD_ADDED] [varchar](14) NULL,
		[DTTM_RCD_LAST_UPD] [varchar](14) NULL,
		[ADDED_BY_USER] [varchar](50) NULL,
		[CRC] [int] NULL,
		[SEC_DEPT_EID] [int] NULL,
		[RES_STATUS_CODE] [int] NULL,
		[CLOSED_FLAG] [int] NULL,
		[AUTO_ADJ_FLAG] [int] NULL,
		[CONF_FLAG] [smallint] NULL,
		[CONF_EVENT_ID] [int] NULL,
		[POLCVG_ROW_ID] [int] NULL,
		[POLCVG_LOSS_ROW_ID][int] NULL,				--MITS 31409 - MBR Finnacial enhancement
		[CLAIM_CURR_CODE][int] NULL,				--
		[CLAIM_TO_BASE_CUR_RATE][float] NULL,			--	
		[CLAIM_CURRENCY_RESERVE_AMOUNT][float] NULL,		--
		[CLAIM_CURRENCY_INCURRED_AMOUNT][float] NULL,		--
		[CLAIM_CURR_COLLECTION_TOTAL][float] NULL,		--	
		[CLAIM_CURRENCY_PAID_TOTAL][float] NULL,		--
		[CLAIM_CURRENCY_BALANCE_AMOUNT][float] NULL,		--	
		[BASE_TO_CLAIM_CUR_RATE][float] NULL,
		[RESERVE_CATEGORY][int] NULL,					--MITS 31409 Ends.
		[STAGING_ID] [int] NULL,				--SDALVI3 JIRA 27488 
		[RC_ROW_ID] [int] NULL,
		[POLICY_CURR_RESERVE_AMOUNT][float] NULL,	
		[POLICY_CURR_INCURRED_AMOUNT][float] NULL,	
		[POLICY_CURR_COLLECTION_TOTAL][float] NULL,			
		[POLICY_CURR_PAID_TOTAL][float] NULL,		
		[POLICY_CURRENCY_BALANCE_AMOUNT][float] NULL,
		[POLICY_CURR_CHANGE_AMOUNT][float] NULL,
		[CLAIM_TO_POLICY_CUR_RATE][float] NULL,
		[CLAIM_CURR_CHANGE_AMOUNT][float] NULL,
	 CONSTRAINT [PK_RESERVE_HISTORY] PRIMARY KEY CLUSTERED 
	(
		[DA_ROW_ID] ASC,
		[JOBID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
------------------------------------------------------------

IF EXISTS (SELECT name FROM sys.tables WHERE name = 'INVOICE') 
DROP TABLE [dbo].[INVOICE]
BEGIN
	CREATE TABLE [dbo].[INVOICE](
		[DA_ROW_ID] [int] NOT NULL,
		[JOBID] [int] NOT NULL,
		[INPUT_ROW_ID] [int] NULL,
		[INVALID_ROW] [int] NULL,
		[UPDATE_ROW] [int] NULL,
		[INVOICE_ID] [int] NULL,
		[FUNDS_TRANS_ID] [int] NULL,
		[CLAIM_ID] [int] NULL,
		[CLAIM_NUMBER_TEXT] [varchar](50) ,
		[CLAIMANT_EID] [int] NULL,
		[UNIT_ID] [int] NULL,
		[PAYEE_TYPE_CODE] [int] NULL,
		[PAYEE_EID] [int] NULL,
		[PAYEE_SPEC_CODE] [int] NULL,
		[LAST_NAME_TEXT] [varchar](255),   -- smishra73 MITS 38208 : Field size changed to Varchar(255)
		[FIRST_NAME_TEXT] [varchar](255),  -- smishra73 MITS 38208 : Field size changed to Varchar(255)
		[ADDR1_TEXT] [varchar](50),
		[ADDR2_TEXT] [varchar](50),
		[CITY_TEXT] [varchar](50),
		[STATE_ID] [int] NULL,
		[COUNTRY_CODE] [int] NULL,
		[POSTAL_CODE_TEXT] [varchar](15),
		[TRANS_DATE_TEXT] [varchar](8),
		[TOT_SCHEDULED_AMT] [float] NULL,
		[TOT_REDUCTION_AMT] [float] NULL,
		[TOT_AMT_TO_PAY] [float] NULL,
		[TOT_AMT_SAVED] [float] NULL,
		[TOT_AMT_BILLED] [float] NULL,
		[NUM_DETAIL_LINES] [smallint] NULL,
		[DTTM_RCD_ADDED] [varchar](14),
		[ADDED_BY_USER] [varchar](50),
		[DTTM_RCD_LAST_UPD] [varchar](14),
		[UPDATED_BY_USER] [varchar](50),
		[DTTM_EOB_PRINTED] [varchar](14),
		[EOB_PRINTED_USER] [varchar](50),
		[PPO_REDUCTION_AMT] [decimal](10, 2) NULL,
		[OTH_REDUCTION_AMT] [decimal](10, 2) NULL,
		[STAGING_ID] [int] NULL,
	 CONSTRAINT [PK_INVOICE] PRIMARY KEY CLUSTERED 
	(
		[DA_ROW_ID] ASC,
		[JOBID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
------------------------------------------------------------

IF EXISTS (SELECT name FROM sys.tables WHERE name = 'INVOICE_DETAIL') 
DROP TABLE [dbo].[INVOICE_DETAIL]
BEGIN
		CREATE TABLE [dbo].[INVOICE_DETAIL](
			[DA_ROW_ID] [int] NOT NULL,
			[JOBID] [int] NOT NULL,
			[INPUT_ROW_ID] [int] NULL,
			[INVALID_ROW] [int] NULL,
			[UPDATE_ROW] [int] NULL,
			[INVOICE_DETAIL_ID] [int] NULL,
			[INVOICE_ID] [int] NULL,
			[FUNDS_SPLIT_ROW_ID] [int] NULL,
			[TABLE_CODE] [int] NULL,
			[PERCENTILE] [varchar](4) NULL,
			[PLACE_OF_SER_CODE] [int] NULL,
			[TYPE_OF_SER_CODE] [int] NULL,
			[BILLING_CODE_TEXT] [varchar](64) NULL,
			[UNITS_BILLED_NUM] [float] NULL,
			[UNITS_BILLED_TYPE] [int] NULL,
			[AMOUNT_BILLED] [float] NULL,
			[SCHEDULED_AMOUNT] [float] NULL,
			[AMOUNT_REDUCED] [float] NULL,
			[AMOUNT_TO_PAY] [float] NULL,
			[AMOUNT_SAVED] [float] NULL,
			[TOOTH_NUMBER] [smallint] NULL,
			[SURFACE_TEXT] [varchar](50) NULL,
			[MODIFIER_CODE] [int] NULL,
			[QUANTITY] [varchar](6) NULL,
			[STORE] [varchar](11) NULL,
			[CONTRACT_EXISTS] [int] NULL,
			[OVERRIDE_TYPE] [int] NULL,
			[CONTRACT_AMOUNT] [float] NULL,
			[DISCOUNT] [float] NULL,
			[AMOUNT_ALLOWED] [float] NULL,
			[BASE_AMOUNT] [float] NULL,
			[ZIP_CODE] [varchar](10) NULL,
			[FEE_TABLE_AMT] [float] NULL,
			[PER_DIEM_AMT] [float] NULL,
			[STOP_LOSS_AMT] [float] NULL,
			[STOP_LOSS_FLAG] [int] NULL,
			[FEE_DATA_SOURCE] [int] NULL,
			[FEE_TABLE_STATE] [varchar](2) NULL,
			[FEE_TABLE_STUDY] [varchar](5) NULL,
			[FEE_DATA_REVISION] [varchar](3) NULL,
			[PRESCRIP_NO] [varchar](30) NULL,
			[DRUG_NAME] [varchar](80) NULL,
			[PRESCRIP_DATE] [varchar](8) NULL,
			[DAYS_SUPPLIED] [smallint] NULL,
			[DATE_FILLED] [varchar](8) NULL,
			[REV_CODE] [varchar](4) NULL,
			[PHY_EID] [int] NULL,
			[BILL_TYPE] [int] NULL,
			[DISPENSED] [int] NULL,
			[HCPCS_CODE] [varchar](5) NULL,
			[PURCHASED_IND] [int] NULL,
			[FL_LICENSE] [varchar](25) NULL,
			[PHY_PHARM_NDC] [varchar](20) NULL,
			[PHY_PHARM_NDC_DES] [varchar](50) NULL,
			[MEDS_QUANTITY] [smallint] NULL,
			[RX_IND] [int] NULL,
			[CERTIFICATION] [int] NULL,
			[RX_USUAL_CHARGE] [float] NULL,
			[BRS_FEE_AMT2] [float] NULL,
			[BRS_FEE_AMT1] [float] NULL,
			[TABLE_CODE_2] [int] NULL,
			[DIAG_REF_NO] [varchar](4) NULL,
			[MED_SUPPLY_FLAG] [smallint] NULL,
			[PPO_REDUCTION_AMT] [decimal](10, 2) NULL,
			[OTH_REDUCTION_AMT] [decimal](10, 2) NULL,
			 [STAGING_ID] [int] NULL,
	 CONSTRAINT [PK_INVOICE_DETAIL] PRIMARY KEY CLUSTERED 
	(
		[DA_ROW_ID] ASC,
		[JOBID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
------------------------------------------------------------

IF EXISTS (SELECT name FROM sys.tables WHERE name = 'INVDETAIL_X_DIAG') 
DROP TABLE [dbo].[INVDETAIL_X_DIAG]
BEGIN
	CREATE TABLE [dbo].[INVDETAIL_X_DIAG](
		[DA_ROW_ID] [int] NOT NULL,
		[JOBID] [int] NOT NULL,
		[INPUT_ROW_ID] [int] NULL,
		[INVALID_ROW] [int] NULL,
		[UPDATE_ROW] [int] NULL,
		[INVOICE_DETAIL_ID] [int] NULL,
		[DIAGNOSIS_CODE] [int] NULL,
	 CONSTRAINT [PK_INVDETAIL_X_DIAG] PRIMARY KEY CLUSTERED 
	(
		[DA_ROW_ID] ASC,
		[JOBID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
------------------------------------------------------------

IF EXISTS (SELECT name FROM sys.tables WHERE name = 'INVDETAIL_X_MOD') 
DROP TABLE [dbo].[INVDETAIL_X_MOD]
BEGIN
CREATE TABLE [dbo].[INVDETAIL_X_MOD](
		[DA_ROW_ID] [int] NOT NULL,
		[JOBID] [int] NOT NULL,
		[INPUT_ROW_ID] [int] NULL,
		[INVALID_ROW] [int] NULL,
		[UPDATE_ROW] [int] NULL,
		[INVOICE_DETAIL_ID] [int] NOT NULL,
		[MODIFIER_CODE] [int] NOT NULL,
		[MODIFIER_ORDER] [int] NULL,
	 CONSTRAINT [PK_INVDETAIL_X_MOD] PRIMARY KEY CLUSTERED 
	(
		[DA_ROW_ID] ASC,
		[JOBID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
------------------------------------------------------------

IF EXISTS (SELECT name FROM sys.tables WHERE name = 'INVDETAIL_X_EOB') 
DROP TABLE [dbo].[INVDETAIL_X_EOB]
BEGIN
CREATE TABLE [dbo].[INVDETAIL_X_EOB](
		[DA_ROW_ID] [int] NOT NULL,
		[JOBID] [int] NOT NULL,
		[INPUT_ROW_ID] [int] NULL,
		[INVALID_ROW] [int] NULL,
		[UPDATE_ROW] [int] NULL,
		[INVOICE_DETAIL_ID] [int] NOT NULL,
		[EOB_CODE] [int] NOT NULL,
		[EOB_TABLE] [int] NOT NULL,
	 CONSTRAINT [PK_INVDETAIL_X_EOB] PRIMARY KEY CLUSTERED 
	(
		[DA_ROW_ID] ASC,
		[JOBID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
------------------------------------------------------------

IF EXISTS (SELECT name FROM sys.tables WHERE name = 'CODES') 
DROP TABLE [dbo].CODES
BEGIN
	CREATE TABLE [dbo].[CODES](
		[DA_ROW_ID] [int] NOT NULL,
		[JOBID] [int] NOT NULL,
		[INPUT_ROW_ID] [int] NULL,
		[INVALID_ROW] [int] NULL,
		[UPDATE_ROW] [int] NULL,
		[IND_STANDARD_CODE] [int] NULL,
		[LINE_OF_BUS_CODE] [int] NULL,
		[CODE_ID] [int] NULL,
		[TABLE_ID] [int] NULL,
		[SHORT_CODE] [varchar](25) NULL,
		[RELATED_CODE_ID] [int] NULL,
		[DELETED_FLAG] [smallint] NULL,
		[TRIGGER_DATE_FIELD] [varchar](50) NULL,
		[EFF_START_DATE] [varchar](8) NULL,
		[EFF_END_DATE] [varchar](8) NULL,
		[ORG_GROUP_EID] [int] NULL,
	 CONSTRAINT [PK_CODES] PRIMARY KEY CLUSTERED 
	(
		[DA_ROW_ID] ASC,
		[JOBID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
------------------------------------------------------------
IF EXISTS (SELECT name FROM sys.tables WHERE name = 'CODES_TEXT') 
DROP TABLE [dbo].CODES_TEXT
BEGIN

	CREATE TABLE [dbo].[CODES_TEXT](
		[DA_ROW_ID] [int] NOT NULL,
		[JOBID] [int] NOT NULL,
		[INPUT_ROW_ID] [int] NULL,
		[INVALID_ROW] [int] NULL,
		[UPDATE_ROW] [int] NULL,
		[CODE_ID] [int] NULL,
		[LANGUAGE_CODE] [int] NULL,
		[SHORT_CODE] [varchar](25) NULL,
		[CODE_DESC] [varchar](50) NULL,
	 CONSTRAINT [PK_CODES_TEXT] PRIMARY KEY CLUSTERED 
	(
		[DA_ROW_ID] ASC,
		[JOBID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
------------------------------------------------------------

IF EXISTS (SELECT name FROM sys.tables WHERE name = 'UNIQUE_CODE') 
DROP TABLE [dbo].UNIQUE_CODE
BEGIN

	CREATE TABLE [dbo].[UNIQUE_CODE](
		[JOBID] [int] NOT NULL,
		[DA_ROW_ID] [int] NOT NULL,
		[TABLE_ID] [int] NULL,
		[CODE_ID] [int] NULL,
		[LINE_OF_BUS_CODE] [int] NULL,
		[RELATED_CODE_ID] [int] NULL,
		[NEW_CODE] [int] NULL,
		[SHORT_CODE] [varchar](25) NULL,
		[CODE_TABLE_NAME] [varchar](30) NULL,
	 CONSTRAINT [PK_UNIQUE_CODE] PRIMARY KEY CLUSTERED 
	(
		[JOBID] ASC,
		[DA_ROW_ID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
------------------------------------------------------------

IF EXISTS (SELECT name FROM sys.tables WHERE name = 'T_MBR_DOC_ATTACHMENT') 
DROP TABLE [dbo].T_MBR_DOC_ATTACHMENT
BEGIN
	CREATE TABLE [dbo].T_MBR_DOC_ATTACHMENT(
		[JOBID] [int] NOT NULL,
		[KEYS] [varchar](50) NULL,
		[SHORT_CODE] [varchar](25) NULL,
		[CODE_ID] [int] NULL,
	 )
END
------------------------------------------------------------

IF EXISTS (SELECT name FROM sys.tables WHERE name = 'T_MBR_PROCESS_LOG') 
DROP TABLE [dbo].T_MBR_PROCESS_LOG
BEGIN
	CREATE TABLE [dbo].T_MBR_PROCESS_LOG(
		[JOBID] [int] NOT NULL,
		[PROCESS_DESC] [varchar](500) NULL,
                [DISPLAY_ORDER] [int]  NULL,
                [TRANS_ID] [int]  NULL,
                [IDENTIFIER] [int] NULL,
		
	 )
END
------------------------------------------------------------

IF EXISTS (SELECT name FROM sys.tables WHERE name = 'T_MBR_DOC_ATTACH_VALID') 
DROP TABLE [dbo].T_MBR_DOC_ATTACH_VALID
BEGIN
	CREATE TABLE [dbo].T_MBR_DOC_ATTACH_VALID(
                [JOBID] [int] NOT NULL,
		[CLAIM_NUMBER] [varchar](25) NULL,
		[BILL_DOCUMENT_NUMBER] [varchar](25) NULL,
		[PAYEE_LAST_NAME] [varchar](255) NULL,
		[CLAIM_ID] [int] NULL,
	 )
END
------------------------------------------------------------

------------------------------------------------------------

IF EXISTS (SELECT name FROM sys.tables WHERE name = 'ENTITY_X_ADDRESSES') 
DROP TABLE [dbo].ENTITY_X_ADDRESSES
BEGIN
	CREATE TABLE [dbo].ENTITY_X_ADDRESSES(
                [DA_ROW_ID] [int] NOT NULL,
		[JOBID] [int] NOT NULL,
		[INPUT_ROW_ID] [int] NULL,
		[INVALID_ROW] [int] NULL,
		[UPDATE_ROW] [int] NULL, 
                [ENTITY_ID] [int] NOT NULL,
		[ADDRESS_ID] [int] NOT NULL,
--		[ADDR1] [varchar](50) NULL,
--		[ADDR2] [varchar](50) NULL,
--		[CITY] [varchar](50) NULL, 
--                [STATE_ID] [int] NULL,
--		[COUNTRY_CODE] [int] NULL,
--		[COUNTY] [varchar](30) NULL,
--		[ZIP_CODE] [varchar](10) NULL,
		[EMAIL_ADDRESS] [varchar](100) NULL,  
        [PRIMARY_ADD_FLAG] [int] NULL,
		[FAX_NUMBER] [varchar](30) NULL,
		[EFFECTIVE_DATE][varchar](14) NULL,
		[EXPIRATION_DATE][varchar](14) NULL,
		[ADDED_BY_USER] [varchar](8) NULL,
		[UPDATED_BY_USER] [varchar](8) NULL,
        [DTTM_RCD_ADDED]   [varchar](10) NULL, 
        [DTTM_RCD_LAST_UPD]  [varchar](10) NULL, 
        [ADDRESS_SEQ_NUM] [int] NULL,
        [LEGACY_UNIQUE_IDENTIFIER] [varchar](10) NULL,
         [ADDRESS_TYPE_CODE] [int] NULL,
	  CONSTRAINT [PK_ENTITY_X_ADDRESSES] PRIMARY KEY CLUSTERED 
	(
		[DA_ROW_ID] ASC,
		[JOBID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
------------------------------------------------------------

IF EXISTS (SELECT name FROM sys.tables WHERE name = 'FUNDS_X_PAYEE') 
DROP TABLE [dbo].FUNDS_X_PAYEE
BEGIN

	CREATE TABLE [dbo].[FUNDS_X_PAYEE](
		[DA_ROW_ID] [int] NOT NULL,
		[JOBID] [int] NOT NULL,
		[INPUT_ROW_ID] [int] NULL,
		[INVALID_ROW] [int] NULL,
		[UPDATE_ROW] [int] NULL,
		[PAYEE_ROW_ID] [int] NOT NULL,
		[PAYEE_EID] [int] NOT NULL,
		[FUNDS_TRANS_ID] [int] NOT NULL,
		[PAYEE_1099_FLAG] [smallint] NULL,
		[DTTM_RCD_ADDED] [varchar](14) NULL,
		[DTTM_RCD_LAST_UPD] [varchar](14) NULL,
		[ADDED_BY_USER] [varchar](50) NULL,
		[UPDATED_BY_USER] [varchar](50) NULL,
		[PAYEE_TYPE_CODE] [int] NOT NULL,
		[PHRASE_TYPE_CODE] [int]  NULL,
	 CONSTRAINT [PK_FUNDS_X_PAYEE] PRIMARY KEY CLUSTERED 
	(
		[DA_ROW_ID] ASC,
		[JOBID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]

END


/****** Object:  Table [dbo].[T_MBR_POLICY]    Script Date: 03/11/2013 14:17:57 ******/
IF EXISTS (SELECT name FROM sys.tables WHERE name = 'T_MBR_POLICY') 
DROP TABLE [dbo].T_MBR_POLICY
begin
CREATE TABLE [dbo].[T_MBR_POLICY](
	[JOBID] [int] NOT NULL,
	[CLAIM_ID] [int] NOT NULL,
	[CLAIM_NUMBER] [varchar](50) NULL,
	[CLAIMANT_ID][int] NULL,			--mpandey24 MITS 33314 : Field Added 
	[LOSS_CODE] [decimal](10, 0) NULL,
	[DISABILITY_CAT] [decimal](10, 0) NULL,
	[UNIT_ID] [decimal](10, 0) NULL,
	[UNIT_NUMBER] [varchar](10) NULL,		--mpandey24 MITS 33314 : Size changed to Varchar(10)
	[POLICY_NAME] [varchar](20) NULL,		--mpandey24 MITS 33314 : CLAIMANT_FIRST_NAME,CLAIMANT_LASTNAME and TAX_ID Fields removed
	[CLMNT_SEQNO] [decimal](20, 0) NULL,
	[RECORD_TYPE] [varchar](1) NULL,
	[COVERAGE_TYPE_CODE] [decimal](10, 0) NULL,
	[COVERAGE_TEXT][varchar] (100) NULL,
	[CVG_SEQUENCE_NO][varchar] (8) NULL,
	[TRANS_SEQ_NO][varchar] (8) NULL,
	[UNIT_TYPE] [varchar](10) NULL,

) 
end


/****** Object:  Table [dbo].[T_RESERVE_BALANCE]  **/

IF EXISTS (SELECT name FROM sys.tables WHERE name = 'T_MBR_RES_BALANCE') 
DROP TABLE [dbo].T_MBR_RES_BALANCE
BEGIN
CREATE TABLE [dbo].[T_MBR_RES_BALANCE](
	[JOBID][int] NOT NULL,
	[CLAIM_ID] [int] NULL,
	[CLAIMANT_EID] [int] NULL,
	[RTC] [int] NULL,
	[BALANCE_AMOUNT] [float] NULL,
	[DA_ROW_ID] [int] NOT NULL,
	[POLCVG_ROW_ID] [int] NULL,
	[CVG_LOSS_ROW_ID] [int] NULL,
 CONSTRAINT [PK_T_MBR_RES_BALANCE] PRIMARY KEY CLUSTERED 
	(
		[DA_ROW_ID] ASC,
		[JOBID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]

END



/****** Object:  Table [dbo].[ACTIVITY_TRACK]    Script Date: 06/04/2013 12:14:17 ******/
IF EXISTS (SELECT name FROM sys.tables WHERE name = 'ACTIVITY_TRACK') 
DROP TABLE [dbo].ACTIVITY_TRACK
BEGIN

CREATE TABLE [dbo].[ACTIVITY_TRACK](
	[JOBID][int] NOT NULL,
	[DA_ROW_ID] [int] NOT NULL,	
	[INPUT_ROW_ID] [int] NULL,
	[INVALID_ROW] [int] NULL,
	[UPDATE_ROW] [int] NULL,
	[ACTIVITY_ROW_ID] [int] NOT NULL,
	[CLAIM_ID] [int] NULL,
	[FOREIGN_TABLE_ID] [int] NULL,
	[FOREIGN_TABLE_KEY] [int] NULL,
	[UPLOAD_FLAG] [int] NULL,
	[DTTM_RCD_ADDED] [varchar](14) NULL,
	[ADDED_BY_USER] [varchar](8) NULL,
	[CHECK_BATCH_ID] [int] NULL,
	[POLICY_SYSTEM_ID] [int] NULL,
	[IS_UPDATED] [int] NULL,
	[ACTIVITY_TYPE] [int] NULL,
	[ACCOUNT_ID] [int] NULL,
	[RESERVE_AMOUNT] [float] NULL,
	[CHECK_STATUS] [int] NULL,
	[RESERVE_STATUS] [int] NULL,
	[CHANGE_AMOUNT][int]NULL,
	[VOID_FLAG] [int] NULL,
	[IS_COLLECTION] [int] NULL,
	
CONSTRAINT [PK_ACTIVITY_TRACK] PRIMARY KEY CLUSTERED 
	(
		[DA_ROW_ID] ASC,
		[JOBID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

) ON [PRIMARY]

END

/****** Object:  Table [dbo].[INVDETAIL_X_DIAG_ICD10]    Script Date: 12/26/2013 16:59:30 ******/
IF EXISTS (SELECT name FROM sys.tables WHERE name = 'INVDETAIL_X_DIAG_ICD10') 
DROP TABLE [dbo].INVDETAIL_X_DIAG_ICD10
BEGIN

CREATE TABLE [dbo].[INVDETAIL_X_DIAG_ICD10](
	[DA_ROW_ID] [int] NOT NULL,
	[JOBID] [int] NOT NULL,
	[INPUT_ROW_ID] [int] NULL,
	[INVALID_ROW] [int] NULL,
	[UPDATE_ROW] [int] NULL,
	[INVOICE_DETAIL_ID] [int] NULL,
	[DIAGNOSIS_CODE] [int] NULL,
 CONSTRAINT [PK_INVDETAIL_X_DIAG_ICD10] PRIMARY KEY CLUSTERED 
(
	[DA_ROW_ID] ASC,
	[JOBID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END

/****** Object:  Table [dbo].[ENTITY_X_ROLES]    Script Date: 01/28/2015 16:59:30 ******/
IF EXISTS (SELECT name FROM sys.tables WHERE name = 'ENTITY_X_ROLES') 
DROP TABLE [dbo].ENTITY_X_ROLES
BEGIN
CREATE TABLE [dbo].[ENTITY_X_ROLES](
	[JOBID][int] NOT NULL,
	[DA_ROW_ID] [int] NOT NULL,	
	[ER_ROW_ID] [int]  NULL,
	[ENTITY_ID] [int]  NULL,
	[ENTITY_TABLE_ID] [int]  NULL,
	[DTTM_RCD_ADDED] [varchar](14) NULL,
	[ADDED_BY_USER] [varchar](50) NULL,
	[DTTM_RCD_LAST_UPD] [varchar](14) NULL,
	[UPDATED_BY_USER] [varchar](50) NULL,
	[DELETED_FLAG] [int] NULL,
 CONSTRAINT [PK_ENTITY_X_ROLES] PRIMARY KEY CLUSTERED 
(
	[JOBID] ASC,
	[DA_ROW_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END


-----------------------------------------------------------------
/****** Object:  Table [dbo].[ADDRESS]    Script Date: 09/22/2015 12:16:29 ******/
IF EXISTS (SELECT name FROM sys.tables WHERE name = 'ADDRESS') 
DROP TABLE [dbo].ADDRESS
BEGIN
CREATE TABLE [dbo].[ADDRESS](
	[JOBID][int] NOT NULL,
	[DA_ROW_ID] [int] NOT NULL,
	[ADDRESS_ID] [int] NULL,
	[ADDR1] [varchar](100) NULL,
	[ADDR2] [varchar](100) NULL,
	[ADDR3] [varchar](100) NULL,
	[ADDR4] [varchar](100) NULL,
	[CITY] [varchar](50) NULL,
	[COUNTY] [varchar](30) NULL,
	[COUNTRY_CODE] [int] NULL,
	[STATE_ID] [int] NULL,
	[ZIP_CODE] [varchar](15) NULL,
	[ADDRESS_SEQ_NUM] [int] NULL,
	[LEGACY_UNIQUE_IDENTIFIER] [varchar](100) NULL,
	[ADDED_BY_USER] [varchar](8) NULL,
	[UPDATED_BY_USER] [varchar](8) NULL,
	[DTTM_RCD_ADDED] [varchar](14) NULL,
	[DTTM_RCD_LAST_UPD] [varchar](14) NULL,
	[SEARCH_STRING] [varchar](4000) NULL,
	[DELETED_FLAG] [smallint] NULL,
	[INVALID_ROW] [int] NULL,
	[UPDATE_ROW] [int] NULL,
 CONSTRAINT [PK_ADDRESS] PRIMARY KEY CLUSTERED 
(
	[JOBID] ASC,
	[DA_ROW_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END


--=======================================================
--RM_ACTIVITY_TRACK
--=======================================================
--/****** Object:  Table [dbo].[RM_ACTIVITY_TRACK]    Script Date: 5/31/2017 4:22:02 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RM_ACTIVITY_TRACK]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE RM_ACTIVITY_TRACK
BEGIN

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON

CREATE TABLE [dbo].[RM_ACTIVITY_TRACK](
	[ACTIVITY_ROW_ID] [int] NOT NULL,
	[CLAIM_ID] [int] NULL,
	[FOREIGN_TABLE_ID] [int] NULL,
	[FOREIGN_TABLE_KEY] [int] NULL,
	[UPLOAD_FLAG] [int] NULL,
	[DTTM_RCD_ADDED] [varchar](14) NULL,
	[ADDED_BY_USER] [varchar](50) NOT NULL,
	[CHECK_BATCH_ID] [int] NULL,
	[POLICY_SYSTEM_ID] [int] NULL,
	[IS_UPDATED] [int] NULL,
	[ACTIVITY_TYPE] [int] NULL,
	[ACCOUNT_ID] [int] NULL,
	[RESERVE_AMOUNT] [float] NULL,
	[RESERVE_STATUS] [int] NULL,
	[CHANGE_AMOUNT] [float] NULL,
	[CHECK_STATUS] [int] NULL,
	[VOID_FLAG] [int] NULL,
	[IS_COLLECTION] [int] NULL,
	[MOVE_HIST_TABLE_ID] [int] NULL,
	[MOVE_HIST_TABLE_KEY] [int] NULL,
	[ADDITIONAL_UPL_DATA] [varchar](100) NULL,
	[DTTM_RCD_LAST_UPD] [varchar](14) NULL,
	[UPDATED_BY_USER] [varchar](50) NULL,
	[RESERVE_HIST_ID] [int] NULL,
	[JOBID] [int] NULL
) ON [PRIMARY]

SET ANSI_PADDING OFF
END

--=======================================================
--RM_FUNDS
--=======================================================
--/****** Object:  Table [dbo].[RM_FUNDS]    Script Date: 5/31/2017 4:25:17 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RM_FUNDS]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE RM_FUNDS
BEGIN

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON

CREATE TABLE [dbo].[RM_FUNDS](
	[AUTO_CHECK_DETAIL] [varchar](30) NULL,
	[ROLLUP_ID] [int] NULL,
	[VOID_DATE] [varchar](8) NULL,
	[ADDR1] [varchar](100) NULL,
	[ADDR2] [varchar](100) NULL,
	[AUTO_CHECK_FLAG] [smallint] NULL,
	[CITY] [varchar](50) NULL,
	[CLAIMANT_EID_ARCHIVE] [int] NULL,
	[COUNTRY_CODE] [int] NULL,
	[FIRST_NAME] [varchar](255) NULL,
	[LAST_NAME] [varchar](255) NULL,
	[PRECHECK_FLAG] [smallint] NULL,
	[STATE_ID] [int] NULL,
	[UNIT_ID_ARCHIVE] [int] NULL,
	[ZIP_CODE] [varchar](10) NULL,
	[TRANS_ID] [int] NOT NULL,
	[CLAIM_ID] [int] NULL,
	[CLAIM_NUMBER] [varchar](25) NULL,
	[CTL_NUMBER] [varchar](25) NULL,
	[VOID_FLAG] [smallint] NULL,
	[DATE_OF_CHECK] [varchar](8) NULL,
	[CHECK_MEMO] [varchar](255) NULL,
	[TRANS_NUMBER] [bigint] NULL,
	[TRANS_DATE] [varchar](8) NOT NULL,
	[PAYEE_EID] [int] NULL,
	[PAYEE_TYPE_CODE] [int] NULL,
	[ACCOUNT_ID] [int] NULL,
	[AMOUNT] [float] NULL,
	[STATUS_CODE] [int] NULL,
	[FILED_1099_FLAG] [smallint] NULL,
	[CLEARED_FLAG] [smallint] NULL,
	[PAYMENT_FLAG] [smallint] NULL,
	[COLLECTION_FLAG] [smallint] NULL,
	[COMMENTS] [text] NULL,
	[NOTES] [varchar](2000) NULL,
	[CRC] [int] NULL,
	[DTTM_RCD_LAST_UPD] [varchar](14) NULL,
	[DTTM_RCD_ADDED] [varchar](14) NULL,
	[UPDATED_BY_USER] [varchar](50) NULL,
	[ADDED_BY_USER] [varchar](50) NULL,
	[BATCH_NUMBER] [int] NULL,
	[SEC_DEPT_EID] [int] NULL,
	[ENCLOSURE_FLAG] [smallint] NULL,
	[APPROVE_USER] [varchar](50) NULL,
	[DTTM_APPROVAL] [varchar](14) NULL,
	[SUB_ACCOUNT_ID] [int] NULL,
	[SETTLEMENT_FLAG] [smallint] NULL,
	[APPROVER_ID] [int] NULL,
	[VOUCHER_FLAG] [smallint] NULL,
	[WEEKS_PAID_CODE] [int] NULL,
	[NUM_OF_PAID_DAYS] [int] NULL,
	[TAX_PAYMENT_FLAG] [smallint] NULL,
	[RESUBMIT_EDI] [smallint] NULL,
	[SUPP_PAYMENT_FLAG] [smallint] NULL,
	[HTMLCOMMENTS] [text] NULL,
	[REISSUE_FLAG] [smallint] NULL,
	[REISSUE_BY] [varchar](50) NULL,
	[REISSUE_DATE] [varchar](8) NULL,
	[REISSUE_PARENT_ID] [int] NULL,
	[NOTES_HTMLCOMMENTS] [text] NULL,
	[REISSUE_REASON_CODE] [int] NULL,
	[MIDDLE_NAME] [varchar](255) NULL,
	[REASON] [varchar](255) NULL,
	[CONF_FLAG] [smallint] NULL,
	[CONF_EVENT_ID] [int] NULL,
	[VOID_REASON] [varchar](max) NULL,
	[VOID_REASON_HTMLCOMMENTS] [varchar](max) NULL,
	[DORMANCY_STATUS] [int] NOT NULL,
	[WITHHOLDING_PMT_FLAG] [smallint] NOT NULL,
	[WITHHOLDING_TYPE] [int] NOT NULL,
	[WITHHOLDING_CHILD_FLAG] [smallint] NOT NULL,
	[PARENT_TRANS_ID] [int] NOT NULL,
	[COMBINED_PAY_FLAG] [smallint] NOT NULL,
	[PAY_TO_THE_ORDER_OF] [varchar](max) NULL,
	[EFT_FLAG] [smallint] NULL,
	[EFT_FILE_NAME] [varchar](255) NULL,
	[EFT_DATE] [varchar](8) NULL,
	[PMT_CURRENCY_CODE] [int] NOT NULL,
	[PMT_CURRENCY_AMOUNT] [float] NOT NULL,
	[PMT_TO_BASE_CUR_RATE_AR] [float] NULL,
	[CLAIM_CURRENCY_CODE] [int] NOT NULL,
	[CLAIM_CURRENCY_AMOUNT] [float] NOT NULL,
	[PMT_TO_CLAIM_CUR_RATE_AR] [float] NULL,
	[BASE_TO_PMT_CUR_RATE_AR] [float] NULL,
	[BASE_TO_CLAIM_CUR_RATE_AR] [float] NULL,
	[FINAL_PAYMENT_FLAG] [smallint] NULL,
	[BILL_TYPE] [int] NULL,
	[MANUAL_CHECK] [int] NOT NULL,
	[CHECK_MEMO_HTMLCOMMENTS] [varchar](max) NULL,
	[RES_SUPP_PAYMENT_FLAG] [smallint] NOT NULL,
	[OFFSET_FLAG] [smallint] NULL,
	[CHECK_TOTAL] [float] NOT NULL,
	[ADDR3] [varchar](100) NULL,
	[ADDR4] [varchar](100) NULL,
	[STOP_PAY_FLAG] [smallint] NULL,
	[STOP_PAY_DATE] [varchar](8) NULL,
	[DSTRBN_TYPE_CODE] [int] NULL,
	[DEDUCTIBLE_CATEGORY] [smallint] NULL,
	[TRANSACTION_REASON] [int] NULL,
	[MAIL_TO_EID] [int] NULL,
	[MAIL_TO_ADDRESS_ID] [int] NULL,
	[COUNTY] [varchar](200) NULL,
	[POLICY_CURRENCY_CODE] [int] NOT NULL,
	[POLICY_CURRENCY_AMOUNT] [float] NOT NULL,
	[POLICY_TO_BASE_CUR_RATE_AR] [float] NULL,
	[BASE_TO_POLICY_CUR_RATE_AR] [float] NULL,
	[EOB_PRINT_DATE] [varchar](8) NULL,
	[EOB_PRINTED_BY_USER] [varchar](50) NULL,
	[DISABLE_OVERRIDE_DED] [smallint] NULL,
	[REGEOB_BATCH_ID] [int] NULL,
	[IAIABC_ADJUST_DATE] [varchar](8) NULL,
	[IAIABC_CREDIT_DATE] [varchar](8) NULL,
	[IAIABC_REDIST_DATE] [varchar](8) NULL,
	[EDI_BATCH_NUMBER] [int] NULL,
	[EDI_MED_EXTRACTED] [int] NULL,
	[JOBID] [int] NULL,
 CONSTRAINT [PK_RM_FUNDS] PRIMARY KEY CLUSTERED 
(
	[TRANS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IDX_RM_FUNDS_CTL_NUMBER] UNIQUE NONCLUSTERED 
(
	[CTL_NUMBER] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

SET ANSI_PADDING OFF

ALTER TABLE [dbo].[RM_FUNDS] ADD  DEFAULT ((0)) FOR [REISSUE_REASON_CODE]
ALTER TABLE [dbo].[RM_FUNDS] ADD  DEFAULT ((0)) FOR [DORMANCY_STATUS]
ALTER TABLE [dbo].[RM_FUNDS] ADD  DEFAULT ((0)) FOR [WITHHOLDING_PMT_FLAG]
ALTER TABLE [dbo].[RM_FUNDS] ADD  DEFAULT ((0)) FOR [WITHHOLDING_TYPE]
ALTER TABLE [dbo].[RM_FUNDS] ADD  DEFAULT ((0)) FOR [WITHHOLDING_CHILD_FLAG]
ALTER TABLE [dbo].[RM_FUNDS] ADD  DEFAULT ((0)) FOR [PARENT_TRANS_ID]
ALTER TABLE [dbo].[RM_FUNDS] ADD  DEFAULT ((0)) FOR [COMBINED_PAY_FLAG]
ALTER TABLE [dbo].[RM_FUNDS] ADD  DEFAULT ((0)) FOR [EFT_FLAG]
ALTER TABLE [dbo].[RM_FUNDS] ADD  DEFAULT ((0)) FOR [PMT_CURRENCY_CODE]
ALTER TABLE [dbo].[RM_FUNDS] ADD  DEFAULT ((0)) FOR [PMT_CURRENCY_AMOUNT]
ALTER TABLE [dbo].[RM_FUNDS] ADD  DEFAULT ((0)) FOR [PMT_TO_BASE_CUR_RATE_AR]
ALTER TABLE [dbo].[RM_FUNDS] ADD  DEFAULT ((0)) FOR [CLAIM_CURRENCY_CODE]
ALTER TABLE [dbo].[RM_FUNDS] ADD  DEFAULT ((0)) FOR [CLAIM_CURRENCY_AMOUNT]
ALTER TABLE [dbo].[RM_FUNDS] ADD  DEFAULT ((0)) FOR [PMT_TO_CLAIM_CUR_RATE_AR]
ALTER TABLE [dbo].[RM_FUNDS] ADD  DEFAULT ((0)) FOR [BASE_TO_PMT_CUR_RATE_AR]
ALTER TABLE [dbo].[RM_FUNDS] ADD  DEFAULT ((0)) FOR [BASE_TO_CLAIM_CUR_RATE_AR]
ALTER TABLE [dbo].[RM_FUNDS] ADD  DEFAULT ((0)) FOR [FINAL_PAYMENT_FLAG]
ALTER TABLE [dbo].[RM_FUNDS] ADD  DEFAULT ((0)) FOR [MANUAL_CHECK]
ALTER TABLE [dbo].[RM_FUNDS] ADD  DEFAULT ((0)) FOR [RES_SUPP_PAYMENT_FLAG]
ALTER TABLE [dbo].[RM_FUNDS] ADD  DEFAULT ((0)) FOR [CHECK_TOTAL]
ALTER TABLE [dbo].[RM_FUNDS] ADD  DEFAULT ((0)) FOR [STOP_PAY_FLAG]
ALTER TABLE [dbo].[RM_FUNDS] ADD  DEFAULT (NULL) FOR [DEDUCTIBLE_CATEGORY]
ALTER TABLE [dbo].[RM_FUNDS] ADD  DEFAULT ((0)) FOR [POLICY_CURRENCY_CODE]
ALTER TABLE [dbo].[RM_FUNDS] ADD  DEFAULT ((0)) FOR [POLICY_CURRENCY_AMOUNT]
ALTER TABLE [dbo].[RM_FUNDS] ADD  DEFAULT ((0)) FOR [POLICY_TO_BASE_CUR_RATE_AR]
ALTER TABLE [dbo].[RM_FUNDS] ADD  DEFAULT ((0)) FOR [BASE_TO_POLICY_CUR_RATE_AR]

END

--=======================================================
--RM_FUNDS_SUPP
--=======================================================
--/****** Object:  Table [dbo].[RM_FUNDS_SUPP]    Script Date: 5/31/2017 4:26:12 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RM_FUNDS_SUPP]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE RM_FUNDS_SUPP
BEGIN

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON

CREATE TABLE [dbo].[RM_FUNDS_SUPP](
	[TRANS_ID] [int] NOT NULL,
	[INT_CLAIM_TEXT] [varchar](21) NULL,
	[LSS_INVOICE_ID] [float] NULL,
	[LSS_HISTORY_ID] [float] NULL,
	[LSS_USER_ID] [varchar](50) NULL,
	[NETWRK_SRVC_CODE] [int] NULL,
	[BILL_RCVD_DATE] [varchar](8) NULL,
	[BILL_RCDMBR_DATE] [varchar](8) NULL,
	[OTH_VEN_DOC_TEXT] [varchar](25) NULL,
	[BILL_DOC_NO_TEXT] [varchar](25) NULL,
	[BILL_REV_CM_EID] [int] NULL,
	[LSS_INV_REQ_AMT] [float] NULL,
	[LSS_APPROVED_AMT] [float] NULL,
	[LSS_INV_FINAL_DATE] [varchar](8) NULL,
	[LSS_PAY_DISCOUNT] [float] NULL,
	[BENEFIT_ADJUST] [int] NULL,
	[BENEFIT_START] [varchar](8) NULL,
	[BENEFIT_END] [varchar](8) NULL,
	[BENEFIT_TRAN] [int] NULL,
	[BENEFIT_ADJ_AMT] [float] NULL,
	[BEN_ADJUST_R3] [int] NULL,
	[ADJUST_AMT] [float] NULL,
	[ADJUST_START] [varchar](8) NULL,
	[ADJUST_END] [varchar](8) NULL,
	[ADJUST_TRAN] [int] NULL,
	[BENEFIT_CREDIT] [int] NULL,
	[CREDIT_AMT] [float] NULL,
	[CREDIT_START] [varchar](8) NULL,
	[CREDIT_END] [varchar](8) NULL,
	[CREDIT_TRAN] [int] NULL,
	[BENEFIT_RED] [int] NULL,
	[REDISTR_AMT] [float] NULL,
	[REDISTR_START] [varchar](8) NULL,
	[REDISTR_END] [varchar](8) NULL,
	[REDISTR_TRAN] [int] NULL,
	[GROSS_AMT_DATE] [varchar](8) NULL,
	[NET_WKLY_AMT] [float] NULL,
	[NET_AMT_DATE] [varchar](8) NULL,
	[SETTLMT_TYPE] [int] NULL,
	[DATE_MTC_EXTRACTED] [varchar](8) NULL,
	[RECOVERY_BENEFIT_TRAN] [int] NULL,
	[SETTLE_CHECK_DATE] [varchar](8) NULL,
	[EDI_DN0174A_AMT] [float] NULL,
	[JOBID] [int] NULL,
 CONSTRAINT [PK_RM_FUNDS_SUPP] PRIMARY KEY CLUSTERED 
(
	[TRANS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING OFF
END

--=======================================================
--RM_FUNDS_TRANS_SPLIT
--=======================================================
--/****** Object:  Table [dbo].[RM_FUNDS_TRANS_SPLIT]    Script Date: 5/31/2017 4:26:29 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RM_FUNDS_TRANS_SPLIT]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE RM_FUNDS_TRANS_SPLIT
BEGIN

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON

CREATE TABLE [dbo].[RM_FUNDS_TRANS_SPLIT](
	[SUM_AMOUNT] [float] NULL,
	[SPLIT_ROW_ID] [int] NOT NULL,
	[TRANS_ID] [int] NULL,
	[TRANS_TYPE_CODE] [int] NULL,
	[RESERVE_TYPE_CODE_ARCHIVE] [int] NULL,
	[AMOUNT] [float] NULL,
	[GL_ACCOUNT_CODE] [int] NULL,
	[FROM_DATE] [varchar](8) NULL,
	[TO_DATE] [varchar](8) NULL,
	[INVOICED_BY] [varchar](50) NULL,
	[INVOICE_AMOUNT] [float] NULL,
	[INVOICE_NUMBER] [varchar](30) NULL,
	[PO_NUMBER] [varchar](14) NULL,
	[CRC] [int] NULL,
	[DTTM_RCD_LAST_UPD] [varchar](14) NULL,
	[DTTM_RCD_ADDED] [varchar](14) NULL,
	[UPDATED_BY_USER] [varchar](50) NULL,
	[ADDED_BY_USER] [varchar](50) NULL,
	[INVOICE_DATE] [varchar](8) NULL,
	[BILL_RCVD_BY_CARRIER_DATE] [varchar](8) NULL,
	[SUPP_PAYMENT_FLAG] [smallint] NULL,
	[AUTO_DISCOUNT] [varchar](10) NULL,
	[SPLIT_CURR_CODE_AR] [float] NULL,
	[SPLIT_CURRENCY_AMOUNT_AR] [float] NULL,
	[SPLIT_CURR_INVOICE_AMOUNT_AR] [float] NULL,
	[SPLIT_CURR_AUTO_DISCOUNT_AR] [float] NULL,
	[SPLIT_TO_BASE_CURR_RATE_AR] [float] NULL,
	[BASE_TO_SPLIT_CURR_RATE_AR] [float] NULL,
	[SPLIT_TO_PMT_CURR_RATE_AR] [float] NULL,
	[POLCVG_ROW_ID_ARCHIVE] [int] NULL,
	[IS_FIRST_FINAL] [smallint] NULL,
	[WITHHOLDING_SPLIT_FLAG] [smallint] NOT NULL,
	[PARENT_SPLIT_ROW_ID] [int] NULL,
	[CONTROL_REQ_FLAG] [smallint] NULL,
	[FUNDS_CR_STATUS] [int] NULL,
	[PMT_CURRENCY_AMOUNT] [float] NOT NULL,
	[PMT_CURRENCY_INVOICE_AMOUNT_AR] [float] NULL,
	[PMT_CURRENCY_AUTO_DISCOUNT] [float] NOT NULL,
	[CLAIM_CURRENCY_AMOUNT] [float] NOT NULL,
	[CLAIM_CURR_INVOICE_AMT_AR] [float] NULL,
	[CLAIM_CURRENCY_AUTO_DISCOUNT] [float] NOT NULL,
	[UPDATE_POL_SYS] [smallint] NULL,
	[POLICY_SYSTEM_ID] [int] NOT NULL,
	[RC_ROW_ID] [int] NOT NULL,
	[LEGACY_UNIQUE_IDENTIFIER] [varchar](100) NULL,
	[OVERRIDE_DED_FLAG] [smallint] NOT NULL,
	[POLICY_CURRENCY_AMOUNT] [float] NOT NULL,
	[POLICY_CURR_INVOICE_AMT_AR] [float] NULL,
	[CURRENCY_CONVERSION_DATE] [varchar](14) NULL,
	[PMT_TO_BASE_CUR_RATE] [float] NULL,
	[PMT_TO_CLAIM_CUR_RATE] [float] NULL,
	[PMT_TO_POLICY_CUR_RATE] [float] NULL,
	[INVOICE_CURRENCY_CODE] [int] NULL,
	[JOBID] [int] NULL,
 CONSTRAINT [PK_RM_FUNDS_TRANS_SPLIT] PRIMARY KEY CLUSTERED 
(
	[SPLIT_ROW_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING OFF

ALTER TABLE [dbo].[RM_FUNDS_TRANS_SPLIT] ADD  DEFAULT ((0)) FOR [POLCVG_ROW_ID_ARCHIVE]
ALTER TABLE [dbo].[RM_FUNDS_TRANS_SPLIT] ADD  DEFAULT ((0)) FOR [WITHHOLDING_SPLIT_FLAG]
ALTER TABLE [dbo].[RM_FUNDS_TRANS_SPLIT] ADD  DEFAULT ((0)) FOR [PMT_CURRENCY_AMOUNT]
ALTER TABLE [dbo].[RM_FUNDS_TRANS_SPLIT] ADD  DEFAULT ((0)) FOR [PMT_CURRENCY_INVOICE_AMOUNT_AR]
ALTER TABLE [dbo].[RM_FUNDS_TRANS_SPLIT] ADD  DEFAULT ((0)) FOR [PMT_CURRENCY_AUTO_DISCOUNT]
ALTER TABLE [dbo].[RM_FUNDS_TRANS_SPLIT] ADD  DEFAULT ((0)) FOR [CLAIM_CURRENCY_AMOUNT]
ALTER TABLE [dbo].[RM_FUNDS_TRANS_SPLIT] ADD  DEFAULT ((0)) FOR [CLAIM_CURR_INVOICE_AMT_AR]
ALTER TABLE [dbo].[RM_FUNDS_TRANS_SPLIT] ADD  DEFAULT ((0)) FOR [CLAIM_CURRENCY_AUTO_DISCOUNT]
ALTER TABLE [dbo].[RM_FUNDS_TRANS_SPLIT] ADD  DEFAULT ((0)) FOR [POLICY_SYSTEM_ID]
ALTER TABLE [dbo].[RM_FUNDS_TRANS_SPLIT] ADD  DEFAULT ((0)) FOR [RC_ROW_ID]
ALTER TABLE [dbo].[RM_FUNDS_TRANS_SPLIT] ADD  DEFAULT ((0)) FOR [OVERRIDE_DED_FLAG]
ALTER TABLE [dbo].[RM_FUNDS_TRANS_SPLIT] ADD  DEFAULT ((0)) FOR [POLICY_CURRENCY_AMOUNT]
ALTER TABLE [dbo].[RM_FUNDS_TRANS_SPLIT] ADD  DEFAULT ((0)) FOR [POLICY_CURR_INVOICE_AMT_AR]

END

--=======================================================
--RM_FUNDS_X_PAYEE
--=======================================================
--/****** Object:  Table [dbo].[RM_FUNDS_X_PAYEE]    Script Date: 5/31/2017 4:26:45 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RM_FUNDS_X_PAYEE]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE RM_FUNDS_X_PAYEE
BEGIN

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON

CREATE TABLE [dbo].[RM_FUNDS_X_PAYEE](
	[PAYEE_ROW_ID] [int] NOT NULL,
	[PAYEE_EID] [int] NOT NULL,
	[FUNDS_TRANS_ID] [int] NOT NULL,
	[PAYEE_1099_FLAG] [smallint] NOT NULL,
	[DTTM_RCD_ADDED] [varchar](14) NOT NULL,
	[DTTM_RCD_LAST_UPD] [varchar](14) NOT NULL,
	[ADDED_BY_USER] [varchar](50) NOT NULL,
	[UPDATED_BY_USER] [varchar](50) NOT NULL,
	[PAYEE_TYPE_CODE] [int] NOT NULL,
	[PHRASE_TYPE_CODE] [int] NOT NULL,
	[BEFORE_PAYEE] [int] NOT NULL,
	[JOBID] [int] NULL
) ON [PRIMARY]

SET ANSI_PADDING OFF

ALTER TABLE [dbo].[RM_FUNDS_X_PAYEE] ADD  DEFAULT ((0)) FOR [PAYEE_TYPE_CODE]
ALTER TABLE [dbo].[RM_FUNDS_X_PAYEE] ADD  DEFAULT ((0)) FOR [PHRASE_TYPE_CODE]
ALTER TABLE [dbo].[RM_FUNDS_X_PAYEE] ADD  DEFAULT ((0)) FOR [BEFORE_PAYEE]

END

--=======================================================
--RM_INVDETAIL_X_DIAG
--=======================================================
--/****** Object:  Table [dbo].[RM_INVDETAIL_X_DIAG]    Script Date: 5/31/2017 4:27:08 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RM_INVDETAIL_X_DIAG]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE RM_INVDETAIL_X_DIAG
BEGIN

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[RM_INVDETAIL_X_DIAG](
	[INVOICE_DETAIL_ID] [int] NOT NULL,
	[DIAGNOSIS_CODE] [int] NOT NULL,
	[JOBID] [int] NULL,
 CONSTRAINT [PK_RM_INVDETAIL_X_DIAG] PRIMARY KEY CLUSTERED 
(
	[INVOICE_DETAIL_ID] ASC,
	[DIAGNOSIS_CODE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

END

--=======================================================
--RM_INVDETAIL_X_DIAG_ICD10
--=======================================================
--/****** Object:  Table [dbo].[RM_INVDETAIL_X_DIAG_ICD10]    Script Date: 5/31/2017 4:27:27 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RM_INVDETAIL_X_DIAG_ICD10]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE RM_INVDETAIL_X_DIAG_ICD10
BEGIN

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[RM_INVDETAIL_X_DIAG_ICD10](
	[INVOICE_DETAIL_ID] [int] NOT NULL,
	[DIAGNOSIS_CODE] [int] NOT NULL,
	[JOBID] [int] NULL,
 CONSTRAINT [PK_RM_INVDETAIL_X_DIAG_ICD10] PRIMARY KEY CLUSTERED 
(
	[INVOICE_DETAIL_ID] ASC,
	[DIAGNOSIS_CODE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

END

--=======================================================
--RM_INVDETAIL_X_EOB
--=======================================================
--/****** Object:  Table [dbo].[RM_INVDETAIL_X_EOB]    Script Date: 5/31/2017 4:27:39 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RM_INVDETAIL_X_EOB]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE RM_INVDETAIL_X_EOB
BEGIN

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[RM_INVDETAIL_X_EOB](
	[INVOICE_DETAIL_ID] [int] NOT NULL,
	[EOB_CODE] [int] NOT NULL,
	[EOB_TABLE] [int] NOT NULL,
	[JOBID] [int] NULL,
 CONSTRAINT [PK_RM_INVDETAIL_X_EOB] PRIMARY KEY CLUSTERED 
(
	[INVOICE_DETAIL_ID] ASC,
	[EOB_CODE] ASC,
	[EOB_TABLE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

END

--=======================================================
--RM_INVDETAIL_X_MOD
--=======================================================
--/****** Object:  Table [dbo].[RM_INVDETAIL_X_MOD]    Script Date: 5/31/2017 4:28:15 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RM_INVDETAIL_X_MOD]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE RM_INVDETAIL_X_MOD
BEGIN

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[RM_INVDETAIL_X_MOD](
	[INVOICE_DETAIL_ID] [int] NOT NULL,
	[MODIFIER_CODE] [int] NOT NULL,
	[MODIFIER_ORDER] [int] NULL,
	[JOBID] [int] NULL,
 CONSTRAINT [PK_RM_INVDETAIL_X_MOD] PRIMARY KEY CLUSTERED 
(
	[INVOICE_DETAIL_ID] ASC,
	[MODIFIER_CODE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

END

--=======================================================
--RM_INVOICE
--=======================================================
--/****** Object:  Table [dbo].[RM_INVOICE]    Script Date: 5/31/2017 4:28:31 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RM_INVOICE]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE RM_INVOICE
BEGIN

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON

CREATE TABLE [dbo].[RM_INVOICE](
	[INVOICE_ID] [int] NOT NULL,
	[FUNDS_TRANS_ID] [int] NULL,
	[CLAIM_ID] [int] NULL,
	[CLAIM_NUMBER_TEXT] [varchar](50) NULL,
	[CLAIMANT_EID] [int] NULL,
	[UNIT_ID] [int] NULL,
	[PAYEE_TYPE_CODE] [int] NULL,
	[PAYEE_EID] [int] NULL,
	[PAYEE_SPEC_CODE] [int] NULL,
	[LAST_NAME_TEXT] [varchar](255) NULL,
	[FIRST_NAME_TEXT] [varchar](255) NULL,
	[ADDR1_TEXT] [varchar](100) NULL,
	[ADDR2_TEXT] [varchar](100) NULL,
	[CITY_TEXT] [varchar](50) NULL,
	[STATE_ID] [int] NULL,
	[COUNTRY_CODE] [int] NULL,
	[POSTAL_CODE_TEXT] [varchar](15) NULL,
	[TRANS_DATE_TEXT] [varchar](8) NULL,
	[TOT_SCHEDULED_AMT] [float] NULL,
	[TOT_REDUCTION_AMT] [float] NULL,
	[TOT_AMT_TO_PAY] [float] NULL,
	[TOT_AMT_SAVED] [float] NULL,
	[TOT_AMT_BILLED] [float] NULL,
	[NUM_DETAIL_LINES] [smallint] NULL,
	[DTTM_RCD_ADDED] [varchar](14) NULL,
	[ADDED_BY_USER] [varchar](50) NULL,
	[DTTM_RCD_LAST_UPD] [varchar](14) NULL,
	[UPDATED_BY_USER] [varchar](50) NULL,
	[DTTM_EOB_PRINTED] [varchar](14) NULL,
	[EOB_PRINTED_USER] [varchar](50) NULL,
	[PPO_REDUCTION_AMT] [float] NULL,
	[OTH_REDUCTION_AMT] [float] NULL,
	[ADDR3_TEXT] [varchar](100) NULL,
	[ADDR4_TEXT] [varchar](100) NULL,
	[JOBID] [int] NULL,
 CONSTRAINT [PK_RM_INVOICE] PRIMARY KEY CLUSTERED 
(
	[INVOICE_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING OFF
END

--=======================================================
--RM_INVOICE_DETAIL
--=======================================================
--/****** Object:  Table [dbo].[RM_INVOICE_DETAIL]    Script Date: 5/31/2017 4:28:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RM_INVOICE_DETAIL]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE RM_INVOICE_DETAIL
BEGIN

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON

CREATE TABLE [dbo].[RM_INVOICE_DETAIL](
	[INVOICE_DETAIL_ID] [int] NOT NULL,
	[INVOICE_ID] [int] NULL,
	[FUNDS_SPLIT_ROW_ID] [int] NULL,
	[TABLE_CODE] [int] NULL,
	[PERCENTILE] [varchar](4) NULL,
	[PLACE_OF_SER_CODE] [int] NULL,
	[TYPE_OF_SER_CODE] [int] NULL,
	[BILLING_CODE_TEXT] [varchar](64) NULL,
	[UNITS_BILLED_NUM] [float] NULL,
	[UNITS_BILLED_TYPE] [int] NULL,
	[AMOUNT_BILLED] [float] NULL,
	[SCHEDULED_AMOUNT] [float] NULL,
	[AMOUNT_REDUCED] [float] NULL,
	[AMOUNT_TO_PAY] [float] NULL,
	[AMOUNT_SAVED] [float] NULL,
	[TOOTH_NUMBER] [smallint] NULL,
	[SURFACE_TEXT] [varchar](50) NULL,
	[MODIFIER_CODE] [int] NULL,
	[QUANTITY] [varchar](6) NULL,
	[STORE] [varchar](11) NULL,
	[CONTRACT_EXISTS] [int] NULL,
	[OVERRIDE_TYPE] [int] NULL,
	[CONTRACT_AMOUNT] [float] NULL,
	[DISCOUNT] [float] NULL,
	[AMOUNT_ALLOWED] [float] NULL,
	[BASE_AMOUNT] [float] NULL,
	[ZIP_CODE] [varchar](10) NULL,
	[FEE_TABLE_AMT] [float] NULL,
	[PER_DIEM_AMT] [float] NULL,
	[STOP_LOSS_AMT] [float] NULL,
	[STOP_LOSS_FLAG] [int] NULL,
	[FEE_DATA_SOURCE] [int] NULL,
	[FEE_TABLE_STATE] [varchar](2) NULL,
	[FEE_TABLE_STUDY] [varchar](5) NULL,
	[FEE_DATA_REVISION] [varchar](3) NULL,
	[PRESCRIP_NO] [varchar](30) NULL,
	[DRUG_NAME] [varchar](80) NULL,
	[PRESCRIP_DATE] [varchar](8) NULL,
	[DAYS_SUPPLIED] [int] NULL,
	[DATE_FILLED] [varchar](8) NULL,
	[REV_CODE] [varchar](4) NULL,
	[PHY_EID] [int] NULL,
	[MED_SUPPLY_FLAG] [int] NULL,
	[DIAG_REF_NO] [varchar](4) NULL,
	[TABLE_CODE_2] [int] NULL,
	[BRS_FEE_AMT1] [float] NULL,
	[BRS_FEE_AMT2] [float] NULL,
	[MEDS_QUANTITY] [int] NULL,
	[RX_IND] [int] NULL,
	[CERTIFICATION] [int] NULL,
	[RX_USUAL_CHARGE] [float] NULL,
	[PHY_PHARM_NDC] [varchar](20) NULL,
	[PHY_PHARM_NDC_DES] [varchar](50) NULL,
	[FL_LICENSE] [varchar](25) NULL,
	[DISPENSED] [int] NULL,
	[HCPCS_CODE] [varchar](5) NULL,
	[PURCHASED_IND] [int] NULL,
	[BILL_TYPE] [int] NULL,
	[PPO_REDUCTION_AMT] [float] NULL,
	[OTH_REDUCTION_AMT] [float] NULL,
	[DENY_LINE_ITEM] [smallint] NULL,
	[PHY_PHARM_NDC_SEC] [varchar](20) NULL,
	[PHY_PHARM_NDC_SEC_DES] [varchar](50) NULL,
	[COUNTY] [varchar](20) NULL,
	[SCHEDULED_TYPE] [int] NULL,
	[INPATIENT_TYPE] [int] NULL,
	[OUTPATIENT_TYPE] [int] NULL,
	[JOBID] [int] NULL,
 CONSTRAINT [PK_RM_INVOICE_DETAIL] PRIMARY KEY CLUSTERED 
(
	[INVOICE_DETAIL_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING OFF
END

--=======================================================
--T_MBR_FILTER_RC0
--=======================================================
--/****** Object:  Table [dbo].[T_MBR_FILTER_RC0]    Script Date: 9/10/2019 4:28:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[T_MBR_FILTER_RC0]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE T_MBR_FILTER_RC0
BEGIN

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON

CREATE TABLE [dbo].[T_MBR_FILTER_RC0](
	[CLAIM_ID]	[INT] NULL,
	[CLAIMANT_EID]	[INT] NULL,
	[PAID_TOTAL]	[FLOAT] NULL,
	[RESERVE_TYPE_CODE]	[INT] NULL,
	[COLLECTION_TOTAL]	[FLOAT] NULL,
	[LINE_OF_BUS_CODE]	[INT] NULL,
	[CLAIM_STATUS_CODE]	[VARCHAR]	(25) NULL,			   	
	[COLL_IN_RSV_BAL]	[INT] NULL,
	[BAL_TO_ZERO]	[INT] NULL,
	[NEG_BAL_TO_ZERO]	[INT] NULL,
	[ADJ_RSV]	[INT] NULL,
	[COLL_IN_INCUR_BAL]	[INT] NULL,
	[RC_ROW_ID]	[INT] NULL,
	[POLICY_CURR_PAID_TOTAL]	[FLOAT] NULL,
	[POLICY_CURR_COLLECTION_TOTAL]	[FLOAT] NULL,
	[CLAIM_CURRENCY_PAID_TOTAL]	[FLOAT] NULL,
	[CLAIM_CURR_COLLECTION_TOTAL]	[FLOAT] NULL,
	[JOBID] [INT] NULL
) ON [PRIMARY]

SET ANSI_PADDING OFF
END

--=======================================================
--T_MBR_FILTER_RC
--=======================================================
--/****** Object:  Table [dbo].[T_MBR_FILTER_RC]    Script Date: 9/10/2019 4:28:50 PM ******/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[T_MBR_FILTER_RC]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE T_MBR_FILTER_RC
BEGIN

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON

CREATE TABLE [dbo].[T_MBR_FILTER_RC](
	[DA_ROW_ID] [INT] NULL,
	[JOBID] [INT] NULL,
	[INPUT_ROW_ID] [INT] NULL,
	[INVALID_ROW] [INT] NULL,
	[UPDATE_ROW] [INT] NULL,
	[BALANCE_AMOUNT] [float] NULL,
	[RC_ROW_ID] [INT] NULL,
	[CLAIM_ID] [INT] NULL,
	[UNIT_ID] [INT] NULL,
	[CLAIMANT_EID] [INT] NULL,
	[RESERVE_TYPE_CODE] [INT] NULL,
	[RESERVE_AMOUNT] [float] NULL,
	[INCURRED_AMOUNT] [float] NULL,
	[COLLECTION_TOTAL] [float] NULL,
	[PAID_TOTAL] [float] NULL,
	[DATE_ENTERED] [VARCHAR] (8) NULL,
	[ENTERED_BY_USER] [VARCHAR] (8) NULL,
	[REASON] [VARCHAR] (30) NULL,
	[UPDATED_BY_USER] [VARCHAR] (8) NULL,
	[DTTM_RCD_ADDED] [VARCHAR] (14) NULL,
	[DTTM_RCD_LAST_UPD] [VARCHAR] (14) NULL,
	[ADDED_BY_USER] [VARCHAR] (8) NULL,
	[CRC] [INT] NULL,
	[SEC_DEPT_EID] [INT] NULL,
	[RES_STATUS_CODE] [INT] NULL,
	[ALLOCATED_AMOUNT] [float] NULL,
	[CONF_FLAG] [INT] NULL,
	[CONF_EVENT_ID] [INT] NULL,
	[POLCVG_ROW_ID] [INT] NULL,
	[STAGING_ID] [INT] NULL,
	[CURRENT_RESERVE_AMOUNT] [float] NULL,
	[BAL_TO_ZERO] [INT] NULL,
	[COLL_IN_RSV_BAL] [INT] NULL,
	[NEG_BAL_TO_ZERO] [INT] NULL,
	[ADJ_RSV] [INT] NULL,
	[COLL_IN_INCUR_BAL] [INT] NULL,
	[CLAIM_STATUS_CODE] [VARCHAR] (25) NULL,
	[RESERVE_CATEGORY] [VARCHAR] (4) NULL,
	[CLAIM_CURR_BALANCE_AMT] [float] NULL,
	[CLAIM_CURR_INCURRED_AMT] [float] NULL,
	[POLICY_CURR_BALANCE_AMT] [float] NULL,
	[POLICY_CURR_INCURRED_AMT] [float] NULL,
	[CLAIM_CURR_RESERVE_AMT] [float] NULL,
	[POLICY_CURR_RESERVE_AMT] [float] NULL,
	[POLICY_CURR_PAID_TOTAL] [float] NULL,
	[POLICY_CURR_COLLECTION_TOTAL] [float] NULL,
	[CLAIM_CURRENCY_PAID_TOTAL] [float] NULL,
	[CLAIM_CURR_COLLECTION_TOTAL] [float] NULL,
	[PAYMENT_AMOUNT] [float] NULL,
	[CLAIM_CURRENCY_AMOUNT] [float] NULL,
	[POLICY_CURRENCY_AMOUNT] [float] NULL,
	[PREV_PRINT_TOTAL] [float] NULL,
	[PREV_POLICY_PRINT_TOTAL] [float] NULL,
	[PREV_POLICY_ALLOCATED_TOTAL] [float] NULL,
	[PREV_CLAIM_PRINT_TOTAL] [float] NULL,
	[PREV_CLAIM_ALLOCATED_TOTAL] [float] NULL,
	[PREV_ALLOCATED_AMOUNT] [float] NULL,
	[PAYMENT_FLAG] [INT] NULL
) ON [PRIMARY]

SET ANSI_PADDING OFF
END


END

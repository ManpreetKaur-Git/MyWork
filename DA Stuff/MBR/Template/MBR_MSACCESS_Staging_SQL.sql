-- ============================================================
--   DI Module Name: MBR
--   Template_MBR (rmA16.4 and above)
--   DESCRIPTION: Structure Definition Script for
--		LINEITEMS,
--		HEADER
--   Script Date: 07/25/2011 14:54:43
--	 Author		: VSONI5
--   ipuri 06/29/2012 Mits:28539
--==============================================================
IF ((SELECT COUNT(*) AS isRMDB FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='SYS_PARMS')=1)
	BEGIN
		PRINT 'Error: Script Execution Aborted - Script trying to execute on RISKMASTER database not on DA Access Staging database. Please open the correct Access Staging database and execute this script.';
	END
ELSE
BEGIN

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HEADER]') AND type in (N'U')) 
DROP TABLE [dbo].[HEADER]

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LINEITEMS]') AND type in (N'U')) 
DROP TABLE [dbo].[LINEITEMS]




--==============================================================
-- Create All the MBR Staging Tables
----------------------------------------------------------------
--****** Object:  Table [dbo].[HEADER]     ******/
---------------------------------------------------------------

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HEADER]') AND type in (N'U')) 

BEGIN
CREATE TABLE [dbo].[HEADER](
	[OPTIONSET_ID] [int] NOT NULL,
	[PAY_OR_COLLECTION] [varchar](1) NULL,
	[CLAIM_NUMBER] [varchar](25) NOT NULL,
	[BILL_DOCUMENT_NUMBER] [varchar](25) NOT NULL,
	[ACCOUNT_NAME] [varchar](100) NULL,
	[PT_PROV_LAST_NAME] [varchar](255) NULL,
	[PT_PROV_FIRST_NAME] [varchar](255) NULL,
	[PT_PROV_MI] [varchar](1) NULL,
	[PT_PROV_ADDRESS1] [varchar](50) NULL,
	[PT_PROV_ADDRESS2] [varchar](50) NULL,
	[PT_PROV_CITY] [varchar](25) NULL,
	[PT_PROV_STATE] [varchar](2) NULL,
	[PT_PROV_ZIPCODE] [varchar](14) NULL,
	[PT_PROV_TAX_ID] [varchar](9) NULL,
	[TOTAL_BILLED] [decimal](10, 2) NULL,
	[TOTAL_PAID] [decimal](10, 2) NULL,
	[DATE_BILLS_PAID] [varchar](8) NULL,
	[PATIENT_LAST_NAME] [varchar](255) NULL,
	[PATIENT_FIRST_NAME] [varchar](255) NULL,
	[PATIENT_MI] [varchar](1) NULL,
	[PATIENT_SUFFIX] [varchar](10) NULL,
	[PATIENT_SSN] [varchar](9) NULL,
	[BAD_FLAG] [int] NULL,
	[BAD_REASON] [varchar](50) NULL,
	[CHECK_NUMBER] [varchar](10) NULL,
	[CHECK_DATE] [varchar](8) NULL,
	[TOT_SCHEDULED_AMT] [decimal](10, 2) NULL,
	[TOT_REDUCTION_AMT] [decimal](10, 2) NULL,
	[PATIENT_ACCT_NO] [varchar](14) NULL,
	[PROV_INVOICE_NUMBER] [varchar](25) NULL,
	[DATE_BILL_RECEIVED] [varchar](8) NULL,
	[DATE_BILL_RECEIVED_BY_MBR_CO] [varchar](8) NULL,
	[PPO_REDUCTION] [decimal](10, 2) NULL,
	[OTHER_REDUCTION] [decimal](10, 2) NULL,
	[OTHER_VENDOR_DOC_NUM] [varchar](25) NULL,
	[PT_PROV_SUFFIX] [varchar](25) NULL,
	[NPI_NUMBER] [varchar](10) NULL,
	[PT_PROV_PREFIX][varchar](25) NULL,
	[MEMO_PHRASE][varchar](25) NULL,
	) ON [PRIMARY]
END
------------------------------------------------------------

------------------------------------------------------------
/****** Object:  Table [dbo].[HEADER]     ******/
------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LINEITEMS]') AND type in (N'U')) 

BEGIN
CREATE TABLE [dbo].[LINEITEMS](
	[OPTIONSET_ID] [int] NULL,
	[LI_LINE_NUMBER] [int] NOT NULL,
	[BILL_DOCUMENT_NUMBER] [varchar](25) NOT NULL,
	[LINE_ITEM_CPT] [varchar](10) NULL,
	[CPT_DESCRIPTION] [varchar](100) NULL,
	[LI_PLACE_OF_SER_CODE] [varchar](25) NULL,
	[LI_TYPE_OF_SER_CODE] [varchar](25) NULL,
	[LI_CHARGES] [decimal](10, 2) NULL,
	[LI_PAID] [decimal](10, 2) NULL,
	[LI_UNITS] [int] NULL,
	[LI_BEGIN_DATE] [varchar](8) NULL,
	[LI_END_DATE] [varchar](8) NULL,
	[TRANS_TYPE_CODE] [varchar](25) NULL,
	[SUFFIX] [varchar](14) NULL,
	[SCHEDULED_AMT] [decimal](10, 2) NULL,
	[REDUCTION_AMT] [decimal](10, 2) NULL,
	[REASON] [varchar](80) NULL,
	[PROV_INVOICE_NUMBER] [varchar](25) NULL,
	[PPO_REDUCTION] [decimal](10, 2) NULL,
	[OTHER_REDUCTION] [decimal](10, 2) NULL,
	[NETWORK_SERVICE_CODE] [varchar](1) NULL,
	[PAID_PROC_CODE_MOD] [varchar](8) NULL,
	[PRIM_ICD9_DIAG_CODE] [varchar](14) NULL,
	[SEC_ICD9_DIAG_CODE] [varchar](14) NULL,
	[PRIM_ICD10_DIAG_CODE] [varchar](14) NULL,	--MITS 33392 - ICD 10 Requiremnt
	[SEC_ICD10_DIAG_CODE] [varchar](14) NULL,	--MITS 33392 - ICD 10 Requiremnt
	[PROV_TYPE_CODE] [varchar](20) NULL,
	[POLICY_NAME] [varchar](20) NULL,
	[UNIT_TYPE][varchar] (6) NULL,
	[UNIT_NUMBER][varchar] (25) NULL, 
	[COVERAGE_CODE][varchar] (25) NULL,
	[COVERAGE_TEXT][varchar] (100) NULL,
	[CVG_SEQUENCE_NO][varchar] (8) NULL,
	[TRANS_SEQ_NO][varchar] (8) NULL,
	[LOSS_CODE][varchar] (25) NULL,
	[DIS_CAT_CODE][varchar] (25) NULL,
	[DIS_LOSS_CODE][varchar] (25) NULL,
	[RESERVE_SUB_TYPE][varchar](25) NULL,
) ON [PRIMARY]
END

END
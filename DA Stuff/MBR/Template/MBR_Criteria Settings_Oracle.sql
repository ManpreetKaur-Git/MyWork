-- ============================================================
--   Template_MBR (rmA16.4 and above)
--   Table:	DATA_INTEGRATOR_TEMPLATES
--   DATE:	 06/29/2012
--   ipuri  Mits:28559  Added Begin End block
--   ipuri  Mits:29801  Added delete statement
-- ============================================================


BEGIN
delete from DATA_INTEGRATOR_TEMPLATES where MODULE_NAME='MBR';
INSERT INTO DATA_INTEGRATOR_TEMPLATES VALUES ((NVL((SELECT MAX(ROW_ID) FROM DATA_INTEGRATOR_TEMPLATES),0) + 1),'MBR','<MBR><Execution_Mode></Execution_Mode><FileType></FileType><PipeFileName></PipeFileName><SourceFile></SourceFile><ProcessClosedClaims></ProcessClosedClaims><EnclFlag></EnclFlag><FilterFrozenClaims></FilterFrozenClaims><CheckImportReason></CheckImportReason><CheckImportMedData></CheckImportMedData><CheckInsuffRes></CheckInsuffRes><UseSuffixCode></UseSuffixCode><ImportPrintedChecks></ImportPrintedChecks><CheckImportProviderInvoiceNumber></CheckImportProviderInvoiceNumber><QueuedPayments></QueuedPayments><GetfirstPayee></GetfirstPayee><SearchbySSN></SearchbySSN><UsePayeeZipLookup></UsePayeeZipLookup><DoNotAddPayee></DoNotAddPayee><UseImportPayeeInfo></UseImportPayeeInfo><ExcludeInvoice></ExcludeInvoice><DuplicatesInclVoids></DuplicatesInclVoids><DuplicatesUseSvcDts></DuplicatesUseSvcDts><UseFeePayment></UseFeePayment><JurisdictionStates1></JurisdictionStates1><CorvelFeeTransType></CorvelFeeTransType><PostDateType1></PostDateType1><CorvelFeeIdentifier></CorvelFeeIdentifier><MBRPaymentsPrinted></MBRPaymentsPrinted><JurisdictionStates2></JurisdictionStates2><CorvelFeeTransType2></CorvelFeeTransType2><PostDateType2></PostDateType2><CorvelFeeIdentifier2></CorvelFeeIdentifier2><MBRPayments2Printed></MBRPayments2Printed><ClearGrid></ClearGrid><BillDocumentNumberCheck></BillDocumentNumberCheck><AppendLog></AppendLog><PrintProcessLog></PrintProcessLog><ExportType></ExportType><ExportDateOnUI></ExportDateOnUI><ExportDateOnUIForEntity></ExportDateOnUIForEntity><RemoveSSN></RemoveSSN><LOBCodes></LOBCodes><ServiceCode></ServiceCode><ClaimStatus></ClaimStatus><Entity_Category></Entity_Category><IncludeSuffix></IncludeSuffix><UpdateSuffix></UpdateSuffix><UpdAllSuffixes></UpdAllSuffixes><EntityTableIds></EntityTableIds><PeopleTableIds></PeopleTableIds><OrgHier_To_Export></OrgHier_To_Export><ClaimAjusterEx></ClaimAjusterEx></MBR>');
COMMIT;
END;
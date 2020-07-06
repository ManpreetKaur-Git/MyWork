-- ============================================================
--   Template_MBR(rmA16.4 and above)
--   Table:	DATA_INTEGRATOR_TEMPLATES
--   DATE:	 06/29/2012
--   ipuri  Mits:28539  Added If Statement
-- ============================================================

BEGIN
IF ((SELECT MAX(TASK_TYPE_ID) FROM TM_TASK_TYPE WHERE NAME='MBR') is null)
	begin
	INSERT INTO TM_TASK_TYPE VALUES((SELECT ISNULL(MAX(TASK_TYPE_ID),0) FROM TM_TASK_TYPE)+1,'MBR', 'DA_MBR', '<Task Name=''MBR'' cmdline=''yes''><Path>DA_MBR.exe</Path></Task>', -1, 'MBRsettings')
	end
ELSE 
	begin
	UPDATE TM_TASK_TYPE SET DESCRIPTION ='DA_MBR' WHERE NAME ='MBR'
	--DELETE FROM TM_TASK_TYPE WHERE NAME='MBR'
	--INSERT INTO TM_TASK_TYPE VALUES((SELECT ISNULL(MAX(TASK_TYPE_ID),0) FROM TM_TASK_TYPE)+1,'MBR', 'DA_MBR', '<Task Name=''MBR'' cmdline=''yes''><Path>DA_MBR.exe</Path></Task>', -1, 'MBRsettings')
	end
END

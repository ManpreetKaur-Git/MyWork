-- ============================================================
--   Template_MBR(rmA16.4 and above)
--   Table:	DATA_INTEGRATOR_TEMPLATES
--   DATE:	 06/29/2012
--   ipuri  Mits:28559  Added Begin End block
-- ============================================================


declare itasktype number;
BEGIN
select MAX(TASK_TYPE_ID) INTO itasktype FROM TM_TASK_TYPE WHERE NAME='MBR';
IF(itasktype is NULL) THEN 
		BEGIN
INSERT INTO TM_TASK_TYPE VALUES(NVL((select MAX(TASK_TYPE_ID) FROM TM_TASK_TYPE),0) + 1,'MBR', 'DA_MBR', '<Task Name=''MBR'' cmdline=''yes''><Path>DA_MBR.exe</Path></Task>', -1, 'MBRsettings');
		END;
ELSE	
		UPDATE TM_TASK_TYPE SET DESCRIPTION='DA_MBR' WHERE NAME='MBR';
		--BEGIN
		--DELETE FROM TM_TASK_TYPE WHERE NAME='MBR';
		--INSERT INTO TM_TASK_TYPE VALUES(NVL((select MAX(TASK_TYPE_ID) FROM TM_TASK_TYPE),0) + 1,'MBR', 'DA_MBR', '<Task Name=''MBR'' cmdline=''yes''><Path>DA_MBR.exe</Path></Task>', -1, 'MBRsettings');
		--END;
END IF;
COMMIT;
END;

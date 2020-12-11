@echo on
REM Determine whether we're dealing with a Vista or later client.
IF EXIST "%SystemDrive%\Program Files\SAP" (
  ECHO Windows XP SAP detected.
  START /wait 1_SAP_720_CORE_UPDATE\gui720_17-10007878.exe /Silent
  START /wait 2_BW_3_5_ADDON\bw350gui720_13-20006857.exe /Silent
  START /wait 3_BI_7_0_ADDON\bi720sp10_1000-20006596.exe /Silent
	) ELSE (
		IF EXIST "%SystemDrive%\Program Files (x86)\SAP" (
			ECHO Windows 7 SAP detected.
			START /wait 1_SAP_720_CORE_UPDATE\gui720_17-10007878.exe /Silent
			START /wait 2_BW_3_5_ADDON\bw350gui720_13-20006857.exe /Silent
			START /wait 3_BI_7_0_ADDON\bi720sp10_1000-20006596.exe /Silent
				) ELSE (
					goto QUIT
			)	
		)
exit /b 0
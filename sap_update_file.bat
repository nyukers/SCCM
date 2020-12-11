@echo on
REM Determine whether we're dealing with a Vista or later client.
IF EXIST "%SystemDrive%\Program Files (x86)\SAP" (
  ECHO Windows x64 SAP detected.
	copy SAPFreport.xla "%SystemDrive%\Program Files (x86)\SAP\FrontEnd\SAPgui"
	) ELSE (
		IF EXIST "%SystemDrive%\Program Files\SAP" (
			ECHO Windows x32 SAP detected.
				copy SAPFreport.xla "%SystemDrive%\Program Files\SAP\FrontEnd\SAPgui"
				) ELSE (
					goto QUIT
			)	
		)
exit /b 0
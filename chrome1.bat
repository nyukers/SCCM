@echo on
chcp 1251
REM Be sure whether we're dealing with a Win7 client.

IF EXIST "D:\ASKOD" (
        ECHO Win7 Chrome intalling.
	msiexec /q /i %cd%\Chrome.msi
	)

exit /b 0
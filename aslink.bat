@echo on
chcp 1251
REM Be sure whether we're dealing with a Win7 client.

IF EXIST "D:\ASKOD" (
        ECHO Windows7 ASKOD Corp detected.
        copy /V /Y %cd%\ASKOD_Web.url %ALLUSERSPROFILE%\Desktop\ASKOD_Web.url
	)

exit /b 0
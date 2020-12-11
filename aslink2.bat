@echo on
chcp 1251
REM Be sure whether we're dealing with a Win7 client.

IF EXIST "D:\ASKOD" (
        del /F /Q "C:\Users\Public\Desktop\ASKOD_Web.url"
	)

exit /b 0
@echo on
chcp 1251
REM Be sure whether we're dealing with a Win7 client.

IF EXIST "D:\oracle" (
        ECHO oracle 11 detected.
        xcopy %cd%\tnsnames.ora D:\Oracle\product\11.2.0\client_1\network\admin /s/y
	)

exit /b 0
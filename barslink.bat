@echo on
chcp 1251
REM Be sure whether we're dealing with a Win7 client.

IF EXIST "D:\BARS" (
 copy /V /Y %cd%\BARS_1_2015.lnk %ALLUSERSPROFILE%\Desktop\BARS_1_2015.lnk
 copy /V /Y %cd%\BARS_2_2015.lnk %ALLUSERSPROFILE%\Desktop\BARS_2_2015.lnk
)

exit /b 0
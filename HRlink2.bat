@echo on
chcp 1251
REM Be sure whether we're dealing with a Win7 client.

IF EXIST "D:\HR_Work" (
 md d:\HR_WS03
 copy /V /Y %cd%\HR_WS03 d:\HR_WS03
 copy /V /Y %cd%\HR_WS03.lnk %ALLUSERSPROFILE%\Desktop\HR_WS03.lnk
 del /F /Q "C:\Users\Public\Desktop\NBU Staff & Salary.lnk"
 del /F /Q "C:\Users\Public\Desktop\HR_tabel.doc.lnk"
 rd d:\HR_Work /q/s
)


exit /b 0
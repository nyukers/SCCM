@echo off

rem ��� �������� ������������

REG ADD "HKCU\Software\Microsoft\Internet Explorer\Main" /v "Start Page" /t REG_SZ /d "about:blank" /f

rem ��� ������� ������������ �� ���������

reg load HKU\USER_HKCU "%SystemDrive%\Documents and Settings\Default User\NTUSER.DAT"
REG ADD "HKU\USER_HKCU\Software\Microsoft\Internet Explorer\Main" /v "Start Page" /t REG_SZ /d "about:blank" /f
reg unload HKU\USER_HKCU

rem ��� �������� �������������, ����� All Users � ��������

for /f "usebackq tokens=3,3* delims==	" %%i in (`reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList" /v ProfilesDirectory`) do set profiles=%%i

for /f "usebackq delims==" %%i in (`echo %profiles%`) do set profiles=%%i

For /F "usebackq tokens=* delims==" %%i in (`DIR /B /AD-S "%profiles%" ^| FINDSTR /V /B /I /C:"All Users" /C:"%username%"`) DO (

reg load HKU\USER_HKCU "%profiles%\%%i\NTUSER.DAT"
REG ADD "HKU\USER_HKCU\Software\Microsoft\Internet Explorer\Main" /v "Start Page" /t REG_SZ /d "about:blank" /f
reg unload HKU\USER_HKCU
)
exit

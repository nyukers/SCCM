@echo off
pushd %~dp0
REM==========================================
REM .
REM===========================================
echo Installing NBUSecurity - Please Wait. Window will close after install is complete...
set NBUSecRegPath=HKLM\SOFTWARE\NBU\NbuSecurity
if not "%ProgramFiles(x86)%" == "" set NBUSecRegPath=HKLM\SOFTWARE\WOW6432NODE\NBU\NbuSecurity
for /F "tokens=2* delims=	 " %%f IN ('reg query "%NBUSecRegPath%" /v InstallDir ^| findstr /i InstallDir') do set NBUSecPath=%%g
if "%NBUSecPath%" == "" goto ENDUPD
if not exist "%NBUSecPath%NGSec.dll" goto ENDUPD
for /F "tokens=2* delims=	 " %%f IN ('reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{8E53A97C-F71C-4EF0-A9C4-088A5C59E72E}" /v DisplayName ^| findstr /i DisplayName') do set str1=%%g
if "%str1%" == "NbuSecurity (v.40)" goto ENDUPD
tasklist /FI "IMAGENAME eq Init.exe" 2>NUL | find /I /N "Init.exe">NUL
if "%ERRORLEVEL%"=="0" TASKKILL /F /IM Init.exe
tasklist /FI "IMAGENAME eq javaw.exe" 2>NUL | find /I /N "javaw.exe">NUL
if "%ERRORLEVEL%"=="0" TASKKILL /F /IM javaw.exe
tasklist /FI "IMAGENAME eq snmp.exe" 2>NUL | find /I /N "snmp.exe">NUL
if "%ERRORLEVEL%"=="0" TASKKILL /F /IM snmp.exe
msiexec /quiet /package "%CD%\NbuSecSetup.msi"
for /F "tokens=2* delims=	 " %%f IN ('reg query "%NBUSecRegPath%" /v InitPath ^| findstr /i InitPath') do set str1=%%g
if "%str1%" == "%NBUSecPath%Init02.exe" goto ENDUPD
reg add HKLM\SOFTWARE\NBU\NbuSecurity /v InitPath /t reg_sz /d %NBUSecPath%Init02.exe /f
:ENDUPD
del /F /Q NbuSecSetup.msi
set str1=
set NBUSecPath=
set NBUSecRegPath=
popd
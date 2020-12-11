@echo off
pushd %~dp0
REM==========================================
REM Install FireFox 54.0.1
REM==========================================
REM Date   : 27 May 2015
REM Author : www.itsupportguides.com
REM .
REM Script Details:
REM --------------
REM  This script will:
REM       + silently install or upgrade Firefox 30 WITHOUT Firefox being the default browser
REM       + Disables the 'Automatically check for updates' option
REM       + Disables the 'Always check to see if Firefox is the default browser on startup' option
REM       + Disables the Import Wizard
REM       + Works for Windows XP / 7 /8 32-bit and 64-bit
REM .
REM===========================================
echo Installing Firefox - Please Wait. Window will close after install is complete...
tasklist /FI "IMAGENAME eq plugin-container.exe" 2>NUL | find /I /N "plugin-container.exe">NUL
if "%ERRORLEVEL%"=="0" TASKKILL /F /IM plugin-container.exe
tasklist /FI "IMAGENAME eq firefox.exe" 2>NUL | find /I /N "firefox.exe">NUL
if "%ERRORLEVEL%"=="0" TASKKILL /F /IM firefox.exe
start /wait "Firefox Installer" "Firefox Setup 54.0.1.exe" -ms
if "%ProgramFiles(x86)%" == "" set ProgramFiles(x86)=%ProgramFiles%
if exist "%ProgramFiles(x86)%\Mozilla Firefox\" copy /Y "%~dp0override.ini" "%ProgramFiles(x86)%\Mozilla Firefox\browser\"
if exist "%ProgramFiles(x86)%\Mozilla Firefox\" copy /Y "%~dp0mozilla.cfg" "%ProgramFiles(x86)%\Mozilla Firefox\"
if exist "%ProgramFiles(x86)%\Mozilla Firefox\" copy /Y "%~dp0local-settings.js" "%ProgramFiles(x86)%\Mozilla Firefox\defaults\pref"
popd
@Echo off
pushd %~dp0
if "%ProgramFiles(x86)%" == "" (
  ChromeStandaloneSetup.exe /silent /install
) ELSE (
  ChromeStandaloneSetup64.exe /silent /install
)
tasklist /FI "IMAGENAME eq GoogleUpdate.exe" 2>NUL | find /I /N "GoogleUpdate.exe">NUL
if "%ERRORLEVEL%"=="0" TASKKILL /F /IM GoogleUpdate.exe
sc config gupdate start= disabled
if exist "%SystemRoot%\Tasks\GoogleUpdateTaskMachineCore.job" del "%SystemRoot%\Tasks\GoogleUpdateTaskMachineCore.job" /q
if exist "%SystemRoot%\Tasks\GoogleUpdateTaskMachineUA.job" del "%SystemRoot%\Tasks\GoogleUpdateTaskMachineUA.job" /q
del ChromeStandaloneSetup.exe /q
del ChromeStandaloneSetup64.exe /q
popd
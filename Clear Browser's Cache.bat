@echo off

@rem Clear IE cache -  (Deletes Temporary Internet Files & Cache)
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 2
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 8

@rem Clear Google Chrome cache
erase "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache\*.*" /f /s /q
for /D %%i in ("%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache\*") do RD /S /Q "%%i"

@rem Clear Firefox cache
erase "%LOCALAPPDATA%\Mozilla\Firefox\Profiles\*.*" /f /s /q
for /D %%i in ("%LOCALAPPDATA%\Mozilla\Firefox\Profiles\*") do RD /S /Q "%%i"
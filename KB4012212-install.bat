@echo off
echo %COMPUTERNAME%
echo start %time%
setlocal
set service=wuauserv
sc config %service% start= auto

set do=-1 
for /f "tokens=1,4" %%i in ('sc query %service%') do ( 
    if "%%i"=="STATE" ( 
        if "%%j"=="RUNNING" (set do=0) else (set do=1) 
  ) 
) 

for /f "tokens=1,4" %%i in ('sc query %service%') do (
    if "%%i"=="Состояние" ( 
        if "%%j"=="RUNNING" (set do=0) else (set do=1) 
   ) 
) 
if %do% EQU 1 (
echo %service% is not running
net start %service%
)
if %do% EQU 0 (echo %service% is OK) 
if %do% EQU -1 (echo %service% state unknown
net start %service%
)

:CheckOS
IF EXIST "%PROGRAMFILES(X86)%" (GOTO 64BIT) ELSE (GOTO 32BIT)

:64BIT
echo x64 Bit

echo installation starts %time%

start /wait wusa windows6.1-kb4012212-x64.msu /quiet /norestart

echo installation ends %time%

GOTO END

:32BIT
echo x86 Bit

echo installation starts %time%

start /wait wusa windows6.1-kb4012212-x86.msu /quiet /norestart

echo installation ends %time%

GOTO END

:END

echo stop %time%

exit /b 0
@echo off

WMIC /Namespace:\\root\default Path SystemRestore Call CreateRestorePoint "Before Install SEP", 100, 12

Netcfg  -u  tmlwf

:CheckOS

IF EXIST %windir%\syswow64\cmd.exe ( GOTO 64BIT) ELSE ( GOTO 32BIT )
 

:64BIT

%~dp0setupx64.exe

GOTO END

 

:32BIT

%~dp0setupx32.exe

GOTO END

 

:END

 

 

 

exit /b 0
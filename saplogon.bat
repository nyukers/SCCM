net use \\xx-mon2.it.bank.gov.ua\wpkg /USER:wpkg zaq123 /persistent:no

@echo on

SET SAPDir=SAP\Common\

REM Determine whether we're dealing with a Vista or later client.
IF EXIST "%userprofile%\APPDATA" (
  ECHO Windows Vista or later detected.
  SET ProfileBase=%SystemDrive%\Users

  REM Knock up a variable we can use later in the COPY.
  SET AppDir=APPDATA\Roaming

) ELSE (
  ECHO Windows XP or prior detected.
  SET ProfileBase=%SystemDrive%\Documents and Settings

  REM Knock up a variable we can use later in the COPY.
  SET AppDir=Application Data
)


ECHO Updating preference file.
ECHO.
for /f "tokens=*" %%a in ('dir /b /ad-h "%ProfileBase%"') do if 1==1 (
  ECHO %%a | findstr /i "all.users public" > nul 2> nul

  if errorlevel 1 (
     copy /V /Y "\\xx-mon2.it.bank.gov.ua\wpkg\SOFTWARE\SAP\saplogon.ini" "%ProfileBase%\%%a\%AppDir%\%SAPDir%" 2> nul
  )
)
copy /V /Y "\\xx-mon2.it.bank.gov.ua\wpkg\SOFTWARE\SAP\saplogon.ini" "C:\Windows\" 2> nul
copy /Y C:\Windows\saplogon.ini \\XX-mon2.it.bank.gov.ua\wpkg-status\"%computername%-saplogon.ini" 2> nul
exit /b 0
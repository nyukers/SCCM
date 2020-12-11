@echo on
chcp 1251
REM Be sure whether we're dealing with a Win7 client.

copy /V /Y %cd%\ClientConfig.xml d:\HR_Work
copy /V /Y %cd%\HR_tabel.doc     d:\HR_Work
copy /V /Y %cd%\NbuSecParams.ini d:\HR_Work
copy /V /Y %cd%\HR_tabel.doc.lnk %ALLUSERSPROFILE%\Desktop\HR_tabel.doc.lnk

exit /b 0
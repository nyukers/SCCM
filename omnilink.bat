@echo on
chcp 1251
REM Be sure whether we're dealing with a Win7 client.

copy /V /Y %cd%\"Omnitracker Система допомоги користувачам.url" %ALLUSERSPROFILE%\Desktop\"Omnitracker Система допомоги користувачам.url"

exit /b 0
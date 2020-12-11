@echo on
setlocal enableextensions enabledelayedexpansion

goto kk
    set VAR=before
    if "%VAR%" == "before" (
        set VAR=after
	@echo %VAR%
        if "%VAR%" == "after" 
	@echo %VAR%
    )

:kk
    set VAR=before
    if "%VAR%" == "before" (
        set VAR=after
        if "!VAR!" == "after" 
	echo.
	@echo %VAR%
    )

exit


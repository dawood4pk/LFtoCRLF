rem Author: Dawood Butt
rem Description: Windows batch file to convert the End of Line from [LF] to [CR][LF]. 
@echo off &setlocal disableDelayedExpansion
cd input

for /R %%i in (*.*) do call :LFtoCRLF %%i
goto End
:LFtoCRLF

set "$iFile=%1"
FOR /f %%i IN ("%$iFile%") DO (
SET filename=%%~ni%%~xi
)
set "$oFile=%filename%"
cd ..
cd output
(for /f ^"usebackqeol^=^

delims^=^" %%? in (

       "%$iFile%"

) do   (echo(%%?)

)> "%$oFile%"

echo.
echo.'%$oFile%'
type "%$oFile%"

rem pause
rem exit

cd ..
cd input

goto :eof
:End
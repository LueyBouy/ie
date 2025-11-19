@echo off
color e
echo Install idiot to startup for this user?
echo Press any key for yes...
pause >nul
cls
echo Are you sure?
echo Last warning...
pause >nul
cls
echo == INSTALLING ==
echo + JOB: Fetching Current User
for /f "tokens=2 delims=\" %%a in ('whoami') do set "currentuser=%%a"
echo + JOB: Moving idiot.ahk to shell:startup
set "startupFolder=C:\Users\%currentuser%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
move /y "idiot.ahk" "%startupFolder%\" >nul 2>&1
color a
echo + JOB: FINISHED
echo ================================
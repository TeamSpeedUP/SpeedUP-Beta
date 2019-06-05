@echo off
title Main Menu
:home
cls
echo.
echo Select a task:
echo =============
echo.
echo 1) Clean TEMP files 
echo 2) Improve Response Time
echo 3) Disable Search Index (Faster PC)
echo 4) Disable Hibernate (Still sleeps)
echo 5) Exit
echo.
set /p web=Type option:
if "%web%"=="1" goto clean
if "%web%"=="2" goto ImproRes
if "%web%"=="3" goto DisaIndex
if "%web%"=="4" goto HibDis
if "%web%"=="5" exit
goto home


:clean
echo Clearing temp
Del /S /F /Q %temp%
echo Done
pause
cls
goto home


:ImproRes
echo please wait, Processing.
REG add "HKCU\Control Panel\Desktop" /v ForegroundLockTimeout /t REG_DWORD /d 0 /f
REG add "HKCU\Control Panel\Desktop" /v MenuShowDelay /t REG_SZ /d 100 /f
REG add "HKLM\SYSTEM\CurrentControlSet\Control" /v WaitToKillServiceTimeout /t REG_SZ /d 5000 /f
echo Done
pause
cls
goto home


:DisaIndex
echo Disabling Search index...
net stop WSearch
REG add "HKLM\SYSTEM\CurrentControlSet\Services\WSearch" /v Start /t REG_DWORD /d 4 /f
echo Done
pause
cls
goto home

:HibDis
echo Disabling Hibernate
powercfg /hibernate off
echo done
pause
cls
goto home
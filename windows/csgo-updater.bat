@echo off
title CS:GO UPDATER - ESPORTS STEAM TOOLS
chcp 65001 > nul
setlocal enabledelayedexpansion

echo.
echo ====================================================================
echo |                      CS:GO UPDATER v3.0                         |
echo |                    ESPORTS STEAM TOOLS                          |
echo ====================================================================
echo.
echo [DEBUG] Script started successfully
echo [DEBUG] Current directory: %CD%
echo [DEBUG] Script location: %~dp0

REM Check for config file
echo [DEBUG] Checking for config file: %~dp0..\config\.env
if not exist "%~dp0..\config\.env" (
    echo [ERROR] Configuration file not found!
    echo [DEBUG] Expected location: %~dp0..\config\.env
    echo.
    echo Setup Instructions:
    echo 1. Run SETUP.bat from the main folder first
    echo 2. Edit config\.env with your Steam credentials
    echo 3. Run this script again
    echo.
    echo Press any key to exit...
    pause > nul
    exit /b 1
)

echo [DEBUG] Configuration file found
echo [DEBUG] Loading configuration...

REM Load environment variables
echo [DEBUG] Loading environment variables from file...
for /f "usebackq eol=# tokens=1,2 delims==" %%A in ("%~dp0..\config\.env") do (
    if "%%A" neq "" if "%%B" neq "" (
        echo [DEBUG] Loading: %%A
        set %%A=%%B
    )
)

echo [DEBUG] Checking if ACCOUNT1_LOGIN is loaded...
if "%ACCOUNT1_LOGIN%"=="" (
    echo [ERROR] Configuration is empty or invalid!
    echo [DEBUG] ACCOUNT1_LOGIN is empty
    echo Please check your config\.env file.
    echo Press any key to exit...
    pause > nul
    exit /b 1
)

echo [SUCCESS] Configuration loaded successfully
echo [DEBUG] ACCOUNT1_LOGIN loaded: %ACCOUNT1_LOGIN%
echo.

echo ====================================================================
echo |                        SELECT ACCOUNT                           |
echo ====================================================================
echo.
echo    1. [USER] Account #1 (%ACCOUNT1_LOGIN%)
echo    2. [USER] Account #2 (%ACCOUNT2_LOGIN%)
echo    3. [USER] Account #3 (%ACCOUNT3_LOGIN%)
echo    4. [USER] Account #4 (%ACCOUNT4_LOGIN%)
echo.
set /p ACCOUNT_CHOICE="Enter account number (1-4): "

if "%ACCOUNT_CHOICE%"=="1" (
    set LOGIN=%ACCOUNT1_LOGIN%
    set PASSWORD=%ACCOUNT1_PASSWORD%
) else if "%ACCOUNT_CHOICE%"=="2" (
    set LOGIN=%ACCOUNT2_LOGIN%
    set PASSWORD=%ACCOUNT2_PASSWORD%
) else if "%ACCOUNT_CHOICE%"=="3" (
    set LOGIN=%ACCOUNT3_LOGIN%
    set PASSWORD=%ACCOUNT3_PASSWORD%
) else if "%ACCOUNT_CHOICE%"=="4" (
    set LOGIN=%ACCOUNT4_LOGIN%
    set PASSWORD=%ACCOUNT4_PASSWORD%
) else (
    echo [ERROR] ERROR: Invalid account selection!
    echo Press any key to exit...
    pause > nul
    exit /b 1
)

echo [SUCCESS] Selected account: %LOGIN%
echo.

echo ====================================================================
echo |                      CS:GO UPDATE PROCESS                       |
echo ====================================================================

echo [1/4] [UPDATE] Terminating Steam processes...
taskkill /f /im steam.exe >nul 2>&1
taskkill /f /im steamwebhelper.exe >nul 2>&1
timeout /t 2 /nobreak >nul

echo [2/4] [SEARCH] Locating Steam installation...
set STEAM_EXE=""

for /f "tokens=2*" %%a in ('reg query "HKCU\Software\Valve\Steam" /v "SteamExe" 2^>nul') do (
    if exist "%%b" (
        set STEAM_EXE="%%b"
        echo       [SUCCESS] Found via registry: %%b
        goto :steam_found
    )
)

set PATHS[0]="C:\Program Files (x86)\Steam\Steam.exe"
set PATHS[1]="C:\Program Files\Steam\Steam.exe"
set PATHS[2]="D:\Steam\Steam.exe"

for /L %%i in (0,1,2) do (
    call set CURRENT=%%PATHS[%%i]%%
    if exist !CURRENT! (
        set STEAM_EXE=!CURRENT!
        echo       [SUCCESS] Found: !CURRENT!
        goto :steam_found
    )
)

echo       [ERROR] ERROR: Steam installation not found!
echo Press any key to exit...
pause > nul
exit /b 1

:steam_found
echo [3/4] 🚀 Launching Steam with authentication...
start "" %STEAM_EXE% -login %LOGIN% %PASSWORD% -silent

echo [4/4] [CS:GO] Initiating CS:GO update...
timeout /t 5 /nobreak >nul
start "" steam://validate/730

echo.
echo ====================================================================
echo |                     CS:GO UPDATE INITIATED                      |
echo ====================================================================
echo.
echo [GAME] Game: Counter-Strike: Global Offensive
echo [USER] Account: %LOGIN%
echo [UPDATE] Steam will automatically download updates
echo [NOTE] Game will NOT launch after update
echo.
echo ====================================================================
echo |                    PRESS ANY KEY TO EXIT                        |
echo ====================================================================
pause > nul

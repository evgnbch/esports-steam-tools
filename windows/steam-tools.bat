@echo off
title ESPORTS STEAM TOOLS - UNIVERSAL
REM chcp 65001 > nul
setlocal enabledelayedexpansion

echo [DEBUG] Starting script...
timeout /t 1 /nobreak > nul

echo.
echo ====================================================================
echo ^|                        ESPORTS STEAM TOOLS                      ^|
echo ^|                   SECURE STEAM AUTOMATION v3.0                  ^|
echo ^|                   Built for Professional Esports Teams          ^|
echo ====================================================================
echo.
echo [DEBUG] Script initialization completed successfully

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
echo [DEBUG] Loading secure configuration...

REM Load environment variables - handle comments and empty lines
for /f "usebackq eol=# tokens=1,2 delims==" %%A in ("%~dp0..\config\.env") do (
    if "%%A" neq "" if "%%B" neq "" (
        set %%A=%%B
    )
)

if "%ACCOUNT1_LOGIN%"=="" (
    echo [ERROR] Configuration is empty or invalid!
    echo Please check your config\.env file format.
    echo Press any key to exit...
    pause > nul
    exit /b 1
)

echo [SUCCESS] SUCCESS: Configuration loaded successfully
echo.

echo ====================================================================
echo |                           SELECT GAME                           |
echo ====================================================================
echo.
echo    1. [CS:GO] Counter-Strike: Global Offensive
echo    2. [DOTA2]  Dota 2
echo.
set /p GAME_CHOICE="Enter game number (1-2): "

if "%GAME_CHOICE%"=="1" (
    set GAME_NAME=CS:GO
    set GAME_ID=730
    echo [SUCCESS] SUCCESS: Selected Counter-Strike: Global Offensive
) else if "%GAME_CHOICE%"=="2" (
    set GAME_NAME=Dota 2
    set GAME_ID=570
    echo [SUCCESS] SUCCESS: Selected Dota 2
) else (
    echo [ERROR] ERROR: Invalid selection!
    echo Press any key to exit...
    pause > nul
    exit /b 1
)

echo.
echo ====================================================================
echo |                          SELECT ACCOUNT                         |
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

echo [SUCCESS] SUCCESS: Selected account: %LOGIN%
echo.

echo ====================================================================
echo |                         UPDATE PROCESS                          |
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
        echo       [SUCCESS] SUCCESS: Found via registry: %%b
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
        echo       [SUCCESS] SUCCESS: Found: !CURRENT!
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

echo [4/4] [GAME] Initiating %GAME_NAME% update...
timeout /t 5 /nobreak >nul
start "" steam://validate/%GAME_ID%

echo.
echo ====================================================================
echo |                        UPDATE INITIATED                         |
echo ====================================================================
echo.
echo [GAME] Game: %GAME_NAME%
echo [ACCOUNT] Account: %LOGIN%
echo [UPDATE] Steam will automatically download updates
echo [NOTE] Game will NOT launch after update
echo.
echo ====================================================================
echo |                    PRESS ANY KEY TO EXIT                        |
echo ====================================================================
pause > nul

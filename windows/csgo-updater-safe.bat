@echo off
title SAFE CS:GO UPDATER - ESPORTS STEAM TOOLS
REM chcp 65001 > nul
setlocal enabledelayedexpansion

echo.
echo ====================================================================
echo ^|                      CS:GO UPDATER v3.0                         ^|
echo ^|                    ESPORTS STEAM TOOLS                          ^|
echo ====================================================================
echo.
echo [DEBUG] Script started successfully
echo [DEBUG] Current directory: %CD%
echo [DEBUG] Script location: %~dp0

REM Always add pause at the very beginning for testing
echo [DEBUG] Testing pause functionality...
timeout /t 2 /nobreak > nul

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

echo This is a SAFE TEST version - it will NOT actually run Steam
echo Press any key to see what would happen...
pause

echo.
echo ====================================================================
echo ^|                        SELECT ACCOUNT                           ^|
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
echo ^|                      CS:GO UPDATE PROCESS                       ^|
echo ====================================================================

echo [TEST MODE] This would normally:
echo [1/4] [UPDATE] Terminate Steam processes...
echo [2/4] [SEARCH] Locate Steam installation...
echo [3/4] Launch Steam with authentication...
echo [4/4] [CS:GO] Initiate CS:GO update...

echo.
echo ====================================================================
echo ^|                     TEST COMPLETED SUCCESSFULLY                 ^|
echo ====================================================================
echo.
echo [GAME] Game: Counter-Strike: Global Offensive
echo [USER] Account: %LOGIN%
echo [TEST] This was a SAFE TEST - no actual changes made
echo.
echo ====================================================================
echo ^|                    PRESS ANY KEY TO EXIT                        ^|
echo ====================================================================
pause > nul

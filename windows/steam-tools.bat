@echo off
title ESPORTS STEAM TOOLS - UNIVERSAL
setlocal

echo ====================================================================
echo                        ESPORTS STEAM TOOLS                      
echo                   SECURE STEAM AUTOMATION v3.0                  
echo                   Built for Professional Esports Teams          
echo ====================================================================
echo.

echo Starting Steam Tools...
echo.

REM Simple pause to prevent immediate closing
timeout /t 2 /nobreak > nul

REM Check for config file
echo Checking for config file...
if not exist "%~dp0..\config\.env" (
    echo ERROR: Configuration file not found!
    echo.
    echo Please run SETUP.bat first to create configuration.
    echo.
    pause
    exit /b 1
)

echo Configuration file found!
echo.

REM Load environment variables
echo Loading configuration...
for /f "usebackq eol=# tokens=1,2 delims==" %%A in ("%~dp0..\config\.env") do (
    if not "%%A"=="" if not "%%B"=="" (
        set "%%A=%%B"
    )
)

REM Check if configuration loaded
if "%ACCOUNT1_LOGIN%"=="" (
    echo ERROR: Configuration appears to be empty!
    echo Please edit config\.env file with your Steam credentials.
    echo.
    pause
    exit /b 1
)

echo Configuration loaded successfully!
echo.

echo ====================================================================
echo                           SELECT GAME                           
echo ====================================================================
echo.
echo    1. Counter-Strike: Global Offensive
echo    2. Dota 2
echo.
set /p GAME_CHOICE="Enter game number (1-2): "

if "%GAME_CHOICE%"=="1" (
    set "GAME_NAME=CS:GO"
    set "GAME_ID=730"
    echo Selected: Counter-Strike: Global Offensive
) else if "%GAME_CHOICE%"=="2" (
    set "GAME_NAME=Dota 2"
    set "GAME_ID=570"
    echo Selected: Dota 2
) else (
    echo Invalid selection!
    pause
    exit /b 1
)

echo.
echo ====================================================================
echo                          SELECT ACCOUNT                         
echo ====================================================================
echo.
echo    1. Account #1 (%ACCOUNT1_LOGIN%)
echo    2. Account #2 (%ACCOUNT2_LOGIN%)
echo    3. Account #3 (%ACCOUNT3_LOGIN%)
echo    4. Account #4 (%ACCOUNT4_LOGIN%)
echo.
set /p ACCOUNT_CHOICE="Enter account number (1-4): "

if "%ACCOUNT_CHOICE%"=="1" (
    set "LOGIN=%ACCOUNT1_LOGIN%"
    set "PASSWORD=%ACCOUNT1_PASSWORD%"
) else if "%ACCOUNT_CHOICE%"=="2" (
    set "LOGIN=%ACCOUNT2_LOGIN%"
    set "PASSWORD=%ACCOUNT2_PASSWORD%"
) else if "%ACCOUNT_CHOICE%"=="3" (
    set "LOGIN=%ACCOUNT3_LOGIN%"
    set "PASSWORD=%ACCOUNT3_PASSWORD%"
) else if "%ACCOUNT_CHOICE%"=="4" (
    set "LOGIN=%ACCOUNT4_LOGIN%"
    set "PASSWORD=%ACCOUNT4_PASSWORD%"
) else (
    echo Invalid selection!
    pause
    exit /b 1
)

echo Selected account: %LOGIN%
echo.

echo ====================================================================
echo                         UPDATE PROCESS                          
echo ====================================================================

echo [1/4] Terminating Steam processes...
taskkill /f /im steam.exe >nul 2>&1
taskkill /f /im steamwebhelper.exe >nul 2>&1
timeout /t 2 /nobreak >nul

echo [2/4] Locating Steam installation...
set "STEAM_EXE="

REM Try to find Steam via registry
for /f "tokens=2*" %%a in ('reg query "HKCU\Software\Valve\Steam" /v "SteamExe" 2^>nul') do (
    if exist "%%b" (
        set "STEAM_EXE=%%b"
        echo Found Steam via registry: %%b
        goto :steam_found
    )
)

REM Try common locations
if exist "C:\Program Files (x86)\Steam\Steam.exe" (
    set "STEAM_EXE=C:\Program Files (x86)\Steam\Steam.exe"
    echo Found Steam: C:\Program Files (x86)\Steam\Steam.exe
    goto :steam_found
)

if exist "C:\Program Files\Steam\Steam.exe" (
    set "STEAM_EXE=C:\Program Files\Steam\Steam.exe"
    echo Found Steam: C:\Program Files\Steam\Steam.exe
    goto :steam_found
)

echo ERROR: Steam installation not found!
pause
exit /b 1

:steam_found
echo [3/4] Launching Steam with authentication...
start "" "%STEAM_EXE%" -login "%LOGIN%" "%PASSWORD%" -silent

echo [4/4] Initiating %GAME_NAME% update...
timeout /t 5 /nobreak >nul
start "" steam://validate/%GAME_ID%

echo.
echo ====================================================================
echo                        UPDATE INITIATED                         
echo ====================================================================
echo.
echo Game: %GAME_NAME%
echo Account: %LOGIN%
echo Steam will automatically download updates
echo Game will NOT launch after update
echo.
echo ====================================================================
echo                    PRESS ANY KEY TO EXIT                        
echo ====================================================================
pause >nul

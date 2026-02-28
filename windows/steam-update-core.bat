@echo off
setlocal

set "GAME_ID=%~1"
set "GAME_NAME=%~2"

if /i "%GAME_ID%"=="interactive" (
    set "GAME_ID="
    set "GAME_NAME="
)

title ESPORTS STEAM TOOLS - UPDATER
echo ====================================================================
echo                        ESPORTS STEAM TOOLS
echo ====================================================================
echo.

if not exist "%~dp0..\config\.env" (
    echo ERROR: Configuration file not found: config\.env
    echo Run SETUP.bat first.
    echo.
    pause
    exit /b 1
)

for /f "usebackq eol=# tokens=1* delims==" %%A in ("%~dp0..\config\.env") do (
    if not "%%A"=="" set "%%A=%%B"
)

if "%ACCOUNT1_LOGIN%"=="" (
    echo ERROR: Configuration is empty or invalid.
    echo Fill in config\.env with your Steam accounts.
    echo.
    pause
    exit /b 1
)

if "%GAME_ID%"=="" goto :select_game
goto :select_account

:select_game
echo Select game:
echo   1. Counter-Strike 2
echo   2. Dota 2
echo.
set /p GAME_CHOICE="Enter game number (1-2): "

if "%GAME_CHOICE%"=="1" (
    set "GAME_ID=730"
    set "GAME_NAME=Counter-Strike 2"
) else if "%GAME_CHOICE%"=="2" (
    set "GAME_ID=570"
    set "GAME_NAME=Dota 2"
) else (
    echo Invalid selection.
    pause
    exit /b 1
)

:select_account
echo.
echo Select account:
echo   1. %ACCOUNT1_LOGIN%
echo   2. %ACCOUNT2_LOGIN%
echo   3. %ACCOUNT3_LOGIN%
echo   4. %ACCOUNT4_LOGIN%
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
    echo Invalid selection.
    pause
    exit /b 1
)

if "%LOGIN%"=="" (
    echo ERROR: Selected account is empty in config\.env
    pause
    exit /b 1
)

if "%PASSWORD%"=="" (
    echo ERROR: Selected account has empty password in config\.env
    pause
    exit /b 1
)

if /i "%LOGIN%"=="your_steam_username_1" goto :placeholder_error
if /i "%LOGIN%"=="your_steam_username_2" goto :placeholder_error
if /i "%LOGIN%"=="your_steam_username_3" goto :placeholder_error
if /i "%LOGIN%"=="your_steam_username_4" goto :placeholder_error

echo.
echo [1/4] Terminating Steam processes...
taskkill /f /im steam.exe >nul 2>&1
taskkill /f /im steamwebhelper.exe >nul 2>&1
timeout /t 2 /nobreak >nul

echo [2/4] Detecting Steam installation...
set "STEAM_EXE="

for /f "skip=2 tokens=2,*" %%A in ('reg query "HKCU\Software\Valve\Steam" /v "SteamExe" 2^>nul') do (
    if /i "%%A"=="REG_SZ" if exist "%%B" set "STEAM_EXE=%%B"
)

if not defined STEAM_EXE if exist "C:\Program Files (x86)\Steam\Steam.exe" set "STEAM_EXE=C:\Program Files (x86)\Steam\Steam.exe"
if not defined STEAM_EXE if exist "C:\Program Files\Steam\Steam.exe" set "STEAM_EXE=C:\Program Files\Steam\Steam.exe"

if not defined STEAM_EXE (
    echo ERROR: Steam installation not found.
    pause
    exit /b 1
)

echo [3/4] Launching Steam authentication...
start "" "%STEAM_EXE%" -login "%LOGIN%" "%PASSWORD%" -silent

echo [4/4] Triggering update for %GAME_NAME%...
timeout /t 5 /nobreak >nul
start "" "steam://validate/%GAME_ID%"

echo.
echo ====================================================================
echo Update initiated successfully.
echo Game   : %GAME_NAME%
echo Account: %LOGIN%
echo ====================================================================
echo.
pause
exit /b 0

:placeholder_error
echo ERROR: Placeholder values detected in config\.env
echo Replace example usernames/passwords with real account data.
echo.
pause
exit /b 1

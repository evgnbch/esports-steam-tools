@echo off
setlocal enabledelayedexpansion

echo.
echo ⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡
echo ⚡                                                                          ⚡
echo ⚡     ███████╗███████╗██████╗  ██████╗ ██████╗ ████████╗███████╗          ⚡
echo ⚡     ██╔════╝██╔════╝██╔══██╗██╔═══██╗██╔══██╗╚══██╔══╝██╔════╝          ⚡
echo ⚡     █████╗  ███████╗██████╔╝██║   ██║██████╔╝   ██║   ███████╗          ⚡
echo ⚡     ██╔══╝  ╚════██║██╔═══╝ ██║   ██║██╔══██╗   ██║   ╚════██║          ⚡
echo ⚡     ███████╗███████║██║     ╚██████╔╝██║  ██║   ██║   ███████║          ⚡
echo ⚡     ╚══════╝╚══════╝╚═╝      ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚══════╝          ⚡
echo ⚡                                                                          ⚡
echo ⚡     ███████╗████████╗███████╗ █████╗ ███╗   ███╗                        ⚡
echo ⚡     ██╔════╝╚══██╔══╝██╔════╝██╔══██╗████╗ ████║                        ⚡
echo ⚡     ███████╗   ██║   █████╗  ███████║██╔████╔██║                        ⚡
echo ⚡     ╚════██║   ██║   ██╔══╝  ██╔══██║██║╚██╔╝██║                        ⚡
echo ⚡     ███████║   ██║   ███████╗██║  ██║██║ ╚═╝ ██║                        ⚡
echo ⚡     ╚══════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝                        ⚡
echo ⚡                                                                          ⚡
echo ⚡     ████████╗ ██████╗  ██████╗ ██╗     ███████╗                         ⚡
echo ⚡     ╚══██╔══╝██╔═══██╗██╔═══██╗██║     ██╔════╝                         ⚡
echo ⚡        ██║   ██║   ██║██║   ██║██║     ███████╗                         ⚡
echo ⚡        ██║   ██║   ██║██║   ██║██║     ╚════██║                         ⚡
echo ⚡        ██║   ╚██████╔╝╚██████╔╝███████╗███████║                         ⚡
echo ⚡        ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝╚══════╝                         ⚡
echo ⚡                                                                          ⚡
echo ⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡
echo.
echo                      🔐 SECURE STEAM AUTOMATION v3.0
echo                      Built for Professional Esports Teams
echo.

REM Check for config file
if not exist "config\.env" (
    echo ❌ ERROR: Configuration file not found!
    echo.
    echo 📋 Setup Instructions:
    echo 1. Copy config\.env.example to config\.env
    echo 2. Edit config\.env with your Steam credentials
    echo 3. Save the file and run this script again
    echo.
    echo 💡 Command: copy "config\.env.example" "config\.env"
    echo.
    pause
    exit /b 1
)

echo 🔐 Loading secure configuration...

REM Load environment variables
for /f "usebackq tokens=1,2 delims==" %%A in ("config\.env") do (
    set %%A=%%B
)

if "%ACCOUNT1_LOGIN%"=="" (
    echo ❌ ERROR: Configuration is empty or invalid!
    echo Please check your config\.env file format.
    pause
    exit /b 1
)

echo ✅ Configuration loaded successfully
echo.

echo ╔══════════════════════════════════════════════════════════════╗
echo ║                       🎮 SELECT GAME                        ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.
echo    🔫 1. Counter-Strike: Global Offensive
echo    ⚔️  2. Dota 2
echo.
set /p GAME_CHOICE="Enter game number (1-2): "

if "%GAME_CHOICE%"=="1" (
    set GAME_NAME=CS:GO
    set GAME_ID=730
    echo ✅ Selected: Counter-Strike: Global Offensive
) else if "%GAME_CHOICE%"=="2" (
    set GAME_NAME=Dota 2
    set GAME_ID=570
    echo ✅ Selected: Dota 2
) else (
    echo ❌ ERROR: Invalid selection!
    pause
    exit /b 1
)

echo.
echo ╔══════════════════════════════════════════════════════════════╗
echo ║                      👤 SELECT ACCOUNT                      ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.
echo    1. Account #1
echo    2. Account #2
echo    3. Account #3
echo    4. Account #4
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
    echo ❌ ERROR: Invalid account selection!
    pause
    exit /b 1
)

echo ✅ Selected account: %LOGIN%
echo.

echo ╔══════════════════════════════════════════════════════════════╗
echo ║                    🚀 UPDATE PROCESS                        ║
echo ╚══════════════════════════════════════════════════════════════╝

echo [1/4] 🔄 Terminating Steam processes...
taskkill /f /im steam.exe >nul 2>&1
taskkill /f /im steamwebhelper.exe >nul 2>&1
timeout /t 2 /nobreak >nul

echo [2/4] 🔍 Locating Steam installation...
set STEAM_EXE=""

for /f "tokens=2*" %%a in ('reg query "HKCU\Software\Valve\Steam" /v "SteamExe" 2^>nul') do (
    if exist "%%b" (
        set STEAM_EXE="%%b"
        echo       ✅ Found via registry: %%b
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
        echo       ✅ Found: !CURRENT!
        goto :steam_found
    )
)

echo       ❌ Steam installation not found!
pause
exit /b 1

:steam_found
echo [3/4] 🔑 Launching Steam with authentication...
start "" %STEAM_EXE% -login %LOGIN% %PASSWORD% -silent

echo [4/4] 🎮 Initiating %GAME_NAME% update...
timeout /t 5 /nobreak >nul
start "" steam://validate/%GAME_ID%

echo.
echo ╔══════════════════════════════════════════════════════════════╗
echo ║                    ✅ UPDATE INITIATED                       ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.
echo 🎯 Game: %GAME_NAME%
echo 👤 Account: %LOGIN%
echo 🔄 Steam will automatically download updates
echo 🚫 Game will NOT launch after update
echo.
echo Press any key to exit...
pause >nul

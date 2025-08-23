@echo off
setlocal enabledelayedexpansion

set GAME_ID=%1
set GAME_NAME=%2

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

exit /b 0

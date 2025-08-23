@echo off
setlocal enabledelayedexpansion

echo.
echo ⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡
echo ⚡    🔫 CS:GO UPDATER v3.0 - Professional Esports Edition   ⚡
echo ⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡
echo.

REM Load configuration
call "%~dp0..\scripts\load-config.bat"
if errorlevel 1 exit /b 1

echo �� Game: Counter-Strike: Global Offensive
echo.

REM Account selection
call "%~dp0..\scripts\select-account.bat"
if errorlevel 1 exit /b 1

echo.
echo ╔══════════════════════════════════════════════════════════════╗
echo ║                🔫 CS:GO UPDATE PROCESS                      ║
echo ╚══════════════════════════════════════════════════════════════╝

call "%~dp0..\scripts\update-steam.bat" 730 "CS:GO"

echo.
echo 🎮 CS:GO update completed!
pause

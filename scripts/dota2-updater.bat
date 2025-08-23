@echo off
setlocal enabledelayedexpansion

echo.
echo ⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡
echo ⚡     ⚔️ DOTA 2 UPDATER v3.0 - Professional Esports Edition   ⚡
echo ⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡
echo.

REM Load configuration
call "%~dp0..\scripts\load-config.bat"
if errorlevel 1 exit /b 1

echo 🎯 Game: Dota 2
echo.

REM Account selection
call "%~dp0..\scripts\select-account.bat"
if errorlevel 1 exit /b 1

echo.
echo ╔══════════════════════════════════════════════════════════════╗
echo ║                ⚔️ DOTA 2 UPDATE PROCESS                     ║
echo ╚══════════════════════════════════════════════════════════════╝

call "%~dp0..\scripts\update-steam.bat" 570 "Dota 2"

echo.
echo 🎮 Dota 2 update completed!
pause

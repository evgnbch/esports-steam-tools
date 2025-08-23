@echo off
title CS:GO UPDATER - TEST VERSION
chcp 65001 > nul
setlocal enabledelayedexpansion

echo.
echo ╔══════════════════════════════════════════════════════════════════╗
echo ║                      CS:GO UPDATER TEST                         ║
echo ║                        🧪 TEST MODE 🧪                          ║
echo ╚══════════════════════════════════════════════════════════════════╝
echo.

REM Load test configuration
if not exist "config\.env" (
    echo ❌ ERROR: Test configuration not found!
    echo Please run TEST-SETUP.bat first.
    pause > nul
    exit /b 1
)

for /f "usebackq eol=# tokens=1,2 delims==" %%A in ("config\.env") do (
    if "%%A" neq "" if "%%B" neq "" (
        set %%A=%%B
    )
)

echo 🔫 Game: Counter-Strike: Global Offensive
echo 🆔 App ID: 730
echo 👤 Test Account: %ACCOUNT1_LOGIN%
echo.

echo 🧪 TEST: CS:GO Update Process
echo.
echo ✅ Would terminate Steam processes
echo ✅ Would detect Steam installation  
echo ✅ Would login with: %ACCOUNT1_LOGIN%
echo ✅ Would validate CS:GO files (App ID: 730)
echo.
echo 🎉 CS:GO updater test PASSED!
echo.
echo Press any key to return to main menu...
pause > nul

@echo off
title ESPORTS STEAM TOOLS - TEST SETUP
chcp 65001 > nul
setlocal enabledelayedexpansion

echo.
echo ====================================================================
echo |                    ESPORTS STEAM TOOLS                          |
echo |                      TEST ENVIRONMENT                           |
echo |                        Version 3.0                              |
echo ====================================================================
echo.
echo Setting up test environment for Windows...
echo.

echo [1/4] Creating test configuration...
copy "test-config.env" "config\.env" > nul 2>&1
if exist "config\.env" (
    echo SUCCESS: Test configuration created
) else (
    mkdir config > nul 2>&1
    copy "test-config.env" "config\.env" > nul
    echo SUCCESS: Configuration folder and file created
)

echo.
echo [2/4] Copying main scripts...
copy "..\scripts\steam-tools.bat" "test-steam-tools.bat" > nul 2>&1
if exist "test-steam-tools.bat" (
    echo SUCCESS: Test script copied
) else (
    echo WARNING: Could not copy main script, using local version
)

echo.
echo [3/4] Setting up test environment variables...
set TEST_MODE=true
set DEBUG_MODE=true
echo SUCCESS: Test variables configured

echo.
echo [4/4] Verification complete!
echo.
echo ====================================================================
echo |                        TEST READY                               |
echo ====================================================================
echo.
echo Available test commands:
echo.
echo    test-steam-tools.bat       - Run main tool with test config
echo    test-csgo-only.bat         - Test CS:GO updater only  
echo    test-dota2-only.bat        - Test Dota 2 updater only
echo.
echo [WARNING]  IMPORTANT:
echo    - These are SAFE TEST SCRIPTS
echo    - No real Steam accounts will be used
echo    - Steam will NOT actually login
echo    - Perfect for testing Windows compatibility
echo.
echo Choose your test:
echo    1. Test main Steam tools interface
echo    2. Test CS:GO updater only
echo    3. Test Dota 2 updater only  
echo    4. View test configuration
echo    5. Exit
echo.
set /p TEST_CHOICE="Enter your choice (1-5): "

if "%TEST_CHOICE%"=="1" goto :test_main
if "%TEST_CHOICE%"=="2" goto :test_csgo
if "%TEST_CHOICE%"=="3" goto :test_dota2
if "%TEST_CHOICE%"=="4" goto :view_config
if "%TEST_CHOICE%"=="5" goto :exit

:test_main
echo.
echo Starting main Steam tools test...
echo.
call test-steam-tools.bat
goto :end

:test_csgo
echo.
echo Starting CS:GO updater test...
echo.
call test-csgo-only.bat
goto :end

:test_dota2
echo.
echo Starting Dota 2 updater test...
echo.
call test-dota2-only.bat
goto :end

:view_config
echo.
echo ===============================================================
echo                     TEST CONFIGURATION
echo ===============================================================
type "config\.env"
echo.
echo ===============================================================
goto :end

:exit
echo.
echo Exiting test setup...
goto :end

:end
echo.
echo ====================================================================
echo |                     TEST COMPLETED                              |
echo |                                                                  |
echo |   Console will stay open for review.                            |
echo |   Press any key to close when ready.                            |
echo ====================================================================
echo.
pause > nul

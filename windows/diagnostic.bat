@echo off
title DIAGNOSTIC TEST
chcp 65001 > nul

echo ================================================================
echo                      DIAGNOSTIC TEST                           
echo ================================================================
echo.

echo [STEP 1] Basic test - script started
echo Current directory: %CD%
echo.

echo [STEP 2] Testing config file path
echo Looking for: %~dp0..\config\.env
if exist "%~dp0..\config\.env" (
    echo [SUCCESS] Config file found!
) else (
    echo [ERROR] Config file NOT found!
    echo [DEBUG] Script directory: %~dp0
    echo [DEBUG] Looking for: %~dp0..\config\.env
)

echo.
echo [STEP 3] Testing pause functionality
echo This test will pause here - press any key to continue...
pause

echo.
echo [STEP 4] Final test
echo If you see this message, the script works properly!
echo.

echo ================================================================
echo                    DIAGNOSTIC COMPLETE                         
echo ================================================================
echo.
echo Press any key to exit...
pause > nul

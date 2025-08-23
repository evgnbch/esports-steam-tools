@echo off
title PATH TEST - ESPORTS STEAM TOOLS
REM chcp 65001 > nul
setlocal enabledelayedexpansion

echo ================================================================
echo                      PATH TESTING SCRIPT                       
echo ================================================================
echo.

echo [STEP 1] Initial location test
echo Current working directory: %CD%
echo Script location: %~dp0
echo.

echo [STEP 2] Looking for config files
echo Looking for config\.env.example: 
if exist "config\.env.example" (
    echo [SUCCESS] Found: config\.env.example
) else (
    echo [ERROR] NOT found: config\.env.example
)

echo.
echo Looking for config\.env:
if exist "config\.env" (
    echo [SUCCESS] Found: config\.env
) else (
    echo [ERROR] NOT found: config\.env
)

echo.
echo [STEP 3] Directory listing
echo Contents of current directory:
dir /b
echo.

echo [STEP 4] Config directory listing
if exist "config\" (
    echo Contents of config directory:
    dir config\ /b
) else (
    echo [ERROR] Config directory not found!
)

echo.
echo [STEP 5] Testing relative paths
echo Testing: %~dp0config\.env.example
if exist "%~dp0config\.env.example" (
    echo [SUCCESS] Found via script path
) else (
    echo [INFO] Not found via script path (this is normal if SETUP.bat is in root)
)

echo.
echo ================================================================
echo                       PATH TEST COMPLETE                       
echo ================================================================
echo.
echo Press any key to exit...
pause > nul

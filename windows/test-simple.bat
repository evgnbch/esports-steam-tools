@echo off
title SIMPLE TEST - ESPORTS STEAM TOOLS
chcp 65001 > nul
setlocal enabledelayedexpansion

echo ================================================================
echo                      SIMPLE TEST SCRIPT                       
echo ================================================================
echo.

echo [1] Testing basic functionality...
echo Current directory: %CD%
echo Script directory: %~dp0
echo.

echo [2] Testing config file existence...
if exist "%~dp0..\config\.env" (
    echo [SUCCESS] Config file found: %~dp0..\config\.env
) else (
    echo [ERROR] Config file not found: %~dp0..\config\.env
    goto :error
)

echo.
echo [3] Testing config file loading...
for /f "usebackq eol=# tokens=1,2 delims==" %%A in ("%~dp0..\config\.env") do (
    if "%%A" neq "" if "%%B" neq "" (
        echo Loading: %%A = %%B
        set %%A=%%B
    )
)

echo.
echo [4] Testing loaded variables...
if "%ACCOUNT1_LOGIN%" neq "" (
    echo [SUCCESS] ACCOUNT1_LOGIN = %ACCOUNT1_LOGIN%
) else (
    echo [ERROR] ACCOUNT1_LOGIN is empty
    goto :error
)

echo.
echo [SUCCESS] All tests passed! Scripts should work now.
echo.
goto :end

:error
echo.
echo [ERROR] Tests failed! Check the issues above.
echo.

:end
echo Press any key to exit...
pause > nul

@echo off

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
exit /b 0

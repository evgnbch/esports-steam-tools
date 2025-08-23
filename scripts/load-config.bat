@echo off

echo 🔐 Loading secure configuration...

if not exist "%~dp0..\config\.env" (
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

REM Load environment variables
for /f "usebackq tokens=1,2 delims==" %%A in ("%~dp0..\config\.env") do (
    set %%A=%%B
)

if "%ACCOUNT1_LOGIN%"=="" (
    echo ❌ ERROR: Configuration is empty or invalid!
    echo Please check your config\.env file format.
    pause
    exit /b 1
)

echo ✅ Configuration loaded successfully
exit /b 0

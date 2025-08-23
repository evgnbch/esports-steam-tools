@echo off
echo.
echo ⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡
echo ⚡               🔧 ESPORTS STEAM TOOLS SETUP                    ⚡
echo ⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡
echo.
echo 🚀 Setting up secure Steam automation tools...
echo.

echo [1/3] 📋 Creating configuration file...
if exist "config\.env" (
    echo ⚠️  Configuration file already exists!
    echo Do you want to overwrite it? (Y/N)
    set /p OVERWRITE=
    if /i "%OVERWRITE%"=="Y" (
        copy "config\.env.example" "config\.env" >nul
        echo ✅ Configuration file updated
    ) else (
        echo ⏭️  Keeping existing configuration
    )
) else (
    copy "config\.env.example" "config\.env" >nul
    echo ✅ Configuration file created
)

echo.
echo [2/3] ⚙️  Configuration required...
echo.
echo 📝 Please edit config\.env with your Steam credentials:
echo    1. Open config\.env in your text editor
echo    2. Replace placeholder values with real Steam usernames/passwords
echo    3. Save the file
echo.
echo 💡 The .env file is automatically protected by .gitignore
echo.

echo [3/3] 🎮 Ready to use!
echo.
echo Available tools:
echo   🔫 scripts\csgo-updater.bat  - CS:GO updates only
echo   ⚔️  scripts\dota2-updater.bat - Dota 2 updates only
echo   🎯 scripts\steam-tools.bat   - Universal tool (both games)
echo.

echo ╔══════════════════════════════════════════════════════════════╗
echo ║                    ⚠️  SECURITY REMINDER                     ║
echo ║                                                              ║
echo ║  1. Never commit .env files to Git                          ║
echo ║  2. Use strong passwords for all Steam accounts             ║
echo ║  3. Enable Steam Guard for additional security              ║
echo ║  4. Check docs\SECURITY.md for detailed guidelines          ║
echo ╚══════════════════════════════════════════════════════════════╝
echo.

set /p OPEN_CONFIG="Open config\.env file now? (Y/N): "
if /i "%OPEN_CONFIG%"=="Y" (
    start notepad "config\.env"
)

echo.
echo ✅ Setup completed! 
echo.
pause

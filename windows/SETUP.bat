@echo off
title ESPORTS STEAM TOOLS - SETUP
chcp 65001 > nul
setlocal enabledelayedexpansion

echo.
echo ╔══════════════════════════════════════════════════════════════════╗
echo ║                    ESPORTS STEAM TOOLS SETUP                    ║
echo ║                      Professional Edition v3.0                  ║
echo ╚══════════════════════════════════════════════════════════════════╝
echo.
echo Setting up secure Steam automation tools for Windows...
echo.

echo [1/3] 📁 Creating configuration file...
if exist "config\.env" (
    echo ⚠️  WARNING: Configuration file already exists!
    set /p OVERWRITE="Do you want to overwrite it? (Y/N): "
    if /i "!OVERWRITE!"=="Y" (
        copy "config\.env.example" "config\.env" > nul
        echo ✅ SUCCESS: Configuration file updated
    ) else (
        echo ⏭️  SKIP: Keeping existing configuration
    )
) else (
    if not exist "config\" mkdir config
    copy "config\.env.example" "config\.env" > nul
    echo ✅ SUCCESS: Configuration file created
)

echo.
echo [2/3] ⚙️  Configuration required...
echo.
echo Please edit config\.env with your Steam credentials:
echo   1. Open config\.env in your text editor
echo   2. Replace placeholder values with real Steam usernames/passwords
echo   3. Save the file
echo.
echo ℹ️  NOTE: The .env file is automatically protected by .gitignore
echo.

echo [3/3] 🎯 Ready to use!
echo.
echo Available tools:
echo   📁 windows\csgo-updater.bat   - 🔫 CS:GO updates only
echo   📁 windows\dota2-updater.bat  - ⚔️  Dota 2 updates only
echo   📁 windows\steam-tools.bat    - 🎮 Universal tool (both games)
echo.
echo   📁 tests\windows\TEST-SETUP.bat  - 🧪 Safe testing environment
echo.

echo ╔══════════════════════════════════════════════════════════════════╗
echo ║                         🔒 SECURITY REMINDER                    ║
echo ║                                                                  ║
echo ║   1. Never commit .env files to Git                             ║
echo ║   2. Use strong, unique passwords                               ║
echo ║   3. Test with test-setup folder first                          ║
echo ║   4. Keep your Steam Guard enabled                              ║
echo ╚══════════════════════════════════════════════════════════════════╝
echo.

echo ✅ Setup completed successfully!
echo.
echo Next steps:
echo   1. Edit config\.env with your credentials
echo   2. Run tests\windows\TEST-SETUP.bat to verify everything works
echo   3. Use the main scripts for your esports team
echo.
echo ╔══════════════════════════════════════════════════════════════════╗
echo ║                    PRESS ANY KEY TO EXIT                        ║
echo ╚══════════════════════════════════════════════════════════════════╝
pause > nul
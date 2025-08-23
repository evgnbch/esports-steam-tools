#!/bin/bash

# ╔══════════════════════════════════════════════════════════════════╗
# ║                    ESPORTS STEAM TOOLS SETUP                    ║
# ║                      Professional Edition v3.0                  ║
# ╚══════════════════════════════════════════════════════════════════╝

set -e

echo ""
echo "╔══════════════════════════════════════════════════════════════════╗"
echo "║                    ESPORTS STEAM TOOLS SETUP                    ║"
echo "║                      Professional Edition v3.0                  ║"
echo "╚══════════════════════════════════════════════════════════════════╝"
echo ""
echo "Setting up secure Steam automation tools for macOS/Linux..."
echo ""

echo "[1/3] 📁 Creating configuration file..."
if [[ -f "config/.env" ]]; then
    echo "⚠️  WARNING: Configuration file already exists!"
    read -p "Do you want to overwrite it? (Y/N): " OVERWRITE
    if [[ "${OVERWRITE,,}" == "y" ]]; then
        cp "config/.env.example" "config/.env"
        echo "✅ SUCCESS: Configuration file updated"
    else
        echo "⏭️  SKIP: Keeping existing configuration"
    fi
else
    mkdir -p config
    cp "config/.env.example" "config/.env"
    echo "✅ SUCCESS: Configuration file created"
fi

echo ""
echo "[2/3] ⚙️  Configuration required..."
echo ""
echo "Please edit config/.env with your Steam credentials:"
echo "  1. Open config/.env in your text editor"
echo "  2. Replace placeholder values with real Steam usernames/passwords"
echo "  3. Save the file"
echo ""
echo "ℹ️  NOTE: The .env file is automatically protected by .gitignore"
echo ""

echo "[3/3] 🎯 Ready to use!"
echo ""
echo "Available tools:"
echo "  📁 macos-linux/csgo-updater.sh   - 🔫 CS:GO updates only"
echo "  📁 macos-linux/dota2-updater.sh  - ⚔️  Dota 2 updates only"
echo "  📁 macos-linux/steam-tools.sh    - 🎮 Universal tool (both games)"
echo ""
echo "  📁 tests/macos-linux/test-setup.sh     - 🧪 Safe testing environment"
echo ""

echo "╔══════════════════════════════════════════════════════════════════╗"
echo "║                         🔒 SECURITY REMINDER                    ║"
echo "║                                                                  ║"
echo "║   1. Never commit .env files to Git                             ║"
echo "║   2. Use strong, unique passwords                               ║"
echo "║   3. Test with testing folder first                             ║"
echo "║   4. Keep your Steam Guard enabled                              ║"
echo "╚══════════════════════════════════════════════════════════════════╝"
echo ""

echo "✅ Setup completed successfully!"
echo ""
echo "Next steps:"
echo "  1. Edit config/.env with your credentials"
echo "  2. Run tests/macos-linux/test-setup.sh to verify everything works"
echo "  3. Use the main scripts for your esports team"
echo ""
echo "╔══════════════════════════════════════════════════════════════════╗"
echo "║                    PRESS ENTER TO EXIT                          ║"
echo "╚══════════════════════════════════════════════════════════════════╝"
read -p ""
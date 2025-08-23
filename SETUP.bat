#!/bin/bash
# filepath: /workspaces/esports-steam-tools/setup.sh

echo
echo "⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡"
echo "⚡               🔧 ESPORTS STEAM TOOLS SETUP                    ⚡"
echo "⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡"
echo
echo "🚀 Setting up secure Steam automation tools..."
echo

echo "[1/3] 📋 Creating configuration file..."
if [ -f "config/.env" ]; then
    echo "⚠️  Configuration file already exists!"
    read -p "Do you want to overwrite it? (Y/N): " OVERWRITE
    if [[ "$OVERWRITE" =~ ^[Yy]$ ]]; then
        cp "config/.env.example" "config/.env"
        echo "✅ Configuration file updated"
    else
        echo "⏭️  Keeping existing configuration"
    fi
else
    cp "config/.env.example" "config/.env"
    echo "✅ Configuration file created"
fi

echo
echo "[2/3] ⚙️  Configuration required..."
echo
echo "📝 Please edit config/.env with your Steam credentials:"
echo "   1. Open config/.env in your text editor"
echo "   2. Replace placeholder values with real Steam usernames/passwords"
echo "   3. Save the file"
echo
echo "💡 The .env file is automatically protected by .gitignore"
echo

echo "[3/3] 🎮 Ready to use!"
echo
echo "Available tools:"
echo "  🔫 scripts/csgo-updater.sh  - CS:GO updates only"
echo "  ⚔️  scripts/dota2-updater.sh - Dota 2 updates only"
echo "  🎯 scripts/steam-tools.sh   - Universal tool (both games)"
echo

echo "╔══════════════════════════════════════════════════════════════╗"
echo "║                    ⚠️  SECURITY REMINDER                     ║"
echo "║                                                              ║"
echo "║  1. Never commit .env files to Git                          ║"
echo "║  2. Use strong passwords for all Steam accounts             ║"
echo "║  3. Enable Steam Guard for additional security              ║"
echo "║  4. Check docs/SECURITY.md for detailed guidelines          ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo

read -p "Open config/.env file now? (Y/N): " OPEN_CONFIG
if [[ "$OPEN_CONFIG" =~ ^[Yy]$ ]]; then
    if command -v code >/dev/null 2>&1; then
        code "config/.env"
    elif command -v nano >/dev/null 2>&1; then
        nano "config/.env"
    elif command -v vim >/dev/null 2>&1; then
        vim "config/.env"
    else
        echo "Please open config/.env manually in your preferred editor"
    fi
fi

echo
echo "✅ Setup completed!"
echo

#!/bin/bash

# ╔══════════════════════════════════════════════════════════════════╗
# ║                        ESPORTS STEAM TOOLS                      ║
# ║                   SECURE STEAM AUTOMATION v3.0                  ║
# ║                   Built for Professional Esports Teams          ║
# ╚══════════════════════════════════════════════════════════════════╝

set -e

echo ""
echo "╔══════════════════════════════════════════════════════════════════╗"
echo "║                        ESPORTS STEAM TOOLS                      ║"
echo "║                   SECURE STEAM AUTOMATION v3.0                  ║"
echo "║                   Built for Professional Esports Teams          ║"
echo "╚══════════════════════════════════════════════════════════════════╝"
echo ""

# Get script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_FILE="$SCRIPT_DIR/../config/.env"

# Check for config file
if [[ ! -f "$CONFIG_FILE" ]]; then
    echo "❌ ERROR: Configuration file not found!"
    echo ""
    echo "Setup Instructions:"
    echo "1. Run setup.sh from the main folder first"
    echo "2. Edit config/.env with your Steam credentials"
    echo "3. Run this script again"
    echo ""
    echo "Press ENTER to exit..."
    read
    exit 1
fi

echo "📁 Loading secure configuration..."

# Load environment variables
set -a
source "$CONFIG_FILE"
set +a

if [[ -z "$ACCOUNT1_LOGIN" ]]; then
    echo "❌ ERROR: Configuration is empty or invalid!"
    echo "Please check your config/.env file format."
    echo "Press ENTER to exit..."
    read
    exit 1
fi

echo "✅ SUCCESS: Configuration loaded successfully"
echo ""

echo "╔══════════════════════════════════════════════════════════════════╗"
echo "║                           SELECT GAME                           ║"
echo "╚══════════════════════════════════════════════════════════════════╝"
echo ""
echo "   1. 🔫 Counter-Strike: Global Offensive"
echo "   2. ⚔️  Dota 2"
echo ""
read -p "Enter game number (1-2): " GAME_CHOICE

case $GAME_CHOICE in
    1)
        GAME_NAME="CS:GO"
        GAME_ID="730"
        echo "✅ SUCCESS: Selected Counter-Strike: Global Offensive"
        ;;
    2)
        GAME_NAME="Dota 2"
        GAME_ID="570"
        echo "✅ SUCCESS: Selected Dota 2"
        ;;
    *)
        echo "❌ ERROR: Invalid selection!"
        echo "Press ENTER to exit..."
        read
        exit 1
        ;;
esac

echo ""
echo "╔══════════════════════════════════════════════════════════════════╗"
echo "║                          SELECT ACCOUNT                         ║"
echo "╚══════════════════════════════════════════════════════════════════╝"
echo ""
echo "   1. 👤 Account #1 ($ACCOUNT1_LOGIN)"
echo "   2. 👤 Account #2 ($ACCOUNT2_LOGIN)"
echo "   3. 👤 Account #3 ($ACCOUNT3_LOGIN)"
echo "   4. 👤 Account #4 ($ACCOUNT4_LOGIN)"
echo ""
read -p "Enter account number (1-4): " ACCOUNT_CHOICE

case $ACCOUNT_CHOICE in
    1)
        LOGIN="$ACCOUNT1_LOGIN"
        PASSWORD="$ACCOUNT1_PASSWORD"
        ;;
    2)
        LOGIN="$ACCOUNT2_LOGIN"
        PASSWORD="$ACCOUNT2_PASSWORD"
        ;;
    3)
        LOGIN="$ACCOUNT3_LOGIN"
        PASSWORD="$ACCOUNT3_PASSWORD"
        ;;
    4)
        LOGIN="$ACCOUNT4_LOGIN"
        PASSWORD="$ACCOUNT4_PASSWORD"
        ;;
    *)
        echo "❌ ERROR: Invalid account selection!"
        echo "Press ENTER to exit..."
        read
        exit 1
        ;;
esac

echo "✅ SUCCESS: Selected account: $LOGIN"
echo ""

echo "╔══════════════════════════════════════════════════════════════════╗"
echo "║                         UPDATE PROCESS                          ║"
echo "╚══════════════════════════════════════════════════════════════════╝"

echo "[1/4] 🔄 Terminating Steam processes..."
# Kill Steam processes on macOS
pkill -f Steam || true
pkill -f steam || true
sleep 2

echo "[2/4] 🔍 Locating Steam installation..."

# Common Steam paths on macOS
STEAM_PATHS=(
    "/Applications/Steam.app/Contents/MacOS/steam_osx"
    "$HOME/Applications/Steam.app/Contents/MacOS/steam_osx"
    "/usr/local/bin/steam"
)

STEAM_EXE=""
for path in "${STEAM_PATHS[@]}"; do
    if [[ -f "$path" ]]; then
        STEAM_EXE="$path"
        echo "       ✅ SUCCESS: Found Steam at: $path"
        break
    fi
done

if [[ -z "$STEAM_EXE" ]]; then
    echo "       ❌ ERROR: Steam installation not found!"
    echo "       Please install Steam from: https://store.steampowered.com/about/"
    echo "Press ENTER to exit..."
    read
    exit 1
fi

echo "[3/4] 🚀 Launching Steam with authentication..."
"$STEAM_EXE" -login "$LOGIN" "$PASSWORD" -silent &

echo "[4/4] 🎮 Initiating $GAME_NAME update..."
sleep 5
open "steam://validate/$GAME_ID"

echo ""
echo "╔══════════════════════════════════════════════════════════════════╗"
echo "║                        UPDATE INITIATED                         ║"
echo "╚══════════════════════════════════════════════════════════════════╝"
echo ""
echo "🎮 Game: $GAME_NAME"
echo "👤 Account: $LOGIN"
echo "🔄 Steam will automatically download updates"
echo "🚫 Game will NOT launch after update"
echo ""
echo "╔══════════════════════════════════════════════════════════════════╗"
echo "║                    PRESS ENTER TO EXIT                          ║"
echo "╚══════════════════════════════════════════════════════════════════╝"
read
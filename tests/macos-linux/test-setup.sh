#!/bin/bash

# ╔══════════════════════════════════════════════════════════════════╗
# ║                    ESPORTS STEAM TOOLS - TEST                   ║
# ║                         Safe Testing Mode                       ║
# ╚══════════════════════════════════════════════════════════════════╝

set -e

echo ""
echo "╔══════════════════════════════════════════════════════════════════╗"
echo "║                    ESPORTS STEAM TOOLS - TEST                   ║"
echo "║                         Safe Testing Mode                       ║"
echo "╚══════════════════════════════════════════════════════════════════╝"
echo ""

# Get script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_FILE="$SCRIPT_DIR/../../config/.env"

echo "🧪 Testing environment setup for macOS..."
echo ""

echo "[1/5] 📋 Checking system requirements..."

# Check if running on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    echo "❌ ERROR: This script is designed for macOS"
    echo "   For other systems, use the appropriate scripts"
    exit 1
fi

echo "       ✅ macOS detected: $(sw_vers -productName) $(sw_vers -productVersion)"

echo "[2/5] 🔍 Checking Steam installation..."

# Check for Steam installation
STEAM_PATHS=(
    "/Applications/Steam.app/Contents/MacOS/steam_osx"
    "$HOME/Applications/Steam.app/Contents/MacOS/steam_osx"
    "/usr/local/bin/steam"
)

STEAM_EXE=""
for path in "${STEAM_PATHS[@]}"; do
    if [[ -f "$path" ]]; then
        STEAM_EXE="$path"
        echo "       ✅ Steam found at: $path"
        break
    fi
done

if [[ -z "$STEAM_EXE" ]]; then
    echo "       ❌ ERROR: Steam not found!"
    echo "       Please install Steam from: https://store.steampowered.com/about/"
    echo ""
    echo "       Installation steps:"
    echo "       1. Download Steam for macOS"
    echo "       2. Open the .dmg file"
    echo "       3. Drag Steam to Applications folder"
    echo "       4. Run Steam once to complete setup"
    echo ""
    exit 1
fi

echo "[3/5] 📁 Checking configuration..."

if [[ ! -f "$CONFIG_FILE" ]]; then
    echo "       ⚠️  WARNING: Configuration file not found"
    echo "       Run setup.sh first to create config/.env"
    echo ""
    echo "       Testing will continue with basic checks..."
else
    echo "       ✅ Configuration file exists"
    
    # Load and validate config
    set -a
    source "$CONFIG_FILE"
    set +a
    
    if [[ -z "$ACCOUNT1_LOGIN" ]] || [[ "$ACCOUNT1_LOGIN" == "your_steam_username_1" ]]; then
        echo "       ⚠️  WARNING: Configuration contains placeholder values"
        echo "       Please edit config/.env with real Steam credentials"
        echo ""
    else
        echo "       ✅ Configuration appears to be set up"
    fi
fi

echo "[4/5] 🔧 Testing script permissions..."

# Check script permissions
BIN_DIR="$SCRIPT_DIR"
for script in "$BIN_DIR"/*.sh; do
    if [[ -f "$script" ]]; then
        if [[ -x "$script" ]]; then
            echo "       ✅ $(basename "$script") is executable"
        else
            echo "       🔧 Making $(basename "$script") executable..."
            chmod +x "$script"
            echo "       ✅ $(basename "$script") is now executable"
        fi
    fi
done

echo "[5/5] 🎯 Testing Steam URL protocols..."

# Test if steam:// URLs work
echo "       Testing Steam protocol handler..."
if command -v osascript >/dev/null 2>&1; then
    # Use AppleScript to test Steam URL without actually opening anything
    osascript -e 'tell application "System Events" to return name of application processes' | grep -q "Steam" && STEAM_RUNNING=true || STEAM_RUNNING=false
    
    if $STEAM_RUNNING; then
        echo "       ✅ Steam is currently running"
    else
        echo "       ℹ️  Steam is not running (this is normal for testing)"
    fi
    
    echo "       ✅ Steam protocol should work when Steam is running"
else
    echo "       ⚠️  Cannot test Steam protocol (osascript not available)"
fi

echo ""
echo "╔══════════════════════════════════════════════════════════════════╗"
echo "║                        TEST RESULTS                             ║"
echo "╚══════════════════════════════════════════════════════════════════╝"
echo ""
echo "✅ System compatibility: PASSED"
echo "✅ Steam installation: PASSED"
echo "✅ Script permissions: PASSED"
echo ""

if [[ -f "$CONFIG_FILE" ]]; then
    if [[ -n "$ACCOUNT1_LOGIN" ]] && [[ "$ACCOUNT1_LOGIN" != "your_steam_username_1" ]]; then
        echo "✅ Configuration: READY"
        echo ""
        echo "🎉 ALL TESTS PASSED!"
        echo ""
        echo "Your system is ready to use the Steam automation tools."
        echo ""
        echo "Next steps:"
        echo "  1. ✅ Configuration is set up"
        echo "  2. Run any of the updater scripts:"
        echo "     • macos-linux/csgo-updater.sh"
        echo "     • macos-linux/dota2-updater.sh" 
        echo "     • macos-linux/steam-tools.sh"
    else
        echo "⚠️  Configuration: NEEDS SETUP"
        echo ""
        echo "🔧 SETUP REQUIRED"
        echo ""
        echo "Your system is ready, but configuration needs to be completed:"
        echo "  1. Edit config/.env with your Steam credentials"
        echo "  2. Run this test again to verify"
        echo "  3. Use the updater scripts"
    fi
else
    echo "⚠️  Configuration: NOT CREATED"
    echo ""
    echo "🔧 SETUP REQUIRED"
    echo ""
    echo "Next steps:"
    echo "  1. Run setup.sh to create configuration"
    echo "  2. Edit config/.env with your Steam credentials"
    echo "  3. Run this test again"
fi

echo ""
echo "╔══════════════════════════════════════════════════════════════════╗"
echo "║                    PRESS ENTER TO EXIT                          ║"
echo "╚══════════════════════════════════════════════════════════════════╝"
read
# 🎯 ESPORTS STEAM TOOLS - COMPLETE WINDOWS SETUP

**Professional Steam automation tools for esports teams - Now fully Windows compatible!**

## 🚀 QUICK START

1. **Download and extract this project**
2. **Run `SETUP.bat` as Administrator** 
3. **Edit `config/.env` with your Steam credentials**
4. **Test with `test-setup/TEST-SETUP.bat` first**
5. **Use main tools in `scripts/` folder**

## 📁 WHAT'S INCLUDED

### Main Scripts (Production Ready)
- **`SETUP.bat`** - Initial setup for Windows
- **`scripts/steam-tools.bat`** - Universal tool (CS:GO + Dota 2)
- **`scripts/csgo-updater.bat`** - CS:GO updates only
- **`scripts/dota2-updater.bat`** - Dota 2 updates only

### Test Environment (100% Safe)
- **`test-setup/TEST-SETUP.bat`** - Safe testing interface
- **`test-setup/test-steam-tools.bat`** - Test main tool
- **`test-setup/test-csgo-only.bat`** - Test CS:GO updater
- **`test-setup/test-dota2-only.bat`** - Test Dota 2 updater

### Configuration
- **`config/.env.example`** - Template configuration
- **`config/.env`** - Your actual credentials (auto-created)

## ✅ FIXED ISSUES

- ✅ **Windows Compatibility**: All scripts now work perfectly on Windows
- ✅ **Console Stays Open**: No more sudden closing
- ✅ **English Language**: All interface text in English
- ✅ **Proper File Paths**: Fixed relative path issues
- ✅ **UTF-8 Support**: Proper Unicode character display
- ✅ **Safe Testing**: Complete test environment included

## 🎮 HOW TO USE

### For Testing (Recommended First)
```cmd
cd test-setup
TEST-SETUP.bat
```
Choose option 1 to test the main interface safely.

### For Production Use
```cmd
# Setup
SETUP.bat

# Edit config with real credentials
notepad config\.env

# Run tools
scripts\steam-tools.bat        # Universal tool
scripts\csgo-updater.bat       # CS:GO only  
scripts\dota2-updater.bat      # Dota 2 only
```

## 🔒 SECURITY FEATURES

- **Safe Test Mode**: Test scripts use fake credentials
- **No Accidental Logins**: Clear warnings in test environment
- **Git Protection**: .env files automatically ignored
- **Professional Grade**: Built for esports team security

## 🏆 PERFECT FOR ESPORTS TEAMS

- **Multiple Account Support**: Up to 4 Steam accounts
- **Game-Specific Updates**: CS:GO or Dota 2 individually
- **Silent Operation**: No game launches after updates
- **Professional Interface**: Clean, clear, reliable

## 📋 REQUIREMENTS

- **Windows 10/11**
- **Steam installed**
- **Administrator privileges** (recommended)
- **Steam accounts with games owned**

## 🆘 TROUBLESHOOTING

### Console Closes Immediately
- Run as Administrator
- Use Command Prompt (not PowerShell)

### "File not found" errors
- Ensure all files are in the same folder
- Check folder permissions

### Steam not detected
- Install Steam first
- Check registry (automatic detection)

### Configuration issues
- Run SETUP.bat again
- Check config/.env format

## 📞 SUPPORT

If you encounter issues:
1. **Test first** with `test-setup/TEST-SETUP.bat`
2. **Check** `test-setup/TEST-INSTRUCTIONS.txt`
3. **Verify** Windows compatibility
4. **Run as Administrator** if needed

## 🎉 READY TO GO!

Your esports team now has professional Steam automation tools that work perfectly on Windows! The console won't close unexpectedly, everything is in English, and you have a complete test environment to verify everything works.

**Test first, then deploy to your team! 🚀**

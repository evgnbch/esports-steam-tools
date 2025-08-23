# ⚡ Esports Steam Tools

<div align="center">

[![License](https://img.shields.io/badge/License-MIT-blue.svg?style=for-the-badge)](LICENSE)
[![Security](https://img.shields.io/badge/Security-Enhanced-green.svg?style=for-the-badge)](#)
[![Steam](https://img.shields.io/badge/Steam-Compatible-blue.svg?style=for-the-badge)](https://store.steampowered.com/)

</div>

---

## 🛡️ Security First

> **🔒 100% Secure**: All credentials stored in local `.env` files - never committed to Git!

---


## ✨ Features

### 🔐 Security
- 🔧 Local `.env` configuration
- 🚫 Zero credentials in code
- 🔒 `.gitignore` protection
- ✅ Enterprise-grade security

### 🎮 Gaming
- ⚡ CS:GO auto-updater
- ⚔️ Dota 2 auto-updater
- 🔄 Multi-account support
- 🎯 Esports optimized

### 🚀 Automation
- 🤖 Steam process management
- 🔍 Smart Steam detection (Windows registry + common paths)
- 📦 Automatic game updates
- 🎨 Beautiful cross-platform CLI interface
- 🧪 Safe testing environment

---

## 🚀 Quick Start

### 🖥️ Windows Users

#### 1. Setup Configuration

```batch
REM Run the setup script
windows\SETUP.bat

REM Edit configuration with your credentials
notepad config\.env
```

#### 2. Run Tools

```batch
REM CS:GO Updater
windows\csgo-updater.bat

REM Dota 2 Updater  
windows\dota2-updater.bat

REM Universal Tool (recommended)
windows\steam-tools.bat
```

---

## ⚙️ Configuration Example

After running setup, edit `config/.env`:

```env
# config/.env - NEVER COMMIT THIS FILE!

# 🔑 Steam Account #1 (Main Competition Account)
ACCOUNT1_LOGIN=your_steam_username_1
ACCOUNT1_PASSWORD=your_steam_password_1

# 🔑 Steam Account #2 (Backup Competition Account)  
ACCOUNT2_LOGIN=your_steam_username_2
ACCOUNT2_PASSWORD=your_steam_password_2

# 🔑 Steam Account #3 (Practice Account)
ACCOUNT3_LOGIN=your_steam_username_3
ACCOUNT3_PASSWORD=your_steam_password_3

# 🔑 Steam Account #4 (Training Account)
ACCOUNT4_LOGIN=your_steam_username_4
ACCOUNT4_PASSWORD=your_steam_password_4
```

> **🛡️ Security Note**: This file is automatically protected by `.gitignore`

---

## 📁 Project Structure

```
📦 esports-steam-tools/
├── 🔐 config/
│   ├── .env.example        # Configuration template
│   └── README.md          # Config documentation
├── 🖥️  windows/            # Windows executables
│   ├── SETUP.bat          # Setup script
│   ├── steam-tools.bat    # Universal tool
│   ├── csgo-updater.bat   # CS:GO specific
│   └── dota2-updater.bat  # Dota 2 specific
└── 🛡️ .gitignore          # Security protection
```

---

## 🔒 Security

### What's Protected?
- ✅ Steam credentials
- ✅ Account configurations  
- ✅ Temporary files
- ✅ Debug logs

### Security Features?
- 🛡️ **Local .env files** - credentials never leave your machine
- 🚫 **Git protection** - .gitignore prevents accidental commits
- 🔒 **No hardcoded secrets** - all sensitive data externalized
- ✅ **Clean history** - fresh repository with no exposed data

---

## 🎮 Supported Games

| Game | Steam ID | Status | Features |
|------|----------|--------|----------|
| 🔫 **CS:GO** | `730` | ✅ Full Support | Auto-update, Multi-account |
| ⚔️ **Dota 2** | `570` | ✅ Full Support | Auto-update, Multi-account |

---


## 🔧 Troubleshooting



### Steam Guard Issues
- Enable Steam Guard in Steam settings
- Use app-generated codes when prompted
- Consider using account without Steam Guard for automation (not recommended for main accounts)

---

## 🤝 Contributing

1. Fork the repository
2. Create feature branch
3. **Never commit .env files**
4. Submit pull request

---

## 📄 License

MIT License - see [LICENSE](LICENSE) file.

---

<div align="center">

**⚡ Built for Professional Esports Teams**

*Secure • Fast • Reliable* 🏆

</div>

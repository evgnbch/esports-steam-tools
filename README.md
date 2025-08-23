<div align="center">
  <img src="assets/images/banner.svg" alt="Esports Steam Tools Banner" width="100%"/>
</div>

# ⚡ Esports Steam Tools

<div align="center">

[![License](https://img.shields.io/badge/License-MIT-blue.svg?style=for-the-badge)](LICENSE)
[![Security](https://img.shields.io/badge/Security-Enhanced-brightgreen.svg?style=for-the-badge)](#)
[![Platform](https://img.shields.io/badge/Platform-Windows-orange.svg?style=for-the-badge)](https://www.microsoft.com/windows)
[![Steam](https://img.shields.io/badge/Steam-Compatible-blue.svg?style=for-the-badge)](https://store.steampowered.com/)

**🔐 Professional & Secure Steam automation tools for esports teams**

[📥 Download](#) • [📖 Docs](docs/) • [🛡️ Security](#security) • [🐛 Issues](../../issues)

</div>

---

## 🛡️ Security First

> **🔒 100% Secure**: All credentials stored in local `.env` files - never committed to Git!

---

## ✨ Features

### 🔐 Security
- ��️ Local `.env` configuration
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
- 🔍 Smart Steam detection
- 📦 Automatic game updates
- 🎨 Beautiful CLI interface

---

## 🚀 Quick Start

### 1. Setup Configuration

```bash
# Copy example config
cp config/.env.example config/.env

# Edit with your credentials (KEEP IT PRIVATE!)
notepad config/.env
```

### 2. Configure Your Accounts

```env
# config/.env - NEVER COMMIT THIS FILE!
ACCOUNT1_LOGIN=your_steam_login
ACCOUNT1_PASSWORD=your_steam_password
# Add more accounts as needed...
```

### 3. Run Tools

```batch
# CS:GO Updater
scripts\csgo-updater.bat

# Dota 2 Updater  
scripts\dota2-updater.bat

# Universal Tool (recommended)
scripts\steam-tools.bat
```

---

## 📁 Project Structure

```
📦 esports-steam-tools/
├── 🔐 config/
│   ├── .env.example        # Configuration template
│   └── README.md          # Config documentation
├── ⚡ scripts/
│   ├── steam-tools.bat    # Universal tool
│   ├── csgo-updater.bat   # CS:GO specific
│   └── dota2-updater.bat  # Dota 2 specific
├── 🧪 tests/              # Testing suite
├── 📚 docs/               # Documentation
├── 🎨 assets/             # Graphics & logos
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

## �� Supported Games

| Game | Steam ID | Status | Features |
|------|----------|--------|----------|
| 🔫 **CS:GO** | `730` | ✅ Full Support | Auto-update, Multi-account |
| ⚔️ **Dota 2** | `570` | ✅ Full Support | Auto-update, Multi-account |

---

## 🧪 Testing

```batch
cd tests
run-tests.bat
```

---

## 📖 Documentation

- 🔒 [Security Guide](docs/SECURITY.md)
- ⚙️ [Configuration](docs/CONFIG.md)
- 🎮 [Gaming Setup](docs/GAMING.md)
- 🔧 [Troubleshooting](docs/TROUBLESHOOTING.md)

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

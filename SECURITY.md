# 🔐 Security Guidelines

## ⚠️ Critical Security Notice

This repository was created as a **secure replacement** for a compromised project where Steam credentials were accidentally exposed in Git history. Follow these guidelines to maintain security.

## 🛡️ Security Best Practices

### 1. Configuration Security
- **NEVER** commit `.env` files with real credentials
- Always use `.env.example` as a template
- Keep `.env` files local and secure
- The `.gitignore` file protects `.env` automatically

### 2. Password Management
```bash
# ✅ GOOD: Use .env files
ACCOUNT1_LOGIN=myusername
ACCOUNT1_PASSWORD=mypassword

# ❌ BAD: Hardcoded in scripts
set LOGIN=myusername
set PASSWORD=mypassword
```

### 3. Git Repository Security
- Check `.gitignore` includes sensitive files
- Never commit configuration files with credentials
- Use `git status` before committing
- Review changes with `git diff` before pushing

### 4. Steam Account Security
- Enable Steam Guard on all accounts
- Use strong, unique passwords
- Regular password rotation (every 90 days)
- Monitor account activity

## 🚨 Emergency Response

### If Credentials Are Exposed:
1. **Immediately change all exposed passwords**
2. **Delete the compromised repository**
3. **Create new repository with clean history**
4. **Notify team members**
5. **Review access logs**

### Recovery Process:
```bash
# 1. Change Steam passwords immediately
# 2. Delete old repository
gh repo delete username/old-repo --confirm

# 3. Create new secure repository
git clone https://github.com/username/esports-steam-tools.git
cd esports-steam-tools

# 4. Set up secure configuration
cp config/.env.example config/.env
# Edit config/.env with new passwords
```

## 🔍 Security Checklist

### Before Each Commit:
- [ ] Check no `.env` files in staging
- [ ] Review `git status` output
- [ ] Verify `.gitignore` is working
- [ ] Run `git diff --cached` to review changes

### Weekly Security Review:
- [ ] Audit repository for sensitive data
- [ ] Check team access permissions
- [ ] Review recent commits
- [ ] Update passwords if needed

### Monthly Security Maintenance:
- [ ] Rotate Steam account passwords
- [ ] Review `.gitignore` effectiveness
- [ ] Update security documentation
- [ ] Train team on security practices

## 📚 Security Resources

- [Steam Security FAQ](https://help.steampowered.com/en/faqs/view/6639-C5EC-80A5-00B1)
- [Git Security Best Practices](https://git-scm.com/book/en/v2/Git-Tools-Signing-Your-Work)
- [Environment Variables Security](https://12factor.net/config)

## 🆘 Support

For security incidents or questions:
- Create secure issue (no credentials in description)
- Contact team security officer
- Follow incident response procedures

---
**Remember**: Security is everyone's responsibility. When in doubt, ask for help!

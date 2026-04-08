# Security Guidelines

## Critical Notice

This repository automates Steam login/update flows. Treat all credentials as sensitive secrets.

## Core Rules

1. Never commit `config/.env` with real usernames/passwords.
2. Use `config/.env.example` only as a template.
3. Do not hardcode credentials in any `.bat` script.
4. Keep Steam Guard enabled on all managed accounts.

## Safe Configuration Pattern

```env
# Good
ACCOUNT1_LOGIN=myusername
ACCOUNT1_PASSWORD=mypassword
```

```bat
REM Bad: never hardcode credentials in scripts
set LOGIN=myusername
set PASSWORD=mypassword
```

## Git Hygiene

- Check `git status` before every commit.
- Review staged changes with `git diff --cached`.
- Ensure `.gitignore` still contains `.env` and `*.env` patterns.

## Incident Response

If credentials were exposed:

1. Change all exposed Steam passwords immediately.
2. Rotate related credentials/tokens.
3. Review recent commits and repository access.
4. Re-clone into a clean workspace if needed.

### Recovery Steps (Windows-friendly)

```powershell
git clone https://github.com/<owner>/esports-steam-tools.git
cd esports-steam-tools
SETUP.bat
```

Then edit `config/.env` locally with new credentials.

## Commit Checklist

- [ ] No `.env` files are staged.
- [ ] No passwords appear in diff output.
- [ ] Only intended scripts/docs were changed.

## Resources

- [Steam Security FAQ](https://help.steampowered.com/en/faqs/view/6639-C5EC-80A5-00B1)
- [Environment Variables Best Practices](https://12factor.net/config)

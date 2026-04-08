#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "$ROOT_DIR"

echo "[INFO] Validating required files..."
required_files=(
  "README.md"
  "SECURITY.md"
  "CHANGELOG.md"
  "LICENSE"
  "SETUP.bat"
  "config/.env.example"
  "config/release-manifest.json"
  "windows/steam-tools.bat"
  "windows/csgo-updater.bat"
  "windows/dota2-updater.bat"
  "windows/steam-update-core.bat"
)

for file in "${required_files[@]}"; do
  if [[ ! -f "$file" ]]; then
    echo "[ERROR] Missing required file: $file"
    exit 1
  fi
done

echo "[INFO] Validating release manifest version format..."
if ! jq -er '.version | test("^[0-9]+\\.[0-9]+\\.[0-9]+$")' config/release-manifest.json >/dev/null; then
  echo "[ERROR] config/release-manifest.json must contain semantic version in .version"
  exit 1
fi

echo "[INFO] Validating .env example keys..."
required_env_keys=(
  "ACCOUNT1_LOGIN"
  "ACCOUNT1_PASSWORD"
  "ACCOUNT2_LOGIN"
  "ACCOUNT2_PASSWORD"
  "ACCOUNT3_LOGIN"
  "ACCOUNT3_PASSWORD"
  "ACCOUNT4_LOGIN"
  "ACCOUNT4_PASSWORD"
)

for key in "${required_env_keys[@]}"; do
  if ! grep -Eq "^${key}=.+" config/.env.example; then
    echo "[ERROR] Missing or empty key in config/.env.example: $key"
    exit 1
  fi
done

echo "[INFO] Validating wrapper scripts..."
wrapper_files=(
  "windows/steam-tools.bat"
  "windows/csgo-updater.bat"
  "windows/dota2-updater.bat"
)

for file in "${wrapper_files[@]}"; do
  if ! grep -Fq 'steam-update-core.bat' "$file"; then
    echo "[ERROR] Wrapper does not call shared core script: $file"
    exit 1
  fi
done

echo "[INFO] Validating .gitignore for .env protection..."
for pattern in ".env" "*.env"; do
  if ! grep -Fxq "$pattern" .gitignore; then
    echo "[ERROR] .gitignore is missing required pattern: $pattern"
    exit 1
  fi
done

echo "[INFO] Scanning for obvious hardcoded credentials in batch files..."
if grep -RInE '^[[:space:]]*set[[:space:]]+"?(ACCOUNT[0-9]+_(LOGIN|PASSWORD)|LOGIN|PASSWORD)=[^%]' SETUP.bat windows/*.bat; then
  echo "[ERROR] Potential hardcoded credential assignment detected."
  exit 1
fi

echo "[DONE] Project structure and security checks passed."

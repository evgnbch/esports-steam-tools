# Esports Steam Tools

Набор Windows BAT-скриптов для запуска обновления Steam-игр с несколькими аккаунтами.

## Структура проекта

- `SETUP.bat` — создаёт `config/.env` из шаблона
- `windows/steam-tools.bat` — интерактивный выбор игры и аккаунта
- `windows/csgo-updater.bat` — быстрое обновление AppID `730` (Counter-Strike 2)
- `windows/dota2-updater.bat` — быстрое обновление AppID `570` (Dota 2)
- `windows/steam-update-core.bat` — общее ядро логики (не запускать напрямую)
- `config/.env.example` — шаблон конфигурации аккаунтов
- `config/release-manifest.json` — единый источник версии релиза
- `scripts/ci/validate-project.sh` — CI-проверка структуры и безопасности
- `.github/workflows/ci-release.yml` — quality gate и публикация релиза по тегу
- `.github/workflows/release-please.yml` — ручные утилиты проверки релизной конфигурации
- `CHANGELOG.md` — заметки по версиям

## Быстрый старт (Windows)

1. Запустите:
   ```bat
   SETUP.bat
   ```
2. Отредактируйте `config/.env` и заполните аккаунты.
3. Запустите один из скриптов:
   ```bat
   windows\steam-tools.bat
   ```

## Конфигурация

Шаблон находится в `config/.env.example`.

Минимум для работы:

```env
ACCOUNT1_LOGIN=your_login
ACCOUNT1_PASSWORD=your_password
```

## Проверка качества

Автоматически проверки выполняются в GitHub Actions через `scripts/ci/validate-project.sh`.

Локальный запуск (например, через Git Bash):

```bash
bash scripts/ci/validate-project.sh
```

## Релизы

1. Обновите `config/release-manifest.json` (поле `version`).
2. Добавьте секцию для этой версии в `CHANGELOG.md`.
3. Создайте и отправьте тег формата `vX.Y.Z`.

После push тега workflow `ci-release.yml` создаст/обновит релиз и прикрепит Windows-архив.

## Безопасность

- `config/.env` не должен попадать в Git
- перед коммитом проверяйте `git status`
- не храните пароли в `.bat`-файлах

Подробности: `SECURITY.md`.

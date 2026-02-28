# Esports Steam Tools

Набор Windows BAT-скриптов для запуска обновления Steam-игр с несколькими аккаунтами.

## Что внутри

- `SETUP.bat` — создаёт `config/.env` из шаблона
- `windows/steam-tools.bat` — интерактивный выбор игры и аккаунта
- `windows/csgo-updater.bat` — быстрое обновление AppID `730` (Counter-Strike 2)
- `windows/dota2-updater.bat` — быстрое обновление AppID `570` (Dota 2)
- `windows/steam-update-core.bat` — общее ядро логики (не запускать напрямую)

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

## Безопасность

- `config/.env` не должен попадать в Git
- перед коммитом проверяйте `git status`
- не храните пароли в `.bat`-файлах

Подробности: `SECURITY.md`.

## Примечания по версии

В версии `v1.1.0`:

- удалено дублирование логики в скриптах обновления
- улучшен парсинг `.env` (поддержка значений с `=`)
- исправлены устаревшие/битые ссылки в документации

# Windows Setup Troubleshooting

## Проблемы при запуске SETUP.bat

### 1. Ошибка "The system cannot find the path specified"

**Причина**: Неправильная рабочая директория

**Решение**:
```batch
cd C:\path\to\esports-steam-tools
windows\SETUP.bat
```

### 2. Ошибки с Unicode символами

**Симптомы**:
- `'║' is not recognized as an internal or external command`
- Искаженные символы в консоли

**Решение**: Обновить файлы .bat (уже исправлено в последней версии)

### 3. Кодировка в Windows Console

**Если видите иероглифы**:
```batch
chcp 65001
windows\SETUP.bat
```

### 4. Проблемы с правами доступа

**Решение**: Запустить Command Prompt от имени администратора:
1. Нажать Win+R
2. Ввести `cmd`
3. Ctrl+Shift+Enter (запуск от имени администратора)
4. Перейти в папку проекта
5. Запустить `windows\SETUP.bat`

### 5. Проблемы с Steam Guard

**При автоматизации**:
- Используйте аккаунты БЕЗ Steam Guard для тестов
- Или настройте мобильный аутентификатор
- Генерируйте коды приложения для автоматизации

### 6. Быстрая проверка работоспособности

```batch
REM Проверить наличие всех файлов
dir windows\*.bat
dir config\.env.example
dir tests\windows\*.bat

REM Безопасный тест
tests\windows\TEST-SETUP.bat
```

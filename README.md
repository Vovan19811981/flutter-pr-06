# State Management

## Запуск

```bash
flutter pub get
flutter analyze
flutter run
```

## Розподіл стану

| Дані | Де зберігаються | Причина |
|---|---|---|
| Поточне значення лічильника | `CounterAppShell` (`State`) | Спільне для головного екрана та історії |
| Історія змін | `CounterAppShell` (`State`) | Використовується на кількох екранах і в бейджі |
| Обраний крок `1 / 5 / 10` | `_CounterScreenState` | Ефемерний стан конкретного екрана |

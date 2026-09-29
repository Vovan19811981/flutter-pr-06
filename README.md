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
| Поточне значення лічильника | `CounterState extends ChangeNotifier` | Спільний стан застосунку |
| Історія змін | `CounterState extends ChangeNotifier` | Використовується незалежними віджетами та екраном історії |
| Обраний крок `1 / 5 / 10` | `_CounterActionsState` | Ефемерний локальний стан |

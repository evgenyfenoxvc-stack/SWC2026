# SWC2026 — iOS-приложение (обёртка сайта)

Открывает **https://www.startupworldcup.io/grand-finale** внутри нативного iOS-приложения через `WKWebView`.

## Что включено
- `SWC2026App.swift` — точка входа
- `ContentView.swift` — экран с индикатором загрузки
- `WebView.swift` — обёртка WKWebView с pull-to-refresh
- `Info.plist` — настройки приложения

## Как собрать (5 минут)

1. Откройте **Xcode** → **File → New → Project**
2. Выберите **iOS → App**, нажмите Next
3. Заполните:
   - Product Name: `SWC2026`
   - Interface: **SwiftUI**
   - Language: **Swift**
4. Сохраните проект в любую папку
5. В навигаторе слева удалите автосгенерированные `ContentView.swift` и файл `...App.swift`
6. Перетащите в проект 3 файла из этого архива:
   - `SWC2026App.swift`
   - `ContentView.swift`
   - `WebView.swift`
   
   При добавлении отметьте галочку **"Copy items if needed"** и target `SWC2026`.
7. Откройте `Info.plist` проекта (или `Info` в настройках target) и при желании скопируйте туда ключ `CFBundleDisplayName` = `SWC2026`
8. Выберите симулятор (например iPhone 15) и нажмите **▶ Run**

Готово — приложение откроет сайт с индикатором загрузки и pull-to-refresh.

## Дальнейшие шаги (по желанию)
- **Иконка приложения**: добавьте в `Assets.xcassets → AppIcon`
- **Push-уведомления**: потребуют настройки Apple Push Notification service (APNs) и Capabilities в Xcode — скажите, если нужно, помогу добавить
- **Публикация в App Store**: нужен Apple Developer аккаунт ($99/год), архивация через Xcode → Product → Archive

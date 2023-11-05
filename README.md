# Install Flutter
https://docs.flutter.dev/get-started/install/macos

brew install cocoapods


# VSCode Extension 
GetX Snippets

# Change Language regardless device setting
```
Get.updateLocale(const Locale('zh', 'CN'));
Get.updateLocale(const Locale('en', 'US'));
```
# Flutter Google Fonts Icon
https://fonts.google.com/icons

# Websocket use GetxService
chat
https://absyz.com/getconnect-the-best-way-to-perform-api-operations-in-flutter-with-getx/

# Flutter local dev can't use localhost or 127.0.0.1

# VSCode extensions for Flutter

- Dart
- Error Lens
- Flutter
- GetX Snippets

Ctrl + . - Wrap or Extract Widget

- Prettier - Code formatter
- Dart Data Class generator
- Bloc

# flutter_boilerplate

# Google Authentication


# Flutter Launcher Icons

flutter pub run flutter_launcher_icons

# Flutter splach

flutter pub run flutter_native_splash:create

# Local http request
Add '--disable-web-security' in the chrome web configuration.
1. Go to flutter\bin\cache and remove a file named: flutter_tools.stamp
2. Go to flutter\packages\flutter_tools\lib\src\web and open the file chrome.dart.
3. Find '--disable-extensions'
4. Add '--disable-web-security', # !!! Including ,(comma)

# MacOS no network connection
```
Add
<key>com.apple.security.network.client</key>
<true />
to
macos/Runner/DebugProfile.entitiements
macos/Runner/release.entitiements
```
# Flutter http: api vs client - ??? Django auth session ???
api: Single http request
client: Multiple requests and a persistent connection

# Flutter MVC+S Design Pattern

Model: lib\models
View: lib\ui
Controller: lib\providers
Services: lib\services

# Tools

[QuickType - Convert JSON to Class](https://quicktype.io/)

## Vscode Extensions

Bloc
Dart Data Class Generator

# Bloc Shortcut

Click the light bulb
Windows: Crtl + .
Mac OS: Command + .

# JSON to Dart

[JSON to Dart](https://javiercbk.github.io/json_to_dart/)

# SVG Cleaner

[SVG Cleaner Online](https://iconly.io/tools/svg-cleaner)

# Flutter Default Config

C:\Tools\Flutter\packages\flutter_tools\gradle\flutter.gradle

# Scrollable Layout

## 1. SingleChildScrollView inside SafeArea

```
Scaffold(
    body: SafeArea(
        child: Column(children: <Widget>[
            Expanded(
                child: SingleChildScrollView(),
            )
        ]
    ),
);
```

## 2. ListView inside SafeArea

```
Scaffold(
    body: SafeArea(
        child: ListView(
        children: <Widget>[],
    ),
);
```

# Clean flutter packages and reinstall flutter packages
```
flutter pub outdated
flutter pub upgrade
flutter clean && flutter pub get 
```

# F5 to run Flutter Debug

# Install Flutter
```bash
https://docs.flutter.dev/get-started/install/macos
brew install cocoapods
```

# VSCode Extension 
GetX Snippets

# Change Language regardless device setting
```bash
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


# Flutter Launcher Icons
```bash
dart run flutter_launcher_icons
```

# Flutter splach
```bash
dart run flutter_native_splash:create
```

# Local http request
Add '--disable-web-security' in the chrome web configuration.
1. Go to flutter\bin\cache and remove a file named: flutter_tools.stamp
2. Go to flutter\packages\flutter_tools\lib\src\web and open the file chrome.dart.
3. Find '--disable-extensions'
4. Add '--disable-web-security', # !!! Including ,(comma)

# MacOS no network connection
Add
<key>com.apple.security.network.client</key>
<true />
to
macos/Runner/DebugProfile.entitiements
macos/Runner/release.entitiements

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

# Fix the corrupted SVG files
[PNG to SVG](https://www.adobe.com/express/feature/image/convert/png-to-svg)
[SVG Cleaner Online](https://iconly.io/tools/svg-cleaner)
[SVG Compressor](https://vecta.io/nano)

# Flutter Default Config
C:\Tools\Flutter\packages\flutter_tools\gradle\flutter.gradle

# Scrollable Layout
## 1. SingleChildScrollView inside SafeArea
```dart
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
```dart
Scaffold(
    body: SafeArea(
        child: ListView(
        children: <Widget>[],
    ),
);
```

# Clean flutter packages and reinstall flutter packages
```bash
flutter pub outdated
flutter pub upgrade
flutter clean && flutter pub get 
```

# Flutter build
```bash
# Debug
flutter build apk
build/app/outputs/debug/apk/release/app-release.apk
build/app/outputs/flutter-apk/app-release.apk

# Release
flutter build appbundle --release
build/app/outputs/bundle/release/app-release.aab
```

# Flutter ColorScheme
https://api.flutter.dev/flutter/material/ColorScheme-class.html

# Recreate Device
```bash
flutter delete android
flutter create .
flutter create --platforms=android,ios --project-name=xfoma .

# Flutter add package
flutter pub add settings_ui
flutter pub get

# Clear Flutter cache files
flutter clean && flutter pub get
```
# Flutter Plugins & Packages
https://github.com/flutter/packages
https://github.com/fluttercommunity/plus_plugins
* Packages
At a minimum, a Dart package is a directory containing a pubspec.yaml file. Additionally, a package can contain dependencies (listed in the pubspec), Dart libraries, apps, resources, tests, images, fonts, and examples. The pub.dev site lists many packages—developed by Google engineers and generous members of the Flutter and Dart community— that you can use in your app.

* Plugins
A plugin package is a special kind of package that makes platform functionality available to the app. Plugin packages can be written for Android (using Kotlin or Java), iOS (using Swift or Objective-C), web, macOS, Windows, Linux, or any combination thereof. For example, a plugin might provide Flutter apps with the ability to use a device's camera.


# Google Fonts Icons
[Google Fonts](https://fonts.google.com/icons)

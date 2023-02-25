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

# Custom flutter_bluetooth_serial

Remove Location Permission didn't release yet in 0.4.0
[Remove Location Permission](https://github.com/edufolly/flutter_bluetooth_serial/pull/152/commits/d6c98d0edafb03cbfb405d619905089bafe88e6c)

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

# Bluetooth

https://pub.dev/packages/quick_blue

https://pub.dev/packages/flutter_reactive_ble
https://pub.dev/packages/flutter_bluetooth_basic_v2
https://pub.dev/packages/flutter_blue
https://pub.dev/packages/bluetooth_low_energy

https://pub.dev/packages/flutter_bluetooth_serial

# F5 to run Flutter Debug

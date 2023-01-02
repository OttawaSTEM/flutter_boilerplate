# VSCode extensions for Flutter
* Dart
* Dart Data Class generator
* Bloc  

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
4. Add '--disable-web-security',            # !!! Including ,(comma)

# Flutter http: api vs client - ??? Django auth session ???
api: Single http request
client: Multiple requests and a persistent connection


# Flutter MVC+S Design Pattern
Model:      lib\models
View:       lib\ui
Controller: lib\providers
Services:   lib\services


# Tools
[QuickType - Convert JSON to Class](https://quicktype.io/)
## Vscode Extensions
Bloc
Dart Data Class Generator

# Bloc Shortcut
Click the light bulb
Windows: Crtl + .
Mac OS:  Command + .

# JSON to Dart
[JSON to Dart](https://javiercbk.github.io/json_to_dart/)


# SVG Cleaner
[SVG Cleaner Online](https://iconly.io/tools/svg-cleaner)
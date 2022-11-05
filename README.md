# flutter_boilerplate

# Setup splash in pubspec.yaml (flutter_native_splash)
## If you have a flavor called production you would do this:
flutter pub run flutter_native_splash:create --flavor production

## For a flavor with a name staging you would provide it's name like so:
flutter pub run flutter_native_splash:create --flavor staging

## And if you have a local version for devs you could do that:
flutter pub run flutter_native_splash:create --flavor development

# Flutter MVC+S Design Pattern
Model:      lib\models
View:       lib\ui
Controller: lib\providers
Services:   lib\services


# api vs client
api: Single http request
client: Multiple requests and a persistent connection
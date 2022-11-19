import 'package:flutter/material.dart';
import 'routes/routes.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      // initialRoute: '/login',
      routes: appRoutes,
    );
  }
}

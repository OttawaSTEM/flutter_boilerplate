import 'package:flutter/material.dart';

import '../core/auth/ui/login.dart';

import '../modules/home/ui/home.dart';
import '../modules/users/ui/users.dart';
import '../modules/counter0/ui/counter0.dart';
import '../modules/counter1/ui/counter1.dart';
import '../modules/counter10/ui/counter10.dart';
import '../modules/counter20/ui/counter20.dart';
import '../modules/counter30/ui/counter30.dart';
import '../modules/weather/ui/weather.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {
  // Pages
  '/': (context) => const HomePage(title: 'Home Page'),
  '/login': (context) => const LoginPage(),

  // Auth
  '/users': (context) => const UserPage(title: 'Users Page'),

  // Backend

  '/counter0': (context) =>
      const Counter0Page(title: 'Counter 0 ChangeNotifier'),
  '/counter1': (context) =>
      const Counter1Page(title: 'Counter 1 Shared Preferences'),

  // Bloc Test
  '/counter10': (context) => const Counter10Page(title: 'Counter 10 Cubit'),
  '/counter20': (context) => const Counter20Page(title: 'Counter 20 Bloc'),
  '/counter30': (context) =>
      const Counter30Page(title: 'Counter 30 Bloc Persistent'),
  '/weather': (context) => const WeatherPage(title: 'Weather'),
};

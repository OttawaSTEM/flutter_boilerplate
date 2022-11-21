import 'package:flutter/material.dart';

import '../modules/home/ui/home.dart';
import '../core/auth/ui/login.dart';

import '../modules/counter1/ui/counter1.dart';
import '../modules/weather/ui/weather.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {
  // Pages
  '/': (context) => const HomePage(title: 'Home Page'),
  '/login': (context) => const LoginPage(),

  // Auth
  // '/user': (context) => const UserPage(),

  // Backend

  // Bloc Test
  '/counter': (context) => const Counter1Page(title: 'Counter'),
  '/weather': (context) => const WeatherPage(title: 'Weather'),
};

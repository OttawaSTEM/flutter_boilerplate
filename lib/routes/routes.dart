import 'package:flutter/material.dart';

import '../modules/home/ui/home.dart';
import '../core/auth/ui/login.dart';

import '../modules/counter1/ui/counter1.dart';
import '../modules/counter2/ui/counter2.dart';
import '../modules/counter3/ui/counter3.dart';
import '../modules/weather/ui/weather.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {
  // Pages
  '/': (context) => const HomePage(title: 'Home Page'),
  '/login': (context) => const LoginPage(),

  // Auth
  // '/user': (context) => const UserPage(),

  // Backend

  // Bloc Test
  '/counter1': (context) => const Counter1Page(title: 'Counter 1'),
  '/counter2': (context) => const Counter2Page(title: 'Counter 2'),
  '/counter3': (context) => const Counter3Page(title: 'Counter 3'),
  '/weather': (context) => const WeatherPage(title: 'Weather'),
};

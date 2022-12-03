import 'package:flutter/material.dart';

import '../core/auth/ui/login.dart';

import '../modules/home/ui/home.dart';
import '../modules/users/ui/users.dart';

import '../modules/counter/ui/counter.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {
  // Pages
  '/': (context) => const HomePage(title: 'Home Page'),
  '/login': (context) => const LoginPage(),

  // Auth
  '/users': (context) => const UserPage(title: 'Users Page'),

  // Backend
  // '/counter': (context) => CounterPage(),
  '/counter': (context) => const CounterPage(title: 'Counter GetX Page'),
};

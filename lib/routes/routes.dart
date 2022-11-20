import 'package:flutter/material.dart';

import '../constants/strings.dart';
import '../modules/counter/ui/counter.dart';
import '../modules/home/ui/home.dart';
import '../core/auth/ui/login.dart';
import '../modules/second_page/ui/second_page.dart';

// import 'package:flutter_boilerplate/views/pages/user_page.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {
  // Pages
  '/': (context) => const HomePage(title: 'Home Page'),
  '/login': (context) => const LoginPage(),

  '/second': (context) => const SecondPage(),
  // '/user': (context) => const UserPage(),

  // Auth

  // Backend

  // Bloc Test
  '/counter': (context) => const CounterPage(title: 'Counter'),
};

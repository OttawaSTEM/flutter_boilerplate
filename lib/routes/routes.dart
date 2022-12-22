import 'package:get/get.dart';

import '../core/auth/ui/login.dart';
import '../modules/home/ui/home.dart';
import '../modules/users/ui/users.dart';
import '../modules/counter/ui/counter.dart';

final appRoutes = [
  GetPage(
    name: '/',
    page: () => const HomePage(title: 'Home Page'),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 500),
  ),
  GetPage(
    name: '/login',
    page: () => const LoginPage(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 500),
  ),
  GetPage(
    name: '/users',
    page: () => const UserPage(title: 'Users Page'),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 500),
  ),
  GetPage(
    name: '/counter',
    page: () => const CounterPage(title: 'Counter GetX Page'),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 500),
  ),
];

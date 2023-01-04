import 'package:get/get.dart';

import '../core/auth/ui/signin.dart';
import '../modules/bluetooth/ui/bluetooth.dart';
import '../modules/counter/ui/counter.dart';
import '../modules/dashboard/ui/dashboard.dart';
import '../modules/home/ui/home.dart';
import '../modules/users/ui/users.dart';

final appRoutes = [
  GetPage(
    name: '/',
    page: () => const HomePage(title: 'Home Page'),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 500),
  ),
  GetPage(
    name: '/login',
    page: () => const SigninPage(),
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
  GetPage(
    name: '/dashboard',
    page: () => const DashboardPage(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 500),
  ),
  GetPage(
    name: '/bluetooth',
    // page: () => const BluetoothPage(title: 'Bluetooth'),
    page: () => const BluetoothPage(title: 'Bluetooth', checkAvailability: false),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 500),
  ),
];

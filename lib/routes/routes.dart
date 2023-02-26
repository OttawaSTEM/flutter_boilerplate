import 'package:get/get.dart';

import '../core/auth/ui/signin.dart';
import '../modules/admin/ui/admin.dart';
import '../modules/bluetooth/ui/bluetooth.dart';
// import '../modules/bluetooth/ui/bluetooth_control.dart';
import '../modules/counter/ui/counter.dart';
import '../modules/dashboard/ui/dashboard.dart';
import '../modules/home/ui/home.dart';
import '../modules/users/ui/users.dart';
import '../modules/chat/ui/chat.dart';

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
    name: '/admin',
    page: () => const AdminPage(title: 'Admin Dashboard'),
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
    page: () =>
        const BluetoothPage(title: 'Bluetooth', checkAvailability: false),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 500),
  ),
  GetPage(
    name: '/chat',
    page: () => const WebsocketPage(title: 'Chat'),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 500),
  ),
];

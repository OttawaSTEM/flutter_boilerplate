import 'package:get/get.dart';

import '../pages/account/signin/ui/signin.dart';
import '../pages/admin/ui/admin.dart';
import '../pages/counter/ui/counter.dart';
import '../pages/dashboard/ui/dashboard.dart';
import '../pages/home/ui/home.dart';
import '../pages/users/ui/users.dart';
import '../pages/chat/ui/chat.dart';

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
    name: '/chat',
    page: () => const WebsocketPage(title: 'Chat'),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 500),
  ),
];

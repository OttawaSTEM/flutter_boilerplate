import 'package:get/get.dart';

import '../pages/account/signin/ui/signin.dart';
import '../pages/admin/ui/admin.dart';
import '../pages/counter/ui/counter.dart';
import '../pages/dashboard/ui/dashboard.dart';
import '../pages/home/ui/home.dart';
import '../pages/users/ui/users.dart';
import '../pages/chat/ui/chat.dart';

const transitionMS = 500;

abstract class AppRoutes {
  static String home = '/';
  static String login = '/login';
  static String admin = '/admin';
  static String users = '/users';
  static String counter = '/counter';
  static String dashboard = '/dashboard';
  static String chat = '/chat';
  static String signup = '/signup';
}

class AppPages {
  static List<GetPage> pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: transitionMS),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const SigninPage(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: transitionMS),
    ),
    GetPage(
      name: AppRoutes.admin,
      page: () => const AdminPage(title: 'Admin Dashboard'),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: transitionMS),
    ),
    GetPage(
      name: AppRoutes.users,
      page: () => const UserPage(title: 'Users Page'),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: transitionMS),
    ),
    GetPage(
      name: AppRoutes.counter,
      page: () => const CounterPage(title: 'Counter GetX Page'),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: transitionMS),
    ),
    GetPage(
      name: AppRoutes.dashboard,
      page: () => const DashboardPage(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: transitionMS),
    ),
    GetPage(
      name: AppRoutes.chat,
      page: () => const WebsocketPage(title: 'Chat'),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: transitionMS),
    ),
  ];
}

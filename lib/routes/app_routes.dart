import 'package:get/get.dart';

import '../pages/city/bindings/city_binding.dart';

import '../pages/account/signin/ui/login.dart';
import '../pages/account/signin/ui/password_reset.dart';
import '../pages/counter/ui/counter_ui.dart';
import '../pages/home/ui/home.dart';
import '../pages/users/ui/users_ui.dart';
import '../pages/groups/ui/groups_ui.dart';
import '../pages/city/ui/city_ui.dart';
import '../pages/dashboard/ui/dashboard.dart';
import '../pages/chat/ui/chat.dart';

const transitionMS = 500;

abstract class AppRoutes {
  static const String home = '/';
  static const String counter = '/counter';
  static const String login = '/signin';
  static const String passwordReset = '/passwordReset';
  static const String users = '/users';
  static const String groups = '/groups';
  static const String city = '/city';
  static const String dashboard = '/dashboard';
  static const String chat = '/chat';

  static const String signup = '/signup';
}

class AppPages {
  static List<GetPage> pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => HomePage(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: transitionMS),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: transitionMS),
    ),
    GetPage(
      name: AppRoutes.passwordReset,
      page: () => const PasswordResetPage(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: transitionMS),
    ),
    GetPage(
      name: AppRoutes.counter,
      page: () => const CounterPage(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: transitionMS),
    ),
    GetPage(
      name: AppRoutes.users,
      page: () => const UserPage(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: transitionMS),
    ),
    GetPage(
      name: AppRoutes.groups,
      page: () => const GroupsPage(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: transitionMS),
    ),
    GetPage(
      name: AppRoutes.city,
      page: () => const CityPage(),
      binding: CityBinding(),
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
      page: () => const WebsocketPage(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: transitionMS),
    ),
  ];
}

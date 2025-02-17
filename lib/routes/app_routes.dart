import 'package:get/get.dart';

import 'package:flutter_boilerplate/pages/city/bindings/city_binding.dart';

import 'package:flutter_boilerplate/pages/account/signin/ui/login.dart';
import 'package:flutter_boilerplate/pages/account/signin/ui/password_reset.dart';
import 'package:flutter_boilerplate/pages/counter/ui/counter_ui.dart';
import 'package:flutter_boilerplate/pages/home/ui/home.dart';
import 'package:flutter_boilerplate/pages/users/ui/users_ui.dart';
import 'package:flutter_boilerplate/pages/groups/ui/groups_ui.dart';
import 'package:flutter_boilerplate/pages/city/ui/city_ui.dart';
import 'package:flutter_boilerplate/pages/dashboard/ui/dashboard.dart';
import 'package:flutter_boilerplate/pages/chat/ui/chat.dart';
import 'package:flutter_boilerplate/pages/settings/ui/settings_ui.dart';

const transitionMS = 500;

abstract class AppRoutes {
  static const String home = '/';
  static const String counter = '/counter';
  static const String login = '/signin';
  static const String signup = '/signup';
  static const String passwordReset = '/passwordReset';
  static const String users = '/users';
  static const String groups = '/groups';
  static const String city = '/city';
  static const String dashboard = '/dashboard';
  static const String chat = '/chat';
  static const String settings = '/settings';
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
      name: AppRoutes.settings,
      page: () => const SettingsPage(),
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

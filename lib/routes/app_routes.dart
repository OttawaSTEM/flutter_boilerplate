import 'package:get/get.dart';

import '../pages/city/bindings/city_binding.dart';
import '../pages/groups/bindings/groups_binding.dart';

import '../pages/account/signin/ui/signin.dart';
import '../pages/counter/ui/counter.dart';
import '../pages/home/ui/home.dart';
import '../pages/users/ui/users.dart';
import '../pages/groups/ui/groups_ui.dart';
import '../pages/city/ui/city_ui.dart';
import '../pages/dashboard/ui/dashboard.dart';
import '../pages/chat/ui/chat.dart';

const transitionMS = 500;

abstract class AppRoutes {
  static const String home = '/';
  static const String counter = '/counter';
  static const String login = '/signin';
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
      page: () => const HomePage(),
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
      name: AppRoutes.login,
      page: () => const SigninPage(),
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
      binding: GroupsBinding(),
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

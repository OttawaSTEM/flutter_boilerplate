import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:flutter_boilerplate/pages/drawer/controller/drawer_controller.dart';
import 'package:flutter_boilerplate/pages/account/signin/ui/signin.dart';
import 'package:flutter_boilerplate/pages/home/ui/home_ui.dart';

class NavDrawer extends StatelessWidget {
  NavDrawer({super.key});

  final SideDrawerController controller = Get.put(SideDrawerController());

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              drawerHeader(context),
              drawerMenuItems(context),
            ],
          ),
        ),
      );

  Widget drawerHeader(BuildContext context) => Material(
        child: InkWell(
          onTap: () {},
          child: Container(
            color: Theme.of(context).colorScheme.primary,
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
              bottom: 24,
            ),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 65,
                  child: CircleAvatar(
                    radius: 45,
                    backgroundColor: Colors.white,
                    child: SvgPicture.asset('assets/images/core/logo.svg'),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'flutter_boilerplate',
                  style: Theme.of(context).textTheme.headlineSmall?.merge(
                        const TextStyle(color: Colors.white),
                      ),
                ),
                // Text(
                //   'flutter_boilerplate',
                //   style: Theme.of(context).textTheme.titleMedium?.merge(
                //         const TextStyle(color: Colors.white),
                //       ),
                // ),
              ],
            ),
          ),
        ),
      );

  Widget drawerMenuItems(BuildContext context) => Container(
        padding: const EdgeInsets.all(10),
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: Text(
                'Home'.tr,
                style: const TextStyle(
                  fontSize: 18.0,
                ),
              ),
              onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => HomePage()),
              ),
            ),
            Obx(
              () => controller.authStatus.value
                  ? ListTile(
                      leading: const Icon(Icons.logout_outlined),
                      title: Text(
                        'Logout'.tr,
                        style: const TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      onTap: () {
                        // Close navigation drawer first
                        Navigator.pop(context);
                        controller.signOut();
                      },
                    )
                  : ListTile(
                      leading: const Icon(Icons.login_outlined),
                      title: Text(
                        'Sign In'.tr,
                        style: const TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      onTap: () {
                        // Close navigation drawer first
                        Navigator.pop(context);
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SignInPage(),
                        ));
                      },
                    ),
            ),
            const Divider(color: Colors.black54),
            ListTile(
              leading: const Icon(Icons.account_tree_outlined),
              title: Text(
                'Plugins'.tr,
                style: const TextStyle(
                  fontSize: 18.0,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.notifications_outlined),
              title: Text(
                'Notification'.tr,
                style: const TextStyle(
                  fontSize: 18.0,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings_outlined),
              title: Text(
                'Settings'.tr,
                style: const TextStyle(
                  fontSize: 18.0,
                ),
              ),
              onTap: () {
                Get.toNamed('/settings');
              },
            ),
          ],
        ),
      );
}

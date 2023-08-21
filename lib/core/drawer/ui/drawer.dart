import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../pages/account/signin/controller/auth_controller.dart';
import '../../../pages/account/signin/ui/signin.dart';
import '../../../pages/home/ui/home.dart';

class NavDrawer extends StatelessWidget {
  NavDrawer({Key? key}) : super(key: key);

  final AuthController authController = Get.put(AuthController());

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
            color: Colors.blue[600],
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
              bottom: 24,
            ),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 55,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: SvgPicture.asset('assets/images/core/logo.svg'),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Flutter Project',
                  style: Theme.of(context).textTheme.headlineSmall?.merge(
                        const TextStyle(color: Colors.white),
                      ),
                ),
                Text(
                  'Ottawa STEM Club',
                  style: Theme.of(context).textTheme.titleMedium?.merge(
                        const TextStyle(color: Colors.white),
                      ),
                ),
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
                MaterialPageRoute(builder: (context) => const HomePage()),
              ),
            ),
            authController.authStatus
                ? ListTile(
                    leading: const Icon(Icons.logout_outlined),
                    title: Text(
                      'Sign out'.tr,
                      style: const TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    onTap: () {
                      // Close navigation drawer first
                      Navigator.pop(context);
                      authController.signOut();
                    },
                  )
                : ListTile(
                    leading: const Icon(Icons.login_outlined),
                    title: Text(
                      'Sign in'.tr,
                      style: const TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    onTap: () {
                      // Close navigation drawer first
                      Navigator.pop(context);
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SigninPage(),
                      ));
                    },
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
          ],
        ),
      );
}

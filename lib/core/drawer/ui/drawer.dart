import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/assets.dart';
import '../../../constants/colors.dart';
import '../../../constants/strings.dart';

import '../../../core/auth/controller/auth_controller.dart';
import '../../../core/auth/ui/login.dart';
import '../../../modules/home/ui/home.dart';

class NavigationDrawer extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  NavigationDrawer({Key? key}) : super(key: key);

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
        // color: Colors.black54,
        color: dividerColor,
        child: InkWell(
            onTap: () {},
            child: Container(
              color: Colors.black54,
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top,
                bottom: 24,
              ),
              child: Column(
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 55,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage(appLogo),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    txtAppName,
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        ?.merge(const TextStyle(color: Colors.white)),
                  ),
                  Text(
                    txtContactEmail,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.merge(const TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            )),
      );

  Widget drawerMenuItems(BuildContext context) => Container(
        padding: const EdgeInsets.all(10),
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text(
                txtHome,
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const HomePage(title: txtAppName)),
              ),
            ),
            authController.authStatus
                ? ListTile(
                    leading: const Icon(Icons.logout_outlined),
                    title: const Text(
                      txtLogout,
                      style: TextStyle(
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
                    title: const Text(
                      txtLogin,
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    onTap: () {
                      // Close navigation drawer first
                      Navigator.pop(context);
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ));
                    },
                  ),
            const Divider(color: Colors.black54),
            ListTile(
              leading: const Icon(Icons.account_tree_outlined),
              title: const Text(
                'Plugins',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.notifications_outlined),
              title: const Text(
                'Notification',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
      );
}

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/constants/assets.dart';
import 'package:flutter_boilerplate/constants/common.dart';
import 'package:flutter_boilerplate/constants/colors.dart';

import 'package:flutter_boilerplate/views/pages/home.dart';
import 'package:flutter_boilerplate/views/pages/second_page.dart';
// import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
// import 'package:flutter_boilerplate/utils/styles.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              DrawerHeader(context),
              DrawerMenuItems(context),
            ],
          ),
        ),
      );

  Widget DrawerHeader(BuildContext context) => Material(
        color: Colors.black54,
        child: InkWell(
            onTap: () {},
            child: Container(
              color: Colors.black54,
              padding: EdgeInsets.only(
                top: 24 + MediaQuery.of(context).padding.top,
                bottom: 24,
              ),
              child: Column(children: const [
                CircleAvatar(
                  radius: 52,
                  backgroundImage: AssetImage(Assets.appLogo),
                ),
                SizedBox(height: 12),
                Text('Ottawa STEM Club', style: TextStyle(fontSize: 28)),
                Text('ottawastem@gmail.com', style: TextStyle(fontSize: 16)),
              ]),
            )),
      );

  Widget DrawerMenuItems(BuildContext context) => Container(
        padding: const EdgeInsets.all(24),
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text('Home'),
              onTap: () =>
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) =>
                          // const HomePage(title: Common.appName))),
                          const HomePage(title: 'title'))),
            ),
            ListTile(
                leading: const Icon(Icons.workspaces_outlined),
                title: const Text('Workflow'),
                onTap: () {
                  // Close navigation drawer first
                  Navigator.pop(context);
                  Navigator.of(context).push(MaterialPageRoute(
                    // < Menu
                    builder: (context) => const SecondPage(),
                  ));
                }),
            ListTile(
              leading: const Icon(Icons.update),
              title: const Text('Updates'),
              onTap: () {},
            ),
            // const Divider(color: AppColors.dividerColor),
            const Divider(color: Colors.black54),
            ListTile(
              leading: const Icon(Icons.account_tree_outlined),
              title: const Text('Plugins'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.notifications_outlined),
              title: const Text('Notification'),
              onTap: () {},
            ),
          ],
        ),
      );
}




// menu header
// class DrawerHeader extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return DrawerHeader(
// //      child: Text("Menu",
// //        style: TextStyle(
// //          fontSize: 20.0,
// //          color: Colors.white,
// //        ),
// //      ),
//       decoration: BoxDecoration(
//         color: Theme.of(context).primaryColor,
//         image: DecorationImage(
//             image: AssetImage(Assets.appLogo), fit: BoxFit.contain),
//       ),
//       child: null,
//     );
//   }
// }

// class HomeDrawer extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: <Widget>[
//           DrawerHeaderItem(),
//           FlutterTipsItem(),
//           Divider(
//             color: Colors.grey[500],
//           ),
//           LoginItem(),
//           ReferAFriendItem(),
//           AboutItem(),
//           RateAppItem(),
//           SizedBox(
//             height: 50,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class BackendDrawer extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: <Widget>[
//           DrawerHeaderItem(),
//           Divider(
//             color: Colors.grey[500],
//           ),
//           LogoutItem(),
//           ReferAFriendItem(),
//           AboutItem(),
//           RateAppItem(),
//           SizedBox(
//             height: 50,
//           ),
//         ],
//       ),
//     );
//   }
// }



// /// home item
// class HomeItem extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text("Home", style: Styles.appDrawerTextStyle),
//       leading: Icon(Icons.lightbulb_outline, color: Styles.appDrawerIconColor),
//       onTap: () {
//         Navigator.pop(context);

//         Navigator.pushNamed(context, '/');
//       },
//     );
//   }
// }

// /// flutter tips item
// class FlutterTipsItem extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text("Flutter Tips", style: Styles.appDrawerTextStyle),
//       leading: Icon(Icons.lightbulb_outline, color: Styles.appDrawerIconColor),
//       onTap: () {
//         Navigator.pop(context);

//         Navigator.pushNamed(context, '/flutter-tips');
//       },
//     );
//   }
// }

// /// refer a friend item
// class ReferAFriendItem extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text("Refer a Friend", style: Styles.appDrawerTextStyle),
//       leading: Icon(Icons.share, color: Styles.appDrawerIconColor),
//       onTap: () {
//         Navigator.pop(context);

//         Navigator.pushNamed(context, '/refer-a-friend');
//       },
//     );
//   }
// }

// /// logout item
// class LogoutItem extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text("Logout", style: Styles.appDrawerTextStyle),
//       leading: Icon(Icons.exit_to_app, color: Styles.appDrawerIconColor),
//       onTap: () {
// //        AuthProvider().logout();

// //        Navigator.pop(context);
// //        Navigator.pop(context);

//         Navigator.pushNamed(context, '/');
//       },
//     );
//   }
// }

// /// login item
// class LoginItem extends StatefulWidget {
//   @override
//   _LoginItemState createState() => _LoginItemState();
// }

// class _LoginItemState extends State<LoginItem> {
//   bool loggedIn = false;

//   void _checkStatus() async {
// //    bool isLoggedIn = await AuthProvider().checkIfAuth();
// //    setState(() {
// //      loggedIn = isLoggedIn;
// //    });
//   }

//   @override
//   void initState() {
//     _checkStatus();

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return loggedIn
//         ? ListTile(
//             title: Text("Dashboard", style: Styles.appDrawerTextStyle),
//             leading: Icon(Icons.home, color: Styles.appDrawerIconColor),
//             onTap: () {
//               Navigator.pop(context);

//               Navigator.pushNamed(context, '/dashboard');
//             },
//           )
//         : ListTile(
//             title: Text("Sign In", style: Styles.appDrawerTextStyle),
//             leading: Icon(Icons.exit_to_app, color: Styles.appDrawerIconColor),
//             onTap: () {
//               Navigator.pop(context);

//               Navigator.pushNamed(context, '/login');
//             },
//           );
//   }
// }

// /// about item
// class AboutItem extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text("About", style: Styles.appDrawerTextStyle),
//       leading: Icon(Icons.info_outline, color: Styles.appDrawerIconColor),
//       onTap: () {
//         Navigator.pop(context);

//         Navigator.pushNamed(context, '/about');
//       },
//     );
//   }
// }

// /// rate app item
// class RateAppItem extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text("Rate Us", style: Styles.appDrawerTextStyle),
//       leading: Icon(Icons.star, color: Styles.appDrawerIconColor),
//       onTap: () {
//         Navigator.pop(context);

//         Navigator.pushNamed(context, '/rate-app');
//       },
//     );
//   }
// }

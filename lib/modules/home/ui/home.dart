import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sidebarx/sidebarx.dart';

import '../../../core/drawer/ui/drawer.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key, required this.title});

  final String title;

  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SidebarX Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        canvasColor: canvasColor,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.white,
            fontSize: 46,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      home: Builder(
        builder: (context) {
          final isSmallScreen = MediaQuery.of(context).size.width < 600;
          return Scaffold(
            key: _key,
            appBar: isSmallScreen
                ? AppBar(
                    title: Text(_getTitleByIndex(_controller.selectedIndex)),
                    backgroundColor: canvasColor,
                    leading: IconButton(
                      onPressed: () {
                        // if (!Platform.isAndroid && !Platform.isIOS) {
                        //   _controller.setExtended(true);
                        // }
                        _key.currentState?.openDrawer();
                      },
                      icon: const Icon(Icons.menu),
                    ),
                  )
                : null,
            drawer: ExampleSidebarX(controller: _controller),
            body: Row(
              children: [
                if (!isSmallScreen) ExampleSidebarX(controller: _controller),
                Expanded(
                  child: Center(
                    child: _ScreensExample(
                      controller: _controller,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ExampleSidebarX extends StatelessWidget {
  const ExampleSidebarX({
    Key? key,
    required SidebarXController controller,
  })  : _controller = controller,
        super(key: key);

  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: _controller,
      theme: SidebarXTheme(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: canvasColor,
          borderRadius: BorderRadius.circular(20),
        ),
        hoverColor: scaffoldBackgroundColor,
        textStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
        selectedTextStyle: const TextStyle(color: Colors.white),
        itemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white),
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: actionColor.withOpacity(0.37),
          ),
          gradient: const LinearGradient(
            colors: [accentCanvasColor, canvasColor],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.28),
              blurRadius: 30,
            )
          ],
        ),
        iconTheme: IconThemeData(
          color: Colors.white.withOpacity(0.7),
          size: 20,
        ),
        selectedIconTheme: const IconThemeData(
          color: Colors.white,
          size: 20,
        ),
      ),
      extendedTheme: const SidebarXTheme(
        width: 200,
        decoration: BoxDecoration(
          color: Colors.black,
        ),
      ),
      footerDivider: divider,
      headerBuilder: (context, extended) {
        return SizedBox(
          height: 100,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset('assets/images/avatar.png'),
          ),
        );
      },
      items: [
        SidebarXItem(
          icon: Icons.home,
          label: 'Home',
          onTap: () {
            debugPrint('Home');
          },
        ),
        const SidebarXItem(
          icon: Icons.search,
          label: 'Search',
        ),
        const SidebarXItem(
          icon: Icons.people,
          label: 'People',
        ),
        const SidebarXItem(
          icon: Icons.favorite,
          label: 'Favorite',
        ),
        const SidebarXItem(
          iconWidget: FlutterLogo(size: 20),
          label: 'Flutter',
        ),
      ],
    );
  }
}

class _ScreensExample extends StatelessWidget {
  const _ScreensExample({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SidebarXController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final pageTitle = _getTitleByIndex(controller.selectedIndex);
        switch (controller.selectedIndex) {
          case 0:
            return ListView.builder(
              padding: const EdgeInsets.only(top: 10),
              itemBuilder: (context, index) => Container(
                height: 100,
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).canvasColor,
                  boxShadow: const [BoxShadow()],
                ),
                child: Center(
                    child: Text(
                  "Item $index",
                  style: const TextStyle(fontSize: 30, color: Colors.white),
                )),
              ),
            );
          default:
            return Text(
              pageTitle,
              style:
                  theme.textTheme.headlineMedium?.copyWith(color: Colors.black),
            );
        }
      },
    );
  }
}

String _getTitleByIndex(int index) {
  switch (index) {
    case 0:
      return 'Home';
    case 1:
      return 'Search';
    case 2:
      return 'People';
    case 3:
      return 'Favorites';
    case 4:
      return 'Custom iconWidget';
    default:
      return 'Not found page';
  }
}

const primaryColor = Color(0xFF685BFF);
const canvasColor = Color(0xFFE72385);
const scaffoldBackgroundColor = Color(0xFFFFFFFF);
const accentCanvasColor = Color(0xFF97EC91);
const white = Colors.white;
final actionColor = const Color(0xFFE34919).withOpacity(0.6);
final divider = Divider(color: white.withOpacity(0.3), height: 1);



// class HomePage extends StatefulWidget {
//   const HomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// const primaryColor = Color(0xFF6252DA);
// const canvasColor = Color(0xFF2E2E48);
// const scaffoldBackgroundColor = Color(0xFF7777B6);

// class _HomePageState extends State<HomePage> {
//   final _controller = SidebarXController(selectedIndex: 0, extended: true);
//   final _key = GlobalKey<ScaffoldState>();
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Builder(builder: (context) {
//         final isSmallScreen = MediaQuery.of(context).size.width < 600;

//         return Scaffold(
//           key: _key,
//           appBar: isSmallScreen
//               ? AppBar(
//                   title: const Text('SideBarX Example'),
//                   leading: IconButton(
//                     onPressed: () {
//                       _key.currentState?.openDrawer();
//                     },
//                     icon: const Icon(Icons.menu),
//                   ),
//                 )
//               : null,
//           drawer: SideBar(
//             controller: _controller,
//           ),
//           body: Row(
//             children: [
//               if (!isSmallScreen) SideBar(controller: _controller),
//               Expanded(
//                 child: Center(
//                   child: AnimatedBuilder(
//                     animation: _controller,
//                     builder: (context, child) {
//                       switch (_controller.selectedIndex) {
//                         case 0:
//                           _key.currentState?.closeDrawer();
//                           return const Center(
//                             child: Text(
//                               'Home',
//                               style:
//                                   TextStyle(color: Colors.black, fontSize: 40),
//                             ),
//                           );
//                         case 1:
//                           _key.currentState?.closeDrawer();
//                           return const Center(
//                             child: Text(
//                               'Search',
//                               style:
//                                   TextStyle(color: Colors.black, fontSize: 40),
//                             ),
//                           );
//                         case 2:
//                           _key.currentState?.closeDrawer();
//                           return const Center(
//                             child: Text(
//                               'Settings',
//                               style:
//                                   TextStyle(color: Colors.black, fontSize: 40),
//                             ),
//                           );
//                         case 3:
//                           _key.currentState?.closeDrawer();
//                           return const Center(
//                             child: Text(
//                               'Theme',
//                               style:
//                                   TextStyle(color: Colors.black, fontSize: 40),
//                             ),
//                           );
//                         default:
//                           return const Center(
//                             child: Text(
//                               'Home',
//                               style:
//                                   TextStyle(color: Colors.black, fontSize: 40),
//                             ),
//                           );
//                       }
//                     },
//                   ),
//                 ),
//               )
//             ],
//           ),
//         );
//       }),
//     );
//   }
// }

// class SideBar extends StatelessWidget {
//   const SideBar({Key? key, required SidebarXController controller})
//       : _controller = controller,
//         super(key: key);

//   final SidebarXController _controller;
//   @override
//   Widget build(BuildContext context) {
//     return SidebarX(
//       controller: _controller,
//       theme: const SidebarXTheme(
//         iconTheme: IconThemeData(
//           color: Colors.black,
//         ),
//         selectedTextStyle: TextStyle(color: Colors.black),
//         hoverColor: Colors.red,
//       ),
//       extendedTheme: const SidebarXTheme(width: 250),
//       footerDivider: Divider(color: Colors.black.withOpacity(0.8), height: 1),
//       headerBuilder: (context, extended) {
//         return const SizedBox(
//           height: 100,
//           child: Icon(
//             Icons.person,
//             size: 60,
//             color: Colors.black,
//           ),
//         );
//       },
//       items: const [
//         SidebarXItem(
//           icon: Icons.home,
//           label: 'Home',
//         ),
//         SidebarXItem(icon: Icons.search, label: 'Search'),
//         SidebarXItem(icon: Icons.settings, label: 'Setting'),
//         SidebarXItem(icon: Icons.dark_mode, label: 'Light/Dark Mode'),
//       ],
//     );
//   }
// }


// class HomePage extends StatefulWidget {
//   const HomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           widget.title,
//           style: GoogleFonts.roboto(
//             fontWeight: FontWeight.bold,
//             color: Colors.black,
//             fontSize: 20,
//           ),
//         ),
//       ),
//       drawer: NavDrawer(),
//       body: Column(
//         children: [
//           const SizedBox(height: 20),
//           SizedBox(
//             height: 50,
//             child: (Center(
//               child: (ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     minimumSize: const Size(120, 50),
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10))),
//                 child: Text(
//                   'Counter 0',
//                   style: GoogleFonts.roboto(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                     fontSize: 16,
//                   ),
//                 ),
//                 onPressed: () {
//                   Get.toNamed("/counter");
//                 },
//               )),
//             )),
//           ),
//           const SizedBox(height: 16),
//           SizedBox(
//             height: 50,
//             child: (Center(
//               child: (ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     minimumSize: const Size(120, 50),
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10))),
//                 child: Text(
//                   'Users Page',
//                   style: GoogleFonts.roboto(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                     fontSize: 16,
//                   ),
//                 ),
//                 onPressed: () {
//                   Get.toNamed("/users");
//                 },
//               )),
//             )),
//           ),
//           const SizedBox(height: 20),
//           SizedBox(
//             height: 50,
//             child: (Center(
//               child: (ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     minimumSize: const Size(120, 50),
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10))),
//                 child: Text(
//                   'Dashboard Page',
//                   style: GoogleFonts.roboto(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                     fontSize: 16,
//                   ),
//                 ),
//                 onPressed: () {
//                   Get.toNamed("/dashboard");
//                 },
//               )),
//             )),
//           ),
//           const SizedBox(height: 20),
//           SizedBox(
//             height: 50,
//             child: (Center(
//               child: (ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     minimumSize: const Size(120, 50),
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10))),
//                 child: Text(
//                   'Bluetooth Page',
//                   style: GoogleFonts.roboto(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                     fontSize: 16,
//                   ),
//                 ),
//                 onPressed: () {
//                   Get.toNamed("/bluetooth");
//                 },
//               )),
//             )),
//           ),
//           const SizedBox(height: 20),
//           SizedBox(
//             height: 50,
//             child: (Center(
//               child: (ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     minimumSize: const Size(120, 50),
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10))),
//                 child: Text(
//                   'Websocket',
//                   style: GoogleFonts.roboto(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                     fontSize: 16,
//                   ),
//                 ),
//                 onPressed: () {
//                   Get.toNamed("/chat");
//                 },
//               )),
//             )),
//           ),
//         ],
//       ),
//     );
//   }
// }

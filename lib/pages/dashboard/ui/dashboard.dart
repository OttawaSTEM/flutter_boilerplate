import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../utils/utils.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var landscapeScreen = (screenSize.width > screenSize.height) ? true : false;
    GetStorage storage = GetStorage();
    storage.write('screeWidth', screenSize.width);
    storage.write('screeHeight', screenSize.height);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/dashboard-bg.png"),
            fit: BoxFit.contain,
          ),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              left: landscapeScreen
                  ? screenPosition('x', 0.15)
                  : screenPosition('x', 0.095),
              top: landscapeScreen
                  ? screenPosition('y', -0.8)
                  : screenPosition('y', -0.546),
              child: IconButton(
                icon: SvgPicture.asset("assets/images/core/logo.svg"),
                // icon: Image.asset("assets/images/logo.png"),
                iconSize: 50,
                onPressed: () => Get.back(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

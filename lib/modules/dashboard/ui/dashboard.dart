import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var ratioFHD = 1.78;
    var baseHorizontal = ((screenSize.width / screenSize.height) > ratioFHD) ? false : true;

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
              top: baseHorizontal
                  ? (screenSize.height / 2) - (screenSize.width / ratioFHD) * 0.4
                  : (screenSize.height / 2) - screenSize.height * 0.4,
              left: baseHorizontal
                  ? (screenSize.width / 2) - screenSize.width * 0.4
                  : (screenSize.width / 2) - (screenSize.height * ratioFHD) * 0.4,
              child: IconButton(
                icon: SvgPicture.asset("assets/images/logo.svg"),
                iconSize: baseHorizontal
                    ? screenSize.width * 0.05
                    : (screenSize.height * ratioFHD) * 0.05,
                onPressed: () => Get.back(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

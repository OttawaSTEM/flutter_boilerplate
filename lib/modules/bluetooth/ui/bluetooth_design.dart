import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../../../utils/utils.dart';

class BluetoothDesignPage extends StatefulWidget {
  const BluetoothDesignPage({super.key});

  @override
  State<BluetoothDesignPage> createState() => _BluetoothDesignPage();
}

class _BluetoothDesignPage extends State<BluetoothDesignPage> {
  double currentGripperValue = 512;
  double currentGripperHeaderValue = 512;
  double currentHeadValue = 512;
  double currentArmUpperValue = 512;
  double currentArmLowerValue = 512;

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
            image: AssetImage("assets/images/robot/robot-arm.png"),
            fit: BoxFit.contain,
          ),
        ),
        child: Stack(
          children: <Widget>[
            // Gripper
            Positioned(
              left: landscapeScreen ? screenPosition('x', 0.15) : screenPosition('x', 0.35),
              top: landscapeScreen ? screenPosition('y', -0.8) : screenPosition('y', -0.8),
              child: Container(
                width: 200,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(24, 24, 24, 1),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4), //color of shadow
                      spreadRadius: 1, //spread radius
                      blurRadius: 3, // blur radius
                      offset: const Offset(1, 1), // changes position of shadow
                    ),
                    //you can set more BoxShadow() here
                  ],
                ),
              ),
            ),
            Positioned(
              left: landscapeScreen ? screenPosition('x', 0.15) : screenPosition('x', 0.35),
              top: landscapeScreen ? screenPosition('y', -0.81) : screenPosition('y', -0.81),
              child: Slider(
                value: currentGripperValue,
                min: 0,
                max: 1024,
                divisions: 1024,
                label: currentGripperValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    currentGripperValue = value;
                  });
                },
              ),
            ),
            Positioned(
              left: landscapeScreen ? screenPosition('x', 0.2) : screenPosition('x', 0.48),
              top: landscapeScreen ? screenPosition('y', -0.75) : screenPosition('y', -0.75),
              child: Text(
                'Gripper: ${currentGripperValue.round().toString()} °',
                style: const TextStyle(
                  color: Colors.white,
                  height: 3,
                  fontSize: 16,
                ),
              ),
            ),

            // Gripper Head
            Positioned(
              left: landscapeScreen ? screenPosition('x', 0.15) : screenPosition('x', 0.35),
              top: landscapeScreen ? screenPosition('y', -0.45) : screenPosition('y', -0.45),
              child: Transform.rotate(
                angle: 90 * pi / 180,
                child: Slider(
                  value: currentGripperHeaderValue,
                  min: 0,
                  max: 1024,
                  divisions: 1024,
                  label: currentGripperHeaderValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      currentGripperHeaderValue = value;
                    });
                  },
                ),
              ),
            ),
            Positioned(
              left: landscapeScreen ? screenPosition('x', 0.15) : screenPosition('x', 0.42),
              top: landscapeScreen ? screenPosition('y', -0.27) : screenPosition('y', -0.3),
              child: Text(
                'Gripper Head: ${currentGripperHeaderValue.round().toString()} °',
                style: const TextStyle(
                  color: Colors.white,
                  height: 3,
                  fontSize: 16,
                ),
              ),
            ),

            // Head
            Positioned(
              left: landscapeScreen ? screenPosition('x', 0.15) : screenPosition('x', 0.35),
              top: landscapeScreen ? screenPosition('y', 0.0) : screenPosition('y', -0.1),
              child: Slider(
                value: currentHeadValue,
                min: 0,
                max: 1024,
                divisions: 1024,
                label: currentHeadValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    currentHeadValue = value;
                  });
                },
              ),
            ),
            Positioned(
              left: landscapeScreen ? screenPosition('x', 0.21) : screenPosition('x', 0.48),
              top: landscapeScreen ? screenPosition('y', 0.05) : screenPosition('y', -0.05),
              child: Text(
                'Head: ${currentHeadValue.round().toString()} °',
                style: const TextStyle(
                  color: Colors.white,
                  height: 3,
                  fontSize: 16,
                ),
              ),
            ),

            // Upper Arm
            Positioned(
              left: landscapeScreen ? screenPosition('x', -0.52) : screenPosition('x', -0.9),
              top: landscapeScreen ? screenPosition('y', -0.2) : screenPosition('y', 0.05),
              child: Transform.rotate(
                angle: 90 * pi / 180,
                child: Slider(
                  value: currentArmUpperValue,
                  min: 0,
                  max: 1024,
                  divisions: 1024,
                  label: currentArmUpperValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      currentArmUpperValue = value;
                    });
                  },
                ),
              ),
            ),
            Positioned(
              left: landscapeScreen ? screenPosition('x', -0.5) : screenPosition('x', -0.85),
              top: landscapeScreen ? screenPosition('y', -0.0) : screenPosition('y', 0.2),
              child: Text(
                'Upper Arm: ${currentArmUpperValue.round().toString()} °',
                style: const TextStyle(
                  color: Colors.white,
                  height: 3,
                  fontSize: 16,
                ),
              ),
            ),

            // Lower Arm
            Positioned(
              left: landscapeScreen ? screenPosition('x', -0.52) : screenPosition('x', -0.9),
              top: landscapeScreen ? screenPosition('y', 0.5) : screenPosition('y', 0.65),
              child: Transform.rotate(
                angle: 90 * pi / 180,
                child: Slider(
                  value: currentArmLowerValue,
                  min: 0,
                  max: 1024,
                  divisions: 1024,
                  label: currentArmLowerValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      currentArmLowerValue = value;
                    });
                  },
                ),
              ),
            ),
            Positioned(
              left: landscapeScreen ? screenPosition('x', -0.5) : screenPosition('x', -0.85),
              top: landscapeScreen ? screenPosition('y', 0.7) : screenPosition('y', 0.8),
              child: Text(
                'Lower Arm: ${currentArmLowerValue.round().toString()} °',
                style: const TextStyle(
                  color: Colors.white,
                  height: 3,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

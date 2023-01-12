import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../../../utils/utils.dart';

class BluetoothDesignPage extends StatefulWidget {
  const BluetoothDesignPage({super.key});

  @override
  State<BluetoothDesignPage> createState() => _BluetoothDesignPage();
}

class _BluetoothDesignPage extends State<BluetoothDesignPage> {
  double gripperValue = 512;
  double gripperHeaderValue = 512;
  double headValue = 512;
  double armUpperValue = 512;
  double armLowerValue = 512;
  double baseValue = 512;

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
            // Dance
            Positioned(
              left: landscapeScreen ? screenPosition('x', -0.42) : screenPosition('x', -0.82),
              top: landscapeScreen ? screenPosition('y', -0.9) : screenPosition('y', -0.9),
              child: (ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(100, 40),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                child: const Text('Dance'),
                onPressed: () {},
              )),
            ),

            // Program 1
            Positioned(
              left: landscapeScreen ? screenPosition('x', -0.42) : screenPosition('x', -0.82),
              top: landscapeScreen ? screenPosition('y', -0.7) : screenPosition('y', -0.75),
              child: (ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(100, 40),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                child: const Text('Program 1'),
                onPressed: () {},
              )),
            ),

            // Gripper
            Positioned(
              left: landscapeScreen ? screenPosition('x', 0.17) : screenPosition('x', 0.35),
              top: landscapeScreen ? screenPosition('y', -0.82) : screenPosition('y', -0.8),
              child: Container(
                width: landscapeScreen ? screenSize.width * 0.18 : screenSize.width * 0.31,
                height: landscapeScreen ? screenSize.height * 0.05 : screenSize.height * 0.04,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(24, 24, 24, 1),
                  borderRadius: BorderRadius.circular(30),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.grey.withOpacity(0.4), //color of shadow
                  //     spreadRadius: 1, //spread radius
                  //     blurRadius: 2, // blur radius
                  //     offset: const Offset(1, 1), // changes position of shadow
                  //   ),
                  // ],
                ),
              ),
            ),
            Positioned(
              left: landscapeScreen ? screenPosition('x', 0.15) : screenPosition('x', 0.35),
              top: landscapeScreen ? screenPosition('y', -0.85) : screenPosition('y', -0.81),
              child: Slider(
                value: gripperValue,
                min: 0,
                max: 1024,
                divisions: 1024,
                label: gripperValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    gripperValue = value;
                  });
                },
              ),
            ),
            Positioned(
              left: landscapeScreen ? screenPosition('x', 0.24) : screenPosition('x', 0.46),
              top: landscapeScreen ? screenPosition('y', -0.75) : screenPosition('y', -0.75),
              child: Text(
                'Gripper: ${gripperValue.round().toString()} °',
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
              top: landscapeScreen ? screenPosition('y', -0.42) : screenPosition('y', -0.45),
              child: Transform.rotate(
                angle: 90 * pi / 180,
                child: Slider(
                  value: gripperHeaderValue,
                  min: 0,
                  max: 1024,
                  divisions: 1024,
                  label: gripperHeaderValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      gripperHeaderValue = value;
                    });
                  },
                ),
              ),
            ),
            Positioned(
              left: landscapeScreen ? screenPosition('x', 0.2) : screenPosition('x', 0.4),
              top: landscapeScreen ? screenPosition('y', -0.18) : screenPosition('y', -0.3),
              child: Text(
                'Gripper Head: ${gripperHeaderValue.round().toString()} °',
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
                value: headValue,
                min: 0,
                max: 1024,
                divisions: 1024,
                label: headValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    headValue = value;
                  });
                },
              ),
            ),
            Positioned(
              left: landscapeScreen ? screenPosition('x', 0.21) : screenPosition('x', 0.48),
              top: landscapeScreen ? screenPosition('y', 0.05) : screenPosition('y', -0.05),
              child: Text(
                'Head: ${headValue.round().toString()} °',
                style: const TextStyle(
                  color: Colors.white,
                  height: 3,
                  fontSize: 16,
                ),
              ),
            ),

            // Upper Arm
            Positioned(
              left: landscapeScreen ? screenPosition('x', -0.52) : screenPosition('x', -0.98),
              top: landscapeScreen ? screenPosition('y', -0.2) : screenPosition('y', 0.05),
              child: Transform.rotate(
                angle: 90 * pi / 180,
                child: Slider(
                  value: armUpperValue,
                  min: 0,
                  max: 1024,
                  divisions: 1024,
                  label: armUpperValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      armUpperValue = value;
                    });
                  },
                ),
              ),
            ),
            Positioned(
              left: landscapeScreen ? screenPosition('x', -0.5) : screenPosition('x', -0.85),
              top: landscapeScreen ? screenPosition('y', -0.0) : screenPosition('y', 0.25),
              child: Text(
                'Upper Arm: ${armUpperValue.round().toString()} °',
                style: const TextStyle(
                  color: Colors.white,
                  height: 3,
                  fontSize: 16,
                ),
              ),
            ),

            // Lower Arm
            Positioned(
              left: landscapeScreen ? screenPosition('x', -0.52) : screenPosition('x', -0.98),
              top: landscapeScreen ? screenPosition('y', 0.5) : screenPosition('y', 0.6),
              child: Transform.rotate(
                angle: 90 * pi / 180,
                child: Slider(
                  value: armLowerValue,
                  min: 0,
                  max: 1024,
                  divisions: 1024,
                  label: armLowerValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      armLowerValue = value;
                    });
                  },
                ),
              ),
            ),
            Positioned(
              left: landscapeScreen ? screenPosition('x', -0.5) : screenPosition('x', -0.85),
              top: landscapeScreen ? screenPosition('y', 0.7) : screenPosition('y', 0.8),
              child: Text(
                'Lower Arm: ${armLowerValue.round().toString()} °',
                style: const TextStyle(
                  color: Colors.white,
                  height: 3,
                  fontSize: 16,
                ),
              ),
            ),

            // Base
            Positioned(
              left: landscapeScreen ? screenPosition('x', -0.15) : screenPosition('x', -0.24),
              top: landscapeScreen ? screenPosition('y', 0.25) : screenPosition('y', 0.25),
              child: SleekCircularSlider(
                appearance: CircularSliderAppearance(
                  startAngle: 180,
                  angleRange: 180,
                  customWidths: CustomSliderWidths(
                    trackWidth: 4,
                    progressBarWidth: 8,
                    handlerSize: 10,
                  ),
                  customColors: CustomSliderColors(
                    dotColor: Colors.blue,
                    trackColor: Colors.blue.withOpacity(0.3),
                    progressBarColors: [
                      Colors.blue.withOpacity(1),
                      Colors.blue.withOpacity(1),
                      Colors.blue.withOpacity(1),
                    ],
                  ),
                  infoProperties: InfoProperties(
                    modifier: (double value) {
                      return '';
                    },
                  ),
                ),
                min: 0,
                max: 1024,
                initialValue: baseValue,
                onChange: (double value) {
                  setState(() {
                    baseValue = value;
                  });
                },
                innerWidget: null,
              ),
            ),
            Positioned(
              left: landscapeScreen ? screenPosition('x', -0.07) : screenPosition('x', -0.12),
              top: landscapeScreen ? screenPosition('y', 0.28) : screenPosition('y', 0.27),
              child: Text(
                'Base: ${baseValue.round().toString()} °',
                style: const TextStyle(
                  color: Colors.white,
                  height: 3,
                  fontSize: 16,
                ),
              ),
            ),

            // Initial Position
            Positioned(
              left: landscapeScreen ? screenPosition('x', 0.25) : screenPosition('x', 0.5),
              top: landscapeScreen ? screenPosition('y', 0.5) : screenPosition('y', 0.65),
              child: (ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(100, 40),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                child: const Text('Initial'),
                onPressed: () {},
              )),
            ),

            // Settings
            Positioned(
              left: landscapeScreen ? screenPosition('x', 0.25) : screenPosition('x', 0.5),
              top: landscapeScreen ? screenPosition('y', 0.7) : screenPosition('y', 0.8),
              child: (ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(100, 40),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                child: const Text('Settings'),
                onPressed: () {},
              )),
            ),
          ],
        ),
      ),
    );
  }
}

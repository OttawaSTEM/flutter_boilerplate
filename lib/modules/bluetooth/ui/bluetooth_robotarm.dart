import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../../../utils/utils.dart';

class Message {
  int whom;
  String text;

  Message(this.whom, this.text);
}

class BluetoothRobotArmPage extends StatefulWidget {
  final BluetoothDevice btDevice;
  const BluetoothRobotArmPage({super.key, required this.btDevice});

  @override
  State<BluetoothRobotArmPage> createState() => _BluetoothRobotArmPage();
}

class _BluetoothRobotArmPage extends State<BluetoothRobotArmPage> {
  static const clientID = 0;
  BluetoothConnection? connection;

  List<Message> messages = List<Message>.empty(growable: true);

  bool isConnecting = true;
  bool get isConnected => (connection?.isConnected ?? false);

  bool isDisconnecting = false;

  double gripperValue = 512;
  double gripperHeaderValue = 512;
  double headValue = 512;
  double armValue = 512;
  double waistValue = 512;
  double baseValue = 512;

  @override
  void initState() {
    super.initState();

    BluetoothConnection.toAddress(widget.btDevice.address).then((btConnection) {
      snackbarMsg(
        title: 'Connected to the Bluetooth device ${widget.btDevice.name}',
        message: 'Succeed!',
        icon: const Icon(
          Icons.check_circle_outline,
          color: Colors.green,
          size: 40,
        ),
      );
      connection = btConnection;
      setState(() {
        isConnecting = false;
        isDisconnecting = false;
      });

      connection!.input!.listen(onDataReceived).onDone(() {
        // Example: Detect which side closed the connection
        // There should be `isDisconnecting` flag to show are we are (locally)
        // in middle of disconnecting process, should be set before calling
        // `dispose`, `finish` or `close`, which all causes to disconnect.
        // If we except the disconnection, `onDone` should be fired as result.
        // If we didn't except this (no flag set), it means closing by remote.
        if (isDisconnecting) {
          snackbarMsg(
            title: 'Bluetooth Device ${widget.btDevice.name}',
            message: 'Disconnected locally!',
            icon: const Icon(
              Icons.error_outline_outlined,
              color: Colors.red,
              size: 40,
            ),
          );
        } else {
          snackbarMsg(
            title: 'Bluetooth Device ${widget.btDevice.name}',
            message: 'Disconnected remotely!',
            icon: const Icon(
              Icons.error_outline_outlined,
              color: Colors.red,
              size: 40,
            ),
          );
        }
        if (mounted) {
          setState(() {});
        }
      });
    }).catchError((error) {
      snackbarMsg(
        title: 'Cannot connect to Bluetooth Device ${widget.btDevice.name}',
        message: error,
        icon: const Icon(
          Icons.error_outline_outlined,
          color: Colors.red,
          size: 40,
        ),
      );
    });
  }

  @override
  void dispose() {
    // Avoid memory leak (`setState` after dispose) and disconnect
    if (isConnected) {
      isDisconnecting = true;
      connection?.dispose();
      connection = null;
    }

    super.dispose();
  }

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
              left: landscapeScreen
                  ? screenPosition('x', -0.42)
                  : screenPosition('x', -0.82),
              top: landscapeScreen
                  ? screenPosition('y', -0.9)
                  : screenPosition('y', -0.9),
              child: (ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(100, 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                onPressed: isConnected ? () => sendMessage('Dance') : null,
                child: const Text('Dance'),
              )),
            ),

            // Program 1
            Positioned(
              left: landscapeScreen
                  ? screenPosition('x', -0.42)
                  : screenPosition('x', -0.82),
              top: landscapeScreen
                  ? screenPosition('y', -0.7)
                  : screenPosition('y', -0.75),
              child: (ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(100, 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                onPressed: isConnected ? () => sendMessage('Program 1') : null,
                child: const Text('Program 1'),
              )),
            ),

            // Gripper
            Positioned(
              left: landscapeScreen
                  ? screenPosition('x', 0.17)
                  : screenPosition('x', 0.35),
              top: landscapeScreen
                  ? screenPosition('y', -0.82)
                  : screenPosition('y', -0.8),
              child: Container(
                width: landscapeScreen
                    ? screenSize.width * 0.18
                    : screenSize.width * 0.31,
                height: landscapeScreen
                    ? screenSize.height * 0.05
                    : screenSize.height * 0.04,
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
              left: landscapeScreen
                  ? screenPosition('x', 0.15)
                  : screenPosition('x', 0.35),
              top: landscapeScreen
                  ? screenPosition('y', -0.85)
                  : screenPosition('y', -0.81),
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
                  isConnected ? () => sendMessage('gripper:$value') : null;
                },
              ),
            ),
            Positioned(
              left: landscapeScreen
                  ? screenPosition('x', 0.24)
                  : screenPosition('x', 0.46),
              top: landscapeScreen
                  ? screenPosition('y', -0.75)
                  : screenPosition('y', -0.75),
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
              left: landscapeScreen
                  ? screenPosition('x', 0.15)
                  : screenPosition('x', 0.35),
              top: landscapeScreen
                  ? screenPosition('y', -0.42)
                  : screenPosition('y', -0.45),
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
                    isConnected
                        ? () => sendMessage('gripper_header:$value')
                        : null;
                  },
                ),
              ),
            ),
            Positioned(
              left: landscapeScreen
                  ? screenPosition('x', 0.2)
                  : screenPosition('x', 0.4),
              top: landscapeScreen
                  ? screenPosition('y', -0.18)
                  : screenPosition('y', -0.3),
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
              left: landscapeScreen
                  ? screenPosition('x', 0.15)
                  : screenPosition('x', 0.35),
              top: landscapeScreen
                  ? screenPosition('y', 0.0)
                  : screenPosition('y', -0.1),
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
                  isConnected ? () => sendMessage('header:$value') : null;
                },
              ),
            ),
            Positioned(
              left: landscapeScreen
                  ? screenPosition('x', 0.21)
                  : screenPosition('x', 0.48),
              top: landscapeScreen
                  ? screenPosition('y', 0.05)
                  : screenPosition('y', -0.05),
              child: Text(
                'Head: ${headValue.round().toString()} °',
                style: const TextStyle(
                  color: Colors.white,
                  height: 3,
                  fontSize: 16,
                ),
              ),
            ),

            // Arm
            Positioned(
              left: landscapeScreen
                  ? screenPosition('x', -0.52)
                  : screenPosition('x', -0.98),
              top: landscapeScreen
                  ? screenPosition('y', -0.2)
                  : screenPosition('y', 0.05),
              child: Transform.rotate(
                angle: 90 * pi / 180,
                child: Slider(
                  value: armValue,
                  min: 0,
                  max: 1024,
                  divisions: 1024,
                  label: armValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      armValue = value;
                    });
                    isConnected ? () => sendMessage('arm_upper:$value') : null;
                  },
                ),
              ),
            ),
            Positioned(
              left: landscapeScreen
                  ? screenPosition('x', -0.5)
                  : screenPosition('x', -0.85),
              top: landscapeScreen
                  ? screenPosition('y', -0.0)
                  : screenPosition('y', 0.25),
              child: Text(
                'Arm: ${armValue.round().toString()} °',
                style: const TextStyle(
                  color: Colors.white,
                  height: 3,
                  fontSize: 16,
                ),
              ),
            ),

            // Waist
            Positioned(
              left: landscapeScreen
                  ? screenPosition('x', -0.52)
                  : screenPosition('x', -0.98),
              top: landscapeScreen
                  ? screenPosition('y', 0.5)
                  : screenPosition('y', 0.6),
              child: Transform.rotate(
                angle: 90 * pi / 180,
                child: Slider(
                  value: waistValue,
                  min: 0,
                  max: 1024,
                  divisions: 1024,
                  label: waistValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      waistValue = value;
                    });
                    isConnected ? () => sendMessage('arm_lower:$value') : null;
                  },
                ),
              ),
            ),
            Positioned(
              left: landscapeScreen
                  ? screenPosition('x', -0.5)
                  : screenPosition('x', -0.85),
              top: landscapeScreen
                  ? screenPosition('y', 0.7)
                  : screenPosition('y', 0.8),
              child: Text(
                'Waist: ${waistValue.round().toString()} °',
                style: const TextStyle(
                  color: Colors.white,
                  height: 3,
                  fontSize: 16,
                ),
              ),
            ),

            // Base
            Positioned(
              left: landscapeScreen
                  ? screenPosition('x', -0.15)
                  : screenPosition('x', -0.24),
              top: landscapeScreen
                  ? screenPosition('y', 0.25)
                  : screenPosition('y', 0.25),
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
                  isConnected ? () => sendMessage('base:$value') : null;
                },
                innerWidget: null,
              ),
            ),
            Positioned(
              left: landscapeScreen
                  ? screenPosition('x', -0.07)
                  : screenPosition('x', -0.12),
              top: landscapeScreen
                  ? screenPosition('y', 0.28)
                  : screenPosition('y', 0.27),
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
              left: landscapeScreen
                  ? screenPosition('x', 0.25)
                  : screenPosition('x', 0.5),
              top: landscapeScreen
                  ? screenPosition('y', 0.5)
                  : screenPosition('y', 0.65),
              child: (ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(100, 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                child: const Text('Initial'),
                onPressed: () {},
              )),
            ),

            // Settings
            Positioned(
              left: landscapeScreen
                  ? screenPosition('x', 0.25)
                  : screenPosition('x', 0.5),
              top: landscapeScreen
                  ? screenPosition('y', 0.7)
                  : screenPosition('y', 0.8),
              child: (ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(100, 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                child: const Text('Settings'),
                onPressed: () {},
              )),
            ),
          ],
        ),
      ),
    );
  }

  void onDataReceived(Uint8List data) {
    // Allocate buffer for parsed data
    int backspacesCounter = 0;
    for (var byte in data) {
      if (byte == 8 || byte == 127) {
        backspacesCounter++;
      }
    }
    Uint8List buffer = Uint8List(data.length - backspacesCounter);
    int bufferIndex = buffer.length;

    // Apply backspace control character
    backspacesCounter = 0;
    for (int i = data.length - 1; i >= 0; i--) {
      if (data[i] == 8 || data[i] == 127) {
        backspacesCounter++;
      } else {
        if (backspacesCounter > 0) {
          backspacesCounter--;
        } else {
          buffer[--bufferIndex] = data[i];
        }
      }
    }

    // Create message if there is new line character
    // String dataString = String.fromCharCodes(buffer);
  }

  void sendMessage(String text) async {
    text = text.trim();
    if (text.isNotEmpty) {
      try {
        connection!.output.add(Uint8List.fromList(utf8.encode("$text\n")));
        await connection!.output.allSent;

        setState(() {
          messages.add(Message(clientID, text));
        });
      } catch (error) {
        // Ignore error, but notify state
        setState(() {});
        snackbarMsg(
          title: 'Cannot connect to Bluetooth Device ${widget.btDevice.name}',
          message: error.toString(),
          icon: const Icon(
            Icons.error_outline_outlined,
            color: Colors.red,
            size: 40,
          ),
        );
      }
    }
  }
}

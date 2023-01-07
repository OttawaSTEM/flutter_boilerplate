import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:get_storage/get_storage.dart';

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

  double currentGripperValue = 512;
  double currentGripperHeaderValue = 512;
  double currentHeadValue = 512;
  double currentArmUpperValue = 512;
  double currentArmLowerValue = 512;

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
            // Gripper
            Positioned(
              left: landscapeScreen ? screenPosition('x', 0.15) : screenPosition('x', 0.35),
              top: landscapeScreen ? screenPosition('y', -0.8) : screenPosition('y', -0.8),
              child: Container(
                width: 190,
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
              left: landscapeScreen ? screenPosition('x', 0.2) : screenPosition('x', 0.46),
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
              left: landscapeScreen ? screenPosition('x', 0.15) : screenPosition('x', 0.4),
              top: landscapeScreen ? screenPosition('y', -0.27) : screenPosition('y', -0.32),
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

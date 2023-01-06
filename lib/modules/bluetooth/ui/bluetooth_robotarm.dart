import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

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
    var ratioFHD = 1.78;
    var baseHorizontal = ((screenSize.width / screenSize.height) > ratioFHD) ? false : true;
    var screenHalfHeight = screenSize.height / 2;
    var screenHalfWidth = screenSize.width / 2;

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
              top: baseHorizontal
                  ? screenHalfHeight - (screenSize.width / ratioFHD) * 0.45
                  : screenHalfHeight - screenSize.height * 0.45,
              left: baseHorizontal
                  ? screenHalfWidth + screenSize.width * 0.1
                  : screenHalfWidth + (screenSize.height * ratioFHD) * 0.1,
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
              top: baseHorizontal
                  ? screenHalfHeight - (screenSize.width / ratioFHD) * 0.42
                  : screenHalfHeight - screenSize.height * 0.42,
              left: baseHorizontal
                  ? screenHalfWidth + screenSize.width * 0.12
                  : screenHalfWidth + (screenSize.height * ratioFHD) * 0.12,
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
              top: baseHorizontal
                  ? screenHalfHeight - (screenSize.width / ratioFHD) * 0.22
                  : screenHalfHeight - screenSize.height * 0.22,
              left: baseHorizontal
                  ? screenHalfWidth + screenSize.width * 0.1
                  : screenHalfWidth + (screenSize.height * ratioFHD) * 0.1,
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
              top: baseHorizontal
                  ? screenHalfHeight - (screenSize.width / ratioFHD) * 0.12
                  : screenHalfHeight - screenSize.height * 0.12,
              left: baseHorizontal
                  ? screenHalfWidth + screenSize.width * 0.11
                  : screenHalfWidth + (screenSize.height * ratioFHD) * 0.11,
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
              top: baseHorizontal
                  ? screenHalfHeight + (screenSize.width / ratioFHD) * 0.02
                  : screenHalfHeight + screenSize.height * 0.02,
              left: baseHorizontal
                  ? screenHalfWidth + screenSize.width * 0.1
                  : screenHalfWidth + (screenSize.height * ratioFHD) * 0.1,
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
              top: baseHorizontal
                  ? screenHalfHeight + (screenSize.width / ratioFHD) * 0.05
                  : screenHalfHeight + screenSize.height * 0.05,
              left: baseHorizontal
                  ? screenHalfWidth + screenSize.width * 0.13
                  : screenHalfWidth + (screenSize.height * ratioFHD) * 0.13,
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
              top: baseHorizontal
                  ? screenHalfHeight + (screenSize.width / ratioFHD) * 0.0
                  : screenHalfHeight + screenSize.height * 0.0,
              left: baseHorizontal
                  ? screenHalfWidth - screenSize.width * 0.25
                  : screenHalfWidth - (screenSize.height * ratioFHD) * 0.25,
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
              top: baseHorizontal
                  ? screenHalfHeight + (screenSize.width / ratioFHD) * 0.1
                  : screenHalfHeight + screenSize.height * 0.1,
              left: baseHorizontal
                  ? screenHalfWidth - screenSize.width * 0.23
                  : screenHalfWidth - (screenSize.height * ratioFHD) * 0.23,
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
              top: baseHorizontal
                  ? screenHalfHeight + (screenSize.width / ratioFHD) * 0.3
                  : screenHalfHeight + screenSize.height * 0.3,
              left: baseHorizontal
                  ? screenHalfWidth - screenSize.width * 0.25
                  : screenHalfWidth - (screenSize.height * ratioFHD) * 0.25,
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
              top: baseHorizontal
                  ? screenHalfHeight + (screenSize.width / ratioFHD) * 0.4
                  : screenHalfHeight + screenSize.height * 0.4,
              left: baseHorizontal
                  ? screenHalfWidth - screenSize.width * 0.23
                  : screenHalfWidth - (screenSize.height * ratioFHD) * 0.23,
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

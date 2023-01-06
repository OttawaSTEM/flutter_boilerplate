import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

import '../../../utils/utils.dart';

class Message {
  int whom;
  String text;

  Message(this.whom, this.text);
}

class BluetoothControlPage extends StatefulWidget {
  final BluetoothDevice btDevice;
  const BluetoothControlPage({super.key, required this.btDevice});

  @override
  State<BluetoothControlPage> createState() => _BluetoothControlPage();
}

class _BluetoothControlPage extends State<BluetoothControlPage> {
  static const clientID = 0;
  BluetoothConnection? connection;

  List<Message> messages = List<Message>.empty(growable: true);

  bool isConnecting = true;
  bool get isConnected => (connection?.isConnected ?? false);

  bool isDisconnecting = false;

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
    final serverName = widget.btDevice.name ?? "Unknown";
    return Scaffold(
      appBar: AppBar(
          title: (isConnecting
              ? Text('Connecting chat to $serverName...')
              : isConnected
                  ? Text(serverName)
                  : Text('Bluetooth device $serverName is not connected!'))),
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: isConnected ? () => sendMessage('LED OFF') : null,
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(120, 50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
                child: const Text('LED OFF'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: isConnected ? () => sendMessage('LED 50%') : null,
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(120, 50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
                child: const Text('LED 25%'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: isConnected ? () => sendMessage('LED 50%') : null,
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(120, 50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
                child: const Text('LED 50%'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: isConnected ? () => sendMessage('LED 50%') : null,
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(120, 50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
                child: const Text('LED 75%'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: isConnected ? () => sendMessage('LED ON') : null,
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(120, 50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
                child: const Text('LED ON'),
              ),
            ],
          ),
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

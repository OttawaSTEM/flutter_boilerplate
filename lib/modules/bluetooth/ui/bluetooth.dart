import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:get/get.dart';

import '../controller/bluetooth_devices.dart';
// import '../ui/bluetooth_chat.dart';
// import '../ui/bluetooth_control.dart';
import '../ui/bluetooth_robotarm.dart';
// import '../ui/bluetooth_design.dart';

enum DeviceAvailability {
  no,
  maybe,
  yes,
}

class DeviceWithAvailability {
  BluetoothDevice device;
  DeviceAvailability availability;
  int? rssi;

  DeviceWithAvailability(this.device, this.availability, [this.rssi]);
}

class BluetoothPage extends StatefulWidget {
  /// If true, on page start there is performed discovery upon the bonded devices.
  /// Then, if they are not avaliable, they would be disabled from the selection.
  final String title;
  final bool checkAvailability;
  const BluetoothPage(
      {super.key, required this.title, this.checkAvailability = true});

  @override
  State<BluetoothPage> createState() => _BluetoothPage();
}

class _BluetoothPage extends State<BluetoothPage> {
  BluetoothState bluetoothState = BluetoothState.UNKNOWN;
  List<DeviceWithAvailability> devices =
      List<DeviceWithAvailability>.empty(growable: true);

  Timer? discoverableTimeoutTimer;
  int discoverableTimeoutSecondsLeft = 0;

  StreamSubscription<BluetoothDiscoveryResult>? discoveryStreamSubscription;
  bool isDiscovering = false;

  @override
  void initState() {
    super.initState();

    isDiscovering = widget.checkAvailability;

    if (isDiscovering) {
      startDiscovery();
    }

    // Setup a list of the bonded devices
    FlutterBluetoothSerial.instance
        .getBondedDevices()
        .then((List<BluetoothDevice> bondedDevices) {
      setState(() {
        devices = bondedDevices
            .map(
              (device) => DeviceWithAvailability(
                device,
                widget.checkAvailability
                    ? DeviceAvailability.maybe
                    : DeviceAvailability.yes,
              ),
            )
            .toList();
      });
    });

    // Get current state
    FlutterBluetoothSerial.instance.state.then((state) {
      setState(() {
        bluetoothState = state;
      });
    });

    // Listen for futher state changes
    FlutterBluetoothSerial.instance
        .onStateChanged()
        .listen((BluetoothState state) {
      setState(() {
        bluetoothState = state;

        // Discoverable mode is disabled when Bluetooth gets disabled
        discoverableTimeoutTimer = null;
        discoverableTimeoutSecondsLeft = 0;
      });
    });
  }

  void restartDiscovery() {
    setState(() {
      isDiscovering = true;
    });

    startDiscovery();
  }

  void startDiscovery() {
    discoveryStreamSubscription =
        FlutterBluetoothSerial.instance.startDiscovery().listen((r) {
      setState(() {
        Iterator i = devices.iterator;
        while (i.moveNext()) {
          var btDevice = i.current;
          if (btDevice.device == r.device) {
            btDevice.availability = DeviceAvailability.yes;
            btDevice.rssi = r.rssi;
          }
        }
      });
    });

    discoveryStreamSubscription?.onDone(() {
      setState(() {
        isDiscovering = false;
      });
    });
  }

  @override
  void dispose() {
    discoverableTimeoutTimer?.cancel();
    discoveryStreamSubscription?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<BluetoothDeviceList> list = devices
        .map((btDevice) => BluetoothDeviceList(
              device: btDevice.device,
              rssi: btDevice.rssi,
              enabled: btDevice.availability == DeviceAvailability.yes,
              onTap: () {
                // Future.delayed(const Duration(milliseconds: 300), () {
                //   Get.to(() => BluetoothChatPage(btDevice: btDevice.device));
                // });
                // Future.delayed(const Duration(milliseconds: 300), () {
                //   Get.to(() => BluetoothControlPage(btDevice: btDevice.device));
                // });
                Future.delayed(const Duration(milliseconds: 300), () {
                  Get.to(
                      () => BluetoothRobotArmPage(btDevice: btDevice.device));
                });
              },
            ))
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          isDiscovering
              ? FittedBox(
                  child: Container(
                    margin: const EdgeInsets.all(16.0),
                    child: const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.white,
                      ),
                    ),
                  ),
                )
              : IconButton(
                  icon: const Icon(Icons.replay),
                  onPressed: restartDiscovery,
                )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 10),
            SwitchListTile(
              title: const Text('Enable Bluetooth'),
              value: bluetoothState.isEnabled,
              onChanged: (bool value) {
                // Do the request and update with the true value then
                future() async {
                  // async lambda seems to not working
                  if (value) {
                    await FlutterBluetoothSerial.instance.requestEnable();
                  } else {
                    await FlutterBluetoothSerial.instance.requestDisable();
                  }
                }

                future().then((_) {
                  setState(() {});
                });
              },
            ),
            const Divider(),
            const ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.bluetooth,
                  color: Colors.white,
                ),
              ),
              title: Text('Choose Bluetooth device to connect'),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: list.length,
              itemBuilder: (context, index) {
                return Card(
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    child: list[index],
                  ),
                );
              },
            ),
            // const SizedBox(height: 50),
            // ElevatedButton(
            //   style: ElevatedButton.styleFrom(
            //       minimumSize: const Size(120, 50),
            //       shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(10))),
            //   child: const Text('UI Design Page'),
            //   onPressed: () {
            //     Get.to(() => const BluetoothDesignPage());
            //   },
            // )
          ],
        ),
      ),
    );
  }
}

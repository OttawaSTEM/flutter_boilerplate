import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

import '../controller/BluetoothDeviceListEntry.dart';

enum _DeviceAvailability {
  no,
  maybe,
  yes,
}

class _DeviceWithAvailability {
  BluetoothDevice device;
  _DeviceAvailability availability;
  int? rssi;

  _DeviceWithAvailability(this.device, this.availability, [this.rssi]);
}

class BluetoothPage extends StatefulWidget {
  /// If true, on page start there is performed discovery upon the bonded devices.
  /// Then, if they are not avaliable, they would be disabled from the selection.
  final String title;
  final bool checkAvailability;
  const BluetoothPage({super.key, required this.title, this.checkAvailability = true});

  @override
  State<BluetoothPage> createState() => _BluetoothPage();
}

class _BluetoothPage extends State<BluetoothPage> {
  BluetoothState bluetoothState = BluetoothState.UNKNOWN;
  List<_DeviceWithAvailability> devices = List<_DeviceWithAvailability>.empty(growable: true);

  Timer? discoverableTimeoutTimer;
  int discoverableTimeoutSecondsLeft = 0;

  // Availability
  StreamSubscription<BluetoothDiscoveryResult>? discoveryStreamSubscription;
  bool isDiscovering = false;

  _BluetoothPage();

  @override
  void initState() {
    super.initState();

    isDiscovering = widget.checkAvailability;

    if (isDiscovering) {
      _startDiscovery();
    }

    // Setup a list of the bonded devices
    FlutterBluetoothSerial.instance.getBondedDevices().then((List<BluetoothDevice> bondedDevices) {
      setState(() {
        devices = bondedDevices
            .map(
              (device) => _DeviceWithAvailability(
                device,
                widget.checkAvailability ? _DeviceAvailability.maybe : _DeviceAvailability.yes,
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
    FlutterBluetoothSerial.instance.onStateChanged().listen((BluetoothState state) {
      setState(() {
        bluetoothState = state;

        // Discoverable mode is disabled when Bluetooth gets disabled
        discoverableTimeoutTimer = null;
        discoverableTimeoutSecondsLeft = 0;
      });
    });
  }

  void _restartDiscovery() {
    setState(() {
      isDiscovering = true;
    });

    _startDiscovery();
  }

  void _startDiscovery() {
    discoveryStreamSubscription = FlutterBluetoothSerial.instance.startDiscovery().listen((r) {
      setState(() {
        Iterator i = devices.iterator;
        while (i.moveNext()) {
          var btDevice = i.current;
          if (btDevice.device == r.device) {
            btDevice.availability = _DeviceAvailability.yes;
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
    List<BluetoothDeviceListEntry> list = devices
        .map((btDevice) => BluetoothDeviceListEntry(
              device: btDevice.device,
              rssi: btDevice.rssi,
              enabled: btDevice.availability == _DeviceAvailability.yes,
              onTap: () {
                Navigator.of(context).pop(btDevice.device);
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
                  onPressed: _restartDiscovery,
                )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
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
            ListView(
              shrinkWrap: true,
              children: list,
            ),
          ],
        ),
      ),
    );
  }
}

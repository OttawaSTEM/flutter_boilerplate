import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:get/get.dart';

class BluetoothPage extends StatelessWidget {
  final String title;
  const BluetoothPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Column(
        children: [
          SizedBox(
            height: 40,
            child: (Center(
              child: (ElevatedButton(
                child: const Text('Bluetooth 0'),
                onPressed: () {
                  Get.toNamed("/Bluetooth");
                },
              )),
            )),
          ),
          SizedBox(
            height: 40,
            child: (Center(
              child: (ElevatedButton(
                child: const Text('Users Page'),
                onPressed: () {
                  Get.toNamed("/users");
                },
              )),
            )),
          ),
          SizedBox(
            height: 40,
            child: (Center(
              child: (ElevatedButton(
                child: const Text('Dashboard Page'),
                onPressed: () {
                  Get.toNamed("/dashboard");
                },
              )),
            )),
          ),
          SizedBox(
            height: 40,
            child: (Center(
              child: (ElevatedButton(
                child: const Text('Bluetooth Page'),
                onPressed: () {
                  Get.toNamed("/bluetooth");
                },
              )),
            )),
          ),
        ],
      ),
    );
  }
}

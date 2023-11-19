import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  final String platform;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.platform,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Text("Press the below button to follow me on $platform"),
          ElevatedButton(
            // style: OutlinedButton.styleFrom(foregroundColor: Colors.green),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Pressed Follow on $platform button"),
                  duration: const Duration(seconds: 5),
                ),
              );
              onPressed();
            },
            child: Text(
              "Follow on $platform".tr,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

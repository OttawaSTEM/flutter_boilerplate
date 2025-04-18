import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Text("Press the below button to follow me on $title"),
          ElevatedButton(
            // style: OutlinedButton.styleFrom(foregroundColor: Colors.green),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Pressed Follow on $title button"),
                  duration: const Duration(seconds: 3),
                ),
              );
              onPressed();
            },
            child: Text(
              "Follow on $title".tr,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/constants/sizes.dart';

ButtonStyle defaultElevatedButtonStyle(BuildContext context) {
  return ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusCircularSize)),
    foregroundColor: Theme.of(context).colorScheme.onPrimary,
    backgroundColor: Theme.of(context).colorScheme.primary,
  );
}

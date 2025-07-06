import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
    required this.title,
    this.backgroundColor,
    this.actions = const [],
    this.fontSize = 20,
  });

  final String title;
  final Color? backgroundColor;
  final List<Widget> actions;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: fontSize,
        ),
      ),
      backgroundColor: backgroundColor ?? Theme.of(context).colorScheme.secondary,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          'assets/images/core/logo.svg',
          height: screenSize.height * 0.1,
        ),
        const SizedBox(height: 20),
        Text('Flutter Project', style: Theme.of(context).textTheme.headlineSmall),
        Text('Ottawa STEM Club', style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: 30),
      ],
    );
  }
}

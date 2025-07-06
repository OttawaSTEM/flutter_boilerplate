import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

class SignInHeader extends StatelessWidget {
  const SignInHeader({super.key});

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
        // Image.asset(
        //   'assets/images/core/logo.png',
        //   height: screenSize.height * 0.1,
        // ),
        const SizedBox(height: 20),
        Text('flutter_boilerplate', style: Theme.of(context).textTheme.headlineSmall),
        // Text('flutter_boilerplate', style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: 30),
      ],
    );
  }
}

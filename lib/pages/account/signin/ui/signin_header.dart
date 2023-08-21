import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

class SigninHeader extends StatelessWidget {
  final Size screenSize;
  const SigninHeader({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        Text('Ottawa STEM Club', style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(height: 30),
      ],
    );
  }
}

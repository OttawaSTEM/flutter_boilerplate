import 'package:flutter/material.dart';

import 'package:flutter_boilerplate/constants/assets.dart';
import 'package:flutter_boilerplate/constants/strings.dart';

class LoginHeader extends StatelessWidget {
  final Size screenSize;
  const LoginHeader({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: const AssetImage(appLogo),
          height: screenSize.height * 0.1,
        ),
        Text(appName, style: Theme.of(context).textTheme.headline5),
        Text(appName, style: Theme.of(context).textTheme.bodyText1),
        const SizedBox(height: 30),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import 'package:flutter_boilerplate/constants/assets.dart';
import 'package:flutter_boilerplate/constants/strings.dart';

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
        Image(
          image: const AssetImage(appLogo),
          height: screenSize.height * 0.1,
        ),
        const SizedBox(height: 20),
        Text(txtAppName, style: Theme.of(context).textTheme.headline5),
        Text(txtAppName, style: Theme.of(context).textTheme.bodyText1),
        const SizedBox(height: 30),
      ],
    );
  }
}

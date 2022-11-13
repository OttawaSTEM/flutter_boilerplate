import 'package:flutter/material.dart';

import 'package:flutter_boilerplate/constants/assets.dart';
import 'package:flutter_boilerplate/constants/strings.dart';

class LoginSocial extends StatelessWidget {
  const LoginSocial({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          txtOR,
          style: TextStyle(height: 2, fontSize: 16),
        ),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            icon: const Image(
              image: AssetImage(googleLogo),
              width: 20,
            ),
            onPressed: () {},
            label: const Text(txtSigninGoogle),
          ),
        ),
        const SizedBox(height: 20),
        TextButton(
          onPressed: () {},
          child: Text.rich(
            TextSpan(
                text: txtNoAccount,
                style: Theme.of(context).textTheme.bodyText1,
                children: const [
                  TextSpan(
                    text: txtSignUp,
                    style: TextStyle(color: Colors.blue),
                  ),
                ]),
          ),
        ),
      ],
    );
  }
}

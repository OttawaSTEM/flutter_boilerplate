import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/assets.dart';
import '../../../constants/strings.dart';

import '../controller/auth_controller.dart';

class SigninSocial extends StatelessWidget {
  const SigninSocial({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          txtOR,
          style: TextStyle(height: 3, fontSize: 16),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: OutlinedButton.icon(
            icon: const Image(
              image: AssetImage(googleLogo),
              width: 20,
            ),
            onPressed: () {
              authController.googleSignIn();
            },
            label: const Text(txtSigninGoogle),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text.rich(
            TextSpan(
                text: txtNoAccount,
                style: Theme.of(context).textTheme.bodySmall,
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

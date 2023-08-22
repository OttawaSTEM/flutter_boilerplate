import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

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
        Text(
          'OR'.tr,
          style: const TextStyle(height: 3, fontSize: 16),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: OutlinedButton.icon(
            // icon: SvgPicture.asset('assets/images/core/google-logo.svg'),
            icon: const Image(
              image: AssetImage('assets/images/core/google-logo.png'),
              width: 20,
            ),
            onPressed: () {
              authController.googleSignIn();
            },
            label: Text('Login with Google'.tr),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text.rich(
            TextSpan(text: 'Don\'t have an account? '.tr, style: Theme.of(context).textTheme.bodySmall, children: [
              TextSpan(
                text: 'Sign up'.tr,
                style: const TextStyle(color: Colors.blue),
              ),
            ]),
          ),
        ),
      ],
    );
  }
}

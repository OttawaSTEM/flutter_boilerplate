import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:flutter_boilerplate/constants/styles.dart';
import 'package:flutter_boilerplate/pages/account/signin/ui/signup.dart';
import 'package:flutter_boilerplate/pages/account/signin/controller/auth_controller.dart';

class SignInSocial extends StatelessWidget {
  const SignInSocial({super.key});

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
          child: ElevatedButton.icon(
            // icon: SvgPicture.asset('assets/images/core/google.svg'),
            icon: Image.asset('assets/images/core/google.png', height: 24, width: 24),
            style: defaultElevatedButtonStyle(context),
            onPressed: () {
              authController.googleSignIn();
            },
            label: Text('Sign In with Google'.tr),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            child: Text.rich(
              TextSpan(
                text: 'Don\'t have an account? '.tr,
                style: Theme.of(context).textTheme.bodyMedium,
                children: [
                  TextSpan(
                    text: 'Sign up'.tr,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            onPressed: () {
              Get.to(() => const SignupPage());
            },
          ),
        ),
      ],
    );
  }
}

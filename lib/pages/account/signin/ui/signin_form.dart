import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_boilerplate/constants/sizes.dart';
import 'package:flutter_boilerplate/pages/account/signin/ui/password_reset.dart';
import 'package:flutter_boilerplate/pages/account/signin/controller/auth_controller.dart';

class ObscuredSignInController extends GetxController {
  RxBool isObscured = true.obs;
}

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    final ObscuredSignInController obscuredSignInController = Get.put(ObscuredSignInController());
    final AuthController authController = Get.put(AuthController());
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();
    final formGlobalKey = GlobalKey<FormState>();

    return Form(
      key: formGlobalKey,
      child: Obx(
        () => Column(
          children: [
            TextFormField(
              controller: usernameController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.mail),
                labelText: 'Email'.tr,
                hintText: 'Email'.tr,
                border: const OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your valid email.'.tr;
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: passwordController,
              obscureText: obscuredSignInController.isObscured.value,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.password),
                labelText: 'Password'.tr,
                hintText: 'Password'.tr,
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: obscuredSignInController.isObscured.value ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                  onPressed: () {
                    obscuredSignInController.isObscured.value = !obscuredSignInController.isObscured.value;
                  },
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password.'.tr;
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                child: Text('Forgot Password?'.tr),
                onPressed: () {
                  Get.to(() => const PasswordResetPage());
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (formGlobalKey.currentState!.validate()) {
                    // authController.signIn(
                    //   username: usernameController.text,
                    //   password: passwordController.text,
                    // );
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusCircularSize)),
                  backgroundColor: Theme.of(context).colorScheme.primary, // background
                  foregroundColor: Theme.of(context).colorScheme.secondary, // foreground
                ),
                child: Text(
                  'Sign In'.tr,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

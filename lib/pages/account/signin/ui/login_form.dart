import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ui/password_reset.dart';
import '../controller/auth_controller.dart';

class ObscuredController extends GetxController {
  RxBool isObscured = true.obs;
}

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ObscuredController obscuredController = Get.put(ObscuredController());
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
                  return 'Please enter your Email.'.tr;
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: passwordController,
              obscureText: obscuredController.isObscured.value,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.password),
                labelText: 'Password'.tr,
                hintText: 'Password'.tr,
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: obscuredController.isObscured.value ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                  onPressed: () {
                    obscuredController.isObscured.value = !obscuredController.isObscured.value;
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
                    authController.userLogin(
                      username: usernameController.text,
                      password: passwordController.text,
                    );
                  }
                },
                child: Text(
                  'Login'.tr,
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

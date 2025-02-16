import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../../widgets/snack_bar_msg.dart';
import '../../../../utils/utils.dart';
import '../controller/auth_controller.dart';
import 'login_header.dart';

var logger = Logger();

class ObscuredSignupController extends GetxController {
  RxBool isObscuredPassword1 = true.obs;
  RxBool isObscuredPassword2 = true.obs;
}

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ObscuredSignupController obscuredSignupController = Get.put(ObscuredSignupController());
    final AuthController authController = Get.put(AuthController());
    final emailController = TextEditingController();
    final usernameController = TextEditingController();
    final password1Controller = TextEditingController();
    final password2Controller = TextEditingController();
    final formGlobalKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(title: Text('Sign up'.tr)),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              const LoginHeader(),
              Form(
                key: formGlobalKey,
                child: Obx(
                  () => Column(
                    children: [
                      TextFormField(
                        controller: usernameController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.person),
                          labelText: 'Username'.tr,
                          hintText: 'Username'.tr,
                          border: const OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your username.'.tr;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.mail),
                          labelText: 'Email'.tr,
                          hintText: 'Email'.tr,
                          border: const OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty || !validateEmail(value)) {
                            return 'Please enter your valid email.'.tr;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: password1Controller,
                        obscureText: obscuredSignupController.isObscuredPassword1.value,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.password),
                          labelText: 'Password'.tr,
                          hintText: 'Password'.tr,
                          border: const OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: obscuredSignupController.isObscuredPassword1.value ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                            onPressed: () {
                              obscuredSignupController.isObscuredPassword1.value = !obscuredSignupController.isObscuredPassword1.value;
                            },
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password.'.tr;
                          } else if (value.length < 6) {
                            return 'Password must be a minimum of 6 characters.'.tr;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: password2Controller,
                        obscureText: obscuredSignupController.isObscuredPassword2.value,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.password),
                          labelText: 'Password (again)'.tr,
                          hintText: 'Password (again)'.tr,
                          border: const OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: obscuredSignupController.isObscuredPassword2.value ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                            onPressed: () {
                              obscuredSignupController.isObscuredPassword2.value = !obscuredSignupController.isObscuredPassword2.value;
                            },
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password.'.tr;
                          } else if (value.length < 6) {
                            return 'Password must be a minimum of 6 characters.'.tr;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            if (password1Controller.text != password2Controller.text) {
                              snackbarMsg(
                                title: 'Password are not matched.'.tr,
                                message: 'Please enter same password.',
                                icon: const Icon(
                                  Icons.error_outline_outlined,
                                  color: Colors.red,
                                  size: 40,
                                ),
                              );
                            } else if (formGlobalKey.currentState!.validate()) {
                              authController.registration(
                                username: usernameController.text,
                                email: emailController.text,
                                password1: password1Controller.text,
                                password2: password2Controller.text,
                              );
                            }
                          },
                          child: Text(
                            'Sign up'.tr,
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

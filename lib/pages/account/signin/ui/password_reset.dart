import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../controller/auth_controller.dart';
import 'login_header.dart';

var logger = Logger();

class PasswordResetPage extends StatelessWidget {
  const PasswordResetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());
    final emailController = TextEditingController();
    final formGlobalKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(title: Text('Password Reset'.tr)),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              const LoginHeader(),
              Text(
                'Reset Password Hints'.tr,
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              Form(
                key: formGlobalKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
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
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          if (formGlobalKey.currentState!.validate()) {
                            authController.resetPassword(
                              email: emailController.text,
                            );
                          }
                        },
                        child: Text(
                          'Reset Password'.tr,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/strings.dart';
import '../controller/auth_controller.dart';

class SigninForm extends StatefulWidget {
  const SigninForm({Key? key}) : super(key: key);

  @override
  State createState() => SigninFormState();
}

class SigninFormState extends State<SigninForm> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final _formGlobalKey = GlobalKey<FormState>();

  bool _isObscured = true;

  @override
  void initState() {
    super.initState();
    _isObscured = true;
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());
    return Form(
      key: _formGlobalKey,
      child: Column(
        children: [
          TextFormField(
            controller: usernameController,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.mail),
              labelText: txtEmail,
              hintText: txtEmail,
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return txtEnterEmail;
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: passwordController,
            obscureText: _isObscured,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.password),
              labelText: txtPassword,
              hintText: txtPassword,
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                icon: _isObscured
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _isObscured = !_isObscured;
                  });
                },
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return txtEnterUserPassword;
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: const Text(txtForgetPassword),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                if (_formGlobalKey.currentState!.validate()) {
                  authController.usernameSignin(
                    username: usernameController.text,
                    password: passwordController.text,
                  );
                }
              },
              child: const Text(txtSignin),
            ),
          ),
        ],
      ),
    );
  }
}

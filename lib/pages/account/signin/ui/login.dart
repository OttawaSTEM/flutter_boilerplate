import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import 'login_header.dart';
import 'login_form.dart';
import 'login_social.dart';

var logger = Logger();

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login'.tr)),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: const Column(
            children: [
              LoginHeader(),
              LoginForm(),
              LoginSocial(),
            ],
          ),
        ),
      ),
    );
  }
}

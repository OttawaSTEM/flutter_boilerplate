import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_header.dart';
import 'login_form.dart';
import 'login_social.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Center(
      child: Scaffold(
        appBar: AppBar(title: Text('Login'.tr)),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                LoginHeader(screenSize: screenSize),
                const LoginForm(),
                const LoginSocial(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

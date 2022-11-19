import 'package:flutter/material.dart';

import 'package:flutter_boilerplate/core/auth/ui/login_header.dart';
import 'package:flutter_boilerplate/core/auth/ui/login_form.dart';
import 'package:flutter_boilerplate/core/auth/ui/login_social.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
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
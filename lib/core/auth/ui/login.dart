import 'package:flutter/material.dart';

import '../../auth/ui/login_header.dart';
import '../../auth/ui/login_form.dart';
import '../../auth/ui/login_social.dart';

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
                LoginForm(),
                const LoginSocial(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../constants/strings.dart';

import '../../auth/ui/login_header.dart';
import '../../auth/ui/login_form.dart';
import '../../auth/ui/login_social.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Center(
      child: Scaffold(
        appBar: AppBar(title: const Text(txtSignin)),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                SigninHeader(screenSize: screenSize),
                const SigninForm(),
                const SigninSocial(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

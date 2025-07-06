import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import 'package:flutter_boilerplate/pages/account/signin/ui/signin_header.dart';
import 'package:flutter_boilerplate/pages/account/signin/ui/signin_form.dart';
import 'package:flutter_boilerplate/pages/account/signin/ui/signin_social.dart';

var logger = Logger();

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign In'.tr)),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: const Column(
            children: [
              SignInHeader(),
              SignInForm(),
              SignInSocial(),
            ],
          ),
        ),
      ),
    );
  }
}

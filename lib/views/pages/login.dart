import 'package:flutter/material.dart';

import 'package:flutter_boilerplate/constants/assets.dart';
// import 'background.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [Image(image: AssetImage(appLogo)), Text('data')]),
        ),
      ),
    ));
  }
}

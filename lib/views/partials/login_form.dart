import 'package:flutter/material.dart';

import 'package:flutter_boilerplate/constants/assets.dart';
import 'package:flutter_boilerplate/constants/sizes.dart';
import 'package:flutter_boilerplate/constants/strings.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_outline_outlined),
                labelText: txtEmail,
                hintText: txtEmail,
                border: OutlineInputBorder()),
          ),
          const SizedBox(height: 20),
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.fingerprint),
              labelText: txtPassword,
              hintText: txtPassword,
              border: OutlineInputBorder(),
              suffixIcon: IconButton(
                onPressed: null,
                icon: Icon(Icons.remove_red_eye_sharp),
              ),
            ),
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
            child: ElevatedButton(
              onPressed: () {},
              child: const Text(txtLogin),
            ),
          ),
        ],
      ),
    );
  }
}

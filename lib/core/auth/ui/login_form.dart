import 'package:flutter/material.dart';

import 'package:flutter_boilerplate/constants/strings.dart';

class LoginForm extends StatelessWidget {
  LoginForm({
    Key? key,
  }) : super(key: key);

  // TextEditingController controller = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: usernameController,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_outline_outlined),
                labelText: txtEmail,
                hintText: txtEmail,
                border: OutlineInputBorder()),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: passwordController,
            keyboardType: TextInputType.text,
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
            height: 50,
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

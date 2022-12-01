import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/strings.dart';
import '../models/auth_model.dart';

class LoginForm extends StatelessWidget {
  LoginForm({
    Key? key,
  }) : super(key: key);

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  static final _formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthModel>(
      //  listener: (context, state) {
      //   if (state.counter3Incremented) {
      //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //       content: const Text('Incremented'),
      //       duration: const Duration(seconds: 1),
      //       action: SnackBarAction(
      //         label: 'ACTION',
      //         onPressed: () {},
      //       ),
      //     ));
      //   } else {
      //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //       content: const Text('Dencremented'),
      //       duration: const Duration(seconds: 1),
      //       action: SnackBarAction(
      //         label: 'ACTION',
      //         onPressed: () {},
      //       ),
      //     ));
      //   }
      // },
      builder: (context, model, child) => Form(
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
                    model.login(
                      username: usernameController.text,
                      password: passwordController.text,
                    );
                  }
                },
                child: const Text(txtLogin),
              ),
            ),
            Text(
              model.token,
              style: const TextStyle(height: 3, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

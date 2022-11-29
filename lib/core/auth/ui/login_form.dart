import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/strings.dart';

import '../../../core/auth/bloc/auth_bloc.dart';

class LoginForm extends StatelessWidget {
  LoginForm({
    Key? key,
  }) : super(key: key);

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  static final GlobalKey<FormState> _formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
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
                  context.read<AuthBloc>().add(UserLoginEvent(
                        usernameController.text,
                        passwordController.text,
                      ));
                }
              },
              child: const Text(txtLogin),
            ),
          ),
        ],
      ),
    );
  }
}

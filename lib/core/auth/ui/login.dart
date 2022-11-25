import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

import '../../auth/ui/login_header.dart';
import '../..//auth/ui/login_form.dart';
import '../..//auth/ui/login_social.dart';

// import '../../auth/bloc/auth_bloc.dart';

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
                // BlocBuilder<AuthBloc, AuthState>(
                //   builder: (context, state) {
                //     // final data = state.props[0] as Map;
                //     return Text(
                //       // (state.token != null)
                //       //     ? 'Temprature: ${state.token}'
                //       //     : 'Temprature: ',
                //       state.token.toString(),
                //       style: const TextStyle(
                //         fontSize: 25,
                //       ),
                //     );
                //   },
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

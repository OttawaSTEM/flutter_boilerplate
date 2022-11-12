import 'package:flutter/material.dart';

import 'package:flutter_boilerplate/constants/assets.dart';
import 'package:flutter_boilerplate/constants/sizes.dart';
import 'package:flutter_boilerplate/constants/strings.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SingleChildScrollView(
              child: Container(
                alignment: Alignment.center,
                // width: loginWidth,
                padding: const EdgeInsets.all(50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(
                      image: const AssetImage(appLogo),
                      height: screenSize.height * 0.2,
                    ),
                    Text(appName, style: Theme.of(context).textTheme.headline4),
                    Text(appName, style: Theme.of(context).textTheme.bodyText1),
                    Form(
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

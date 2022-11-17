import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import 'package:flutter_boilerplate/data/local/counter.dart';
// import 'package:flutter_boilerplate/data/local/shopping_cart.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shoping Cart'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Second page content'),
            ElevatedButton(
              onPressed: () {
                // HttpService.get();
                Navigator.pushNamed(context, '/second');
              },
              child: const Text('Launch screen'),
            ),
          ],
        ),
      ),
    );
  }
}

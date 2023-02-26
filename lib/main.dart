import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../routes/routes.dart';

Future main() async {
  await GetStorage.init();
  await dotenv.load(fileName: 'assets/local.env');
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // https://flutter.github.io/samples/web/material_3_demo/#/
      // theme: ThemeData(
      //   useMaterial3: true,
      //   brightness: Brightness.light,
      //   primarySwatch: Colors.blue,
      //   colorSchemeSeed: Colors.blue,
      // ),
      // debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: appRoutes,
    );
  }
}

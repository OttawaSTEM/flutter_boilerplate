import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:flutter_boilerplate/lang/languages.dart';
import 'package:flutter_boilerplate/theme/theme.dart';
import 'package:flutter_boilerplate/routes/app_routes.dart';
import 'package:flutter_boilerplate/utils/utils.dart';

Future main() async {
  // Let's Encrypt Certificate Handshake Expired Error
  // WidgetsFlutterBinding.ensureInitialized();
  // ByteData data = await PlatformAssetBundle().load('assets/ca/lets-encrypt-r3.pem');
  // SecurityContext.defaultContext.setTrustedCertificatesBytes(data.buffer.asUint8List());

  await GetStorage.init();
  await dotenv.load(fileName: 'assets/local.env');
  await detectOS();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // themeMode: ThemeMode.system,
      theme: lightMode,
      darkTheme: darkMode,
      translations: Languages(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      initialRoute: AppRoutes.home,
      getPages: AppPages.pages,
    );
  }
}

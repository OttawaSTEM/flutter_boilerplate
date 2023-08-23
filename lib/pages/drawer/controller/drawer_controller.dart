import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../utils/rest_api.dart';
import '../../home/ui/home.dart';
import '../../../../widgets/snack_bar_msg.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';

var logger = Logger();
final env = dotenv.env;

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email',
  ],
);

class SideDrawerController extends GetxController {
  final storage = GetStorage();
  RxBool authStatus = false.obs;

  @override
  void onInit() {
    String? token = storage.read('token');
    if (token != null) {
      authStatus.value = true;
    } else {
      authStatus.value = false;
    }
    super.onInit();
  }

  void updateLoginStatus() {
    String? token = storage.read('token');
    if (token != null) {
      authStatus.value = true;
    } else {
      authStatus.value = false;
    }
  }

  void signOut() async {
    final String djangoLogoutURL = '${env['BASE_URL']}/api/auth/logout/';

    Get.dialog(
      AlertDialog(
        title: const Text('Sign Out'),
        content: const Text('Are you sure to sign out?'),
        actions: [
          ElevatedButton(
            child: const Text("Sign Out"),
            onPressed: () async {
              storage.remove('token');
              await RestAPI().postData(djangoLogoutURL);
              await _googleSignIn.signOut();
              authStatus.value = false;
              Get.back();
              Get.to(() => HomePage());
              snackbarMsg(
                title: 'Logout'.tr,
                message: 'Logout sucussed!'.tr,
                icon: const Icon(
                  Icons.check_circle_outline,
                  color: Colors.green,
                  size: 40,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

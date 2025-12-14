import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:flutter_boilerplate/utils/rest_api.dart';
import 'package:flutter_boilerplate/widgets/snack_bar_msg.dart';
import 'package:flutter_boilerplate/pages/home/ui/home_ui.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';

var logger = Logger();
final env = dotenv.env;

// class LoginService {
//   final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
//   Future<bool> signInWithGoogle() async {
//     try {
//       await _googleSignIn.initialize(
//         // If you have scopes:
//         serverClientId: '298422184945-t3sgqh443j1v0280k0pe400j0e8mdmit.apps.googleusercontent.com',
//       );
//       logger.i('GoogleSignIn initialized with serverClientId');
//       // Authenticate: opens Google sign-in UI
//       final GoogleSignInAccount? googleUser = await _googleSignIn.authenticate();
//       if (googleUser == null) {
//         logger.w('User cancelled the Google sign-in flow');
//         // User canceled or something went wrong
//         return false;
//       }
//       logger.i('User selected account: ${googleUser.email}');
//       // Get authentication info (ID token)
//       final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
//       logger.i('Retrieved Google ID token: ${googleAuth.idToken != null ? "SUCCESS" : "NULL"}');
//       final idToken = googleAuth.idToken;
//       if (idToken == null) {
//         // No ID token — cannot proceed
//         logger.i('idToken== null');
//         return false;
//       }
//       // Create a Firebase credential with the idToken
//       final credential = GoogleAuthProvider.credential(
//         idToken: idToken,
//         // Note: accessToken may not be available directly, depending on your scopes
//       );
//       logger.i('Firebase credential created');
//       // Sign in to Firebase
//       await _auth.signInWithCredential(credential);
//       // Optionally: if you want accessToken, authorize scopes
//       // (only if you actually need access token)
//       final authClient = await googleUser.authorizationClient.authorizeScopes([
//         'email',
//         'profile',
//       ]);
//       final accessToken = authClient.accessToken;
//       print("Access Token: $accessToken");
//       return true;
//     } catch (e) {
//       logger.e('Google sign-in error: $e');
//       return false;
//     }
//   }
// }

// Future <void› signInwithGoogle({} required BuildContext context,
// bool isForAccountSelection = false,
// required Widget toScreen,
// }) async {
// try {
// // GoogleSignInAccount
// final google = GoogleSignIn.instance;
// await google.initialize();
// // required in v7+
// if (isForAccountSelection == true) {
// await google.disconnect();
// final account = await google.authenticate(); // correct method
// final
// auth = account.authentication;
// final credential = GoogleAuthProvider.credential(
// idToken: auth.idToken,
// // accessToken: auth. accessToken,
// );
// log(' M sign in success! }');
// final userCred = await FirebaseAuth.instance.signInWithCredential(
// credential,
// );
// state = userCred.user;
// if (userCred.user != null && context.mounted) {
// Navigator.of ( context,
// ).pushReplacement(MaterialPageRoute(builder: (_) => toScreen)) ;
// }
// } on FirebaseAuthException catch (e) {
// log(" sign in failed! $e');
// } on Exception catch (e) {
// log(' sign in failed exception! $e');
// }
// }

class AuthService {
  final _googleSignIn = GoogleSignIn.instance;
  bool _isGoogleSignInInitialized = false;

  AuthService() {
    _initializeGoogleSignIn();
  }

  Future<void> _initializeGoogleSignIn() async {
    try {
      await _googleSignIn.initialize(serverClientId: '616461986489-k7bam9apf6cnpl7h9kmb0vuq6it8e6m0.apps.googleusercontent.com'
          // serverClientId: '616461986489-roc1koshstt1dbfs6d8a2n4r8p3l6k4k.apps.googleusercontent.com'
          );
      _isGoogleSignInInitialized = true;
    } catch (e) {
      snackbarMsg(
        title: 'Failed to initialize Google Sign-In: $e'.tr,
        message: e.toString(),
        icon: const Icon(
          Icons.error_outline_outlined,
          color: Colors.red,
          size: 40,
        ),
      );
    }
  }

  /// Always check Google sign in initialization before use
  Future<void> _ensureGoogleSignInInitialized() async {
    if (!_isGoogleSignInInitialized) {
      await _initializeGoogleSignIn();
    }
  }

  Future<GoogleSignInAccount> signInWithGoogle() async {
    await _ensureGoogleSignInInitialized();

    try {
      // authenticate() throws exceptions instead of returning null
      final GoogleSignInAccount account = await _googleSignIn.authenticate(
        scopeHint: ['email'], // Specify required scopes
      );
      return account;
    } on GoogleSignInException catch (e) {
      logger.e('Google Sign In error: code: ${e.code.name} description: ${e.description} details: ${e.details}', error: e);
      rethrow;
    } catch (error) {
      logger.e('Unexpected Google Sign-In error: $error');
      rethrow;
    }
  }
}

class AuthController extends GetxController {
  final storage = GetStorage();
  final authService = AuthService();
  final String djangoLoginURL = '${env['BASE_URL']}/api/auth/login/';
  final String djangoLogoutURL = '${env['BASE_URL']}/api/auth/logout/';
  final String djangoPasswordResetURL = '${env['BASE_URL']}/api/auth/password/reset/';
  final String djangoRegistrationURL = '${env['BASE_URL']}/api/auth/registration/';
  final String djangoGoogleAuthURL = '${env['BASE_URL']}/api/auth/google/';

  // bool authStatus = false;
  // bool get authStatus => authStatus;
  RxBool authStatus = false.obs;

  void djangoAuth(String url, Object body) async {
    var response = await RestAPI().postData(url, body);
    var data = response.body;

    if (!response.hasError) {
      if (data['key'] != null) {
        // Login succeed, get token
        storage.write("token", data['key']);
        authStatus.value = true;
        Get.to(() => HomePage());
        snackbarMsg(
          title: 'Login'.tr,
          message: 'Login succeed.'.tr,
          icon: const Icon(
            Icons.check_circle_outline,
            color: Colors.green,
            size: 40,
          ),
        );
      } else if (data['email'] != null) {
        // Login failed - invalid email, remove token
        storage.remove('token');
        authStatus.value = false;
        snackbarMsg(
          title: 'Login'.tr,
          message: ('Failed'.tr) + (' ') + ('Please enter your valid email.'.tr),
          icon: const Icon(
            Icons.error_outline_outlined,
            color: Colors.red,
            size: 40,
          ),
        );
      } else if (data['non_field_errors'] != null) {
        // Login failed - invalid password, remove token
        storage.remove('token');
        authStatus.value = false;
        snackbarMsg(
          title: 'Login'.tr,
          message: ('Failed'.tr) + (' ') + ('Unable to log in with provided credentials.'.tr),
          icon: const Icon(
            Icons.error_outline_outlined,
            color: Colors.red,
            size: 40,
          ),
        );
      } else if (data['detail'] == 'Password reset e-mail has been sent.') {
        // Password reset succeed
        Get.to(() => HomePage());
        snackbarMsg(
          title: 'Password Reset'.tr,
          message: 'Password reset e-mail has been sent.'.tr,
          icon: const Icon(
            Icons.check_circle_outline,
            color: Colors.green,
            size: 40,
          ),
        );
      } else if (data['detail'] == 'Verification e-mail sent.') {
        // Registration succeed
        Get.to(() => HomePage());
        snackbarMsg(
          title: 'Sig up'.tr,
          message: ('Succeed.'.tr) + (' ') + ('Verification e-mail sent.'.tr),
          icon: const Icon(
            Icons.check_circle_outline,
            color: Colors.green,
            size: 40,
          ),
        );
      } else {
        snackbarMsg(
          title: 'Error'.tr,
          message: '${response.statusText}',
          icon: const Icon(
            Icons.error_outline_outlined,
            color: Colors.red,
            size: 40,
          ),
        );
      }
    } else if (!response.isOk) {
      if (data.containsKey('username')) {
        if (data['username'].contains('A user with that username already exists.')) {
          // Registration failed, user email is already registered
          snackbarMsg(
            title: 'Sig up'.tr,
            message: ('Failed.'.tr) + (' ') + ('A user with that username already exists.'.tr),
            icon: const Icon(
              Icons.error_outline_outlined,
              color: Colors.red,
              size: 40,
            ),
          );
        }
      } else if (data.containsKey('email')) {
        if (data['email'].contains('A user is already registered with this e-mail address.')) {
          // Registration failed, user email is already registered
          snackbarMsg(
            title: 'Sig up'.tr,
            message: 'Failed, A user is already registered with this e-mail address.'.tr,
            icon: const Icon(
              Icons.error_outline_outlined,
              color: Colors.red,
              size: 40,
            ),
          );
        }
      } else {
        snackbarMsg(
          title: 'Error',
          message: 'Backend server error, Status Code: ${response.statusCode}.',
          icon: const Icon(
            Icons.error_outline_outlined,
            color: Colors.red,
            size: 40,
          ),
        );
      }
    }
  }

  Future<void> googleSignIn() async {
    try {
      // Use v7's authenticate() method which throws exceptions
      final GoogleSignInAccount account = await authService.signInWithGoogle();

      // v7: Authorization is separate from authentication
      // Request authorization with required scopes to get access token
      const List<String> scopes = ['email'];
      final GoogleSignInClientAuthorization authorization = await account.authorizationClient.authorizeScopes(scopes);

      final body = jsonEncode({
        'access_token': authorization.accessToken,
      });
      djangoAuth(djangoGoogleAuthURL, body);
    } on GoogleSignInException catch (e) {
      storage.remove('token');
      logger.e('Google Sign In Exception: ${e.code.name}', error: e);
      snackbarMsg(
        title: 'Google Login failed'.tr,
        message: '${e.code.name}: ${e.description ?? "Unknown error"}'.tr,
        icon: const Icon(
          Icons.error_outline_outlined,
          color: Colors.red,
          size: 40,
        ),
      );
    } catch (e) {
      storage.remove('token');
      logger.e('Unexpected Google Sign In error', error: e);
      snackbarMsg(
        title: 'Google Login failed'.tr,
        message: e.toString(),
        icon: const Icon(
          Icons.error_outline_outlined,
          color: Colors.red,
          size: 40,
        ),
      );
    }
  }

  void userLogin({required String username, required String password}) async {
    final body = {
      'email': username,
      'password': password,
    };
    djangoAuth(djangoLoginURL, body);
  }

  void resetPassword({required String email}) async {
    final body = {
      'email': email,
    };
    djangoAuth(djangoPasswordResetURL, body);
  }

  void registration({required String username, required String email, required String password1, required String password2}) async {
    final body = {
      'username': username,
      'email': email,
      'password1': password1,
      'password2': password2,
    };
    djangoAuth(djangoRegistrationURL, body);
  }
}

import 'package:http/http.dart' as http;
import 'dart:convert';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class UserRepository {
  Future<dynamic> getAuthData(String userName, String userPassword) async {
    var client = http.Client();
    try {
      // const String url = 'http://192.168.1.60:8000/api/auth/login/';
      const String url = 'http://192.168.1.51:8000/api/auth/login/';

      const dynamic headers = {
        'Accept': '*/*',
        'User-Agent':
            'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36',
        'Content-Type': 'application/json',
      };

      final body = jsonEncode({
        'username': '',
        'email': userName,
        'password': userPassword,
      });

      final response =
          await client.post(Uri.parse(url), headers: headers, body: body);
      final jsonDecodedData = jsonDecode(response.body);
      return jsonDecodedData;
    } catch (e) {
      throw Exception(e);
    } finally {
      client.close();
    }
  }
}



  // Future<String> authenticate({
  //   required String username,
  //   required String password,
  // }) async {
  //   await Future.delayed(const Duration(seconds: 1));
  //   return 'token';
  // }

  // Future<void> deleteToken() async {
  //   /// delete from keystore/keychain
  //   await Future.delayed(const Duration(seconds: 1));
  //   return;
  // }

  // Future<void> persistToken(String token) async {
  //   /// write to keystore/keychain
  //   await Future.delayed(const Duration(seconds: 1));
  //   return;
  // }

  // Future<bool> hasToken() async {
  //   /// read from keystore/keychain
  //   await Future.delayed(const Duration(seconds: 1));
  //   return false;
  // }

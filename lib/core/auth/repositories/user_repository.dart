import 'package:http/http.dart' as http;
import 'dart:convert';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class UserRepository {
  Future<dynamic> getAuthData(String userName, String userPassword) async {
    var client = http.Client();
    try {
      final String url =
          'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=43ea6baaad7663dc17637e22ee6f78f2';
      final response = await client.get(Uri.parse(url));

      final jsonDecodedData = jsonDecode(response.body);
      return jsonDecodedData['main'];
    } catch (e) {
      throw Exception(e);
    } finally {
      client.close();
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
  }
}

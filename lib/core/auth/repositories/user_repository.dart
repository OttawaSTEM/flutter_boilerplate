import 'dart:async';

import 'package:flutter_boilerplate/core/auth/models/user_model.dart';
import 'package:uuid/uuid.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class UserRepository {
  Future<String> authenticate({
    required String username,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    return 'token';
  }

  Future<void> deleteToken() async {
    /// delete from keystore/keychain
    await Future.delayed(const Duration(seconds: 1));
    return;
  }

  Future<void> persistToken(String token) async {
    /// write to keystore/keychain
    await Future.delayed(const Duration(seconds: 1));
    return;
  }

  Future<bool> hasToken() async {
    /// read from keystore/keychain
    await Future.delayed(const Duration(seconds: 1));
    return false;
  }
}

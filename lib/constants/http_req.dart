// import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';

// Auth URL
// const String authUrl =
//     kDebugMode ? 'http://192.168.1.51:8000/api/auth/login/' : 'https://domain.com/api/auth/login';

const String googleUrl =
    'https://accounts.google.com/o/oauth2/v2/auth?redirect_uri=localhost:8000/api/auth/login/callback/&prompt=consent&response_type=code&client_id=905930693098-tvji5i03ner41c3fje05i18hpvm3l6mg.apps.googleusercontent.com&scope=openid%20email%20profile&access_type=offline';

// api routes
// ? 'http://192.168.1.51:8000/api/auth/login/'
const String authUrl = kDebugMode
    ? 'http://192.168.1.51:8000/api/auth/login/' // iMac
    // ? 'http://192.168.1.60:8000/api/auth/login/'   // Win
    : 'https://domain.com/api/auth/login';

const String userUrl = kDebugMode
    ? 'http://192.168.1.51:8000/api/users/' // iMac
    // ? 'http://192.168.1.60:8000/api/users/'        // Win
    : 'https://domain.com/api/users/';

// api keys
const String moviesApiKey =
    'API_KEY'; // e.g. 'bff708fnwFwef9832ed927da1d'; or Env.moviesApiKey;

// http headers
const Object apiHeaders = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
};

const Object backendHeaders = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer val'
};

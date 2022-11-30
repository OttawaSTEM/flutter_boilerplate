// import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';

// Auth URL
// const String authUrl =
//     kDebugMode ? 'http://192.168.1.51:8000/api/auth/login/' : 'https://domain.com/api/auth/login';

// api routes
// ? 'http://192.168.1.51:8000/api/auth/login/'
const String authUrl =
    kDebugMode ? 'http://192.168.1.60:8000/api/auth/login/' : 'https://domain.com/api/auth/login';

// api keys
const String moviesApiKey = 'API_KEY'; // e.g. 'bff708fnwFwef9832ed927da1d'; or Env.moviesApiKey;

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

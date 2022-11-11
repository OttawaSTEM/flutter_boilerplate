import 'package:flutter/foundation.dart';

class HttpReq {
  // api routes
  static String apiBaseUrl = kDebugMode
      ? "http://0.0.0.0:8000/api/users/"
      : "https://api.json-generator.com/templates/-eZlCwfKSpqC/data?access_token=60p9v6l4cvb874bi65k6vze2bbxuz4e81yyurvym";

  // api keys
  static String moviesApiKey =
      "API_KEY"; // e.g. "bff708fnwFwef9832ed927da1d"; or Env.moviesApiKey;

  // http headers
  static Object apiHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  static Object backendHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer val'
  };
}

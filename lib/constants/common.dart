import 'package:flutter/foundation.dart';

class Common {
  // App content
  static String appName = "Flutter Boilerplate";
  static String contactEmail = "support@acelords.space";
  static String appAbout = "Using this app will improve your project deliverability and sharpen your understanding of Flutter"
      "and BLoC pattern in no time. Build Flutter apps like a pro!";

  // Images
  static String logoImage = "assets/images/logo.png";

  // Share message
  static String shareLink = "http://bit.ly/acelords";
  static String shareMessage = "Check out this Amazing App at $shareLink";
  static String shareSubject = "Best App Ever!";
  static String twitterUrl = "https://twitter.com/acelords";

  // MQ Topics
  static String publicTopicKey = kDebugMode ? "debug" : "production";

  // Others
  static double commonPadding = 15.0;
  static String commonDateFormat = "dd MMM yyyy, hh:mm a";
}

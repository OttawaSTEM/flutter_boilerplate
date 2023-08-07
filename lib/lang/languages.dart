import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/lang/zh_cn.dart';
import 'package:get/get.dart';

import 'en_us.dart';

class Languages extends Translations {
  static Locale? get locale => Get.deviceLocale;
  static const fallbackLocale = Locale('en', 'US');
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'zh_CN': zhCN,
      };
}

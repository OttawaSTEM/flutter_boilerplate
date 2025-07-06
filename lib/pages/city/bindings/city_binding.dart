import 'package:get/get.dart';

import 'package:flutter_boilerplate/pages/city/controller/city_controller.dart';
import 'package:flutter_boilerplate/pages/city/data/city_provider.dart';

class CityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CityProvider());
    Get.lazyPut<CityController>(() => CityController(cityProvider: Get.find()));
  }
}

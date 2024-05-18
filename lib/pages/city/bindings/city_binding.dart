import 'package:get/get.dart';

import '../controller/city_controller.dart';
import '../data/city_provider.dart';

class CityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CityProvider());
    Get.lazyPut<CityController>(() => CityController(cityProvider: Get.find()));
  }
}

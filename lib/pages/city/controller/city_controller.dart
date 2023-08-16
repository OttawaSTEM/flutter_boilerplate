import 'package:get/get.dart';

import '../data/city_provider.dart';
import '../model/city_model.dart';

class CityController extends GetxController with StateMixin<List<CityModel>> {
  final CityProvider cityProvider;
  CityController({required this.cityProvider});

  @override
  void onInit() {
    findAllCities();
    super.onInit();
  }

  void findAllCities() {
    cityProvider.getCity().then((result) {
      List<CityModel>? data = result.body;
      change(data, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  // void insertCity() {
  //   const body = {'nome': 'joao', 'idade': 47};

  //   cityProvider.postCity(body).then((result) {
  //     print(result.body.abbreviation);
  //     print(result.body.name);
  //   });
  // }
}

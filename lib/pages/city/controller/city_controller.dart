import 'package:get/get.dart';

import 'package:flutter_boilerplate/pages/city/data/city_provider.dart';
import 'package:flutter_boilerplate/pages/city/model/city_model.dart';

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

var logger = Logger();

// class CityController extends GetxController with StateMixin<List<CityModel>> {
//   final CityProvider cityProvider;
//   CityController({required this.cityProvider});

//   @override
//   void onInit() {
//     findAllCities();
//     super.onInit();
//   }

//   void findAllCities() {
//     cityProvider.getCity().then((result) {
//       List<CityModel>? data = result.body;
//       change(data, status: RxStatus.success());
//     }, onError: (err) {
//       change(null, status: RxStatus.error(err.toString()));
//     });
//   }

//   void insertCity() {
//     const body = {'nome': 'joao', 'idade': 47};

//     cityProvider.postCity(body).then((result) {
//       if (kDebugMode) {
//         logger.i(result.body?.abbreviation);
//         logger.i(result.body?.name);
//       }
//     });
//   }
// }

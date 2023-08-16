import 'package:get/get.dart';

import '../model/city_model.dart';

class CityProvider extends GetConnect {
  @override
  void onInit() {
    // All request will pass to jsonEncode so CasesModel.fromJson()
    httpClient.defaultDecoder = CityModel.listFromJson;

    // httpClient.addRequestModifier((request) {
    //   request.headers['Authorization'] = 'Bearer sdfsdfgsdfsdsdf12345678';
    //   return request;
    // });
  }

  Future<Response<List<CityModel>>> getCity() => get<List<CityModel>>(
      'https://servicodados.ibge.gov.br/api/v1/localidades/estados');

  Future<Response<CityModel>> postCity(body) =>
      post<CityModel>('http://192.168.0.101:3000/items', body,
          decoder: (obj) => CityModel.fromJson(obj));
}

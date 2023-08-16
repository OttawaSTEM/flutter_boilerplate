import 'package:get/get.dart';
// import 'package:get/get_connect/http/src/request/request.dart';

import '../model/groups_model.dart';

class GroupsProvider extends GetConnect {
  @override
  void onInit() {
    // All request will pass to jsonEncode so Model.fromJson()
    httpClient.defaultDecoder = GroupModel.listFromJson;

    // httpClient.addRequestModifier((Request request) async {
    //   request.headers['Authorization'] = 'Bearer sdfsdfgsdfsdsdf12345678';
    //   return request;
    // });
  }

  Future<Response<List<GroupModel>>> getGroups() =>
      get<List<GroupModel>>('https://flutter.ottawastem.com/api/groups/');
  // get<List<GroupModel>>(
  //     'https://servicodados.ibge.gov.br/api/v1/localidades/estados');

  Future<Response<GroupModel>> postGroups(body) =>
      post<GroupModel>('http://192.168.0.101:3000/items', body,
          decoder: (obj) => GroupModel.fromJson(obj));
}

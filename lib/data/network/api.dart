import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class HttpService {
  final logger = Logger();

  void get() async {
    const String url = 'https://api.json-generator.com/templates/-eZlCwfKSpqC/data?access_token=60p9v6l4cvb874bi65k6vze2bbxuz4e81yyurvym';
    try {
      final response = await http.get(Uri.parse(url));
      logger.i(response);
    } catch (e) {
      logger.i(e);
    }
  }

// Future<List<User>> fetchUsers() async {
// try {
//     Response response = await Dio().get(‘https://jsonplaceholder.typicode.com/users’);
//     if (response.statusCode == 200) {
//         var getUsersData = response.data as List;
//         var listUsers = getUsersData.map((i) => User.fromJSON(i)).toList();
//         return listUsers;
//         } else {
//             throw Exception(‘Failed to load users’);
//         }
//     } catch (e) {
//         print(e);
//     }
// }

  //  dio instance to request token
  // var tokenDio = Dio();
  // String? csrfToken;
  // dio.options.baseUrl = 'http://www.dtworkroom.com/doris/1/2.0.0/';
  // tokenDio.options = dio.options;
  // dio.interceptors.add(QueuedInterceptorsWrapper(
  //   onRequest: (options, handler) {
  //     logger.i('send request：path:${options.path}，baseURL:${options.baseUrl}');
  //     if (csrfToken == null) {
  //       logger.i('no token，request token firstly...');
  //       tokenDio.get('/token').then((d) {
  //         options.headers['csrfToken'] = csrfToken = d.data['data']['token'];
  //         logger.i('request token succeed, value: ' + d.data['data']['token']);
  //         logger.i(
  //             'continue to perform request：path:${options.path}，baseURL:${options.path}');
  //         handler.next(options);
  //       }).catchError((error, stackTrace) {
  //         handler.reject(error, true);
  //       });
  //     } else {
  //       options.headers['csrfToken'] = csrfToken;
  //       return handler.next(options);
  //     }
  //   },
  //  );
}

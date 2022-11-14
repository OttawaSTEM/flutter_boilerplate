import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class User with ChangeNotifier {
  List<dynamic> _jsonData = [];
  bool _error = false;
  String _errorMessage = '';

  List get jsonData => _jsonData;
  bool get error => _error;
  String get errorMessage => _errorMessage;

  Future<void> get fetchData async {
    var response = await http.get(
      // Uri.parse('https://api.json-generator.com/templates/-eZlCwfKSpqC/data?access_token=60p9v6l4cvb874bi65k6vze2bbxuz4e81yyurvym'),
      Uri.parse('https://ottawastem-flutter-backend.herokuapp.com/api/user/'),
    );

    // kDebugMode ? print(response.body) : null;
    if (response.statusCode == 200) {
      try {
        _jsonData = jsonDecode(response.body);
      } catch (e) {
        _error = true;
        _errorMessage = e.toString();
        _jsonData = [];
      }
    } else {
      _error = true;
      _errorMessage = 'Error: internet error';
      _jsonData = [];
    }
    notifyListeners();
  }

  void initialValues() {
    _jsonData = [];
    _error = false;
    _errorMessage = '';
    notifyListeners();
  }
}



// import 'dart:convert';

// List<Welcome> welcomeFromJson(String str) => List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

// String welcomeToJson(List<Welcome> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Welcome {
//     Welcome({
//         this.name,
//         this.age,
//     });

//     String name;
//     int age;

//     factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
//         name: json["name"],
//         age: json["age"],
//     );

//     Map<String, dynamic> toJson() => {
//         "name": name,
//         "age": age,
//     };
// }

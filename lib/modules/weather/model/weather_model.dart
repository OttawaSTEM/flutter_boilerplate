import 'package:equatable/equatable.dart';

enum WeatherCondition {
  snow,
  heavyRain,
  lightRain,
}

class WeatherModel extends Equatable {
  final double temprature;
  // final double minTemprature;
  // final double maxTemprature;
  // final int humidity;

  double get getTemprature => temprature - 272.5;

  WeatherModel({
    this.temprature,
    // required this.minTemprature,
    // required this.maxTemprature,
    // required this.humidity,
  }) : super([
          temprature,
        ]);

  WeatherModel.fromJson(dynamic json) : temprature = json['temp'];
  // minTemprature = json['temp_min'],
  // maxTemprature = json['temp_max'],
  // humidity = json['humidity'];

  // Map<String, dynamic> toJson() => {
  //   'temp' = temprature,
  //   'temp_min' = minTemprature,
  //   'temp_max' = maxTemprature,
  //   'humidity' = humidity,
  // };
}


  // double get getTemprature => temprature - 272.5;

// import 'package:equatable/equatable.dart';

// class WeatherModel extends Equatable {
//   final double temprature;
//   final String? location;

//   const WeatherModel({
//     required this.temprature,
//     this.location,
//   });

//   @override
//   List<Object> get props => [temprature];

//   // double get temp => temprature;

//   factory WeatherModel.fromJson(Map<String, dynamic> json) {
//     return WeatherModel(
//       temprature: json['temp'],
//       location: json['location'],
//     );
//   }
// }

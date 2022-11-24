import 'package:equatable/equatable.dart';

enum WeatherCondition {
  snow,
  heavyRain,
  lightRain,
}

class WeatherModel extends Equatable {
  final double temprature;
  final double feelsLike;
  final double minTemprature;
  final double maxTemprature;
  final int pressure;
  final int humidity;

  const WeatherModel({
    required this.temprature,
    required this.feelsLike,
    required this.minTemprature,
    required this.maxTemprature,
    required this.pressure,
    required this.humidity,
  });

  @override
  List<Object> get props => [
        temprature,
        feelsLike,
        minTemprature,
        maxTemprature,
        pressure,
        humidity,
      ];

  // double get temp => temprature;

  factory WeatherModel.fromJson(dynamic json) {
    return WeatherModel(
      temprature: json['temp'],
      feelsLike: json['feels_like'],
      minTemprature: json['temp_min'],
      maxTemprature: json['temp_max'],
      pressure: json['pressure'],
      humidity: json['humidity'],
    );
  }
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

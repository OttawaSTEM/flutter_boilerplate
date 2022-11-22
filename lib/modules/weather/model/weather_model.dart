import 'package:equatable/equatable.dart';

class WeatherModel extends Equatable {
  final double temprature;
  final String? location;

  const WeatherModel({
    required this.temprature,
    this.location,
  });

  @override
  List<Object> get props => [temprature];

  // double get temp => temprature;

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      temprature: json['temp'],
      location: json['location'],
    );
  }
}

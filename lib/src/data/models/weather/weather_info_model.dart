import 'package:equatable/equatable.dart';

class WeatherInfoModel extends Equatable {
  // DateTime
  final DateTime dateTime;

  // Weather
  final String verboseWeather;

  // Temperature
  final double temperature;
  final double minTemperature;
  final double maxTemperature;

  // Humidity
  final double humidity;

  // Wind
  final double windSpeed;
  final double windDirection;

  const WeatherInfoModel({
    required this.dateTime,
    required this.verboseWeather,
    required this.temperature,
    required this.minTemperature,
    required this.maxTemperature,
    required this.humidity,
    required this.windSpeed,
    required this.windDirection,
  });

  @override
  List<Object> get props {
    return [
      dateTime,
      verboseWeather,
      temperature,
      minTemperature,
      maxTemperature,
      humidity,
      windSpeed,
    ];
  }
}

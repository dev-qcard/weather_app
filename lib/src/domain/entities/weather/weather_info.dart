import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class WeatherInfo extends Equatable {
  // DateTime
  final DateTime dateTime;

  // Weather
  final String verboseWeather;
  final Image weatherImage;

  // Temperature
  final double temperature;
  final double minTemperature;
  final double maxTemperature;

  // Humidity
  final double humidity;
  final String verboseHumidity;

  // Wind
  final double windSpeed;
  final String verboseWindDirection;

  // Location
  final String city;
  final String country;

  const WeatherInfo({
    required this.dateTime,
    required this.verboseWeather,
    required this.weatherImage,
    required this.temperature,
    required this.minTemperature,
    required this.maxTemperature,
    required this.humidity,
    required this.verboseHumidity,
    required this.windSpeed,
    required this.verboseWindDirection,
    required this.city,
    required this.country,
  });

  @override
  List<Object> get props {
    return [
      dateTime,
      verboseWeather,
      weatherImage,
      temperature,
      minTemperature,
      maxTemperature,
      humidity,
      verboseHumidity,
      windSpeed,
      verboseWindDirection,
      city,
      country,
    ];
  }
}

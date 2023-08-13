import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/src/core/constants/humidity_levels.dart';
import 'package:weather_app/src/core/constants/weather_codes.dart';
import 'package:weather_app/src/core/constants/weather_codes_translated.dart';
import 'package:weather_app/src/core/constants/wind_directions.dart';
import 'package:weather_app/src/domain/entities/weather/weather_info.dart';

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

  // Location
  final String city;
  final String country;

  const WeatherInfoModel({
    required this.dateTime,
    required this.verboseWeather,
    required this.temperature,
    required this.minTemperature,
    required this.maxTemperature,
    required this.humidity,
    required this.windSpeed,
    required this.windDirection,
    required this.city,
    required this.country,
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
      city,
      country,
    ];
  }

  Image _getWeatherImage(String verboseWeather) {
    //! TODO Asset images for the weather
    return Image.network(
      'https://img.freepik.com/premium-vector/thunderstorm-icon-forecast-weather-illustration-symbol-cloud-ligthning-vector_744955-684.jpg?w=826',
    );
  }

  String _getVerboseHumidity(double humidity) {
    if (humidity < 30.0) {
      return HumidityLevels.lowHumidity;
    } else if (humidity < 80.0) {
      return HumidityLevels.lowHumidity;
    } else {
      return HumidityLevels.lowHumidity;
    }
  }

  String _getVerboseWindDirection(double degrees) {
    if (315.0 < degrees && degrees <= 45.0) {
      return WindDirections.northDirection;
    } else if (45.0 < degrees && degrees <= 135.0) {
      return WindDirections.eastDirection;
    } else if (135.0 < degrees && degrees <= 225.0) {
      return WindDirections.southDirection;
    } else {
      return WindDirections.westDirection;
    }
  }

  WeatherInfo toWeatherInfo() {
    return WeatherInfo(
      dateTime: dateTime,
      verboseWeather: verboseWeather,
      weatherImage: _getWeatherImage(verboseWeather),
      temperature: temperature,
      minTemperature: minTemperature,
      maxTemperature: maxTemperature,
      humidity: humidity,
      verboseHumidity: _getVerboseHumidity(humidity),
      windSpeed: windSpeed,
      verboseWindDirection: _getVerboseWindDirection(windDirection),
      city: city,
      country: country,
    );
  }

  static String _getVerboseWeather(String weather) {
    if (weather == WeatherCodes.clear) {
      return WeatherCodesTranslated.clear;
    } else if (weather == WeatherCodes.clouds) {
      return WeatherCodesTranslated.clouds;
    } else if (weather == WeatherCodes.rain) {
      return WeatherCodesTranslated.rain;
    } else if (weather == WeatherCodes.snow) {
      return WeatherCodesTranslated.snow;
    } else {
      return WeatherCodesTranslated.thunderstorm;
    }
  }

  static String _getReverseVerboseWeather(String weather) {
    if (weather == WeatherCodesTranslated.clear) {
      return WeatherCodes.clear;
    } else if (weather == WeatherCodesTranslated.clouds) {
      return WeatherCodes.clouds;
    } else if (weather == WeatherCodesTranslated.rain) {
      return WeatherCodes.rain;
    } else if (weather == WeatherCodesTranslated.snow) {
      return WeatherCodes.snow;
    } else {
      return WeatherCodes.thunderstorm;
    }
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dt_txt': dateTime.toString(),
      'weather': [
        {'main': _getReverseVerboseWeather(verboseWeather)}
      ],
      'main': {
        'temp': temperature,
        'temp_min': minTemperature,
        'temp_max': maxTemperature,
        'humidity': humidity,
      },
      'wind': {
        'speed': windSpeed,
        'deg': windDirection,
      },
      'city': {
        'name': city,
        'country': country,
      }
    };
  }

  WeatherInfoModel.fromMap(Map<String, dynamic> map)
      : dateTime = DateTime.parse(map['dt_txt']),
        verboseWeather = _getVerboseWeather(map['weather'][0]['main'] as String),
        temperature = (map['main']['temp'] as num).toDouble(),
        minTemperature = (map['main']['temp_min'] as num).toDouble(),
        maxTemperature = (map['main']['temp_max'] as num).toDouble(),
        humidity = (map['main']['humidity'] as num).toDouble(),
        windSpeed = (map['wind']['speed'] as num).toDouble(),
        windDirection = (map['wind']['deg'] as num).toDouble(),
        city = map['city']['name'] as String,
        country = map['city']['country'] as String;
}

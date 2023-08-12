import 'package:dio/dio.dart';
import 'package:weather_app/src/data/datasources/weather/i_weather_datasource.dart';
import 'package:weather_app/src/data/models/location/user_location_model.dart';
import 'package:weather_app/src/data/models/weather/weather_info_model.dart';

class WeatherDatasource implements IWeatherDatasource {
  final Dio client;

  WeatherDatasource({
    required this.client,
  });

  @override
  Future<List<WeatherInfoModel>> loadWeather(UserLocationModel userLocation) {
    throw UnimplementedError();
  }
}

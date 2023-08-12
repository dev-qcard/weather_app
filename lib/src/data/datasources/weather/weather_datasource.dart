import 'package:dio/dio.dart';
import 'package:weather_app/secrets/api.dart';
import 'package:weather_app/src/data/datasources/weather/i_weather_datasource.dart';
import 'package:weather_app/src/data/models/location/user_location_model.dart';
import 'package:weather_app/src/data/models/weather/weather_info_model.dart';

class WeatherDatasource implements IWeatherDatasource {
  final Dio client;

  WeatherDatasource({
    required this.client,
  });

  @override
  Future<List<WeatherInfoModel>> loadWeather(UserLocationModel userLocation) async {
    try {
      final response = await client.request(
          'https://api.openweathermap.org/data/2.5/forecast?lat=${userLocation.latitude}&lon=${userLocation.longitude}&units=metric&appid=$apiKey');

      final data = response.data['list'].take(4);
      throw Exception();
      final weatherInfoModelList = [];
    } catch (_) {
      throw Exception();
    }
  }
}

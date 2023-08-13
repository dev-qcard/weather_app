import 'package:dio/dio.dart';
import 'package:weather_app/secrets/api.dart';
import 'package:weather_app/src/data/datasources/weather/i_weather_datasource.dart';
import 'package:weather_app/src/data/models/location/location_model.dart';
import 'package:weather_app/src/data/models/weather/weather_info_model.dart';

class WeatherDatasource implements IWeatherDatasource {
  final Dio client;

  WeatherDatasource({
    required this.client,
  });

  @override
  Future<List<WeatherInfoModel>> loadWeather(LocationModel userLocation) async {
    final response = await client.request(
      'https://api.openweathermap.org/data/2.5/forecast?lang=ru&lat=${userLocation.latitude}&lon=${userLocation.longitude}&units=metric&appid=$apiKey',
    );

    final rawWeatherInfoMapList = (response.data['list'] as List<dynamic>).take(4).toList();
    final city = response.data['city']['name'] as String;
    final country = response.data['city']['country'] as String;
    final weatherInfoMapList = rawWeatherInfoMapList.map((e) => (e as Map<String, dynamic>)
      ..addAll(
        {
          'city': {
            'name': city,
            'country': country,
          }
        },
      ));
    final weatherInfoModelList =
        weatherInfoMapList.map((e) => WeatherInfoModel.fromMap(e)).toList();

    return weatherInfoModelList;
  }
}

import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_app/src/data/datasources/cache_manager/i_cache_manager.dart';
import 'package:weather_app/src/data/models/weather/weather_info_model.dart';

class CacheManager implements ICacheManager {
  static const weatherKey = 'WEATHER_LOCAL_DB_KEY';
  final Box database;

  CacheManager({
    required this.database,
  });

  @override
  Future<void> cacheWeatherData(List<WeatherInfoModel> weatherData) async {
    final listOfWeatherMaps = weatherData.map((e) => e.toMap()).toList();
    await database.put(weatherKey, listOfWeatherMaps);
  }

  @override
  Future<List<WeatherInfoModel>> loadWeatherData() async {
    final rawListOfWeatherMaps = await database.get(weatherKey) as List<dynamic>;
    final listOfWeatherMaps = rawListOfWeatherMaps
        .map(
          (e) => (e as Map<dynamic, dynamic>).map(
            (key, value) => MapEntry(key.toString(), value),
          ),
        )
        .toList();
    final listOfWeatherModels = listOfWeatherMaps.map((e) => WeatherInfoModel.fromMap(e)).toList();
    return listOfWeatherModels;
  }
}

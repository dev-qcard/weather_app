import 'package:weather_app/src/data/datasources/cache_manager/i_cache_manager.dart';
import 'package:weather_app/src/data/models/weather/weather_info_model.dart';

class CacheManager implements ICacheManager {
  @override
  Future<void> cacheWeatherData(List<WeatherInfoModel> weatherData) {
    throw UnimplementedError(); // TODO
  }

  @override
  Future<List<WeatherInfoModel>> loadWeatherData() {
    throw UnimplementedError(); // TODO
  }
}

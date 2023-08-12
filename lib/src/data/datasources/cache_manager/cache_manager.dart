import 'package:weather_app/src/data/datasources/cache_manager/i_cache_manager.dart';
import 'package:weather_app/src/data/models/location/user_verbose_location_model.dart';
import 'package:weather_app/src/data/models/weather/weather_info_model.dart';

class CacheManager implements ICacheManager {
  @override
  Future<void> cacheLocationData(UserVerboseLocationModel weatherData) {
    throw UnimplementedError();
  }

  @override
  Future<void> cacheWeatherData(List<WeatherInfoModel> weatherData) {
    throw UnimplementedError();
  }

  @override
  Future<UserVerboseLocationModel> loadLocationData() {
    throw UnimplementedError();
  }

  @override
  Future<List<WeatherInfoModel>> loadWeatherData() {
    throw UnimplementedError();
  }
}

import 'package:weather_app/src/data/models/weather/weather_info_model.dart';

abstract class ICacheManager {
  // Weather
  Future<void> cacheWeatherData(List<WeatherInfoModel> weatherData);
  Future<List<WeatherInfoModel>> loadWeatherData();
}

import 'package:weather_app/src/data/models/location/user_location_model.dart';
import 'package:weather_app/src/data/models/weather/weather_info_model.dart';

abstract class IWeatherDatasource {
  Future<List<WeatherInfoModel>> loadWeather(UserLocationModel userLocation);
}

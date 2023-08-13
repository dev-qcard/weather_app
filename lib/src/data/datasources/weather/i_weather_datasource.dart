import 'package:weather_app/src/data/models/location/location_model.dart';
import 'package:weather_app/src/data/models/weather/weather_info_model.dart';

abstract class IWeatherDatasource {
  Future<List<WeatherInfoModel>> loadWeather(LocationModel userLocation);
}

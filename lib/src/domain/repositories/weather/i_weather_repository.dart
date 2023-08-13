import 'package:dartz/dartz.dart';
import 'package:weather_app/src/core/failures/failure.dart';
import 'package:weather_app/src/domain/entities/location/location.dart';
import 'package:weather_app/src/domain/entities/weather/weather_info.dart';

abstract class IWeatherRepository {
  Future<Either<Failure, List<WeatherInfo>>> loadWeather(Location userLocation);
}

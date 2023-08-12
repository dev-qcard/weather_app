import 'package:dartz/dartz.dart';
import 'package:weather_app/src/core/failures/failure.dart';
import 'package:weather_app/src/data/datasources/cache_manager/i_cache_manager.dart';
import 'package:weather_app/src/data/datasources/connection_checker/i_connection_checker.dart';
import 'package:weather_app/src/data/datasources/weather/i_weather_datasource.dart';
import 'package:weather_app/src/domain/entities/location/user_location.dart';
import 'package:weather_app/src/domain/entities/weather/weather_info.dart';
import 'package:weather_app/src/domain/repositories/weather/i_weather_repository.dart';

class WeatherRepository implements IWeatherRepository {
  final IConnectionChecker connectionChecker;
  final ICacheManager cacheManager;
  final IWeatherDatasource weatherDatasource;

  WeatherRepository({
    required this.connectionChecker,
    required this.cacheManager,
    required this.weatherDatasource,
  });

  @override
  Future<Either<Failure, List<WeatherInfo>>> loadWeather(UserLocation userLocation) {
    throw UnimplementedError();
  }
}

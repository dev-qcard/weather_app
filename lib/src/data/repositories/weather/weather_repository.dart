import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/src/core/failures/api_problem.dart';
import 'package:weather_app/src/core/failures/connection_failure.dart';
import 'package:weather_app/src/core/failures/failure.dart';
import 'package:weather_app/src/core/failures/location_failure.dart';
import 'package:weather_app/src/data/datasources/cache_manager/i_cache_manager.dart';
import 'package:weather_app/src/data/datasources/connection_checker/i_connection_checker.dart';
import 'package:weather_app/src/data/datasources/weather/i_weather_datasource.dart';
import 'package:weather_app/src/data/models/location/user_location_model.dart';
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
  Future<Either<Failure, List<WeatherInfo>>> loadWeather(UserLocation userLocation) async {
    final permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) return const Left(LocationFailure());

    final position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);

    final isConnected = await connectionChecker.isConnected;

    if (!isConnected) {
      try {
        final weatherInfoModels = await cacheManager.loadWeatherData();
        final weatherInfoEntites = weatherInfoModels.map((e) => e.toWeatherInfo()).toList();

        return Right(weatherInfoEntites);
      } catch (_) {
        return const Left(ConnectionFailure());
      }
    }

    try {
      final weatherInfoModels = await weatherDatasource.loadWeather(
        UserLocationModel(
          latitude: position.latitude,
          longitude: position.longitude,
        ),
      );

      await cacheManager.cacheWeatherData(weatherInfoModels);

      final weatherInfoEntites = weatherInfoModels.map((e) => e.toWeatherInfo()).toList();

      return Right(weatherInfoEntites);
    } catch (_) {
      return const Left(ApiProblemFailure());
    }
  }
}

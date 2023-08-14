import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/src/core/failures/common/api_problem.dart';
import 'package:weather_app/src/core/failures/common/connection_failure.dart';
import 'package:weather_app/src/core/failures/common/location_failure.dart';
import 'package:weather_app/src/core/failures/failure.dart';
import 'package:weather_app/src/data/datasources/cache_manager/i_cache_manager.dart';
import 'package:weather_app/src/data/datasources/connection_checker/i_connection_checker.dart';
import 'package:weather_app/src/data/datasources/weather/i_weather_datasource.dart';
import 'package:weather_app/src/data/models/location/location_model.dart';
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
  Future<Either<Failure, List<WeatherInfo>>> loadWeather() async {
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

    final permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      await Geolocator.requestPermission();
      final secondTry = await Geolocator.checkPermission();
      if (secondTry == LocationPermission.denied) {
        return const Left(LocationFailure());
      }
    }

    final position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);

    try {
      final weatherInfoModels = await weatherDatasource.loadWeather(
        LocationModel(
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

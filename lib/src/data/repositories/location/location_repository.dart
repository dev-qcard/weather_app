import 'package:dartz/dartz.dart';
import 'package:weather_app/src/core/failures/failure.dart';
import 'package:weather_app/src/data/datasources/cache_manager/i_cache_manager.dart';
import 'package:weather_app/src/data/datasources/connection_checker/i_connection_checker.dart';
import 'package:weather_app/src/data/datasources/location/i_location_datasource.dart';
import 'package:weather_app/src/domain/entities/location/user_verbose_location.dart';
import 'package:weather_app/src/domain/repositories/location/i_location_repository.dart';

class LocationRepository implements ILocationRepository {
  final IConnectionChecker connectionChecker;
  final ICacheManager cacheManager;
  final ILocationDatasource locationDatasource;

  LocationRepository({
    required this.connectionChecker,
    required this.cacheManager,
    required this.locationDatasource,
  });

  @override
  Future<Either<Failure, UserVerboseLocation>> getLocation() async {
    throw UnimplementedError();
  }
}

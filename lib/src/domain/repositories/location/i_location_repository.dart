import 'package:dartz/dartz.dart';
import 'package:weather_app/src/core/failures/failure.dart';
import 'package:weather_app/src/domain/entities/location/user_verbose_location.dart';

abstract class ILocationRepository {
  Future<Either<Failure, UserVerboseLocation>> getLocation();
}

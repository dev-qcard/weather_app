import 'package:dartz/dartz.dart';
import 'package:weather_app/src/core/failures/failure.dart';
import 'package:weather_app/src/core/success/success.dart';
import 'package:weather_app/src/core/usecases/i_usecase.dart';
import 'package:weather_app/src/domain/entities/location/user_location.dart';

class GetLocation implements IUsecase<Success, UserLocation> {
  @override
  Future<Either<Failure, Success>> call(UserLocation params) {
    throw UnimplementedError();
  }
}

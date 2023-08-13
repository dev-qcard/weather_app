import 'package:dartz/dartz.dart';
import 'package:weather_app/src/core/failures/failure.dart';
import 'package:weather_app/src/core/success/success.dart';
import 'package:weather_app/src/domain/entities/user/user_data.dart';

abstract class IAuthService {
  Future<Either<Failure, Success>> signIn(UserData userData);
  Future<Either<Failure, Success>> signUp(UserData userData);
}

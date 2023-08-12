import 'package:dartz/dartz.dart';
import 'package:weather_app/src/core/failures/failure.dart';
import 'package:weather_app/src/core/success/success.dart';
import 'package:weather_app/src/domain/entities/user/user_data.dart';
import 'package:weather_app/src/domain/services/auth/i_auth_service.dart';

class AuthService implements IAuthService {
  @override
  Future<Either<Failure, Success>> signIn(UserData userData) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Success>> signUp(UserData userData) {
    throw UnimplementedError();
  }
}

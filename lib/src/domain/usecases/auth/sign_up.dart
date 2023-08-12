import 'package:dartz/dartz.dart';
import 'package:weather_app/src/core/failures/failure.dart';
import 'package:weather_app/src/core/success/success.dart';
import 'package:weather_app/src/core/usecases/i_usecase.dart';
import 'package:weather_app/src/domain/entities/user/user_data.dart';

class SignUp implements IUsecase<Success, UserData> {
  @override
  Future<Either<Failure, Success>> call(UserData params) {
    throw UnimplementedError();
  }
}

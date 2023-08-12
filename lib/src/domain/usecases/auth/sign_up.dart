import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/src/core/failures/failure.dart';
import 'package:weather_app/src/core/success/success.dart';
import 'package:weather_app/src/core/usecases/i_usecase.dart';
import 'package:weather_app/src/domain/entities/user/user_data.dart';
import 'package:weather_app/src/domain/services/auth/i_auth_service.dart';

class SignUp implements IUsecase<Success, SignUpParams> {
  final IAuthService authService;

  SignUp({
    required this.authService,
  });

  @override
  Future<Either<Failure, Success>> call(SignUpParams params) {
    return authService.signUp(params.userData);
  }
}

class SignUpParams extends Equatable {
  final UserData userData;

  const SignUpParams({
    required this.userData,
  });

  @override
  List<Object> get props => [userData];
}

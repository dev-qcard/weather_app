import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/src/core/failures/failure.dart';
import 'package:weather_app/src/core/success/success.dart';
import 'package:weather_app/src/core/usecases/i_usecase.dart';
import 'package:weather_app/src/domain/entities/user/user_data.dart';
import 'package:weather_app/src/domain/services/auth/i_auth_service.dart';

class SignIn implements IUsecase<Success, SignInParams> {
  final IAuthService authService;

  SignIn({
    required this.authService,
  });

  @override
  Future<Either<Failure, Success>> call(SignInParams params) async {
    return authService.signIn(params.userData);
  }
}

class SignInParams extends Equatable {
  final UserData userData;

  const SignInParams({
    required this.userData,
  });

  @override
  List<Object> get props => [userData];
}

import 'package:dartz/dartz.dart';
import 'package:weather_app/src/core/failures/failure.dart';
import 'package:weather_app/src/core/params/no_params.dart';
import 'package:weather_app/src/core/success/success.dart';
import 'package:weather_app/src/core/usecases/i_usecase.dart';
import 'package:weather_app/src/domain/services/auth/i_auth_service.dart';

class SignOut implements IUsecase<Success, NoParams> {
  final IAuthService authService;

  SignOut({
    required this.authService,
  });

  @override
  Future<Either<Failure, Success>> call(NoParams params) async {
    return authService.signOut();
  }
}

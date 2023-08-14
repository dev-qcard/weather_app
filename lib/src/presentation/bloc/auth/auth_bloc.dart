import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/core/failures/auth/email_in_use_failure.dart';
import 'package:weather_app/src/core/failures/auth/invalid_email_failure.dart';
import 'package:weather_app/src/core/failures/auth/user_disabled_failure.dart';
import 'package:weather_app/src/core/failures/auth/user_not_found_failure.dart';
import 'package:weather_app/src/core/failures/auth/weak_password_failure.dart';
import 'package:weather_app/src/core/failures/auth/wrong_password_failure.dart';
import 'package:weather_app/src/core/failures/common/api_problem.dart';
import 'package:weather_app/src/core/failures/common/connection_failure.dart';
import 'package:weather_app/src/core/failures/failure.dart';
import 'package:weather_app/src/core/params/no_params.dart';
import 'package:weather_app/src/domain/entities/user/user_data.dart';
import 'package:weather_app/src/domain/usecases/auth/sign_in.dart';
import 'package:weather_app/src/domain/usecases/auth/sign_out.dart';
import 'package:weather_app/src/domain/usecases/auth/sign_up.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignIn signIn;
  final SignUp signUp;
  final SignOut signOut;

  AuthBloc({
    required this.signIn,
    required this.signUp,
    required this.signOut,
  }) : super(const AuthInitial()) {
    on<SignInEvent>((event, emit) => _onSignIn(event, emit));
    on<SignUpEvent>((event, emit) => _onSignUp(event, emit));
    on<SignOutEvent>((event, emit) => _onSignOut(event, emit));
  }

  void _onSignIn(SignInEvent event, Emitter<AuthState> emit) async {
    emit(const AuthLoading());

    final successOrFailure = await signIn(
      SignInParams(
        userData: UserData(
          email: event.email,
          password: event.password,
        ),
      ),
    );

    successOrFailure.fold(
      (l) => emit(AuthError(errorMessage: _getErrorMessage(l))),
      (r) {
        emit(const AuthSuccess());
      },
    );
  }

  void _onSignUp(SignUpEvent event, Emitter<AuthState> emit) async {
    emit(const AuthLoading());

    final successOrFailure = await signUp(
      SignUpParams(
        userData: UserData(
          email: event.email,
          password: event.password,
        ),
      ),
    );

    successOrFailure.fold(
      (l) => emit(AuthError(errorMessage: _getErrorMessage(l))),
      (r) {
        emit(const AuthSuccess());
      },
    );
  }

  void _onSignOut(SignOutEvent event, Emitter<AuthState> emit) async {
    emit(const AuthLoading());

    final successOrFailure = await signOut(
      const NoParams(),
    );

    successOrFailure.fold(
      (l) => emit(AuthError(errorMessage: _getErrorMessage(l))),
      (r) {
        emit(const AuthSuccessSignOut());
      },
    );
  }

  String _getErrorMessage(Failure failure) {
    if (failure is ApiProblemFailure) {
      return 'Удаленная ошибка, попробуйте позже';
    } else if (failure is ConnectionFailure) {
      return 'Ошибка подключения, проверьте сеть';
    } else if (failure is EmailInUseFailure) {
      return 'Адрес почты уже используется';
    } else if (failure is InvalidEmailFailure) {
      return 'Проверьте адрес почты еще раз';
    } else if (failure is UserDisabledFailure) {
      return 'Ваш аккаунт заблокирован';
    } else if (failure is UserNotFoundFailure) {
      return 'Такого пользователя не существует';
    } else if (failure is WeakPasswordFailure) {
      return 'Слабый пароль, введите новый';
    } else if (failure is WrongPasswordFailure) {
      return 'Неверный пароль';
    } else {
      return 'Неизвестная ошибка, попробуйте позже';
    }
  }
}

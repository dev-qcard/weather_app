part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  const AuthInitial();

  @override
  List<Object?> get props => [];
}

class AuthLoading extends AuthState {
  const AuthLoading();

  @override
  List<Object?> get props => [];
}

class AuthSuccess extends AuthState {
  const AuthSuccess();

  @override
  List<Object?> get props => [];
}

class AuthSuccessSignOut extends AuthState {
  const AuthSuccessSignOut();

  @override
  List<Object?> get props => [];
}

class AuthError extends AuthState {
  final String errorMessage;

  const AuthError({
    required this.errorMessage,
  });

  @override
  List<Object?> get props => [errorMessage];
}

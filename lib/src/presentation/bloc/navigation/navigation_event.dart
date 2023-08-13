part of 'navigation_bloc.dart';

sealed class NavigationEvent extends Equatable {
  const NavigationEvent();
}

class AutoSignInEvent extends NavigationEvent {
  const AutoSignInEvent();

  @override
  List<Object?> get props => [];
}

class SignOutEvent extends NavigationEvent {
  const SignOutEvent();

  @override
  List<Object?> get props => [];
}

class SignUpEvent extends NavigationEvent {
  final String email;
  final String password;

  const SignUpEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}

class SignInEvent extends NavigationEvent {
  final String email;
  final String password;

  const SignInEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}

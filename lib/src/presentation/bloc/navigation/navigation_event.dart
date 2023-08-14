part of 'navigation_bloc.dart';

sealed class NavigationEvent extends Equatable {
  const NavigationEvent();
}

class AutoSignInEvent extends NavigationEvent {
  const AutoSignInEvent();

  @override
  List<Object?> get props => [];
}

class SignInPageEvent extends NavigationEvent {
  const SignInPageEvent();

  @override
  List<Object?> get props => [];
}

class SignUpPageEvent extends NavigationEvent {
  const SignUpPageEvent();

  @override
  List<Object?> get props => [];
}

class WeatherPageEvent extends NavigationEvent {
  const WeatherPageEvent();

  @override
  List<Object?> get props => [];
}

part of 'navigation_bloc.dart';

sealed class NavigationState extends Equatable {
  const NavigationState();
}

class NavigationSignUp extends NavigationState {
  const NavigationSignUp();

  @override
  List<Object?> get props => [];
}

class NavigationSignIn extends NavigationState {
  const NavigationSignIn();

  @override
  List<Object?> get props => [];
}

class NavigationWeather extends NavigationState {
  const NavigationWeather();

  @override
  List<Object?> get props => [];
}

class NavigationLoading extends NavigationState {
  const NavigationLoading();

  @override
  List<Object?> get props => [];
}

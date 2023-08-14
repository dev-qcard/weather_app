import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(const NavigationLoading()) {
    on<AutoSignInEvent>((event, emit) => _onAutoSignIn(event, emit));
    on<SignInPageEvent>((event, emit) => _onSignInPageEvent(event, emit));
    on<SignUpPageEvent>((event, emit) => _onSignUpPageEvent(event, emit));
    on<WeatherPageEvent>((event, emit) => _onWeatherPageEvent(event, emit));
  }

  void _onAutoSignIn(AutoSignInEvent event, Emitter<NavigationState> emit) async {
    if (FirebaseAuth.instance.currentUser != null) {
      emit(const NavigationWeather());
    } else {
      emit(const NavigationSignIn());
    }
  }

  void _onSignInPageEvent(SignInPageEvent event, Emitter<NavigationState> emit) async {
    emit(const NavigationSignIn());
  }

  void _onSignUpPageEvent(SignUpPageEvent event, Emitter<NavigationState> emit) async {
    emit(const NavigationSignUp());
  }

  void _onWeatherPageEvent(WeatherPageEvent event, Emitter<NavigationState> emit) async {
    emit(const NavigationWeather());
  }
}

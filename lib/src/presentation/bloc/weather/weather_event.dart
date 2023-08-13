part of 'weather_bloc.dart';

sealed class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class LoadWeatherEvent extends WeatherEvent {
  const LoadWeatherEvent();

  @override
  List<Object?> get props => [];
}

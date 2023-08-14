part of 'weather_bloc.dart';

sealed class WeatherState extends Equatable {
  const WeatherState();
}

class WeatherLoading extends WeatherState {
  const WeatherLoading();

  @override
  List<Object?> get props => [];
}

class WeatherLoaded extends WeatherState {
  final List<WeatherInfo> weather;

  const WeatherLoaded({
    required this.weather,
  });

  @override
  List<Object?> get props => [weather];
}

class WeatherError extends WeatherState {
  final String errorMessage;

  const WeatherError({
    required this.errorMessage,
  });

  @override
  List<Object?> get props => [errorMessage];
}

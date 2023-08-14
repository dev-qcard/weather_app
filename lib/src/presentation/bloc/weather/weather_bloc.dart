import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/core/failures/common/api_problem.dart';
import 'package:weather_app/src/core/failures/common/connection_failure.dart';
import 'package:weather_app/src/core/failures/common/location_failure.dart';
import 'package:weather_app/src/core/failures/failure.dart';
import 'package:weather_app/src/core/params/no_params.dart';
import 'package:weather_app/src/domain/entities/weather/weather_info.dart';
import 'package:weather_app/src/domain/usecases/weather/load_weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final LoadWeather loadWeather;

  WeatherBloc({
    required this.loadWeather,
  }) : super(const WeatherLoading()) {
    on<LoadWeatherEvent>((event, emit) => _onLoadWeather(event, emit));
  }

  void _onLoadWeather(LoadWeatherEvent event, Emitter<WeatherState> emit) async {
    final dataOrFailure = await loadWeather(const NoParams());

    dataOrFailure.fold(
      (l) => emit(WeatherError(errorMessage: _getErrorMessage(l))),
      (r) => emit(WeatherLoaded(weather: r)),
    );
  }

  String _getErrorMessage(Failure failure) {
    if (failure is ApiProblemFailure) {
      return 'Удаленная ошибка, попробуйте позже';
    } else if (failure is ConnectionFailure) {
      return 'Ошибка подключения, проверьте сеть';
    } else if (failure is LocationFailure) {
      return 'Разрешите приложению отслеживать ваше местоположение';
    } else {
      return 'Неизвестная ошибка, попробуйте позже';
    }
  }
}

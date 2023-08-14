import 'package:dartz/dartz.dart';
import 'package:weather_app/src/core/failures/failure.dart';
import 'package:weather_app/src/core/params/no_params.dart';
import 'package:weather_app/src/core/usecases/i_usecase.dart';
import 'package:weather_app/src/domain/entities/weather/weather_info.dart';
import 'package:weather_app/src/domain/repositories/weather/i_weather_repository.dart';

class LoadWeather implements IUsecase<List<WeatherInfo>, NoParams> {
  final IWeatherRepository weatherRepository;

  LoadWeather({
    required this.weatherRepository,
  });

  @override
  Future<Either<Failure, List<WeatherInfo>>> call(NoParams params) async {
    return await weatherRepository.loadWeather();
  }
}

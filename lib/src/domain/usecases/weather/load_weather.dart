import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/src/core/failures/failure.dart';
import 'package:weather_app/src/core/usecases/i_usecase.dart';
import 'package:weather_app/src/domain/entities/location/user_location.dart';
import 'package:weather_app/src/domain/entities/weather/weather_info.dart';
import 'package:weather_app/src/domain/repositories/weather/i_weather_repository.dart';

class LoadWeather implements IUsecase<List<WeatherInfo>, LoadWeatherParams> {
  final IWeatherRepository weatherRepository;

  LoadWeather({
    required this.weatherRepository,
  });

  @override
  Future<Either<Failure, List<WeatherInfo>>> call(LoadWeatherParams params) async {
    return await weatherRepository.loadWeather(params.userLocation);
  }
}

class LoadWeatherParams extends Equatable {
  final UserLocation userLocation;

  const LoadWeatherParams({
    required this.userLocation,
  });

  @override
  List<Object> get props => [userLocation];
}

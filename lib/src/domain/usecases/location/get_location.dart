import 'package:dartz/dartz.dart';
import 'package:weather_app/src/core/failures/failure.dart';
import 'package:weather_app/src/core/params/no_params.dart';
import 'package:weather_app/src/core/usecases/i_usecase.dart';
import 'package:weather_app/src/domain/entities/location/user_verbose_location.dart';
import 'package:weather_app/src/domain/repositories/location/i_location_repository.dart';

class GetLocation implements IUsecase<UserVerboseLocation, NoParams> {
  final ILocationRepository locationRepository;

  GetLocation({
    required this.locationRepository,
  });

  @override
  Future<Either<Failure, UserVerboseLocation>> call(NoParams params) async {
    return await locationRepository.getLocation();
  }
}

import 'package:dio/dio.dart';
import 'package:weather_app/src/data/datasources/location/i_location_datasource.dart';
import 'package:weather_app/src/data/models/location/user_verbose_location_model.dart';

class LocationDatasource implements ILocationDatasource {
  final Dio client;

  LocationDatasource({
    required this.client,
  });

  @override
  Future<UserVerboseLocationModel> getLocation() {
    throw UnimplementedError();
  }
}

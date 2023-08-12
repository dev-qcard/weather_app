import 'package:weather_app/src/data/models/location/user_verbose_location_model.dart';

abstract class ILocationDatasource {
  Future<UserVerboseLocationModel> getLocation();
}

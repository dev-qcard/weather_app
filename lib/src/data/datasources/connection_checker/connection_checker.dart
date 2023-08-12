import 'package:weather_app/src/data/datasources/connection_checker/i_connection_checker.dart';

class ConnectionChecker implements IConnectionChecker {
  @override
  Future<bool> get isConnected => throw UnimplementedError();
}

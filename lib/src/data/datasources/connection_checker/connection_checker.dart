import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:weather_app/src/data/datasources/connection_checker/i_connection_checker.dart';

class ConnectionChecker implements IConnectionChecker {
  final InternetConnectionChecker internetConnectionChecker;

  ConnectionChecker({
    required this.internetConnectionChecker,
  });

  @override
  Future<bool> get isConnected async => await internetConnectionChecker.hasConnection;
}

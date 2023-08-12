import 'package:equatable/equatable.dart';

class UserLocation extends Equatable {
  final double lattitude;
  final double longitude;

  const UserLocation({
    required this.lattitude,
    required this.longitude,
  });

  @override
  List<Object> get props => [lattitude, longitude];
}

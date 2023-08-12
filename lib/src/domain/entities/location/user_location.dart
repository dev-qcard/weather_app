import 'package:equatable/equatable.dart';

class UserLocation extends Equatable {
  final String userLocation;

  const UserLocation({
    required this.userLocation,
  });

  @override
  List<Object> get props => [userLocation];
}

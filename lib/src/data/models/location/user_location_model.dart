import 'package:equatable/equatable.dart';

class UserLocationModel extends Equatable {
  final double latitude;
  final double longitude;

  const UserLocationModel({
    required this.latitude,
    required this.longitude,
  });

  @override
  List<Object> get props => [latitude, longitude];
}

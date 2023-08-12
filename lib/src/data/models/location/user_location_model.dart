import 'package:equatable/equatable.dart';

class UserLocationModel extends Equatable {
  final double lattitude;
  final double longitude;

  const UserLocationModel({
    required this.lattitude,
    required this.longitude,
  });

  @override
  List<Object> get props => [lattitude, longitude];
}

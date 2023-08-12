import 'package:equatable/equatable.dart';

class UserVerboseLocationModel extends Equatable {
  final double lattitude;
  final double longitude;
  final String userVerboseLocation;

  const UserVerboseLocationModel({
    required this.lattitude,
    required this.longitude,
    required this.userVerboseLocation,
  });

  @override
  List<Object> get props => [
        lattitude,
        longitude,
        userVerboseLocation,
      ];
}

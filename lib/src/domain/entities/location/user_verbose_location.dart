import 'package:equatable/equatable.dart';

class UserVerboseLocation extends Equatable {
  final double lattitude;
  final double longitude;
  final String userVerboseLocation;

  const UserVerboseLocation({
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

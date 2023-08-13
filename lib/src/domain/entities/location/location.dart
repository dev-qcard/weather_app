import 'package:equatable/equatable.dart';

class Location extends Equatable {
  final double lattitude;
  final double longitude;

  const Location({
    required this.lattitude,
    required this.longitude,
  });

  @override
  List<Object> get props => [lattitude, longitude];
}

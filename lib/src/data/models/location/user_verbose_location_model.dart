// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:weather_app/src/domain/entities/location/user_verbose_location.dart';

class UserVerboseLocationModel extends Equatable {
  final double latitude;
  final double longitude;
  final String userVerboseLocation;

  const UserVerboseLocationModel({
    required this.latitude,
    required this.longitude,
    required this.userVerboseLocation,
  });

  @override
  List<Object> get props => [
        latitude,
        longitude,
        userVerboseLocation,
      ];

  UserVerboseLocation toVerboseLocation() {
    return UserVerboseLocation(
      lattitude: latitude,
      longitude: longitude,
      userVerboseLocation: userVerboseLocation,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'latitude': latitude,
      'longitude': longitude,
      'userVerboseLocation': userVerboseLocation,
    };
  }

  factory UserVerboseLocationModel.fromMap(Map<String, dynamic> map) {
    return UserVerboseLocationModel(
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
      userVerboseLocation: map['userVerboseLocation'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserVerboseLocationModel.fromJson(String source) =>
      UserVerboseLocationModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

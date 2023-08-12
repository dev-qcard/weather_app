import 'package:equatable/equatable.dart';

class UserData extends Equatable {
  final String email;
  final String password;

  const UserData({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}

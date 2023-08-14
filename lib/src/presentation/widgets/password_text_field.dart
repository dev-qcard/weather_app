import 'package:flutter/material.dart';
import 'package:weather_app/src/presentation/styles/app_colors.dart';
import 'package:weather_app/src/presentation/styles/fonts.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController controller;

  const PasswordTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _passwordVisible = false;
  late Icon _currentIcon = _openPassword;

  static const _openPassword = Icon(
    Icons.remove_red_eye,
    color: AppColors.blue,
  );
  static const _closePassword = Icon(
    Icons.remove_red_eye_outlined,
    color: AppColors.grey,
  );

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      cursorColor: AppColors.blue,
      cursorWidth: 2,
      obscureText: !_passwordVisible,
      decoration: InputDecoration(
        hintText: 'Пароль',
        hintStyle: Fonts.b1.copyWith(
          color: AppColors.grey,
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.blue,
            width: 2,
          ),
        ),
        suffixIcon: IconButton(
          splashRadius: 20,
          onPressed: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
              _currentIcon = !_passwordVisible ? _openPassword : _closePassword;
            });
          },
          icon: _currentIcon,
        ),
      ),
    );
  }
}

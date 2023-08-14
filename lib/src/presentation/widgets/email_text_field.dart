import 'package:flutter/material.dart';
import 'package:weather_app/src/presentation/styles/app_colors.dart';
import 'package:weather_app/src/presentation/styles/fonts.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController controller;

  const EmailTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: AppColors.blue,
      cursorWidth: 2,
      decoration: InputDecoration(
        hintText: 'Email',
        hintStyle: Fonts.b1.copyWith(
          color: AppColors.grey,
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.blue,
            width: 2,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:weather_app/src/presentation/styles/app_colors.dart';
import 'package:weather_app/src/presentation/styles/fonts.dart';

class HelperButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  const HelperButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 48,
          width: 150,
          child: TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
              splashFactory: NoSplash.splashFactory,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30), // <-- Radius
              ),
            ),
            child: Text(
              text,
              style: Fonts.b1.copyWith(
                color: AppColors.blue,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

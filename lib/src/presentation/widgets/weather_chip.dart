// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:weather_app/src/presentation/common/common.dart';
import 'package:weather_app/src/presentation/styles/fonts.dart';

class WeatherChip extends StatelessWidget {
  final String time;
  final Image icon;
  final String temperature;
  final void Function() onTap;
  final bool isActive;

  const WeatherChip({
    Key? key,
    required this.time,
    required this.icon,
    required this.temperature,
    required this.onTap,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(
          top: 5,
          right: 2,
          left: 2,
          bottom: 10,
        ),
        decoration: isActive
            ? BoxDecoration(
                color: Colors.white.withAlpha(50),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.white.withAlpha(200),
                  width: 2,
                ),
              )
            : null,
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              time,
              style: Fonts.b2.copyWith(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            Common.smallPadding,
            icon,
            Common.smallPadding,
            Text(
              temperature,
              style: Fonts.b2.copyWith(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

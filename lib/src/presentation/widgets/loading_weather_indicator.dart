import 'package:flutter/material.dart';

class LoadingWeatherIndicator extends StatelessWidget {
  const LoadingWeatherIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.white,
      ),
    );
  }
}

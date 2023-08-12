import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  final dio = Dio();

  final response = await dio.request(
      'https://api.openweathermap.org/data/2.5/forecast?lat=70&lon=70.99&units=metric&appid=7eb352720659d41dc10be384511ab72a');

  print(response.data['cod']);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}

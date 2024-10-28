import 'package:flutter/material.dart';
import 'package:weatherly/Utils/size_utils.dart';
import 'package:weatherly/views/weather_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => Sizer(
        builder: (context, orientation, deviceType) {
          return child ?? const SizedBox();
        },
      ),
      debugShowCheckedModeBanner: false,
      home: const WeatherPage(),
    );
  }
}

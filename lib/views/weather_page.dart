import 'package:flutter/material.dart';
import 'package:weatherly/services/weather_service.dart';

import '../model /weather_model.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {

  //simple approach and not safe  for production, .env file to store api
  final _weatherService = WeatherService("6d7b7ff40bc21819121c998eed4e69dd");
  Weather? _weather;


  _fetchWeather() async {


    String _cityName = await  _weatherService.getCurrentCity();

    try {

final weather = await  _weatherService.getWeather(_cityName);
setState(() {
  _weather = weather;
});
      
    } catch (e) {
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

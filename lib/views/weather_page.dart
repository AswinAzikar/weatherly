import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weatherly/constant/constants.dart';
import 'package:weatherly/gen/assets.gen.dart';
import 'package:weatherly/services/weather_service.dart';

import '../model /weather_model.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  //simple approach and not safe  for production, use .env file to store api key
  final _weatherService = WeatherService("6d7b7ff40bc21819121c998eed4e69dd");
  Weather? _weather;

  _fetchWeather() async {
    String cityName = await _weatherService.getCurrentCity();

    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      logger.f(e);
    }
  }

  String getWeatherAnimation(String? mainCondition) {
//weathers considered : clouds, mist , smog , haze , dust , fog
    switch (mainCondition?.toLowerCase()) {
      case 'clear':
        return Assets.sunny;

      case 'clouds':
        return Assets.cloudy;
      case 'mist':
        return Assets.misty;
      case 'smog':
        return Assets.fog;
      case 'haze':
        return Assets.haze;
      case 'dust':
        return Assets.dusty;

      case 'rain':
        return Assets.rainy;

      case 'drizzle':
        return Assets.rainy;

      case 'thunderstorm':
        return Assets.thunder;
      case 'showering':
        return Assets.rainy;
      default:
        return Assets.sunny;
    }
  }

  @override
  void initState() {
    _fetchWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            //     crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_weather?.cityName ?? "Loading...."),
              Lottie.asset(getWeatherAnimation(_weather?.mainCondition)),
              Text("${_weather?.temperature.round().toString()} °C"),
              Text(_weather?.mainCondition ?? "...loading")
            ],
          ),
        ],
      ),
    );
  }
}

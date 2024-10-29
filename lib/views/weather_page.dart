import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:weatherly/Theme/theme.dart';
import 'package:weatherly/Utils/size_utils.dart';
import 'package:weatherly/constant/constants.dart';
import 'package:weatherly/controller/theme_controller.dart';
import 'package:weatherly/gen/assets.gen.dart';
import 'package:weatherly/services/weather_service.dart';

import '../model /weather_model.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final ThemeController _themeController = Get.put(ThemeController());
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
      case 'drizzle':
      case 'showering':
        return Assets.rainy;
      case 'thunderstorm':
        return Assets.thunder;
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
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        _weather?.cityName ?? "Loading....",
                        style: TextStyle(fontSize: 30.fSize),
                      ),
                      Lottie.asset(
                          getWeatherAnimation(_weather?.mainCondition)),
                      Text(
                        "${_weather?.temperature.round().toString()} °C",
                        style: TextStyle(fontSize: 20.fSize),
                      ),
                      Text(
                        _weather?.mainCondition ?? "...loading",
                        style: TextStyle(fontSize: 30.fSize),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: 20,
            right: 0,
            child: Obx(() => IconButton(
                  icon: Icon(
                      _themeController.currentTheme.value == ThemeMode.dark
                          ? Icons.dark_mode
                          : Icons.light_mode),
                  onPressed: () {
                    _themeController.switchTheme();
                    Get.changeThemeMode(_themeController.currentTheme.value);
                  },
                )),
          ),
        ],
      ),
    );
  }
}

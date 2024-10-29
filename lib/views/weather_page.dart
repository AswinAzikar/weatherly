import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'package:weatherly/Utils/size_utils.dart';
import 'package:weatherly/constant/constants.dart';
import 'package:weatherly/controller/theme_controller.dart';

import 'package:weatherly/services/weather_service.dart';

import '../gen/assets.gen.dart';
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
        return Assets.lotties.sunny;
      case 'clouds':
        return Assets.lotties.cloudy;
      case 'mist':
        return Assets.lotties.misty;
      case 'smog':
        return Assets.lotties.fog;
      case 'haze':
        return Assets.lotties.haze;
      case 'dust':
        return Assets.lotties.dusty;
      case 'rain':
      case 'drizzle':
      case 'showering':
        return Assets.lotties.rainy;
      case 'thunderstorm':
        return Assets.lotties.thunder;
      default:
        return Assets.lotties.sunny;
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
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          RefreshIndicator.adaptive(
            onRefresh: () => _fetchWeather(),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 0.3.fSize * SizeUtils.height,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            _weather?.cityName ?? "Loading....",
                            style: TextStyle(
                              fontSize: 40.fSize,
                              color: const Color.fromARGB(255, 194, 21, 9),
                              fontWeight: FontWeight.bold,
                              fontFamily: 'LEDDotMatrix',
                            ),
                          ),
                          Lottie.asset(
                              getWeatherAnimation(_weather?.mainCondition)),
                          Text(
                            _weather?.temperature.round().toString() != null
                                ? "${_weather?.temperature.round().toString()} °C"
                                : "---",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.fSize,
                              fontFamily: 'LEDDotMatrix',
                            ),
                          ),
                          Text(
                            _weather?.mainCondition ?? "...loading",
                            style: TextStyle(
                                fontFamily: 'LEDDotMatrix',
                                fontSize: 30.fSize,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 25.fSize,
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

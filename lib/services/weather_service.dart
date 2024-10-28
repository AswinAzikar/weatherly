import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../model /weather_model.dart';

class WeatherService {
  static const BASE_URL = "https://api.openweathermap.org/data/2.5/weather";
  final String apiKey;

  WeatherService(this.apiKey);

  Future<Weather> getWeather(String cityName) async {
    Dio dio = Dio();

    final response =
        await dio.get('$BASE_URL?q=$cityName&appid=$apiKey&units=metric');
    return response.statusCode == 200
        ? Weather.fromJson(response.data)
        : throw Exception('Failed to load Weather data');
  }

  Future<String> getCurrentCity() async {
    LocationPermission permission = await Geolocator.checkPermission();

    permission == LocationPermission.denied
        ? permission = await Geolocator.requestPermission()
        : permission;

//fetch current location
    Position position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
      accuracy: LocationAccuracy.high,
    ));
//convert the location into placemark objects list

    List<Placemark> placeMarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    //extract city name
    String? city = placeMarks[0].locality;
    return city ?? "";
  }
}

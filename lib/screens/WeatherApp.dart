import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:havadurumu/models/HavaDurumuModel.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  final dio = Dio();
  WeatherModel? weather;

  Future<void> havaDurumu(String cityName) async {
    try {
      final response = await dio.get(
          "http://api.weatherapi.com/v1/forecast.json?key=02ffe55727744477b4c101908231312%20&q=${cityName}&days=5&aqi=no&alerts=no");
      print(response.data);
      setState(() {
        weather = WeatherModel.fromJson(response.data);
      });
    } catch (error) {
      print("Error fetching weather data: $error");
    }
  }

  @override
  void initState() {
    super.initState();
    havaDurumu("Konya");
  }

  @override
  Widget build(BuildContext context) {
    if (weather != null) {
      return Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/${weather!.image}.png",
                scale: 3,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            weather!.temperature.round().toString() + "°C",
            style: const TextStyle(fontSize: 50, fontWeight: FontWeight.w200),
          ),
          const SingleChildScrollView(
            child: Column(
              children: [
                
              ],
            ),
          ),
        ],
      );
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}

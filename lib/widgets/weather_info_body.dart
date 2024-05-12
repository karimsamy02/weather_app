import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/data_layer/model/weather_model.dart';
import 'package:weather_app/main.dart';

class WeatherInfoBody extends StatelessWidget {
  final WeatherModel weather;

  const WeatherInfoBody({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            getThemeColor(weather.weatherCondition)!,
            getThemeColor(weather.weatherCondition)![300]!,
            getThemeColor(weather.weatherCondition)![50]!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              weather.cityName,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Updated at: ${weather.date}',
              style: const TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/weather2.png',
                  width: 50, // Adjust the width as needed
                  height: 50, // Adjust the height as needed
                ),
                const SizedBox(width: 10),
                Flexible(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Temperature: ${weather.tamp.toString()}'),
                      Text('Max Temp: ${weather.maxTamp}'),
                      Text('Min Temp: ${weather.minTamp}'),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              weather.weatherCondition,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

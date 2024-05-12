import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather/get_weather_cubit.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String? cityName;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'search a city ',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            onSubmitted: (value) async {
              var getweather = BlocProvider.of<GetWeatherCubit>(context);
              getweather.GetWeather(cityname: value);
              Navigator.pop(context);
            },
            decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              border: OutlineInputBorder(),
              hintText: 'Enter a city',
              label: Text('search'),
              suffixIcon: Icon(Icons.search),
            ),
          ),
        ),
      ),
    );
  }
}

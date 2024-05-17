import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather/get_weather_cubit.dart';
import 'package:weather_app/Splach/View/splach_screen.dart';



void main() {
  runApp(
       MyApp()

  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder:(context)=> BlocBuilder<GetWeatherCubit, GetWeatherState>(
  builder: (context, state) {

    return MaterialApp(
          theme: ThemeData(
            primarySwatch: getThemeColor(BlocProvider.of<GetWeatherCubit>(context).weatherModel?.weatherCondition),
          ),
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        );
  },
),
      ),
    );
  }
}


 MaterialColor getThemeColor(String? condition) {
  if(condition==null){
    return Colors.blue;
  }
switch (condition) {
case "Sunny":
return Colors.orange;
case "Partly cloudy":
case "Cloudy":
case "Overcast":
case "Mist":
case "Fog":
case "Freezing fog":
return Colors.grey;
case "Patchy rain possible":
case "Light rain":
case "Patchy light rain":
case "Patchy light drizzle":
case "Light drizzle":
case "Patchy light rain with thunder":
return Colors.lightBlue;
case "Patchy snow possible":
case "Patchy light snow":
case "Patchy moderate snow":
case "Patchy heavy snow":
case "Light snow":
case "Blowing snow":
case "Blizzard":
return Colors.blue;
case "Patchy sleet possible":
case "Patchy freezing drizzle possible":
case "Light freezing rain":
case "Moderate or heavy freezing rain":
case "Light sleet":
case "Moderate or heavy sleet":
return Colors.indigo;
case "Heavy freezing drizzle":
case "Heavy rain at times":
case "Heavy rain":
case "Heavy snow":
case "Torrential rain shower":
case "Moderate or heavy rain shower":
case "Moderate or heavy sleet showers":
case "Moderate or heavy snow showers":
case "Moderate or heavy showers of ice pellets":
case "Moderate or heavy snow with thunder":
return Colors.deepPurple;
case "Thundery outbreaks possible":
return Colors.amber;
case "Light rain shower":
case "Light sleet showers":
case "Light snow showers":
case "Light showers of ice pellets":
case "Light showers of ice pellets":
return Colors.blueGrey;
default:
return Colors.blue;
}
}
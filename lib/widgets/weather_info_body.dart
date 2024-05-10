import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather/get_weather_cubit.dart';
import 'package:weather_app/data_layer/model/weather_model.dart';
import 'package:weather_app/main.dart';

class Weather_Info_Body extends StatelessWidget
{
final  WeatherModel weather;
  const Weather_Info_Body({super.key,   required this.weather});
  @override
  Widget build(BuildContext context) {
    WeatherModel? weatherModel=
        BlocProvider.of<GetWeatherCubit>(context).weatherModel;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            getThemeColor(weatherModel!.weatherCondition),
            getThemeColor(weatherModel.weatherCondition)[300]!,
            getThemeColor(weatherModel.weatherCondition)[50]!,
          ],begin: Alignment.topCenter,end: Alignment.bottomCenter,

        ),
      ),
      child:
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(
                flex: 3,
              ),
              Text( weatherModel!.cityName,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                ('Updated at : ${weatherModel.date}'),
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.network(weatherModel.image!),
                  Text(
                    weatherModel.tamp.toString() ,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Column(
                    children: [
                      Text('max temp :${weatherModel.maxTamp} ' ),
                      Text('min temp :${weatherModel.minTamp}'),
                    ],
                  ),
                ],
              ),
              Spacer( flex: 3,),
              Text(
               weatherModel.weatherCondition,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(
                flex: 5,
              ),
            ],
          ),

    );


  }

}
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather/get_weather_cubit.dart';
import 'package:weather_app/data_layer/services/get_api.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/widgets/noweather.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

class Home_page extends StatefulWidget
{
  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder: (context){
              return Search();
            }));
          },
              icon: Icon(Icons.search))
        ],
        title: Text('Weather app'),
      ),
      body: BlocBuilder<GetWeatherCubit,GetWeatherState>(
        builder: ( context, state) {
          if(state is GetWeatherInitial){
            return NoWeatherBody();
          }else if(state is WeatherLoadedState ){
            return Weather_Info_Body(weather: state.weatherModel,);
          } else{
            return Text('oops there was an error');
          }

        },

      ),

    );

  }
}
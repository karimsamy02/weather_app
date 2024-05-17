import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/Search/Model/weather_model.dart';

class WeatherService {
  Dio dio;
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = '1647fd9490584ea7bff52409240904';

  WeatherService(this.dio);

  Future<WeatherModel?> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);

      return weatherModel;
    } on DioError catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'Oops, there was an error. Please try again later.';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('Oops, there was an error. Please try again later.');
    }
  }
}

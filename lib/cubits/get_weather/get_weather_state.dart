part of 'get_weather_cubit.dart';

@immutable
sealed class GetWeatherState {}

final class GetWeatherInitial extends GetWeatherState {}
final class WeatherLoadedState extends GetWeatherState {
  final WeatherModel weatherModel;

  WeatherLoadedState(this.weatherModel);
}
final class WeatherFailureState extends GetWeatherState {
  final  String failurmassage;

  WeatherFailureState(this.failurmassage);
}

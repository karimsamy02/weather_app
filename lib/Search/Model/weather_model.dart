class WeatherModel {
  final String cityName;
  final String date;
  String? imageUrl; // Change to non-final
  final double tamp;
  final double maxTamp;
  final double minTamp;
  final String weatherCondition;

  WeatherModel({
    required this.cityName,
    required this.date,
    this.imageUrl, // Make it nullable
    required this.tamp,
    required this.maxTamp,
    required this.minTamp,
    required this.weatherCondition,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      imageUrl: json['forecast']['forecastday'][0]['day']['condition']['icon'],
      cityName: json['location']['name'],
      date: json['current']['last_updated'],
      tamp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxTamp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTamp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      weatherCondition: json['forecast']['forecastday'][0]['day']['condition']['text'],
    );
  }
}

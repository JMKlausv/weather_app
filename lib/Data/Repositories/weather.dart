import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';

import '../Data Providers/app_constants.dart';
import '../Services/api.dart';

class WeatherRepo {
  final ApiClient apiClient;
  WeatherRepo({required this.apiClient});
  String? apiKey = dotenv.env['API_KEY'];
  Future<Response> getWeather(double lat, double lon) async {
// weather?lat=8.9503902&lon=38.7462426&appid=553a124b0d3c86a6e8e776656bf5bf62
    var value = await apiClient.getData(
        "${AppConstants.getWeather}?lat=$lat&lon=$lon&appid=$apiKey&units=metric");
    return value;
  }

  Future<Response> seachWeatherByCity(String cityName) async {
    var value = await apiClient.getData(
        "${AppConstants.getWeather}?q=$cityName&appid=$apiKey&units=metric");
    return value;
  }
}

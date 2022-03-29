import 'package:http/http.dart' as http;

class WeatherDataProvider {
  final String API_KEY = '9f720cdaaad301a44b0722f1b5d3dc80';

  Future<http.Response> getRawWeatherData(String city) async {
    http.Response rawWeatherData = await http.get(
      Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$API_KEY&units=metric'),
    );
    return rawWeatherData;
  }
}

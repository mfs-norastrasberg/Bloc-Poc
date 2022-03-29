import 'package:http/http.dart' as http;

class WeatherDataProvider {
  final String API_KEY = ''; //get api key
  final String URL_API = ''; // replace with URL from article (readme.md)

  Future<http.Response> getRawWeatherData(String city) async {
    http.Response rawWeatherData = await http.get(
      Uri.parse(URL_API),
    );
    return rawWeatherData;
  }
}

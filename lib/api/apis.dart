import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class WeatherApis {
  var client = http.Client();
  String base = 'https://api.openweathermap.org/data/2.5/';
  String apikey = dotenv.env['WEATHER_API_KEY'] ?? 'no_api_key';
  String location;
  String units;
  WeatherApis(this.location, this.units);

  void getCurrentWeather() {
    final Future<http.Response> x = client.get(Uri.parse(
        '${base}weather?q=${location}&appid=${apikey}&units=${units}'));
  }
}

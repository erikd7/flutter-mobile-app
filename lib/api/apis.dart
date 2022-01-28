import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:weatherlite/models.dart';

class WeatherApi {
  var client = http.Client();
  String base = 'https://api.openweathermap.org/data/2.5/';
  String apikey = dotenv.env['WEATHER_API_KEY'] ?? 'no_api_key';
  String location;
  String units;
  WeatherApi(this.location, this.units);

  Future<Weather> getCurrentWeather() async {
    final response = await client.get(
        Uri.parse(
            '${base}weather?q=${location}&appid=${apikey}&units=${units}'),
        headers: {"Accept": "application/json"});

    var responseData = json.decode(response.body);
    return Weather.fromJson(responseData);
  }
}

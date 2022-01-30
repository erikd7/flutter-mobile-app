import 'package:flutter/material.dart';

import 'package:weatherlite/util/convert.dart';

class WDaylight {
  final TimeOfDay? sunrise;
  final TimeOfDay? sunset;

  WDaylight(this.sunrise, this.sunset);
}

class Weather {
  final String? locationName;
  final String? description;
  final int? temp;
  final int? feelsLike;
  final int? clouds;
  final WDaylight? daylight;

  Weather(this.locationName, this.description, this.temp, this.feelsLike,
      this.clouds, this.daylight);

  Weather.fromJson(Map<String, dynamic> json)
      : locationName = json['name'],
        description = json['weather'][0]['description'],
        temp = json['main']['temp'].round(),
        feelsLike = json['main']['feels_like'].round(),
        clouds = json['clouds']['all'].round(),
        daylight = WDaylight(
            Converter.unixTimestampToTod(json['sys']['sunrise']),
            Converter.unixTimestampToTod(json['sys']['sunset']));
}

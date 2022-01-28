class Weather {
  final double? temp;
  final double? feelsLike;

  Weather(this.temp, this.feelsLike);

  Weather.fromJson(Map<String, dynamic> json)
      : temp = json['main']['temp'],
        feelsLike = json['main']['feels_like'];

  @override
  String toString() {
    return 'temp: $temp, feelslike: $feelsLike';
  }
}

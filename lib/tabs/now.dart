import 'package:flutter/material.dart';

import 'package:weatherlite/api/apis.dart';
import 'package:weatherlite/components/Styled.dart';
import 'package:weatherlite/components/Temperature.dart';
import 'package:weatherlite/components/Daylight.dart';
import 'package:weatherlite/models.dart';

class Now extends StatefulWidget {
  const Now({Key? key, required this.apis}) : super(key: key);

  final WeatherApi apis;

  @override
  State<Now> createState() => _NowState();
}

class _NowState extends State<Now> with SingleTickerProviderStateMixin {
  Future<Weather>? weatherData;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          // center the children
          children: <Widget>[
            weatherData == null
                ? NowIcon()
                : FutureBuilder<Weather>(
                    future: weatherData,
                    builder: (context, weather) {
                      if (weather.hasData) {
                        return Column(children: [
                          Styled.card(Temperature(data: weather.data)),
                          Styled.card(Daylight(data: weather.data?.daylight)),
                        ]);
                      } else if (weather.hasError) {
                        return Text(
                            'Weather API error: ${weather.error.toString()}');
                      } else {
                        return const CircularProgressIndicator();
                      }
                    }),
            FloatingActionButton(
              onPressed: () => setState(() {
                weatherData = widget.apis.getCurrentWeather();
              }),
              tooltip: 'Add Location',
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}

class NowIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Icon(Icons.home);
  }
}

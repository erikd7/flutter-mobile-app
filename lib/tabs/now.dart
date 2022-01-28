import 'package:flutter/material.dart';

import 'package:weatherlite/api/apis.dart';
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            NowIcon(),
            Text("Current Weather"),
            FloatingActionButton(
              onPressed: () => setState(() {
                weatherData = widget.apis.getCurrentWeather();
              }),
              tooltip: 'Add Location',
              child: const Icon(Icons.add),
            ),
            weatherData == null
                ? const Text('no weather data')
                : FutureBuilder<Weather>(
                    future: weatherData,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text(
                            'Temp is ${snapshot.data?.temp}. Feels like ${snapshot.data?.feelsLike}.');
                      } else if (snapshot.hasError) {
                        return Text(
                            'Delivery error: ${snapshot.error.toString()}');
                      } else {
                        return const CircularProgressIndicator();
                      }
                    })
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

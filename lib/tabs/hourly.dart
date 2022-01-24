import 'package:flutter/material.dart';

class Hourly extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          // center the children
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            HourlyIcon(),
            Text("Hourly Forecast")
          ],
        ),
      ),
    );
  }
}

class HourlyIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Icon(Icons.access_time_filled);
  }
}

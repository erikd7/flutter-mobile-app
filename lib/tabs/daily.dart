import 'package:flutter/material.dart';

class Daily extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          // center the children
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DailyIcon(),
            Text("Daily Forecast")
          ],
        ),
      ),
    );
  }
}

class DailyIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Icon(Icons.calendar_today);
  }
}

import 'package:flutter/material.dart';

import 'package:weatherlite/models.dart';

class Daylight extends StatefulWidget {
  const Daylight({Key? key, required this.data}) : super(key: key);

  final WDaylight? data;

  @override
  State<Daylight> createState() => _DaylightState();
}

class _DaylightState extends State<Daylight>
    with SingleTickerProviderStateMixin {
  Future<WDaylight>? daylightData;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Column(
            // center the children
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('sunrise ${(widget.data?.sunrise)?.format(context)}')
            ],
          )
        ]),
      ),
    );
  }
}

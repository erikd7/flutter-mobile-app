import 'package:flutter/material.dart';

import 'package:weatherlite/models.dart';

class Temperature extends StatefulWidget {
  const Temperature({Key? key, required this.data}) : super(key: key);

  final Weather? data;

  @override
  State<Temperature> createState() => _TemperatureState();
}

class _TemperatureState extends State<Temperature>
    with SingleTickerProviderStateMixin {
  Future<Weather>? weatherData;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('${widget.data?.temp}\u00B0',
                    style: const TextStyle(fontSize: 30))
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('feels like ${widget.data?.temp}\u00B0',
                    style: const TextStyle(fontSize: 40))
              ],
            ),
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('${widget.data?.clouds}% cloud cover',
                      style: const TextStyle(fontSize: 40))
                ],
              ),
            ],
          )
        ]),
      ),
    );
  }
}

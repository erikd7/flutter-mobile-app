import 'package:flutter/material.dart';

class Locations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                LocationsIcon(),
                Text("Locations")
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: FloatingActionButton(
            onPressed: () => {},
            tooltip: 'Add Location',
            child: const Icon(Icons.add),
        )),
      ]
    );
  }
}

class LocationsIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Icon(Icons.search);
  }
}

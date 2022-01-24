import 'package:flutter/material.dart';

class Now extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          // center the children
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            NowIcon(),
            Text("Current Weather")
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

import 'package:flutter/material.dart';

class Styled {
  static Widget card(Widget child) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          constraints: BoxConstraints(
            minHeight: 90,
            minWidth: 10,
            maxHeight: double.infinity,
            maxWidth: double.infinity,
          ),
          width: double.infinity,
          child: Card(
            child: child,
          ),
        ));
  }
}

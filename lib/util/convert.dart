import 'package:flutter/material.dart';

class Converter {
  static TimeOfDay unixTimestampToTod(int timestamp) {
    return TimeOfDay.fromDateTime(
        DateTime.fromMillisecondsSinceEpoch(timestamp * 1000));
  }
}

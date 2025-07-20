import 'package:flutter/material.dart';

class ColorManager {
  static const white = Colors.white;
  static const black = Colors.black;
  static const transparent = Colors.transparent;
  static const accent = grey;
  static const background = white;
  static const grey = Colors.grey;
  static const red = Colors.red;
  static final cardBackground = grey.shade200;
  static final selectedSegment = grey.shade400;
  static const primaryText = black;
  static const highPriority = Colors.red;
  static const mediumPriority = Colors.orange;
  static const lowPriority = Colors.green;
  static const priorities = <int, Color>{
    3: highPriority,
    2: mediumPriority,
    1: lowPriority,
  };
}

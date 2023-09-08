import 'package:flutter/material.dart';
class ScreenSize {
  static double getScreenWidth(BuildContext context, double widthFactor) {
    return MediaQuery.of(context).size.width * widthFactor;
  }

  static double getScreenHeight(BuildContext context, double heightFactor) {
    return MediaQuery.of(context).size.height * heightFactor;
  }
}
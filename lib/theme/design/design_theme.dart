import 'package:flutter/material.dart';

class DesignTheme {
  static Color mainColor = Color(0xFFF38000);

  static TextStyle buttonText = TextStyle(
    color: Colors.white,
    fontSize: 14,
  );

  static TextStyle carouselTitleWhite = TextStyle(
    color: Colors.white,
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );

  static TextStyle carouselFieldWhite = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static const BoxShadow resumeButtonsShadow = BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.03),
    blurRadius: 15.0,
    spreadRadius: 1.0,
    offset: Offset(0.0, 5.0),
  );
}

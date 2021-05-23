import 'package:flutter/material.dart';

abstract class Pallette {
  static const MaterialColor primary = MaterialColor(0xFF1E272F, <int, Color>{
    50: Color.fromRGBO(234, 234, 235, 1.0),
    100: Color.fromRGBO(212, 213, 214, 1.0),
    200: Color.fromRGBO(191, 192, 194, 1.0),
    300: Color.fromRGBO(170, 171, 174, 1.0),
    400: Color.fromRGBO(149, 151, 154, 1.0),
    500: Color.fromRGBO(127, 130, 133, 1.0),
    600: Color.fromRGBO(106, 109, 113, 1.0),
    700: Color.fromRGBO(85, 88, 93, 1.0),
    800: Color.fromRGBO(63, 67, 72, 1.0),
    900: Color.fromRGBO(42, 46, 52, 1.0)
  });

  static const Color accent = Color.fromRGBO(245, 179, 1, 1.0);
  static const Color background = Color.fromRGBO(30, 35, 40, 1.0);

  static const Color content = Colors.white;

  static const Color error = Colors.redAccent;
}

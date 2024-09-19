import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xff39A552);
  static const Color white = Color(0xffffffff);
  static const Color black = Color(0xff303030);
  static const Color navy = Color(0xff4F5A69);
  static const Color red = Color(0xffC91C22);
  static const Color darkBlue = Color(0xff003E90);
  static const Color pink = Color(0xffED1E79);
  static const Color brown = Color(0xffCF7E48);
  static const Color lightBlue = Color(0xff4882CF);
  static const Color yellow = Color(0xffF2D352);
  static const Color grey = Color(0xff79828B);

  static ThemeData lightTheme = ThemeData(
    primaryColor: primary,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      backgroundColor: primary,
      foregroundColor: white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(22),
          right: Radius.circular(22),
        ),
      ),
      titleTextStyle: TextStyle(
        color: white,
        fontSize: 22,
        fontWeight: FontWeight.w400,
      ),
      centerTitle: true,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: white,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: black,
      ),
    ),
  );
}

import 'package:flutter/material.dart';

abstract class Apptheme {
  static ThemeData lightTheme() => ThemeData(
      fontFamily: 'Matter',
      textTheme: const TextTheme(
        headline1: headline1,
        headline2: headline2,
        headline3: headline3,
      ));

  static const gray = Color(0xffF0F2F5);
  static const black = Color(0xff111111);
  static const deepGray = Color(0xff444444);
  static const darkGray = Color(0xff656565);
  static const white = Color(0xffffffff);
  static const lightGray = Color(0xff9C9C9C);
  static const orange = Color(0xffEC4E27);
  static const lightOrange = Color(0xffF47E61);
  static const purple = Color(0xff6B34C3);
  static const lightPurple = Color(0xff8E5EDB);
  static const blue = Color(0xff3465C3);
  static const lightBlue = Color(0xff5785DE);
  static const fadedBlue = Color(0xff87C6F5);

  static const headline1 = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 16,
    color: black,
    fontFamily: 'Matter',
  );
  static const headline2 = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 14,
    color: black,
    fontFamily: 'Matter',
  );
  static const headline3 = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 16,
    color: white,
    fontFamily: 'Matter',
  );
}

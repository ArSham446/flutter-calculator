import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  primaryColor: const Color(0xff8B5FBF),
  hintColor: const Color(0xffD6C6E1),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      color: Color(0xff4A4A4A),
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: TextStyle(
      color: Color(0xff4A4A4A),
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: TextStyle(
      color: Color(0xff878787),
      fontSize: 16,
    ),
    bodyMedium: TextStyle(
      color: Color(0xff878787),
      fontSize: 14,
    ),
  ),
  scaffoldBackgroundColor: const Color(0xffF5F3F7),
  appBarTheme: const AppBarTheme(
    color: Color(0xff8B5FBF),
    iconTheme: IconThemeData(
      color: Color(0xff4A4A4A),
    ),
  ),
  colorScheme: const ColorScheme(
    primary: Color(0xff8B5FBF), //primary 100
    primaryContainer: Color(0xff61398F), //primary 200
    secondary: Color(0xffD6C6E1), //accent 100
    secondaryContainer: Color(0xff9A73B5), //accent 200
    background: Color(0xffffffff), //bg 300
    surface: Color(0xffF5F3F7), //bg 100
    onBackground: Color(0xff4A4A4A), //text 100
    onError: Color(0xff878787), //text 200
    onPrimary: Color(0xffE9E4ED), //bg 200
    onSecondary: Color(0xffffffff), //primary 300
    onSurface: Color(0xff878787),
    brightness: Brightness.light,
    error: Color(0xffFFFFFF),
  ),
);

final ThemeData DarkTheme = ThemeData(
  primaryColor: const Color(0xff8B5FBF),
  hintColor: const Color(0xffD6C6E1),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      color: Color(0xff4A4A4A),
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: TextStyle(
      color: Color(0xff4A4A4A),
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: TextStyle(
      color: Color(0xff878787),
      fontSize: 16,
    ),
    bodyMedium: TextStyle(
      color: Color(0xff878787),
      fontSize: 14,
    ),
  ),
  scaffoldBackgroundColor: const Color(0xff0B0F2B),
  appBarTheme: const AppBarTheme(
    color: Color(0xff8B5FBF),
    iconTheme: IconThemeData(
      color: Color(0xff4A4A4A),
    ),
  ),
  colorScheme: const ColorScheme(
    primary: Color(0xffFFC107), //primary 100
    primaryContainer: Color(0xffdda400), //primary 200
    secondary: Color(0xff00BCD4), //accent 100
    secondaryContainer: Color(0xff005e74), //accent 200
    background: Color(0xff333554), //bg 300
    surface: Color(0xff0B0F2B), //bg 100
    onBackground: Color(0xffFFFFFF), //text 100
    onError: Color(0xff9c9c9c), //text 200
    onPrimary: Color(0xff1a1e3b), //bg 200
    onSecondary: Color(0xff916400), //primary 300
    onSurface: Color(0xff878787),
    brightness: Brightness.light,
    error: Color(0xffFFFFFF),
  ),
);

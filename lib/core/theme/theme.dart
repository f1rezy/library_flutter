import 'package:flutter/material.dart';

const primaryColor = Colors.black;
const lightGrey = Color(0xFFF7F7F9);

final themeData = ThemeData(
  primaryColor: primaryColor,
  colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
  useMaterial3: true,
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w600,
      fontFamily: 'Roboto',
    ),
    displayMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w300,
      fontFamily: 'Roboto',
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      fontFamily: 'Roboto',
    ),
    labelMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontFamily: 'Roboto',
      height: 2,
    ),
  ),
);

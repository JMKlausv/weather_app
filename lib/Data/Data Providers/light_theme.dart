import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: 'CenturyGothic',
  scaffoldBackgroundColor: ColorResources.lightBgColor,
  primaryColor: ColorResources.primaryColor,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: ColorResources.primaryColor,
    secondary: ColorResources.accentColor,
    background: ColorResources.lightBgColor,
    onBackground: ColorResources.lightTextColor,
    surface: ColorResources.lightCardBgColor,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: ColorResources.lightBgColor,
    titleTextStyle: const TextStyle(
      color: ColorResources.lightTextColor,
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: const IconThemeData(
      color: ColorResources.lightTextColor,
    ),
  ),
  textTheme: const TextTheme(
    headlineSmall:
        TextStyle(fontSize: 18.0, color: ColorResources.lightTextColor),
    headlineMedium:
        TextStyle(fontSize: 28.0, color: ColorResources.lightTextColor),
    displaySmall:
        TextStyle(fontSize: 18.0, color: ColorResources.lightTextColor),
    displayMedium:
        TextStyle(fontSize: 28.0, color: ColorResources.primaryColor),
    displayLarge:
        TextStyle(fontSize: 36.0, color: ColorResources.lightTextColor),
    titleMedium: TextStyle(
        fontSize: 15.0,
        fontWeight: FontWeight.w500,
        color: ColorResources.lightTextColor),
    titleLarge: TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.normal,
        color: ColorResources.lightTextColor),
    titleSmall: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: ColorResources.lightSubtitleColor),
    bodyMedium: TextStyle(fontSize: 21.0, color: ColorResources.lightTextColor),
    bodyLarge:
        TextStyle(fontSize: 14.0, color: ColorResources.lightSubtitleColor),
    bodySmall: TextStyle(fontSize: 14.0, color: ColorResources.lightTextColor),
  ),
  cardTheme: CardTheme(
    color: ColorResources.lightCardBgColor,
    elevation: 2,
  ),
  radioTheme: RadioThemeData(
    fillColor:
        MaterialStateColor.resolveWith((states) => ColorResources.primaryColor),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: ColorResources.lightCardBgColor,
    selectedItemColor: ColorResources.primaryColor,
    unselectedItemColor: ColorResources.lightSubtitleColor,
  ),
);

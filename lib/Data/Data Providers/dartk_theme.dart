import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData darkTheme = ThemeData(
  fontFamily: 'CenturyGothic',
  scaffoldBackgroundColor: ColorResources.darkBgColor,
  primaryColor: ColorResources.primaryColor,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: ColorResources.primaryColor,
    secondary: ColorResources.accentColor,
    background: ColorResources.darkBgColor,
    onBackground: ColorResources.darkTextColor,
    surface: ColorResources.darkCardBgColor,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: ColorResources.darkBgColor,
    titleTextStyle: const TextStyle(
      color: ColorResources.darkTextColor,
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: const IconThemeData(
      color: ColorResources.darkTextColor,
    ),
  ),
  textTheme: const TextTheme(
    headlineSmall:
        TextStyle(fontSize: 18.0, color: ColorResources.darkTextColor),
    headlineMedium:
        TextStyle(fontSize: 32.0, color: ColorResources.darkTextColor),
    displaySmall:
        TextStyle(fontSize: 18.0, color: ColorResources.darkTextColor),
    displayMedium:
        TextStyle(fontSize: 28.0, color: ColorResources.primaryColor),
    displayLarge:
        TextStyle(fontSize: 36.0, color: ColorResources.darkTextColor),
    titleMedium: TextStyle(
        fontSize: 15.0,
        fontWeight: FontWeight.w500,
        color: ColorResources.darkTextColor),
    titleLarge: TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.normal,
        color: ColorResources.darkTextColor),
    titleSmall: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: ColorResources.darkSubtitleColor),
    bodyMedium: TextStyle(fontSize: 24.0, color: ColorResources.darkTextColor),
    bodyLarge:
        TextStyle(fontSize: 14.0, color: ColorResources.darkSubtitleColor),
    bodySmall: TextStyle(fontSize: 12.0, color: ColorResources.darkTextColor),
  ),
  cardTheme: CardTheme(
    color: ColorResources.darkCardBgColor,
    elevation: 2,
  ),
  radioTheme: RadioThemeData(
    fillColor:
        MaterialStateColor.resolveWith((states) => ColorResources.primaryColor),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: ColorResources.darkCardBgColor,
    selectedItemColor: ColorResources.primaryColor,
    unselectedItemColor: ColorResources.darkSubtitleColor,
  ),
);

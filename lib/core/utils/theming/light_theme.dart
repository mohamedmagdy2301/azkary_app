import 'package:azkary_app/core/utils/colors.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: 'Cairo',
  primaryColor: ColorsAppLight.primaryColor,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    elevation: 0,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    elevation: 0,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    selectedIconTheme: IconThemeData(
      color: ColorsAppLight.primaryColor,
      size: 27,
    ),
    unselectedIconTheme: IconThemeData(
      color: Colors.grey,
      size: 21,
    ),
  ),
);

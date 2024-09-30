import 'package:azkary_app/core/utils/colors.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  fontFamily: 'poppins',
  scaffoldBackgroundColor: ColorsAppDark.backgroundColor,
  primaryColor: ColorsAppLight.primaryColor,
  brightness: Brightness.dark,
  iconTheme: const IconThemeData(color: Colors.white),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: ColorsAppDark.backgroundColor,
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
  appBarTheme: const AppBarTheme(
    backgroundColor: ColorsAppDark.backgroundColor,
    foregroundColor: Colors.white,
    elevation: 0,
  ),
);

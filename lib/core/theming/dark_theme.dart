import 'package:azkary_app/core/utils/colors.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  fontFamily: 'Cairo',
  scaffoldBackgroundColor: ColorsAppDark.backgroundColor,
  primaryColor: ColorsAppLight.primaryColor,
  brightness: Brightness.dark,
  iconTheme: const IconThemeData(color: Colors.white),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: ColorsAppDark.backgroundColor,
    elevation: 0,
    type: BottomNavigationBarType.fixed,
    showSelectedLabels: false,
    showUnselectedLabels: false,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: ColorsAppDark.backgroundColor,
    foregroundColor: Color.fromARGB(255, 229, 229, 229),
    elevation: 0,
  ),
);

import 'package:azkary_app/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: 'Cairo',
  primaryColor: ColorsAppLight.primaryColor,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    elevation: 0,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    elevation: 0,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    selectedIconTheme: IconThemeData(
      color: ColorsAppLight.primaryColor,
      size: 27.sp,
    ),
    unselectedIconTheme: IconThemeData(
      color: Colors.grey,
      size: 21.sp,
    ),
  ),
);

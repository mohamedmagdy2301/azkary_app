import 'package:azkary_app/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData darkTheme = ThemeData(
  fontFamily: 'Cairo',
  scaffoldBackgroundColor: ColorsAppDark.backgroundColor,
  primaryColor: ColorsAppLight.primaryColor,
  brightness: Brightness.dark,
  iconTheme: const IconThemeData(color: Colors.white),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: ColorsAppDark.backgroundColor,
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
  appBarTheme: const AppBarTheme(
    backgroundColor: ColorsAppDark.backgroundColor,
    foregroundColor: Colors.white,
    elevation: 0,
  ),
);

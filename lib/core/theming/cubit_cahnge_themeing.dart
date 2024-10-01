import 'package:azkary_app/core/theming/dark_theme.dart';
import 'package:azkary_app/core/theming/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeState {
  final ThemeData themeData;

  ThemeState({required this.themeData});
}

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(themeData: lightTheme));

  // Toggle between light and dark theme
  void toggleTheme() {
    final isLightTheme = state.themeData == lightTheme;
    emit(ThemeState(themeData: isLightTheme ? darkTheme : lightTheme));
  }
}

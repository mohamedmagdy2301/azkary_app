import 'package:azkary_app/core/local_storage/shared_preferences_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum AppTheme { light, dark }

class ThemeCubit extends Cubit<ThemeMode> {
  static const String _themeKey = "theme_mode";

  ThemeCubit() : super(ThemeMode.system);

  Future<void> loadTheme() async {
    final themeIndex = await SharedPreferencesManager.getData(key: _themeKey);
    if (themeIndex != null) {
      emit(ThemeMode.values[themeIndex]);
    } else {
      emit(ThemeMode.system);
    }
  }

  Future<void> toggleTheme(AppTheme theme) async {
    if (theme == AppTheme.dark) {
      emit(ThemeMode.dark);
      await SharedPreferencesManager.setData(
        key: _themeKey,
        value: ThemeMode.dark.index,
      );
    } else {
      emit(ThemeMode.light);
      await SharedPreferencesManager.setData(
        key: _themeKey,
        value: ThemeMode.light.index,
      );
    }
  }
}

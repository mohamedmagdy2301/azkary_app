import 'package:azkary_app/core/local_storage/shared_preferences_manager.dart';
import 'package:azkary_app/core/notification_helper/awesome_notification_manager.dart';
import 'package:azkary_app/core/theming/cubit_cahnge_themeing.dart';
import 'package:azkary_app/main_development.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    ScreenUtil.ensureScreenSize(),
    AwesomeNotificationManager.initialize(),
    SharedPreferencesManager.sharedPreferencesInitialize(),
  ]);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  final themeCubit = ThemeCubit();
  await themeCubit.loadTheme();
  runApp(MyApp(
    themeCubit: themeCubit,
  ));
}

//flutter build apk --flavor production --target lib/main_production.dart --release

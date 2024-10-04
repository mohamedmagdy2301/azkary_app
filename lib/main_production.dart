import 'package:azkary_app/main_development.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
// await Future.wait([
//     LocalNotificationService.initialize(),
//     WorkManagerService.initialize(),
//   ]);
  runApp(const MyApp());
}

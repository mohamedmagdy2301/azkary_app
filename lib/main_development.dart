import 'package:azkary_app/Azkary_app.dart';
import 'package:azkary_app/core/utils/theming/light_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      home: const NavBarMainApp(),
    );
  }
}

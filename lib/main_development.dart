import 'package:azkary_app/Azkary_app.dart';
import 'package:azkary_app/core/utils/theming/light_theme.dart';
import 'package:azkary_app/features/azkar/presentation/veiw/screens/azkar_details_screen.dart';
import 'package:azkary_app/features/azkar/presentation/veiw/screens/azkar_screen.dart';
import 'package:azkary_app/features/home/presentation/veiw/screens/home_screen.dart';
import 'package:azkary_app/features/sabha/presentation/veiw/screens/sabha_screen.dart';
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
      routes: routes,
      initialRoute: '/',
    );
  }

  Map<String, WidgetBuilder> get routes => {
        '/': (context) => const NavBarMainApp(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        AzkarScreen.routeName: (context) => const AzkarScreen(),
        SabhaScreen.routeName: (context) => const SabhaScreen(),
        AzkarDetailsScreen.routeName: (context) => const AzkarDetailsScreen(),
      };
}

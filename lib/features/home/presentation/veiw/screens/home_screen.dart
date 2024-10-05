import 'package:azkary_app/features/home/presentation/veiw/widgets/appbar_home_screen.dart';
import 'package:azkary_app/features/home/presentation/veiw/widgets/sabha_screen_body_circle.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarHome(),
      body: BodyHomeScreen(),
    );
  }
}

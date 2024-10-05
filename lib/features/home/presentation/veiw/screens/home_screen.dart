import 'package:azkary_app/features/home/presentation/veiw/widgets/appbar_home_screen.dart';
import 'package:azkary_app/features/home/presentation/veiw/widgets/body_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarHome(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 10.h,
        ),
        child: const BodyHomeScreen(),
      ),
    );
  }
}

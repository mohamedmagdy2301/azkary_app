import 'package:azkary_app/core/local_storage/shared_preferences_manager.dart';
import 'package:azkary_app/core/utils/colors.dart';
import 'package:azkary_app/features/sabha/presentation/veiw/widgets/appbar_sabha.dart';
import 'package:azkary_app/features/sabha/presentation/veiw/widgets/sabha_screen_body_circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SabhaScreen extends StatefulWidget {
  const SabhaScreen({super.key});
  static const String routeName = '/sabha';

  @override
  State<SabhaScreen> createState() => _SabhaScreenState();
}

class _SabhaScreenState extends State<SabhaScreen> {
  int counter = SharedPreferencesManager.getData(key: 'counter') ?? 0;

  void incrementCounter() {
    setState(() {
      counter++;
      SharedPreferencesManager.setData(key: 'counter', value: counter);
    });
  }

  void clearCounter() {
    setState(() {
      counter = 0;
      SharedPreferencesManager.setData(key: 'counter', value: counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarSabha(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 150.h),
            GestureDetector(
              onTap: () => incrementCounter(),
              child: SabhaScreenBodyCircle(counter: counter),
            ),
            SizedBox(height: 70.h),
            IconButton(
              onPressed: () => clearCounter(),
              icon: CircleAvatar(
                backgroundColor: const Color.fromARGB(255, 216, 216, 216),
                radius: 25.w,
                child: Icon(
                  Icons.replay,
                  size: 35.sp,
                  color: ColorsAppLight.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

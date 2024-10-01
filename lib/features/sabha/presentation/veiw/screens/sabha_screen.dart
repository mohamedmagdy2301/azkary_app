import 'package:azkary_app/core/utils/colors.dart';
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
  int counter = 0;

  @override
  //
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 200.h),
            GestureDetector(
              onTap: () {
                setState(() {
                  counter++;
                });
              },
              child: SabhaScreenBodyCircle(counter: counter),
            ),
            SizedBox(height: 70.h),
            IconButton(
              onPressed: () {
                setState(() {
                  counter = 0;
                });
              },
              icon: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 216, 216, 216),
                radius: 30.w,
                child: Icon(
                  Icons.replay,
                  size: 40.sp,
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

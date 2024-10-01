import 'package:azkary_app/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SabhaScreenBodyCircle extends StatelessWidget {
  const SabhaScreenBodyCircle({
    super.key,
    required this.counter,
  });

  final int counter;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      width: 200.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: ColorsAppLight.primaryColor,
            blurRadius: 25.sp,
            spreadRadius: 15.sp,
          ),
        ],
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 225, 254, 154),
            Color.fromARGB(255, 165, 187, 110),
            ColorsAppLight.primaryColor,
            Color.fromARGB(255, 110, 125, 73),
            Color.fromARGB(255, 97, 110, 65),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            counter.toString(),
            style: TextStyle(
              fontSize: 60.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: "Amiri",
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            'سبح',
            style: TextStyle(
              fontSize: 20.sp,
              color: Colors.white,
              fontFamily: "Amiri",
            ),
          ),
        ],
      ),
    );
  }
}

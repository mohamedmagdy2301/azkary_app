import 'package:azkary_app/core/functions/convert_to_12_hour.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrayerTimeRow extends StatelessWidget {
  const PrayerTimeRow({
    super.key,
    required this.time,
    required this.title,
    required this.colorText,
  });
  final String time, title;
  final Color colorText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: colorText,
            ),
          ),
          Text(
            convertTo12HourFormat(time)
                .replaceAll("AM", "ص")
                .replaceAll("PM", " م  "),
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: colorText,
            ),
          ),
        ],
      ),
    );
  }
}

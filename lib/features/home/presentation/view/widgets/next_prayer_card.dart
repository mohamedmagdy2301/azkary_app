import 'dart:async';

import 'package:azkary_app/core/functions/get_current_prayer_arbic.dart';
import 'package:azkary_app/core/functions/get_status_prayer_time.dart';
import 'package:azkary_app/core/utils/colors.dart';
import 'package:azkary_app/features/home/domain/prayer_times_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NextPrayerCard extends StatefulWidget {
  const NextPrayerCard({
    super.key,
    required this.prayerTimes,
  });
  final List<PrayerTimesEntity> prayerTimes;

  @override
  State<NextPrayerCard> createState() => _NextPrayerCardState();
}

class _NextPrayerCardState extends State<NextPrayerCard> {
  Timer? timer;
  String remainingTime = '';

  String? nextPrayerNames;

  Map<String, String> prayerTimings = {};

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer t) => updatePrayerTime(),
    );
    updatePrayerTime();
  }

  void updatePrayerTime() {
    setState(() {
      remainingTime = findPrayerTimes();
      nextPrayerNames = getCurrentPrayerByArabic();
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.h,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 193, 231, 98),
            ColorsAppLight.primaryColor,
            Color.fromARGB(255, 107, 131, 49),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.1, 0.7, 1],
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 15.w,
        vertical: 18.h,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on_outlined,
                color: Colors.white,
                size: 20.sp,
              ),
              Text(
                ' شبين الكوم, المنوفيه',
                style: TextStyle(
                  fontSize: 15.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'متبقي علي',
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'صلاة $nextPrayerNames',
                    style: TextStyle(
                      fontSize: 25.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    remainingTime,
                    style: TextStyle(
                      fontSize: 26.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    'ساعة',
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

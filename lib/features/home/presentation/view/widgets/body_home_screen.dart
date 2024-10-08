import 'package:azkary_app/features/home/domain/prayer_times_entity.dart';
import 'package:azkary_app/features/home/presentation/view/widgets/next_prayer_card.dart';
import 'package:azkary_app/features/home/presentation/view/widgets/prayer_times_card.dart';
import 'package:azkary_app/features/home/presentation/view/widgets/today_doaa_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BodyHomeScreen extends StatelessWidget {
  const BodyHomeScreen({
    super.key,
    required this.prayerTimes,
  });
  final List<PrayerTimesEntity> prayerTimes;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          NextPrayerCard(prayerTimes: prayerTimes),
          SizedBox(height: 15.h),
          PrayerTimesCard(prayerTimes: prayerTimes),
          SizedBox(height: 15.h),
          const TodayDoaaCard(),
        ],
      ),
    );
  }
}

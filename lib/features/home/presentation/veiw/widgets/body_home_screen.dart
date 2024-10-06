import 'package:azkary_app/features/home/presentation/veiw/widgets/next_prayer_card.dart';
import 'package:azkary_app/features/home/presentation/veiw/widgets/prayer_times_card.dart';
import 'package:azkary_app/features/home/presentation/veiw/widgets/today_doaa_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BodyHomeScreen extends StatelessWidget {
  const BodyHomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const NextPrayerCard(),
          SizedBox(height: 15.h),
          const PrayerTimesCard(),
          SizedBox(height: 15.h),
          const TodayDoaaCard(),
        ],
      ),
    );
  }
}

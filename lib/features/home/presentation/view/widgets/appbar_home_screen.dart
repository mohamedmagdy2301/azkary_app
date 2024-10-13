import 'package:azkary_app/core/utils/colors.dart';
import 'package:azkary_app/features/home/domain/prayer_times_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarHome extends StatelessWidget implements PreferredSizeWidget {
  const AppBarHome({super.key, required this.prayerTimes});
  final List<PrayerTimesEntity> prayerTimes;

  @override
  Widget build(BuildContext context) {
    PrayerTimesEntity time = prayerTimes[0];
    return AppBar(
      elevation: 0,
      toolbarHeight: 85.h,
      forceMaterialTransparency: true,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h),
          Text(
            '${time.dayWeek} ${time.dayMonth},${time.month}',
            style: TextStyle(
              fontSize: 25.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 3.h),
          Text(
            ' ${time.dayWeekHijri}  ${time.monthHijri}  ${time.yearHijri}',
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
              color: ColorsAppLight.primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(85.h);
}

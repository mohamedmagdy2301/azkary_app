import 'package:azkary_app/core/utils/colors.dart';
import 'package:azkary_app/features/home/domain/prayer_times_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarHome extends StatelessWidget implements PreferredSizeWidget {
  const AppBarHome({super.key, required this.prayerTimes});
  final List<PrayerTimesEntity> prayerTimes;

  @override
  Widget build(BuildContext context) {
    String dayWeek = prayerTimes[0].dayWeek;
    String dayMonth = prayerTimes[0].dayMonth;
    String month = prayerTimes[0].month;
    String dayHijri = prayerTimes[0].dayWeekHijri;
    String monthHijri = prayerTimes[0].monthHijri;
    String yearHijri = prayerTimes[0].yearHijri;

    return AppBar(
      elevation: 0,
      toolbarHeight: 70.h,
      forceMaterialTransparency: true,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h),
          Text(
            '$dayWeek $dayMonth,$month',
            style: TextStyle(
              fontSize: 25.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 3.h),
          Text(
            '$dayHijri $monthHijri $yearHijri',
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
  Size get preferredSize => Size.fromHeight(70.h);
}

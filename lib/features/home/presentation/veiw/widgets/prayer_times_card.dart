import 'package:azkary_app/core/utils/colors.dart';
import 'package:azkary_app/core/utils/strings.dart';
import 'package:azkary_app/features/home/presentation/veiw/widgets/prayer_time_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrayerTimesCard extends StatelessWidget {
  const PrayerTimesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 350.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Colors.grey.shade100,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 160.w,
            height: 40.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r),
              ),
              color: ColorsAppLight.primaryColor,
            ),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(
                  Icons.watch_later_outlined,
                  color: Colors.white,
                ),
                Text(
                  StringsAppAR.prayerTimes,
                  style: TextStyle(
                    fontSize: 17.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 30.w,
              ),
              child: Column(
                children: [
                  SizedBox(height: 8.h),
                  PrayerTimeRow(
                    title: StringsAppAR.alFajr,
                    time: "0${DateTime.now().hour + 1}:45 ص",
                    colorText: Colors.grey,
                  ),
                  const Divider(
                    thickness: .3,
                    height: 0,
                  ),
                  PrayerTimeRow(
                    title: StringsAppAR.alFajr,
                    time: "0${DateTime.now().hour + 1}:45 ص",
                    colorText: Colors.grey,
                  ),
                  const Divider(
                    thickness: .3,
                    height: 0,
                  ),
                  PrayerTimeRow(
                    title: StringsAppAR.alFajr,
                    time: "0${DateTime.now().hour + 1}:45 ص",
                    colorText: ColorsAppLight.primaryColor,
                  ),
                  const Divider(
                    thickness: .3,
                    height: 0,
                  ),
                  PrayerTimeRow(
                    title: StringsAppAR.alFajr,
                    time: "0${DateTime.now().hour + 1}:45 ص",
                    colorText: Colors.black,
                  ),
                  const Divider(
                    thickness: .3,
                    height: 0,
                  ),
                  PrayerTimeRow(
                    title: StringsAppAR.alFajr,
                    time: "0${DateTime.now().hour + 1}:45 ص",
                    colorText: Colors.black,
                  ),
                  const Divider(
                    thickness: .3,
                    height: 0,
                  ),
                  PrayerTimeRow(
                    title: StringsAppAR.alFajr,
                    time: "0${DateTime.now().hour + 1}:45 ص",
                    colorText: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

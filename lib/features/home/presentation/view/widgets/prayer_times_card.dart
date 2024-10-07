import 'package:azkary_app/core/functions/get_status_prayer_name.dart';
import 'package:azkary_app/core/theming/cubit_cahnge_themeing.dart';
import 'package:azkary_app/core/utils/colors.dart';
import 'package:azkary_app/core/utils/strings.dart';
import 'package:azkary_app/features/home/domain/prayer_times_entity.dart';
import 'package:azkary_app/features/home/presentation/view/widgets/prayer_time_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrayerTimesCard extends StatefulWidget {
  const PrayerTimesCard({super.key, required this.prayerTimes});
  final List<PrayerTimesEntity> prayerTimes;

  @override
  State<PrayerTimesCard> createState() => _PrayerTimesCardState();
}

class _PrayerTimesCardState extends State<PrayerTimesCard> {
  final List nextPrayerTime = findPrayerNames()['nextPrayer']!;

  Color updatePrayerTime(prayerName, isLightTheme) {
    for (var prayer in nextPrayerTime) {
      if (prayer == prayerName) {
        if (nextPrayerTime[0] == prayerName) {
          return ColorsAppLight.primaryColor;
        }
        return isLightTheme ? Colors.black : Colors.white;
      }
    }
    return Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    final isLightTheme = context.watch<ThemeCubit>().state == ThemeMode.light;
    String fajr = widget.prayerTimes[0].fajrTime;
    String sunrise = widget.prayerTimes[0].sunriseTime;
    String dhuhr = widget.prayerTimes[0].dhuhrTime;
    String asr = widget.prayerTimes[0].asrTime;
    String maghrib = widget.prayerTimes[0].maghribTime;
    String isha = widget.prayerTimes[0].ishaTime;

    return Container(
      width: double.infinity,
      height: 350.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: isLightTheme
            ? Colors.grey.shade100
            : const Color.fromARGB(255, 31, 31, 31),
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
                    time: " $fajr ص",
                    colorText: updatePrayerTime('Fajr', isLightTheme),
                  ),
                  const Divider(
                    thickness: .3,
                    height: 0,
                  ),
                  PrayerTimeRow(
                    title: StringsAppAR.alShoroq,
                    time: "$sunrise ص",
                    colorText: updatePrayerTime('Sunrise', isLightTheme),
                  ),
                  const Divider(
                    thickness: .3,
                    height: 0,
                  ),
                  PrayerTimeRow(
                    title: StringsAppAR.alZaher,
                    time: " $dhuhr ص",
                    colorText: updatePrayerTime('Dhuhr', isLightTheme),
                  ),
                  const Divider(
                    thickness: .3,
                    height: 0,
                  ),
                  PrayerTimeRow(
                    title: StringsAppAR.alAsr,
                    time: "$asr  م ",
                    colorText: updatePrayerTime('Asr', isLightTheme),
                  ),
                  const Divider(
                    thickness: .3,
                    height: 0,
                  ),
                  PrayerTimeRow(
                    title: StringsAppAR.alMagreb,
                    time: " $maghrib  م ",
                    colorText: updatePrayerTime('Maghrib', isLightTheme),
                  ),
                  const Divider(
                    thickness: .3,
                    height: 0,
                  ),
                  PrayerTimeRow(
                    title: StringsAppAR.alEsha,
                    time: " $isha  م ",
                    colorText: updatePrayerTime('Isha', isLightTheme),
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

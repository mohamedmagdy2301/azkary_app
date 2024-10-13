import 'package:azkary_app/core/theming/cubit_cahnge_themeing.dart';
import 'package:azkary_app/features/home/domain/prayer_times_entity.dart';
import 'package:azkary_app/features/home/presentation/view/widgets/build_header_prayer_time.dart';
import 'package:azkary_app/features/home/presentation/view/widgets/prayer_times_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrayerTimesCard extends StatelessWidget {
  const PrayerTimesCard({super.key, required this.prayerTimes});
  final List<PrayerTimesEntity> prayerTimes;

  @override
  Widget build(BuildContext context) {
    final isLightTheme = context.watch<ThemeCubit>().state == ThemeMode.light;

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BuildHeaderPrayerTime(),
          PrayerTimesList(prayerTimes: prayerTimes),
        ],
      ),
    );
  }
}

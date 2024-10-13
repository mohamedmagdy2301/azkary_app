import 'package:azkary_app/features/home/domain/prayer_times_entity.dart';
import 'package:azkary_app/features/home/presentation/view/widgets/appbar_home_screen.dart';
import 'package:azkary_app/features/home/presentation/view/widgets/body_home_screen.dart';
import 'package:azkary_app/features/home/presentation/view_model/notification_manager/prayer_time_notification_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrayerTimeLoadedUI extends StatelessWidget {
  const PrayerTimeLoadedUI({
    super.key,
    required this.prayerTimes,
    required this.locationName,
  });
  final List<PrayerTimesEntity> prayerTimes;
  final String locationName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PrayerTimeNotificationCubit(),
      child: Scaffold(
        appBar: AppBarHome(prayerTimes: prayerTimes),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 10.h,
          ),
          child: BodyHomeScreen(
              prayerTimes: prayerTimes, locationName: locationName),
        ),
      ),
    );
  }
}

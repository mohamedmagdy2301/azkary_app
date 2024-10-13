import 'package:azkary_app/features/home/presentation/view/widgets/prayer_time_loaded_UI.dart';
import 'package:azkary_app/features/home/presentation/view_model/prayer_times_cubit/prayper_times_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrayerTimesCubit, PrayerTimesState>(
      builder: (context, state) {
        if (state is PrayerTimesLoaded) {
          return PrayerTimeLoadedUI(prayerTimes: state.prayerTimes);
        } else if (state is PrayerTimesError) {
          return Scaffold(
            body: Center(
              child: Text(
                state.message,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.sp,
                ),
              ),
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}

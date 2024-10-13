import 'dart:async';

import 'package:azkary_app/core/functions/get_current_prayer_arbic.dart';
import 'package:azkary_app/core/functions/get_status_prayer_time.dart';
import 'package:azkary_app/features/home/domain/prayer_times_entity.dart';
import 'package:azkary_app/features/home/presentation/view_model/next_prayer/next_prayer_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NextPrayerCubit extends Cubit<NextPrayerState> {
  late Timer timer;
  final List<PrayerTimesEntity> prayerTimes;

  NextPrayerCubit({required this.prayerTimes})
      : super(NextPrayerState(remainingTime: '', nextPrayerName: '')) {
    _startTimer();
    _updatePrayerTime();
  }

  void _startTimer() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer t) => _updatePrayerTime(),
    );
  }

  void _updatePrayerTime() {
    final remainingTime = findPrayerTimes();
    final nextPrayerName = getCurrentPrayerByArabic()[0];

    emit(NextPrayerState(
      remainingTime: remainingTime,
      nextPrayerName: nextPrayerName,
    ));
  }

  @override
  Future<void> close() {
    timer.cancel();
    return super.close();
  }
}

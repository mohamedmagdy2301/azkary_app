import 'dart:developer';

import 'package:azkary_app/features/home/data/prayer_time_repo_impl.dart';
import 'package:azkary_app/features/home/domain/prayer_times_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'prayper_times_state.dart';
//   https://api.aladhan.com/v1/timings?latitude=30.5632921&longitude=30.9970544&method=5

class PrayerTimesCubit extends Cubit<PrayerTimesState> {
  PrayerTimesCubit() : super(PrayerTimesInitial());
  PrayerTimesRepository prayerTimesRepository = PrayerTimesRepository();

  List<PrayerTimesEntity> prayerTimes = [];

  Future<void> fetchPrayerTimes() async {
    emit(PrayerTimesLoading());
    try {
      prayerTimes = await prayerTimesRepository.fetchPrayerTimes();
      emit(PrayerTimesLoaded(prayerTimes));
    } catch (e) {
      log(e.toString());
      emit(PrayerTimesError(e.toString()));
    }
  }
}

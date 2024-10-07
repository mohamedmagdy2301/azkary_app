part of 'prayper_times_cubit.dart';

sealed class PrayerTimesState {}

final class PrayerTimesInitial extends PrayerTimesState {}

final class PrayerTimesLoading extends PrayerTimesState {}

final class PrayerTimesLoaded extends PrayerTimesState {
  final List<PrayerTimesEntity> prayerTimes;
  PrayerTimesLoaded(this.prayerTimes);
}

final class PrayerTimesError extends PrayerTimesState {
  final String message;
  PrayerTimesError(this.message);
}

class PrayerTimesEntity {
  final String dayWeek;
  final String dayMonth;
  final String month;

  final String dayWeekHijri;
  final String monthHijri;
  final String yearHijri;

  final String fajrTime;
  final String sunriseTime;
  final String dhuhrTime;
  final String asrTime;
  final String maghribTime;
  final String ishaTime;

  PrayerTimesEntity({
    required this.dayWeek,
    required this.dayMonth,
    required this.month,
    required this.dayWeekHijri,
    required this.monthHijri,
    required this.yearHijri,
    required this.fajrTime,
    required this.sunriseTime,
    required this.dhuhrTime,
    required this.asrTime,
    required this.maghribTime,
    required this.ishaTime,
  });
}

import 'package:azkary_app/features/home/data/prayer_time_repo_impl.dart';

class FindPrayerTimes {
  static DateTime now = DateTime.now();
  static List<DateTime> nextPrayerTime = [];
  static List<DateTime> pastPrayerTime = [];
  static String? currentPrayerTime;
  static String findPrayerTimes() {
    PrayerTimesRepository.timings.forEach(
      (prayerName, prayerTimeString) {
        DateTime prayerTime = DateTime(
          now.year,
          now.month,
          now.day,
          int.parse(prayerTimeString.split(":")[0]),
          int.parse(prayerTimeString.split(":")[1]),
        );
        if (now.isAfter(prayerTime)) {
          pastPrayerTime.add(prayerTime);
        } else {
          nextPrayerTime.add(prayerTime);
        }
      },
    );
    if (nextPrayerTime.isEmpty) {
      nextPrayerTime = pastPrayerTime;
      pastPrayerTime = [];
    }
    Duration timeDifference = nextPrayerTime[0].difference(now);
    int hours = timeDifference.inHours;
    int minutes = timeDifference.inMinutes % 60;
    int seconds = timeDifference.inSeconds % 60;

    return '$hours:$minutes:$seconds';
  }
}

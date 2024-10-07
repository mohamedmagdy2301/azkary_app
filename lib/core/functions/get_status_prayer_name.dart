// Get the current time

import 'package:azkary_app/features/home/data/prayer_time_repo_impl.dart';

class FindPrayerNames {
  static DateTime now = DateTime.now();
  static List<String> nextPrayer = [];
  static List<String> pastPrayer = [];
  static DateTime currentPrayerTime = DateTime.now();

  static Map<String, List<String>> stutasPrayerTimes = {};
  static Map<String, List<String>> findPrayerNames() {
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
          pastPrayer.add(prayerName);
        } else {
          nextPrayer.add(prayerName);
        }
      },
    );
    if (nextPrayer.isEmpty) {
      nextPrayer = pastPrayer;
      pastPrayer = [];
    }

    stutasPrayerTimes = {"pastPrayer": pastPrayer, "nextPrayer": nextPrayer};
    return stutasPrayerTimes;
  }
}

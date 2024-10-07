import 'dart:developer';

import 'package:azkary_app/features/home/data/prayer_time_repo_impl.dart';

findPrayerTimes() {
  DateTime now = DateTime.now();
  List<DateTime> nextPrayerTime = [];
  List<DateTime> pastPrayerTime = [];
  PrayerTimesRepository.timings.forEach(
    (prayerName, prayerTimeString) {
      if (prayerName == "Sunset" ||
          prayerName == "Imsak" ||
          prayerName == "Firstthird" ||
          prayerName == "Lastthird" ||
          prayerName == "Midnight") {
      } else {
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
      }
    },
  );
  if (nextPrayerTime.isEmpty) {
    nextPrayerTime = pastPrayerTime;
    pastPrayerTime = [];
  }
  // log("nextPrayer: $nextPrayerTime");
  // log("pastPrayer: $pastPrayerTime");
  Duration timeDifference = nextPrayerTime[0].difference(now);
  int hours = timeDifference.inHours;
  int minutes = timeDifference.inMinutes % 60;
  int seconds = timeDifference.inSeconds % 60;
  log("currentPrayer: '$hours:$minutes:$seconds'");

  return '$hours:$minutes:$seconds';
}

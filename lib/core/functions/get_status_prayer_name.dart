// Get the current time

import 'dart:developer';

import 'package:azkary_app/features/home/data/repo/prayer_time_repo_impl.dart';

Map<String, List<String>> findPrayerNames() {
  DateTime now = DateTime.now();
  List<String> nextPrayerNames = [];
  List<String> pastPrayerNames = [];

  Map<String, List<String>> stutasPrayerNames = {};
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
          pastPrayerNames.add(prayerName);
        } else {
          nextPrayerNames.add(prayerName);
        }
      }
    },
  );
  if (nextPrayerNames.isEmpty) {
    nextPrayerNames = pastPrayerNames;
    pastPrayerNames = [];
  }
  log("nextPrayer: $nextPrayerNames");
  log("pastPrayer: $pastPrayerNames");

  stutasPrayerNames = {
    "pastPrayer": pastPrayerNames,
    "nextPrayer": nextPrayerNames
  };
  return stutasPrayerNames;
}

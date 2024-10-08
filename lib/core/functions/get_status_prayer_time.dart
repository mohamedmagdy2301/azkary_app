import 'dart:developer';

import 'package:azkary_app/features/home/data/prayer_time_repo_impl.dart';

String findPrayerTimes() {
  DateTime now = DateTime.now();
  List<DateTime> nextPrayerTime = [];

  // Loop through the prayer times and classify them as past or next
  PrayerTimesRepository.timings.forEach(
    (prayerName, prayerTimeString) {
      if (prayerName != "Sunset" &&
          prayerName != "Imsak" &&
          prayerName != "Firstthird" &&
          prayerName != "Lastthird" &&
          prayerName != "Midnight") {
        DateTime prayerTime = DateTime(
          now.year,
          now.month,
          now.day,
          int.parse(prayerTimeString.split(":")[0]),
          int.parse(prayerTimeString.split(":")[1]),
        );

        // Classify the prayer times
        if (now.isBefore(prayerTime)) {
          nextPrayerTime.add(prayerTime);
        }
      }
    },
  );

  if (nextPrayerTime.isEmpty) {
    PrayerTimesRepository.timings.forEach(
      (prayerName, prayerTimeString) {
        if (prayerName != "Sunset" &&
            prayerName != "Imsak" &&
            prayerName != "Firstthird" &&
            prayerName != "Lastthird" &&
            prayerName != "Midnight") {
          DateTime prayerTime = DateTime(
            now.year,
            now.month,
            now.day + 1, // Move to the next day
            int.parse(prayerTimeString.split(":")[0]),
            int.parse(prayerTimeString.split(":")[1]),
          );
          nextPrayerTime.add(prayerTime);
        }
      },
    );
  }

  // Calculate time difference
  Duration timeDifference = nextPrayerTime[0].difference(now);
  int hours = timeDifference.inHours;
  int minutes = timeDifference.inMinutes % 60;
  int seconds = timeDifference.inSeconds % 60;

  // Format the time difference with leading zeros if necessary
  String formattedTime = "${hours.abs().toString().padLeft(2, '0')}:"
      "${minutes.abs().toString().padLeft(2, '0')}:"
      "${seconds.abs().toString().padLeft(2, '0')}";

  log("Next prayer in: $formattedTime");
  return formattedTime;
}

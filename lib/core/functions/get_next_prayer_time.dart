import 'package:azkary_app/features/home/data/prayer_time_repo_impl.dart';
import 'package:intl/intl.dart';

String findNextPrayerAndDifference() {
  DateTime now = DateTime.now();
  DateFormat timeFormatter = DateFormat("HH:mm");

  String? nextPrayerName;
  DateTime? nextPrayerTime;

  PrayerTimesRepository.timings.forEach((prayerName, prayerTimeString) {
    // Ensure prayer time is not empty
    DateTime prayerTime = DateTime(
      now.year,
      now.month,
      now.day,
      timeFormatter.parse(prayerTimeString).hour,
      timeFormatter.parse(prayerTimeString).minute,
    );

    if (now.isBefore(prayerTime) && nextPrayerName == null) {
      nextPrayerName = prayerName;
      nextPrayerTime = prayerTime;
    }
  });

  if (nextPrayerTime != null) {
    Duration timeDifference = nextPrayerTime!.difference(now);
    int hours = timeDifference.inHours;
    int minutes = timeDifference.inMinutes % 60;
    int seconds = timeDifference.inSeconds % 60;

    return '$hours:$minutes:$seconds';
  } else {
    return 'No more prayers today';
  }
}

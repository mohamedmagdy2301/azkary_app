import 'package:intl/intl.dart';

String findNextPrayerAndDifference(Map<String, String?> timings) {
  final DateFormat timeFormatter = DateFormat("HH:mm");
  DateTime now = DateTime.now();
  DateTime? nextPrayerTime;
  timings.forEach((prayerName, prayerTimeString) {
    DateTime prayerTime = DateTime(
      now.year,
      now.month,
      now.day,
      timeFormatter.parse(prayerTimeString!).hour,
      timeFormatter.parse(prayerTimeString).minute,
    );

    if (now.isBefore(prayerTime)) {
      nextPrayerTime = prayerTime;
    }
  });
  Duration timeDifference = nextPrayerTime!.difference(now);
  int hours = timeDifference.inHours;
  int minutes = timeDifference.inMinutes % 60;
  int seconds = timeDifference.inSeconds % 60;
  String result = '$hours:$minutes:$seconds';

  return result;
}

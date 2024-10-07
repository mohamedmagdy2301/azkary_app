import 'package:intl/intl.dart';

// Get the current time

findPrayerTimes(timings) {
  DateTime now = DateTime.now();

  final DateFormat timeFormatter = DateFormat("HH:mm");
  Map<String, String> prayerNamesArabic = {
    "Fajr": "الفجر",
    "Sunrise": "الشروق",
    "Dhuhr": "الظهر",
    "Asr": "العصر",
    "Maghrib": "المغرب",
    "Isha": "العشاء",
  };
  String? pastPrayer;
  String? nextPrayer;
  String? currentPrayer;
  DateTime? pastPrayerTime;
  DateTime? nextPrayerTime;
  DateTime? currentPrayerTime;

  // Loop through each prayer time
  timings.forEach((prayerName, prayerTimeString) {
    // Convert the prayer time string to DateTime
    DateTime prayerTime = DateTime(
        now.year,
        now.month,
        now.day,
        timeFormatter.parse(prayerTimeString!).hour,
        timeFormatter.parse(prayerTimeString).minute);

    // If current time is after the prayer time, it's a past prayer
    if (now.isAfter(prayerTime)) {
      pastPrayer = prayerName;
      pastPrayerTime = prayerTime;
    }

    // If current time is before the prayer time and we haven't found the next prayer yet
    if (now.isBefore(prayerTime) && nextPrayer == null) {
      nextPrayer = prayerName;
      nextPrayerTime = prayerTime;
    }

    // If current time matches a prayer time (for an exact match case)
    if (now.hour == prayerTime.hour && now.minute == prayerTime.minute) {
      currentPrayer = prayerName;
      currentPrayerTime = prayerTime;
    }
  });

  // Output the past, current (if any), and next prayers
  if (currentPrayer != null) {
    print("Current prayer: $currentPrayer at $currentPrayerTime");
  } else {
    print("Past prayer: $pastPrayer at $pastPrayerTime");

    print("Next prayer: $nextPrayer at $nextPrayerTime");
  }

  String nextPrayerInArabic = prayerNamesArabic[nextPrayer] ?? " none";

  // Get future prayers
  List<String> futurePrayers = [];
  timings.forEach((prayerName, prayerTimeString) {
    DateTime prayerTime = DateTime(
        now.year,
        now.month,
        now.day,
        timeFormatter.parse(prayerTimeString!).hour,
        timeFormatter.parse(prayerTimeString).minute);
    if (prayerTime.isAfter(now)) {
      futurePrayers.add(prayerName);
    }
  });

  print("Future prayers: $futurePrayers");
  return nextPrayerInArabic;
}

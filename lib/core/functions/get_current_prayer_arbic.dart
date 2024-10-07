import 'get_status_prayer_name.dart';

String getCurrentPrayerByArabic() {
  String nextPrayerName = 'no prayer';
  Map<String, String> prayerNamesArabic = {
    "Fajr": "الفجر",
    "Sunrise": "الشروق",
    "Dhuhr": "الظهر",
    "Asr": "العصر",
    "Maghrib": "المغرب",
    "Isha": "العشاء",
  };

  nextPrayerName = FindPrayerNames.findPrayerNames()["nextPrayer"]![0];

  return prayerNamesArabic[nextPrayerName]!;
}

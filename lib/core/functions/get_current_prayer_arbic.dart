import 'get_status_prayer_name.dart';

List getCurrentPrayerByArabic() {
  String nextPrayerName = 'no prayer';
  Map<String, List> prayerNamesArabic = {
    "Fajr": ["الفجر", "11"],
    "Sunrise": ["الشروق", "12"],
    "Dhuhr": ["الظهر", "13"],
    "Asr": ["العصر", "14"],
    "Maghrib": ["المغرب", "15"],
    "Isha": ["العشاء", "16"],
  };

  nextPrayerName = findPrayerNames()["nextPrayer"]![0];

  return prayerNamesArabic[nextPrayerName]!;
}

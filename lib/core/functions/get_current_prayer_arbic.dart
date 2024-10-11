import 'get_status_prayer_name.dart';

List getCurrentPrayerByArabic() {
  String nextPrayerName = 'no prayer';
  Map<String, List> prayerNamesArabic = {
    "Fajr": ["الفجر", "0"],
    "Sunrise": ["الشروق", "1"],
    "Dhuhr": ["الظهر", "2"],
    "Asr": ["العصر", "3"],
    "Maghrib": ["المغرب", "4"],
    "Isha": ["العشاء", "5"],
  };

  nextPrayerName = findPrayerNames()["nextPrayer"]![0];

  return prayerNamesArabic[nextPrayerName]!;
}

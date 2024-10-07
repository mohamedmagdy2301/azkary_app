import 'package:azkary_app/core/functions/convert_en_to_ar_months.dart';
import 'package:azkary_app/core/functions/get_current_prayer_arbic.dart';
import 'package:azkary_app/features/home/domain/prayer_times_entity.dart';

import 'date.dart';
import 'meta.dart';
import 'timings.dart';

class PrayerTimesModel extends PrayerTimesEntity {
  final Timings? timings;
  final Date? date;
  final Meta? meta;

  PrayerTimesModel({this.timings, this.date, this.meta})
      : super(
          dayWeek: date?.hijri?.weekday?.ar ?? "none",
          dayMonth: date?.readable?.split(" ")[0] ?? "none",
          month: monthTranslations[date?.readable?.split(" ")[1]] ?? "none",
          dayWeekHijri: date?.hijri?.weekday?.ar ?? "none",
          monthHijri: date?.hijri?.month?.ar ?? "none",
          yearHijri: date?.hijri?.year ?? "none",
          nextPrayer: getCurrentPrayerByArabic(),
          fajrTime: timings?.fajr ?? "none",
          sunriseTime: timings?.sunrise ?? "none",
          dhuhrTime: timings?.dhuhr ?? "none",
          asrTime: timings?.asr ?? "none",
          maghribTime: timings?.maghrib ?? "none",
          ishaTime: timings?.isha ?? "none",
        );

  factory PrayerTimesModel.fromJson(Map<String, dynamic> json) {
    return PrayerTimesModel(
      timings: json['timings'] == null
          ? null
          : Timings.fromJson(json['timings'] as Map<String, dynamic>),
      date: json['date'] == null
          ? null
          : Date.fromJson(json['date'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'timings': timings?.toJson(),
        'date': date?.toJson(),
        'meta': meta?.toJson(),
      };
}

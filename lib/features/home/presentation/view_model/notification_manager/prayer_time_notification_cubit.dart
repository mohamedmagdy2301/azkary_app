import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:azkary_app/core/local_storage/shared_preferences_manager.dart';
import 'package:azkary_app/core/notification_helper/awesome_notification_manager.dart';
import 'package:azkary_app/features/home/data/repo/prayer_time_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'prayer_time_notification_state.dart';

class PrayerTimeNotificationCubit extends Cubit<PrayerTimeNotificationState> {
  PrayerTimeNotificationCubit() : super(NoPrayerTimeNotification()) {
    isSwitchEnabled = _getSwitchStatusFromPreferences();
    selectedTime = _getNotificationTimeFromPreferences();
  }

  late TimeOfDay selectedTime;
  late bool isSwitchEnabled;

  String prayerKey = "Fajr";
  final Map<String, List> prayerNamesArabic = {
    "Fajr": ["الفجر", "11"],
    "Sunrise": ["الشروق", "12"],
    "Dhuhr": ["الظهر", "13"],
    "Asr": ["العصر", "14"],
    "Maghrib": ["المغرب", "15"],
    "Isha": ["العشاء", "16"],
  };

  Future<void> togglePrayerTimeNotification(
    BuildContext context, {
    required String prayerName,
    required bool isNotified,
  }) async {
    DateTime now = DateTime.now();
    String? selectedTime = PrayerTimesRepository.timings[prayerName];
    prayerKey = prayerName;

    if (selectedTime != null) {
      DateTime prayerTime = DateTime(
        now.year,
        now.month,
        now.day,
        int.parse(selectedTime.split(":")[0]),
        int.parse(selectedTime.split(":")[1]),
        0,
      );

      if (prayerTime.isAfter(now)) {
        if (isNotified) {
          saveSwitchIsEnableNotification(true);

          enableNotification(prayerName, prayerTime, context);
          emit(PrayerTimeNotification());
        } else {
          saveSwitchIsEnableNotification(false);
          await disableNotification(context, prayerName);
          emit(NoPrayerTimeNotification());
        }
      }
    }
  }

  Future<void> disableNotification(
      BuildContext context, String prayerName) async {
    await AwesomeNotifications()
        .cancel(int.parse(prayerNamesArabic[prayerKey]![1]));
    ScaffoldMessenger.of(context).showSnackBar(
      _buildSnackBar(
        'تم تعطيل اشعارات ${prayerNamesArabic[prayerName]![0]}',
        Colors.grey,
      ),
    );
  }

  void enableNotification(
      String prayerName, DateTime prayerTime, BuildContext context) {
    AwesomeNotificationManager.reminderPrayerTimeNotification(
      id: int.parse(prayerNamesArabic[prayerName]![1]) + 5,
      title: "صلاة ${prayerNamesArabic[prayerName]![0]}",
      body:
          " قم توضأ الآن متبقي علي الصلاة ${prayerNamesArabic[prayerName]![0]} خمس دقائق",
      selectedTime: prayerTime,
    );
    AwesomeNotificationManager.basicePrayerTimeNotification(
      id: int.parse(prayerNamesArabic[prayerName]![1]),
      title: "صلاة ${prayerNamesArabic[prayerName]![0]}",
      body: "حان الان موعد اذان صلاة ${prayerNamesArabic[prayerName]![0]}",
      selectedTime: prayerTime,
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: Center(
          child: Text(
            ' تم تفعيل اشعارات ${prayerNamesArabic[prayerName]![0]}',
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  void saveSwitchIsEnableNotification(bool isEnable) async {
    await SharedPreferencesManager.setData(
        key: 'switch_${prayerNamesArabic[prayerKey]![1]}_isEnable',
        value: isEnable);
  }

  SnackBar _buildSnackBar(String message, Color color) {
    return SnackBar(
      backgroundColor: color,
      content: Center(
        child: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  TimeOfDay _getNotificationTimeFromPreferences() {
    final hour = SharedPreferencesManager.getData(
        key: 'notification_${prayerNamesArabic[prayerKey]![1]}_hour');
    final minute = SharedPreferencesManager.getData(
        key: 'notification_${prayerNamesArabic[prayerKey]![1]}_minute');
    return hour != null && minute != null
        ? TimeOfDay(hour: hour, minute: minute)
        : TimeOfDay.now();
  }

  bool _getSwitchStatusFromPreferences() {
    return SharedPreferencesManager.getData(
            key: 'switch_${prayerNamesArabic[prayerKey]![1]}_isEnable') ??
        false;
  }
}

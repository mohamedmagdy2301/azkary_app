import 'dart:ui';

import 'package:awesome_notifications/awesome_notifications.dart';

class AwesomeNotificationManager {
  static Future<void> initialize() async {
    await AwesomeNotifications().initialize(
      'resource://drawable/quran',
      [
        NotificationChannel(
          channelKey: 'azkar_schedule_app_channel',
          channelName: 'Basic notifications',
          channelDescription: 'Notification channel for basic tests',
          defaultColor: const Color(0xFF9D50FF),
          importance: NotificationImportance.High,
          enableLights: true,
          enableVibration: true,
        ),
      ],
    );
    AwesomeNotifications().requestPermissionToSendNotifications();
  }

  static Future<void> scheduleNotification({
    required int id,
    required String title,
    required String body,
    required int selectedHour,
    required int selectedMinute,
  }) async {
    final now = DateTime.now();

    final notificationContent = NotificationContent(
      id: id,
      channelKey: 'azkar_schedule_app_channel',
      title: title,
      body: body,
      category: NotificationCategory.Social,
      notificationLayout: NotificationLayout.BigText,
      //locked: true,
      wakeUpScreen: true,
      autoDismissible: true,
      fullScreenIntent: true,
      displayOnForeground: true,
      displayOnBackground: true,
      duration: Duration(seconds: 1),
    );
    final schedule = NotificationCalendar(
      year: now.year,
      month: now.month,
      day: now.day,
      weekday: now.weekday,
      hour: selectedHour,
      minute: selectedMinute,
      second: 0,
      repeats: true, // Set the schedule to repeat daily
      // preciseAlarm: true,
      allowWhileIdle: true,
      timeZone: await AwesomeNotifications().getLocalTimeZoneIdentifier(),
    );

    await AwesomeNotifications().createNotification(
      content: notificationContent,
      schedule: schedule,
    );

    // await AwesomeNotifications().cancelAll();
  }
}

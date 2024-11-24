import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:azkary_app/features/azkar/data/azkar_screen_body_item_model_data.dart';
import 'package:azkary_app/features/azkar/presentation/veiw/screens/azkar_details_screen.dart';
import 'package:azkary_app/features/home/presentation/view/screens/home_screen.dart';
import 'package:azkary_app/main_development.dart';
import 'package:flutter/material.dart';

class AwesomeNotificationManager {
  static Future<void> initialize() async {
    await AwesomeNotifications().initialize(
      'resource://drawable/quran',
      [
        NotificationChannel(
          channelKey: "basic_prayer_time_channel",
          channelName: 'basic prayer time notifications',
          channelDescription:
              'Notification channel for basic prayer time tests',
          importance: NotificationImportance.Max,
          channelShowBadge: true,
          groupAlertBehavior: GroupAlertBehavior.Children,
          enableLights: true,
          enableVibration: true,
          defaultPrivacy: NotificationPrivacy.Public,
          playSound: true,
          soundSource: 'resource://raw/adan',
        ),
        NotificationChannel(
          channelKey: "reminder_prayer_time_channel",
          channelName: 'reminder prayer time notifications',
          channelDescription:
              'Notification channel for reminder prayer time tests',
          importance: NotificationImportance.Max,
          groupAlertBehavior: GroupAlertBehavior.Children,
          enableLights: true,
          enableVibration: true,
          defaultPrivacy: NotificationPrivacy.Public,
          onlyAlertOnce: true,
          playSound: true,
          soundSource: 'resource://raw/reminder',
        ),
        NotificationChannel(
          channelKey: "schedule_azkar_channel",
          channelName: 'schedule notifications',
          channelDescription: 'Notification channel for schedule tests',
          importance: NotificationImportance.Max,
          channelShowBadge: true,
          groupAlertBehavior: GroupAlertBehavior.Children,
          enableLights: true,
          enableVibration: true,
          defaultPrivacy: NotificationPrivacy.Public,
          onlyAlertOnce: true,
          playSound: true,
          soundSource: 'resource://raw/sound_test',
        ),
      ],
    );
    AwesomeNotifications().requestPermissionToSendNotifications();
    onActionReceived();
  }

  static Future<void> scheduleAzkarNotification({
    required int id,
    required String title,
    required String body,
    required int selectedHour,
    required int selectedMinute,
    required bool isRepeating,
  }) async {
    final notificationContent = NotificationContent(
      id: id,
      channelKey: "schedule_azkar_channel",
      title: title,
      body: body,
    );
    final schedule = NotificationCalendar(
      hour: selectedHour,
      minute: selectedMinute,
      second: 0,
      repeats: isRepeating,
      timeZone: await AwesomeNotifications().getLocalTimeZoneIdentifier(),
    );

    await AwesomeNotifications().createNotification(
      content: notificationContent,
      schedule: schedule,
    );
  }

  static Future<void> reminderPrayerTimeNotification({
    required int id,
    required String title,
    required String body,
    required DateTime selectedTime,
  }) async {
    final notificationContent = NotificationContent(
      id: id,
      channelKey: "reminder_prayer_time_channel",
      title: title,
      body: body,
    );
    final schedule = NotificationCalendar(
      hour: selectedTime.hour,
      minute: selectedTime.minute - 5,
      second: selectedTime.second,
      repeats: true,
      timeZone: await AwesomeNotifications().getLocalTimeZoneIdentifier(),
    );

    await AwesomeNotifications().createNotification(
      content: notificationContent,
      schedule: schedule,
    );
  }

  static Future<void> basicePrayerTimeNotification({
    required int id,
    required String title,
    required String body,
    required DateTime selectedTime,
  }) async {
    final notificationContent = NotificationContent(
      id: id,
      channelKey: "basic_prayer_time_channel",
      title: title,
      body: body,
    );
    final schedule = NotificationCalendar(
      hour: selectedTime.hour,
      minute: selectedTime.minute,
      second: selectedTime.second,
      repeats: true,
      timeZone: await AwesomeNotifications().getLocalTimeZoneIdentifier(),
    );

    await AwesomeNotifications().createNotification(
      content: notificationContent,
      schedule: schedule,
    );
  }

  static void onActionReceived() {
    AwesomeNotifications()
        .setListeners(onActionReceivedMethod: onActionReceivedMethod);
  }

  @pragma('vm:entry-point')
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    if (receivedAction.actionType == ActionType.SilentAction ||
        receivedAction.actionType == ActionType.SilentBackgroundAction) {
    } else {
      return onActionReceivedImplementationMethod(receivedAction);
    }
  }

  static Future<void> onActionReceivedImplementationMethod(
      ReceivedAction receivedAction) async {
    MyApp.navigatorKey.currentState?.pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) {
          if (receivedAction.channelKey == "schedule_azkar_channel") {
            return AzkarDetailsScreen(
              azkarScreenBodyItemModel:
                  azkarScreenBodyItemModel[receivedAction.id!],
            );
          }
          return const HomeScreen();
        },
      ),
      (route) => false,
    );
  }
}

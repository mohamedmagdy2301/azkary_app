import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:azkary_app/features/azkar/data/azkar_screen_body_item_model_data.dart';
import 'package:azkary_app/features/azkar/presentation/veiw/screens/azkar_details_screen.dart';
import 'package:azkary_app/main_development.dart';
import 'package:flutter/material.dart';

class AwesomeNotificationManager {
  static Future<void> initialize({required String channelKey}) async {
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
    required String channalKey,
  }) async {
    final now = DateTime.now();

    final notificationContent = NotificationContent(
      id: id,
      channelKey: channalKey,
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
      duration: const Duration(seconds: 1),
    );
    final schedule = NotificationCalendar(
      year: now.year,
      month: now.month,
      day: now.day,
      weekday: now.weekday,
      hour: selectedHour,
      minute: selectedMinute,
      second: 0,
      repeats: true,
      allowWhileIdle: true,
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
      // For background actions, you must hold the execution until the end
      print(
          'Message sent via notification input: "${receivedAction.buttonKeyInput}"');
    } else {
      return onActionReceivedImplementationMethod(receivedAction);
    }
  }

  static Future<void> onActionReceivedImplementationMethod(
      ReceivedAction receivedAction) async {
    MyApp.navigatorKey.currentState?.pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => AzkarDetailsScreen(
          azkarScreenBodyItemModel:
              azkarScreenBodyItemModel[receivedAction.id!],
        ),
      ),
      (route) => route.isFirst,
    );
  }
}

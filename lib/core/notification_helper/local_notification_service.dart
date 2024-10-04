import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class LocalNotificationService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static onTap(NotificationResponse response) {}
  //! Initialize Local Notification
  static Future initialize() async {
    InitializationSettings initializationSettings =
        const InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );
    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveBackgroundNotificationResponse: onTap,
      onDidReceiveNotificationResponse: onTap,
    );
  }

// ! Show Basic Notification
  static Future showBasicNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    NotificationDetails notificationDetails = const NotificationDetails(
        android: AndroidNotificationDetails(
      'channel_id 0',
      'basic channel',
      importance: Importance.max,
      priority: Priority.high,
      // sound: RawResourceAndroidNotificationSound(
      //     'sound_test.wav'.split('.').first),
    ));
    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      notificationDetails,
      payload: 'data',
    );
  }

// ! Show Repeating Notification every minute
  static Future showRepeatingNotification() async {
    const NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
      'channel_id 1',
      'Repeating channel',
      importance: Importance.max,
      priority: Priority.high,
    ));
    await flutterLocalNotificationsPlugin.periodicallyShow(
      1,
      'Repeating Notification',
      'Notification Body',
      RepeatInterval.everyMinute,
      notificationDetails,
      payload: 'data',
    );
  }

// ! Show Scheduled Notification 10 seconds
  static Future showScheduledNotification() async {
    const NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
      'channel_id 2',
      'Scheduled channel',
      importance: Importance.max,
      priority: Priority.high,
    ));
    tz.initializeTimeZones();
    final String currentTimeZoneLocal =
        await FlutterTimezone.getLocalTimezone();
    // ? To get current local with way accuratlly
    tz.setLocalLocation(tz.getLocation(currentTimeZoneLocal));
    await flutterLocalNotificationsPlugin.zonedSchedule(
      2,
      'Scheduled Notification',
      'Body',
      // ? To get current scheduled time by local timezone
      tz.TZDateTime.now(tz.local).add(
        const Duration(seconds: 1),
      ),
      // ? To get static scheduled time by local timezone
      // tz.TZDateTime(tz.local, 2024, 9, !!, !!, !!),
      notificationDetails,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      payload: 'data',
    );
  }

//! Show Daily Scheduled Notification
  static Future<void> showDailyScheduledNotification() async {
    const NotificationDetails notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        'channel_id 3',
        'Daily Scheduled channel',
        importance: Importance.max,
        priority: Priority.high,
      ),
    );

    tz.initializeTimeZones();
    final String currentTimeZoneLocal =
        await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(currentTimeZoneLocal));
    final tz.TZDateTime currentTime = tz.TZDateTime.now(tz.local);

    if (currentTime.hour >= 1 && currentTime.hour < 4) {
      tz.TZDateTime scheduledDate =
          currentTime.add(const Duration(seconds: 60));
      await flutterLocalNotificationsPlugin.zonedSchedule(
        3,
        'Daily Scheduled Notification',
        'Body',
        scheduledDate,
        notificationDetails,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        payload: 'data',
      );
    }
  }
// // ! Show Daily Scheduled Notification
//   static Future showDailyyScheduledNotification() async {
//     const NotificationDetails notificationDetails = NotificationDetails(
//       android: AndroidNotificationDetails(
//         'channel_id 3',
//         'Daily Scheduled channel',
//         importance: Importance.max,
//         priority: Priority.high,
//       ),
//     );
//     tz.initializeTimeZones();
//     final String currentTimeZoneLocal =
//         await FlutterTimezone.getLocalTimezone();
//     // ? To get current local with way accuratlly
//     tz.setLocalLocation(tz.getLocation(currentTimeZoneLocal));
//     final tz.TZDateTime currentTime = tz.TZDateTime.now(tz.local);
//     log("currentTime : ${currentTime.hour}");
//     log("---------------------------------");
//     // ? To get static scheduled time by local timezone
//     tz.TZDateTime scheduledDate = tz.TZDateTime(
//       tz.local,
//       currentTime.year,
//       currentTime.month,
//       currentTime.day,
//       currentTime.hour,
//       56,
//     );
//     log("before update : ${scheduledDate.hour}");
//     log("---------------------------------");
//     if (scheduledDate.isBefore(currentTime)) {
//       scheduledDate = scheduledDate.add(const Duration(hours: 1));
//       log("after update : ${scheduledDate.hour}");
//       log("---------------------------------");
//     }
//     {
//       await flutterLocalNotificationsPlugin.zonedSchedule(
//         3,
//         'Daily Scheduled Notification',
//         'Body',
//         scheduledDate,
//         notificationDetails,
//         uiLocalNotificationDateInterpretation:
//             UILocalNotificationDateInterpretation.absoluteTime,
//         payload: 'data',
//       );
//     }
//   }

// ! Cancel All Notification
  static Future cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

// ! Cancel Notification By Id
  static Future cancelNotificationById(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }
}

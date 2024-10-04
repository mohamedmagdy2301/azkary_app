import 'dart:developer';

import 'package:azkary_app/core/notification_helper/local_notification_service.dart';
import 'package:flutter/foundation.dart';
import 'package:workmanager/workmanager.dart';

class WorkManagerService {
  static Workmanager workmanager = Workmanager();

  static Future<void> initialize({
    required int id,
  }) async {
    await workmanager.initialize(
      callbackDispatcher, // Removed the parameters
      isInDebugMode: kDebugMode,
    );
    registerPeriodicTask(
      id: id,
    ); // Pass the arguments here
  }

  static Future<void> registerPeriodicTask({
    required int id,
  }) async {
    await workmanager.registerPeriodicTask(
      "id_$id",
      "periodic Task",
      frequency: const Duration(minutes: 2),
      inputData: {
        'id': id,
      }, // Passing the data to the callback function
    );
  }

  static Future<void> cancelAllTasks() async {
    await workmanager.cancelAll();
  }

  static Future<void> cancelTask(String uniqueName) async {
    await workmanager.cancelByUniqueName(uniqueName);
  }
}

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) {
    int id = 0;

    // Extracting the data from inputData
    LocalNotificationService.initialize();
    LocalNotificationService.showBasicNotification(
      id: id,
      title: "Basic Notification $id",
      body: 'task $task, inputData $inputData',
    ).then((value) {
      log("notification sent successfully with id : $id");
      id++;
      log("next notification with id : $id");
    });

    return Future.value(true);
  });
}

@pragma('vm:entry-point')
void actionCallBack() {
  Workmanager().executeTask(
    (taskName, inputData) {
      int id = 0;
      LocalNotificationService.showBasicNotification(
        id: id++,
        title: 'Basic Notification $id',
        body: 'task $taskName, inputData $inputData',
      );
      return Future.value(true);
    },
  );
}

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:azkary_app/core/notification_helper/awesome_notification_manager.dart';
import 'package:azkary_app/features/azkar/data/azkar_screen_body_item_model_data.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'azkar_notification_state.dart';

class AzkarNotificationCubit extends Cubit<AzkarNotificationState> {
  AzkarNotificationCubit(this.azkarScreenBodyItemModel)
      : super(NoHasAzkarNotification());

  late TimeOfDay timeOfDay0 = TimeOfDay.now();
  final AzkarScreenBodyItemModel azkarScreenBodyItemModel;
  late TimeOfDay? selectedTime;
  String textButton = "اختيار موعد";

  bool isSwitchEnable = false;

  onTimeChanged(BuildContext context) async {
    selectedTime = await showTimePicker(
      context: context,
      initialTime: timeOfDay0,
    );

    if (selectedTime != null) {
      timeOfDay0 = selectedTime!;
      // Canceling the previous notification
      await AwesomeNotifications().cancel(azkarScreenBodyItemModel.id);
      // Scheduling the notification
      AwesomeNotificationManager.scheduleNotification(
        id: azkarScreenBodyItemModel.id,
        title: azkarScreenBodyItemModel.title,
        body: "موعد ${azkarScreenBodyItemModel.title}",
        selectedHour: timeOfDay0.hour,
        selectedMinute: timeOfDay0.minute,
      );

      isSwitchEnable = true;
      textButton = timeOfDay0.format(context).toString();

      emit(
        HasAzkarNotification(
            isSwitchEnable: isSwitchEnable, textButton: textButton),
      );
    }
  }

  // Method to cancel notifications
  cancelNotification() async {
    isSwitchEnable = false;
    textButton = "اختيار موعد";
    await AwesomeNotifications().cancel(azkarScreenBodyItemModel.id);
    emit(NoHasAzkarNotification());
  }
}

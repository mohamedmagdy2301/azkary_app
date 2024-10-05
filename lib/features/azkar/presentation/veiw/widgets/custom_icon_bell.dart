import 'package:azkary_app/core/utils/colors.dart';
import 'package:azkary_app/features/azkar/presentation/view_model/notification_manager/azkar_notification_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomIconBell extends StatelessWidget {
  const CustomIconBell({
    super.key,
    required this.azkarNotificationCubit,
  });

  final AzkarNotificationCubit azkarNotificationCubit;

  @override
  Widget build(BuildContext context) {
    return Icon(
      azkarNotificationCubit.isViewNotification
          ? azkarNotificationCubit.isSwitchEnable
              ? CupertinoIcons.bell_fill
              : CupertinoIcons.bell_slash
          : azkarNotificationCubit.isSwitchEnable
              ? CupertinoIcons.bell_fill
              : CupertinoIcons.bell_slash,
      color: azkarNotificationCubit.isViewNotification
          ? azkarNotificationCubit.isSwitchEnable
              ? ColorsAppLight.primaryColor
              : Colors.grey
          : azkarNotificationCubit.isSwitchEnable
              ? ColorsAppLight.primaryColor
              : Colors.grey,
    );
  }
}

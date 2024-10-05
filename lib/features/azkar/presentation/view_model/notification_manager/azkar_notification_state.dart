part of 'azkar_notification_cubit.dart';

@immutable
sealed class AzkarNotificationState {}

final class NoHasAzkarNotification extends AzkarNotificationState {}

final class ViewNotification extends AzkarNotificationState {}

class HasAzkarNotification extends AzkarNotificationState {
  final bool isSwitchEnable;
  final String textButton;
  HasAzkarNotification(
      {required this.isSwitchEnable, required this.textButton});
}

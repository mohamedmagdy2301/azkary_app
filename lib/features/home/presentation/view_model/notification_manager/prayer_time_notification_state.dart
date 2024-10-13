part of 'prayer_time_notification_cubit.dart';

@immutable
sealed class PrayerTimeNotificationState {}

final class PrayerTimeNotification extends PrayerTimeNotificationState {}

final class NoPrayerTimeNotification extends PrayerTimeNotificationState {}

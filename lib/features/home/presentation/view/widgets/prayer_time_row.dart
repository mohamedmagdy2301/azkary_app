import 'package:azkary_app/core/functions/convert_to_12_hour.dart';
import 'package:azkary_app/core/utils/colors.dart';
import 'package:azkary_app/core/utils/strings.dart';
import 'package:azkary_app/features/home/presentation/view_model/notification_manager/prayer_time_notification_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrayerTimeRow extends StatelessWidget {
  const PrayerTimeRow({
    super.key,
    required this.time,
    required this.title,
    required this.colorText,
    required this.isNotified,
    required this.onPressed,
  });
  final String time, title;
  final Color colorText;
  final bool isNotified;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrayerTimeNotificationCubit,
        PrayerTimeNotificationState>(
      builder: (context, state) {
        return SizedBox(
          height: 50.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: colorText,
                ),
              ),
              const Spacer(),
              title == StringsAppAR.alShoroq
                  ? const SizedBox()
                  : IconButton(
                      onPressed: onPressed,
                      iconSize: 20.sp,
                      icon: isNotified
                          ? const Icon(
                              Icons.notifications,
                              color: ColorsAppLight.primaryColor,
                            )
                          : const Icon(
                              Icons.notifications_off_outlined,
                              color: Colors.grey,
                            )),
              SizedBox(width: 10.w),
              Text(
                convertTo12HourFormat(time)
                    .replaceAll("AM", "ص")
                    .replaceAll("PM", " م  "),
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: colorText,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

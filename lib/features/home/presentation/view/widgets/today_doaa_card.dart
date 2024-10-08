import 'dart:async';
import 'dart:math';

import 'package:azkary_app/core/theming/cubit_cahnge_themeing.dart';
import 'package:azkary_app/core/utils/colors.dart';
import 'package:azkary_app/core/utils/strings.dart';
import 'package:azkary_app/features/azkar/data/azkar_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TodayDoaaCard extends StatefulWidget {
  const TodayDoaaCard({
    super.key,
  });

  @override
  State<TodayDoaaCard> createState() => _TodayDoaaCardState();
}

class _TodayDoaaCardState extends State<TodayDoaaCard> {
  List<Map<String, String>> azkarList = azkarData["أدعية الأنبياء"]!;

  // Function to display random Zikr
  displayRandomZikr() {
    Random random = Random();
    int randomIndex = random.nextInt(azkarList.length);
    String randomAzkarContent = azkarList[randomIndex]["content"]!;
    return randomAzkarContent.split(".").first;
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(
      const Duration(hours: 1),
      (Timer t) => displayRandomZikr(),
    );
    displayRandomZikr();
  }

  @override
  Widget build(BuildContext context) {
    final isLightTheme = context.watch<ThemeCubit>().state == ThemeMode.light;

    return SizedBox(
      height: 130.h,
      child: Card(
        elevation: 0,
        color: isLightTheme
            ? Colors.grey.shade100
            : const Color.fromARGB(255, 31, 31, 31),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.bookmark,
                    color: ColorsAppLight.primaryColor,
                    size: 20.sp,
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    StringsAppAR.daiaToday,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: ColorsAppLight.primaryColor,
                    ),
                  ),
                ],
              ),
              Text(
                displayRandomZikr(),
                style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                    color: isLightTheme ? Colors.black : Colors.white,
                    fontFamily: "Amiri"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:azkary_app/core/theming/cubit_cahnge_themeing.dart';
import 'package:azkary_app/core/theming/light_theme.dart';
import 'package:azkary_app/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AzkarDetailsLiseviewItemCard extends StatelessWidget {
  final int index;
  final List<Map<String, String>>? dataList;
  final int counter; // Receive the current counter value
  final VoidCallback onCounterChanged; // Callback to notify counter change

  const AzkarDetailsLiseviewItemCard({
    super.key,
    required this.index,
    required this.dataList,
    required this.counter,
    required this.onCounterChanged,
  });

  @override
  Widget build(BuildContext context) {
    bool isLightTheme =
        context.read<ThemeCubit>().state.themeData == lightTheme;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30.w,
        vertical: 10.h,
      ),
      child: GestureDetector(
        onTap: onCounterChanged,
        child: Card(
          elevation: 4,
          color: isLightTheme ? Colors.grey.shade100 : Colors.grey.shade900,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Container(
                height: 50.h,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  color: isLightTheme
                      ? const Color.fromARGB(255, 225, 225, 225)
                      : const Color.fromARGB(255, 68, 68, 68),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "الذكر ${index + 1}",
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: isLightTheme
                              ? ColorsAppLight.primaryColor
                              : const Color.fromARGB(255, 156, 214, 9)),
                    ),
                    counter == (int.parse(dataList?[index]["count"] ?? "0"))
                        ? Icon(
                            Icons.check_circle_outline,
                            color: isLightTheme
                                ? ColorsAppLight.primaryColor
                                : const Color.fromARGB(255, 156, 214, 9),
                          )
                        : Text(
                            "التكرار : $counter / ${dataList?[index]["count"]}",
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: isLightTheme
                                  ? const Color.fromARGB(255, 35, 42, 18)
                                  : const Color.fromARGB(255, 177, 177, 177),
                            ),
                          ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 15.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h),
                    Text(
                      dataList?[index]['content'] ?? "",
                      style: TextStyle(
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w400,
                        height: 2,
                        wordSpacing: 2,
                        fontFamily: "Amiri",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

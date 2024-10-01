import 'package:azkary_app/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AzkarDetailsLiseviewItemCard extends StatelessWidget {
  const AzkarDetailsLiseviewItemCard({
    super.key,
    required this.dataList,
    required this.index,
  });
  final int index;
  final List<Map<String, String>>? dataList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30.w,
        vertical: 10.h,
      ),
      child: Card(
        elevation: 2,
        color: Colors.grey.shade100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 14.w,
            vertical: 15.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "الذكر ${index + 1}",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorsAppLight.primaryColor,
                    ),
                  ),
                  Text(
                    "التكرار : ${dataList?[index]["count"]}",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 35, 42, 18),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Text(
                dataList?[index]['content'] ?? "",
                style: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w400,
                  height: 2,
                  wordSpacing: 2.2,
                  fontFamily: "Amiri",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

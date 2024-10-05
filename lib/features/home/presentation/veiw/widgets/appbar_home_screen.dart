import 'package:azkary_app/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarHome extends StatelessWidget implements PreferredSizeWidget {
  const AppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(),
      elevation: 0,
      toolbarHeight: 60.h,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'الأحد 25,سيبتمبر',
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 3.h),
          Text(
            '13 صفر 1444',
            style: TextStyle(
              fontSize: 17.sp,
              fontWeight: FontWeight.w400,
              color: ColorsAppLight.primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.h);
}

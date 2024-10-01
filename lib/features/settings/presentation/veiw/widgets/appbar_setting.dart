import 'package:azkary_app/core/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarSettings extends StatelessWidget implements PreferredSizeWidget {
  const AppBarSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        StringsAppAR.settings,
        style: TextStyle(
          fontSize: 30.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
      centerTitle: true,
      flexibleSpace: Container(),
      elevation: 0,
      toolbarHeight: 60.h,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.h);
}

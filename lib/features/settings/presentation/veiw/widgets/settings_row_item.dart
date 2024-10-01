import 'package:azkary_app/core/theming/cubit_cahnge_themeing.dart';
import 'package:azkary_app/core/theming/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsRowItem extends StatelessWidget {
  const SettingsRowItem({
    super.key,
    required this.title,
    required this.leading,
  });
  final String title;
  final Widget leading;

  @override
  Widget build(BuildContext context) {
    bool isLightTheme =
        context.read<ThemeCubit>().state.themeData == lightTheme;
    return Column(
      children: [
        Container(
          height: 80.h,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          color: isLightTheme
              ? const Color.fromARGB(255, 242, 242, 242)
              : const Color.fromARGB(255, 30, 30, 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400),
              ),
              const Spacer(),
              leading,
            ],
          ),
        ),
        const Divider(
          color: Color.fromARGB(255, 186, 186, 186),
          thickness: 1,
          height: 1,
        ),
      ],
    );
  }
}

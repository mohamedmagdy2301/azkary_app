import 'package:azkary_app/core/theming/cubit_cahnge_themeing.dart';
import 'package:azkary_app/core/theming/light_theme.dart';
import 'package:azkary_app/core/utils/colors.dart';
import 'package:azkary_app/core/utils/strings.dart';
import 'package:azkary_app/features/settings/presentation/veiw/widgets/appbar_setting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});
  static const routeName = '/home';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    var themeCubit = context.read<ThemeCubit>();
    return Scaffold(
      appBar: const AppBarSettings(),
      body: Column(
        children: [
          SettingsRowItem(
            title: StringsAppAR.themesMode,
            leading: Row(
              children: [
                const Icon(Icons.dark_mode),
                SizedBox(width: 8.w),
                CupertinoSwitch(
                  activeColor: ColorsAppLight.primaryColor,
                  trackColor: Colors.black,
                  value: themeCubit.state.themeData == lightTheme,
                  onChanged: (value) {
                    setState(() {
                      themeCubit.toggleTheme();
                    });
                  },
                ),
                SizedBox(width: 8.w),
                const Icon(Icons.light_mode),
              ],
            ),
          ),
          SettingsRowItem(
            title: StringsAppAR.language,
            leading: IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: const Icon(Icons.language),
            ),
          ),
          SettingsRowItem(
            title: StringsAppAR.aboutApp,
            leading: IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: const Icon(Icons.info),
            ),
          ),
        ],
      ),
    );
  }
}

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
          height: 60.h,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          color: isLightTheme
              ? const Color.fromARGB(255, 242, 242, 242)
              : const Color.fromARGB(255, 90, 120, 13),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 18.sp),
              ),
              const Spacer(),
              leading,
            ],
          ),
        ),
        Divider(
          color: isLightTheme
              ? const Color.fromARGB(255, 186, 186, 186)
              : const Color.fromARGB(255, 249, 249, 249),
          thickness: 1,
          height: 1,
        ),
      ],
    );
  }
}

import 'package:azkary_app/core/theming/cubit_cahnge_themeing.dart';
import 'package:azkary_app/core/utils/strings.dart';
import 'package:azkary_app/features/settings/presentation/veiw/widgets/appbar_setting.dart';
import 'package:azkary_app/features/settings/presentation/veiw/widgets/settings_row_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  static const routeName = '/home';
  @override
  Widget build(BuildContext context) {
    var themeCubit = context.read<ThemeCubit>();
    return Scaffold(
      appBar: const AppBarSettings(),
      body: Column(
        children: [
          SettingsRowItem(
            title: StringsAppAR.themesMode,
            leading: CupertinoSwitch(
              activeColor: const Color.fromARGB(255, 90, 123, 8),
              trackColor: const Color.fromARGB(255, 156, 214, 9),
              value: context.watch<ThemeCubit>().state == ThemeMode.dark,
              onChanged: (value) {
                if (value) {
                  themeCubit.toggleTheme(AppTheme.dark);
                } else {
                  themeCubit.toggleTheme(AppTheme.light);
                }
              },
            ),
          ),
          SettingsRowItem(
            title: StringsAppAR.language,
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.language),
            ),
          ),
          SettingsRowItem(
            title: StringsAppAR.aboutApp,
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.info),
            ),
          ),
        ],
      ),
    );
  }
}
